   
    parameter PROC_NUM = 14;
    parameter ST_IDLE = 3'b000;
    parameter ST_FILTER_FAKE = 3'b001;
    parameter ST_DL_DETECTED = 3'b010;
    parameter ST_DL_REPORT = 3'b100;
   

    reg [2:0] CS_fsm;
    reg [2:0] NS_fsm;
    reg [PROC_NUM - 1:0] dl_detect_reg;
    reg [PROC_NUM - 1:0] dl_done_reg;
    reg [PROC_NUM - 1:0] origin_reg;
    reg [PROC_NUM - 1:0] dl_in_vec_reg;
    reg [31:0] dl_keep_cnt;
    integer i;
    integer fp;

    // FSM State machine
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            CS_fsm <= ST_IDLE;
        end
        else begin
            CS_fsm <= NS_fsm;
        end
    end
    always @ (CS_fsm or dl_in_vec or dl_detect_reg or dl_done_reg or dl_in_vec or origin_reg or dl_keep_cnt) begin
        case (CS_fsm)
            ST_IDLE : begin
                if (|dl_in_vec) begin
                    NS_fsm = ST_FILTER_FAKE;
                end
                else begin
                    NS_fsm = ST_IDLE;
                end
            end
            ST_FILTER_FAKE: begin
                if (dl_keep_cnt >= 32'd1000) begin
                    NS_fsm = ST_DL_DETECTED;
                end
                else if (dl_detect_reg != (dl_detect_reg & dl_in_vec)) begin
                    NS_fsm = ST_IDLE;
                end
                else begin
                    NS_fsm = ST_FILTER_FAKE;
                end
            end
            ST_DL_DETECTED: begin
                // has unreported deadlock cycle
                if (dl_detect_reg != dl_done_reg) begin
                    NS_fsm = ST_DL_REPORT;
                end
                else begin
                    NS_fsm = ST_DL_DETECTED;
                end
            end
            ST_DL_REPORT: begin
                if (|(dl_in_vec & origin_reg)) begin
                    NS_fsm = ST_DL_DETECTED;
                end
                else begin
                    NS_fsm = ST_DL_REPORT;
                end
            end
            default: NS_fsm = ST_IDLE;
        endcase
    end

    // dl_detect_reg record the procs that first detect deadlock
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_detect_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_IDLE) begin
                dl_detect_reg <= dl_in_vec;
            end
        end
    end

    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_keep_cnt <= 32'h0;
        end
        else begin
            if (CS_fsm == ST_FILTER_FAKE && (dl_detect_reg == (dl_detect_reg & dl_in_vec))) begin
                dl_keep_cnt <= dl_keep_cnt + 32'h1;
            end
            else if (CS_fsm == ST_FILTER_FAKE && (dl_detect_reg != (dl_detect_reg & dl_in_vec))) begin
                dl_keep_cnt <= 32'h0;
            end
        end
    end

    // dl_detect_out keeps in high after deadlock detected
    assign dl_detect_out = (|dl_detect_reg) && (CS_fsm == ST_DL_DETECTED || CS_fsm == ST_DL_REPORT);

    // dl_done_reg record the cycles has been reported
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_done_reg <= 'b0;
        end
        else begin
            if ((CS_fsm == ST_DL_REPORT) && (|(dl_in_vec & dl_detect_reg) == 'b1)) begin
                dl_done_reg <= dl_done_reg | dl_in_vec;
            end
        end
    end

    // clear token once a cycle is done
    assign token_clear = (CS_fsm == ST_DL_REPORT) ? ((|(dl_in_vec & origin_reg)) ? 'b1 : 'b0) : 'b0;

    // origin_reg record the current cycle start id
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            origin_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                origin_reg <= origin;
            end
        end
    end
   
    // origin will be valid for only one cycle
    wire [PROC_NUM*PROC_NUM - 1:0] origin_tmp;
    assign origin_tmp[PROC_NUM - 1:0] = (dl_detect_reg[0] & ~dl_done_reg[0]) ? 'b1 : 'b0;
    genvar j;
    generate
    for(j = 1;j < PROC_NUM;j = j + 1) begin: F1
        assign origin_tmp[j*PROC_NUM +: PROC_NUM] = (dl_detect_reg[j] & ~dl_done_reg[j]) ? ('b1 << j) : origin_tmp[(j - 1)*PROC_NUM +: PROC_NUM];
    end
    endgenerate
    always @ (CS_fsm or origin_tmp) begin
        if (CS_fsm == ST_DL_DETECTED) begin
            origin = origin_tmp[(PROC_NUM - 1)*PROC_NUM +: PROC_NUM];
        end
        else begin
            origin = 'b0;
        end
    end

    
    // dl_in_vec_reg record the current cycle dl_in_vec
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_in_vec_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                dl_in_vec_reg <= origin;
            end
            else if (CS_fsm == ST_DL_REPORT) begin
                dl_in_vec_reg <= dl_in_vec;
            end
        end
    end
    
    // find_df_deadlock to report the deadlock
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            find_df_deadlock <= 1'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED && dl_detect_reg == dl_done_reg) begin
                find_df_deadlock <= 1'b1;
            end
            else if (CS_fsm == ST_IDLE) begin
                find_df_deadlock <= 1'b0;
            end
        end
    end
    
    // get the first valid proc index in dl vector
    function integer proc_index(input [PROC_NUM - 1:0] dl_vec);
        begin
            proc_index = 0;
            for (i = 0; i < PROC_NUM; i = i + 1) begin
                if (dl_vec[i]) begin
                    proc_index = i;
                end
            end
        end
    endfunction

    // get the proc path based on dl vector
    function [752:0] proc_path(input [PROC_NUM - 1:0] dl_vec);
        integer index;
        begin
            index = proc_index(dl_vec);
            case (index)
                0 : begin
                    proc_path = "fft_mdf_fft_mdf.axis_to_word_U0";
                end
                1 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc10_U0";
                end
                2 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc111_U0";
                end
                3 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc212_U0";
                end
                4 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc313_U0";
                end
                5 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc414_U0";
                end
                6 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc515_U0";
                end
                7 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc616_U0";
                end
                8 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc717_U0";
                end
                9 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc18_U0";
                end
                10 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc819_U0";
                end
                11 : begin
                    proc_path = "fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0";
                end
                12 : begin
                    proc_path = "fft_mdf_fft_mdf.Loop_read_loop_proc_U0";
                end
                13 : begin
                    proc_path = "fft_mdf_fft_mdf.word_to_axis_U0";
                end
                default : begin
                    proc_path = "unknown";
                end
            endcase
        end
    endfunction

    // print the headlines of deadlock detection
    task print_dl_head;
        begin
            $display("\n//////////////////////////////////////////////////////////////////////////////");
            $display("// ERROR!!! DEADLOCK DETECTED at %0t ns! SIMULATION WILL BE STOPPED! //", $time);
            $display("//////////////////////////////////////////////////////////////////////////////");
            fp = $fopen("deadlock_db.dat", "w");
        end
    endtask

    // print the start of a cycle
    task print_cycle_start(input reg [752:0] proc_path, input integer cycle_id);
        begin
            $display("/////////////////////////");
            $display("// Dependence cycle %0d:", cycle_id);
            $display("// (1): Process: %0s", proc_path);
            $fdisplay(fp, "Dependence_Cycle_ID %0d", cycle_id);
            $fdisplay(fp, "Dependence_Process_ID 1");
            $fdisplay(fp, "Dependence_Process_path %0s", proc_path);
        end
    endtask

    // print the end of deadlock detection
    task print_dl_end(input integer num, input integer record_time);
        begin
            $display("////////////////////////////////////////////////////////////////////////");
            $display("// Totally %0d cycles detected!", num);
            $display("////////////////////////////////////////////////////////////////////////");
            $display("// ERROR!!! DEADLOCK DETECTED at %0t ns! SIMULATION WILL BE STOPPED! //", record_time);
            $display("//////////////////////////////////////////////////////////////////////////////");
            $fdisplay(fp, "Dependence_Cycle_Number %0d", num);
            $fclose(fp);
        end
    endtask

    // print one proc component in the cycle
    task print_cycle_proc_comp(input reg [752:0] proc_path, input integer cycle_comp_id);
        begin
            $display("// (%0d): Process: %0s", cycle_comp_id, proc_path);
            $fdisplay(fp, "Dependence_Process_ID %0d", cycle_comp_id);
            $fdisplay(fp, "Dependence_Process_path %0s", proc_path);
        end
    endtask

    // print one channel component in the cycle
    task print_cycle_chan_comp(input [PROC_NUM - 1:0] dl_vec1, input [PROC_NUM - 1:0] dl_vec2);
        reg [824:0] chan_path;
        integer index1;
        integer index2;
        begin
            index1 = proc_index(dl_vec1);
            index2 = proc_index(dl_vec2);
            case (index1)
                0 : begin
                    case(index2)
                    1: begin
                        if (~axis_to_word_U0.w_in_blk_n) begin
                            if (~w_in_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.w_in_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc10_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.w_in_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~w_in_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.w_in_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc10_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.w_in_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U.if_full_n & axis_to_word_U0.ap_start & ~axis_to_word_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc10_U0',");
                        end
                    end
                    endcase
                end
                1 : begin
                    case(index2)
                    2: begin
                        if (~Loop_VITIS_LOOP_95_1_proc10_U0.s0_blk_n) begin
                            if (~s0_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc111_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s0_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s0_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc111_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s0_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U.if_full_n & Loop_VITIS_LOOP_95_1_proc10_U0.ap_start & ~Loop_VITIS_LOOP_95_1_proc10_U0.real_start & (trans_in_cnt_1 == trans_out_cnt_1) & ~start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc111_U0',");
                        end
                    end
                    0: begin
                        if (~Loop_VITIS_LOOP_95_1_proc10_U0.w_in_blk_n) begin
                            if (~w_in_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.w_in_U' written by process 'fft_mdf_fft_mdf.axis_to_word_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.w_in_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~w_in_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.w_in_U' read by process 'fft_mdf_fft_mdf.axis_to_word_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.w_in_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U.if_empty_n & Loop_VITIS_LOOP_95_1_proc10_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc10_U0_U' written by process 'fft_mdf_fft_mdf.axis_to_word_U0',");
                        end
                    end
                    endcase
                end
                2 : begin
                    case(index2)
                    3: begin
                        if (~Loop_VITIS_LOOP_95_1_proc111_U0.s1_blk_n) begin
                            if (~s1_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s1_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc212_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s1_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s1_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc212_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U.if_full_n & Loop_VITIS_LOOP_95_1_proc111_U0.ap_start & ~Loop_VITIS_LOOP_95_1_proc111_U0.real_start & (trans_in_cnt_2 == trans_out_cnt_2) & ~start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc212_U0',");
                        end
                    end
                    1: begin
                        if (~Loop_VITIS_LOOP_95_1_proc111_U0.s0_blk_n) begin
                            if (~s0_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc10_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s0_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s0_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc10_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s0_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U.if_empty_n & Loop_VITIS_LOOP_95_1_proc111_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc111_U0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc10_U0',");
                        end
                    end
                    endcase
                end
                3 : begin
                    case(index2)
                    4: begin
                        if (~Loop_VITIS_LOOP_95_1_proc212_U0.s2_blk_n) begin
                            if (~s2_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s2_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc313_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s2_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s2_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc313_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U.if_full_n & Loop_VITIS_LOOP_95_1_proc212_U0.ap_start & ~Loop_VITIS_LOOP_95_1_proc212_U0.real_start & (trans_in_cnt_3 == trans_out_cnt_3) & ~start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc313_U0',");
                        end
                    end
                    2: begin
                        if (~Loop_VITIS_LOOP_95_1_proc212_U0.s1_blk_n) begin
                            if (~s1_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s1_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc111_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s1_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s1_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc111_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U.if_empty_n & Loop_VITIS_LOOP_95_1_proc212_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc212_U0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc111_U0',");
                        end
                    end
                    endcase
                end
                4 : begin
                    case(index2)
                    5: begin
                        if (~Loop_VITIS_LOOP_95_1_proc313_U0.s3_blk_n) begin
                            if (~s3_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s3_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc414_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s3_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s3_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s3_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc414_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s3_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U.if_full_n & Loop_VITIS_LOOP_95_1_proc313_U0.ap_start & ~Loop_VITIS_LOOP_95_1_proc313_U0.real_start & (trans_in_cnt_4 == trans_out_cnt_4) & ~start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc414_U0',");
                        end
                    end
                    3: begin
                        if (~Loop_VITIS_LOOP_95_1_proc313_U0.s2_blk_n) begin
                            if (~s2_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s2_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc212_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s2_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s2_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s2_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc212_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s2_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U.if_empty_n & Loop_VITIS_LOOP_95_1_proc313_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc313_U0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc212_U0',");
                        end
                    end
                    endcase
                end
                5 : begin
                    case(index2)
                    6: begin
                        if (~Loop_VITIS_LOOP_95_1_proc414_U0.s4_blk_n) begin
                            if (~s4_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s4_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc515_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s4_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s4_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s4_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc515_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s4_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U.if_full_n & Loop_VITIS_LOOP_95_1_proc414_U0.ap_start & ~Loop_VITIS_LOOP_95_1_proc414_U0.real_start & (trans_in_cnt_5 == trans_out_cnt_5) & ~start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc515_U0',");
                        end
                    end
                    4: begin
                        if (~Loop_VITIS_LOOP_95_1_proc414_U0.s3_blk_n) begin
                            if (~s3_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s3_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc313_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s3_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s3_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s3_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc313_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s3_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U.if_empty_n & Loop_VITIS_LOOP_95_1_proc414_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc414_U0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc313_U0',");
                        end
                    end
                    endcase
                end
                6 : begin
                    case(index2)
                    7: begin
                        if (~Loop_VITIS_LOOP_95_1_proc515_U0.s5_blk_n) begin
                            if (~s5_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s5_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc616_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s5_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s5_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s5_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc616_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s5_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U.if_full_n & Loop_VITIS_LOOP_95_1_proc515_U0.ap_start & ~Loop_VITIS_LOOP_95_1_proc515_U0.real_start & (trans_in_cnt_6 == trans_out_cnt_6) & ~start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc616_U0',");
                        end
                    end
                    5: begin
                        if (~Loop_VITIS_LOOP_95_1_proc515_U0.s4_blk_n) begin
                            if (~s4_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s4_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc414_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s4_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s4_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s4_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc414_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s4_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U.if_empty_n & Loop_VITIS_LOOP_95_1_proc515_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc515_U0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc414_U0',");
                        end
                    end
                    endcase
                end
                7 : begin
                    case(index2)
                    8: begin
                        if (~Loop_VITIS_LOOP_95_1_proc616_U0.s6_blk_n) begin
                            if (~s6_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s6_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc717_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s6_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s6_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s6_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc717_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s6_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U.if_full_n & Loop_VITIS_LOOP_95_1_proc616_U0.ap_start & ~Loop_VITIS_LOOP_95_1_proc616_U0.real_start & (trans_in_cnt_7 == trans_out_cnt_7) & ~start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc717_U0',");
                        end
                    end
                    6: begin
                        if (~Loop_VITIS_LOOP_95_1_proc616_U0.s5_blk_n) begin
                            if (~s5_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s5_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc515_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s5_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s5_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s5_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc515_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s5_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U.if_empty_n & Loop_VITIS_LOOP_95_1_proc616_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc616_U0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc515_U0',");
                        end
                    end
                    endcase
                end
                8 : begin
                    case(index2)
                    9: begin
                        if (~Loop_VITIS_LOOP_95_1_proc717_U0.s7_blk_n) begin
                            if (~s7_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s7_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc18_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s7_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s7_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s7_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc18_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s7_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U.if_full_n & Loop_VITIS_LOOP_95_1_proc717_U0.ap_start & ~Loop_VITIS_LOOP_95_1_proc717_U0.real_start & (trans_in_cnt_8 == trans_out_cnt_8) & ~start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc18_U0',");
                        end
                    end
                    7: begin
                        if (~Loop_VITIS_LOOP_95_1_proc717_U0.s6_blk_n) begin
                            if (~s6_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s6_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc616_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s6_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s6_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s6_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc616_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s6_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U.if_empty_n & Loop_VITIS_LOOP_95_1_proc717_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_95_1_proc717_U0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc616_U0',");
                        end
                    end
                    endcase
                end
                9 : begin
                    case(index2)
                    8: begin
                        if (~Loop_VITIS_LOOP_168_1_proc18_U0.s7_blk_n) begin
                            if (~s7_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s7_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc717_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s7_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s7_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s7_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc717_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s7_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U.if_empty_n & Loop_VITIS_LOOP_168_1_proc18_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_168_1_proc18_U0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_95_1_proc717_U0',");
                        end
                    end
                    10: begin
                        if (~Loop_VITIS_LOOP_168_1_proc18_U0.s8_blk_n) begin
                            if (~s8_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s8_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc819_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s8_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s8_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s8_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc819_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s8_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U.if_full_n & Loop_VITIS_LOOP_168_1_proc18_U0.ap_start & ~Loop_VITIS_LOOP_168_1_proc18_U0.real_start & (trans_in_cnt_9 == trans_out_cnt_9) & ~start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc819_U0',");
                        end
                    end
                    endcase
                end
                10 : begin
                    case(index2)
                    9: begin
                        if (~Loop_VITIS_LOOP_168_1_proc819_U0.s8_blk_n) begin
                            if (~s8_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s8_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc18_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s8_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s8_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s8_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc18_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s8_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U.if_empty_n & Loop_VITIS_LOOP_168_1_proc819_U0.ap_idle & ~start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Loop_VITIS_LOOP_168_1_proc819_U0_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc18_U0',");
                        end
                    end
                    11: begin
                        if (~Loop_VITIS_LOOP_168_1_proc819_U0.s9_blk_n) begin
                            if (~s9_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s9_U' written by process 'fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s9_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s9_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s9_U' read by process 'fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s9_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U.if_full_n & Loop_VITIS_LOOP_168_1_proc819_U0.ap_start & ~Loop_VITIS_LOOP_168_1_proc819_U0.real_start & (trans_in_cnt_10 == trans_out_cnt_10) & ~start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U' read by process 'fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0',");
                        end
                    end
                    endcase
                end
                11 : begin
                    case(index2)
                    10: begin
                        if (~Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26.s9_blk_n) begin
                            if (~s9_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.s9_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc819_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s9_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~s9_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.s9_U' read by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc819_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.s9_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U.if_empty_n & Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.ap_idle & ~start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_pro5jm_U' written by process 'fft_mdf_fft_mdf.Loop_VITIS_LOOP_168_1_proc819_U0',");
                        end
                    end
                    12: begin
                        if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U.i_full_n & Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.ap_done & ap_done_reg_0 & ~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U.t_read) begin
                            if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U' written by process 'fft_mdf_fft_mdf.Loop_read_loop_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U' read by process 'fft_mdf_fft_mdf.Loop_read_loop_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U.i_full_n & Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0.ap_done & ap_done_reg_0 & ~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U.t_read) begin
                            if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U' written by process 'fft_mdf_fft_mdf.Loop_read_loop_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U' read by process 'fft_mdf_fft_mdf.Loop_read_loop_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                12 : begin
                    case(index2)
                    11: begin
                        if (~rd_bank_cast_loc_channel_U.if_empty_n & Loop_read_loop_proc_U0.ap_idle & ~rd_bank_cast_loc_channel_U.if_write) begin
                            if (~rd_bank_cast_loc_channel_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.rd_bank_cast_loc_channel_U' written by process 'fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.rd_bank_cast_loc_channel_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~rd_bank_cast_loc_channel_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.rd_bank_cast_loc_channel_U' read by process 'fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.rd_bank_cast_loc_channel_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U.t_empty_n & Loop_read_loop_proc_U0.ap_idle & ~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U.i_write) begin
                            if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U' written by process 'fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U' read by process 'fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U.t_empty_n & Loop_read_loop_proc_U0.ap_idle & ~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U.i_write) begin
                            if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U.t_empty_n) begin
                                $display("//      Blocked by empty input PIPO 'fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U' written by process 'fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U.i_full_n) begin
                                $display("//      Blocked by full output PIPO 'fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U' read by process 'fft_mdf_fft_mdf.Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.bit_reverse_buf_stream_mdf_word_t_0_stream_mdf_word_t_0_bank_1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    13: begin
                        if (~Loop_read_loop_proc_U0.w_out_blk_n) begin
                            if (~w_out_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.w_out_U' written by process 'fft_mdf_fft_mdf.word_to_axis_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.w_out_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~w_out_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.w_out_U' read by process 'fft_mdf_fft_mdf.word_to_axis_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.w_out_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_word_to_axis_U0_U.if_full_n & Loop_read_loop_proc_U0.ap_start & ~Loop_read_loop_proc_U0.real_start & (trans_in_cnt_11 == trans_out_cnt_11) & ~start_for_word_to_axis_U0_U.if_read) begin
                            $display("//      Blocked by full output start propagation FIFO 'fft_mdf_fft_mdf.start_for_word_to_axis_U0_U' read by process 'fft_mdf_fft_mdf.word_to_axis_U0',");
                        end
                    end
                    endcase
                end
                13 : begin
                    case(index2)
                    12: begin
                        if (~word_to_axis_U0.w_out_blk_n) begin
                            if (~w_out_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'fft_mdf_fft_mdf.w_out_U' written by process 'fft_mdf_fft_mdf.Loop_read_loop_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.w_out_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~w_out_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'fft_mdf_fft_mdf.w_out_U' read by process 'fft_mdf_fft_mdf.Loop_read_loop_proc_U0'");
                                $fdisplay(fp, "Dependence_Channel_path fft_mdf_fft_mdf.w_out_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                        if (~start_for_word_to_axis_U0_U.if_empty_n & word_to_axis_U0.ap_idle & ~start_for_word_to_axis_U0_U.if_write) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'fft_mdf_fft_mdf.start_for_word_to_axis_U0_U' written by process 'fft_mdf_fft_mdf.Loop_read_loop_proc_U0',");
                        end
                    end
                    endcase
                end
            endcase
        end
    endtask

    // report
    initial begin : report_deadlock
        integer cycle_id;
        integer cycle_comp_id;
        integer record_time;
        wait (dl_reset == 1);
        cycle_id = 1;
        record_time = 0;
        while (1) begin
            @ (negedge dl_clock);
            case (CS_fsm)
                ST_DL_DETECTED: begin
                    cycle_comp_id = 2;
                    if (dl_detect_reg != dl_done_reg) begin
                        if (dl_done_reg == 'b0) begin
                            print_dl_head;
                            record_time = $time;
                        end
                        print_cycle_start(proc_path(origin), cycle_id);
                        cycle_id = cycle_id + 1;
                    end
                    else begin
                        print_dl_end((cycle_id - 1),record_time);
                        @(negedge dl_clock);
                        @(negedge dl_clock);
                        $finish;
                    end
                end
                ST_DL_REPORT: begin
                    if ((|(dl_in_vec)) & ~(|(dl_in_vec & origin_reg))) begin
                        print_cycle_chan_comp(dl_in_vec_reg, dl_in_vec);
                        print_cycle_proc_comp(proc_path(dl_in_vec), cycle_comp_id);
                        cycle_comp_id = cycle_comp_id + 1;
                    end
                    else begin
                        print_cycle_chan_comp(dl_in_vec_reg, dl_in_vec);
                    end
                end
            endcase
        end
    end
 
