; ModuleID = 'C:/Users/ntoum/Desktop/thesis_repo/hls/mdf_fft_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" = type { %"struct.hls::axis<ap_int<128>, 1, 1, 1, '8', false>" }
%"struct.hls::axis<ap_int<128>, 1, 1, 1, '8', false>" = type { %"struct.ap_int<128>", %"struct.ap_uint<16>", %"struct.ap_uint<16>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_int<128>" = type { %"struct.ap_int_base<128, true>" }
%"struct.ap_int_base<128, true>" = type { %"struct.ssdm_int<128, true>" }
%"struct.ssdm_int<128, true>" = type { i128 }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline
define void @apatb_fft_mdf_ir(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias nonnull dereferenceable(32) %s_in, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias nonnull dereferenceable(32) %s_out) local_unnamed_addr #0 {
entry:
  %s_in_copy.data = alloca i128, align 512
  %s_in_copy.keep = alloca i16, align 512
  %s_in_copy.strb = alloca i16, align 512
  %s_in_copy.user = alloca i1, align 512
  %s_in_copy.last = alloca i1, align 512
  %s_in_copy.id = alloca i1, align 512
  %s_in_copy.dest = alloca i1, align 512
  %s_out_copy.data = alloca i128, align 512
  %s_out_copy.keep = alloca i16, align 512
  %s_out_copy.strb = alloca i16, align 512
  %s_out_copy.user = alloca i1, align 512
  %s_out_copy.last = alloca i1, align 512
  %s_out_copy.id = alloca i1, align 512
  %s_out_copy.dest = alloca i1, align 512
  call fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* nonnull %s_in, i128* nonnull align 512 %s_in_copy.data, i16* nonnull align 512 %s_in_copy.keep, i16* nonnull align 512 %s_in_copy.strb, i1* nonnull align 512 %s_in_copy.user, i1* nonnull align 512 %s_in_copy.last, i1* nonnull align 512 %s_in_copy.id, i1* nonnull align 512 %s_in_copy.dest, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* nonnull %s_out, i128* nonnull align 512 %s_out_copy.data, i16* nonnull align 512 %s_out_copy.keep, i16* nonnull align 512 %s_out_copy.strb, i1* nonnull align 512 %s_out_copy.user, i1* nonnull align 512 %s_out_copy.last, i1* nonnull align 512 %s_out_copy.id, i1* nonnull align 512 %s_out_copy.dest)
  call void @apatb_fft_mdf_hw(i128* %s_in_copy.data, i16* %s_in_copy.keep, i16* %s_in_copy.strb, i1* %s_in_copy.user, i1* %s_in_copy.last, i1* %s_in_copy.id, i1* %s_in_copy.dest, i128* %s_out_copy.data, i16* %s_out_copy.keep, i16* %s_out_copy.strb, i1* %s_out_copy.user, i1* %s_out_copy.last, i1* %s_out_copy.id, i1* %s_out_copy.dest)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %s_in, i128* %s_in_copy.data, i16* %s_in_copy.keep, i16* %s_in_copy.strb, i1* %s_in_copy.user, i1* %s_in_copy.last, i1* %s_in_copy.id, i1* %s_in_copy.dest, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %s_out, i128* %s_out_copy.data, i16* %s_out_copy.keep, i16* %s_out_copy.strb, i1* %s_out_copy.user, i1* %s_out_copy.last, i1* %s_out_copy.id, i1* %s_out_copy.dest)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias, i128* noalias align 512 "unpacked"="1.0" %_V_data_V, i16* noalias align 512 "unpacked"="1.1" %_V_keep_V, i16* noalias align 512 "unpacked"="1.2" %_V_strb_V, i1* noalias align 512 "unpacked"="1.3" %_V_user_V, i1* noalias align 512 "unpacked"="1.4" %_V_last_V, i1* noalias align 512 "unpacked"="1.5" %_V_id_V, i1* noalias align 512 "unpacked"="1.6" %_V_dest_V, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias, i128* noalias align 512 "unpacked"="3.0" %_V_data_V1, i16* noalias align 512 "unpacked"="3.1" %_V_keep_V2, i16* noalias align 512 "unpacked"="3.2" %_V_strb_V3, i1* noalias align 512 "unpacked"="3.3" %_V_user_V4, i1* noalias align 512 "unpacked"="3.4" %_V_last_V5, i1* noalias align 512 "unpacked"="3.5" %_V_id_V6, i1* noalias align 512 "unpacked"="3.6" %_V_dest_V7) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>.32"(i128* align 512 %_V_data_V, i16* align 512 %_V_keep_V, i16* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>.32"(i128* align 512 %_V_data_V1, i16* align 512 %_V_keep_V2, i16* align 512 %_V_strb_V3, i1* align 512 %_V_user_V4, i1* align 512 %_V_last_V5, i1* align 512 %_V_id_V6, i1* align 512 %_V_dest_V7, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %1)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_out(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias, i128* noalias align 512 "unpacked"="1.0" %_V_data_V, i16* noalias align 512 "unpacked"="1.1" %_V_keep_V, i16* noalias align 512 "unpacked"="1.2" %_V_strb_V, i1* noalias align 512 "unpacked"="1.3" %_V_user_V, i1* noalias align 512 "unpacked"="1.4" %_V_last_V, i1* noalias align 512 "unpacked"="1.5" %_V_id_V, i1* noalias align 512 "unpacked"="1.6" %_V_dest_V, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias, i128* noalias align 512 "unpacked"="3.0" %_V_data_V1, i16* noalias align 512 "unpacked"="3.1" %_V_keep_V2, i16* noalias align 512 "unpacked"="3.2" %_V_strb_V3, i1* noalias align 512 "unpacked"="3.3" %_V_user_V4, i1* noalias align 512 "unpacked"="3.4" %_V_last_V5, i1* noalias align 512 "unpacked"="3.5" %_V_id_V6, i1* noalias align 512 "unpacked"="3.6" %_V_dest_V7) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %0, i128* align 512 %_V_data_V, i16* align 512 %_V_keep_V, i16* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %1, i128* align 512 %_V_data_V1, i16* align 512 %_V_keep_V2, i16* align 512 %_V_strb_V3, i1* align 512 %_V_user_V4, i1* align 512 %_V_last_V5, i1* align 512 %_V_id_V6, i1* align 512 %_V_dest_V7)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias %dst, i128* noalias align 512 "unpacked"="1.0" %src_V_data_V, i16* noalias align 512 "unpacked"="1.1" %src_V_keep_V, i16* noalias align 512 "unpacked"="1.2" %src_V_strb_V, i1* noalias align 512 "unpacked"="1.3" %src_V_user_V, i1* noalias align 512 "unpacked"="1.4" %src_V_last_V, i1* noalias align 512 "unpacked"="1.5" %src_V_id_V, i1* noalias align 512 "unpacked"="1.6" %src_V_dest_V) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>.26"(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* nonnull %dst, i128* align 512 %src_V_data_V, i16* align 512 %src_V_keep_V, i16* align 512 %src_V_strb_V, i1* align 512 %src_V_user_V, i1* align 512 %src_V_last_V, i1* align 512 %src_V_id_V, i1* align 512 %src_V_dest_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>.26"(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias nocapture, i128* noalias nocapture align 512 "unpacked"="1.0" %_V_data_V, i16* noalias nocapture align 512 "unpacked"="1.1" %_V_keep_V, i16* noalias nocapture align 512 "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture align 512 "unpacked"="1.3" %_V_user_V, i1* noalias nocapture align 512 "unpacked"="1.4" %_V_last_V, i1* noalias nocapture align 512 "unpacked"="1.5" %_V_id_V, i1* noalias nocapture align 512 "unpacked"="1.6" %_V_dest_V) unnamed_addr #4 {
entry:
  %1 = alloca i128
  %2 = alloca i16
  %3 = alloca i16
  %4 = alloca i1
  %5 = alloca i1
  %6 = alloca i1
  %7 = alloca i1
  %8 = alloca %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %9 = bitcast i128* %_V_data_V to i8*
  %10 = call i1 @fpga_fifo_not_empty_16(i8* %9)
  br i1 %10, label %push, label %ret

push:                                             ; preds = %empty
  %11 = bitcast i128* %1 to i8*
  %12 = bitcast i128* %_V_data_V to i8*
  call void @fpga_fifo_pop_16(i8* %11, i8* %12)
  %13 = load volatile i128, i128* %1
  %14 = bitcast i16* %3 to i8*
  %15 = bitcast i16* %_V_keep_V to i8*
  call void @fpga_fifo_pop_2(i8* %14, i8* %15)
  %16 = load volatile i16, i16* %3
  %17 = bitcast i16* %2 to i8*
  %18 = bitcast i16* %_V_strb_V to i8*
  call void @fpga_fifo_pop_2(i8* %17, i8* %18)
  %19 = load volatile i16, i16* %2
  %20 = bitcast i1* %7 to i8*
  %21 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_pop_1(i8* %20, i8* %21)
  %22 = bitcast i1* %7 to i8*
  %23 = load i8, i8* %22
  %24 = trunc i8 %23 to i1
  %25 = bitcast i1* %6 to i8*
  %26 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %25, i8* %26)
  %27 = bitcast i1* %6 to i8*
  %28 = load i8, i8* %27
  %29 = trunc i8 %28 to i1
  %30 = bitcast i1* %5 to i8*
  %31 = bitcast i1* %_V_id_V to i8*
  call void @fpga_fifo_pop_1(i8* %30, i8* %31)
  %32 = bitcast i1* %5 to i8*
  %33 = load i8, i8* %32
  %34 = trunc i8 %33 to i1
  %35 = bitcast i1* %4 to i8*
  %36 = bitcast i1* %_V_dest_V to i8*
  call void @fpga_fifo_pop_1(i8* %35, i8* %36)
  %37 = bitcast i1* %4 to i8*
  %38 = load i8, i8* %37
  %39 = trunc i8 %38 to i1
  %.fca.0.0.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" undef, i128 %13, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %.fca.0.0.0.0.0.insert, i16 %16, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %.fca.0.1.0.0.0.insert, i16 %19, 0, 2, 0, 0, 0
  %.fca.0.3.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %.fca.0.2.0.0.0.insert, i1 %24, 0, 3, 0, 0, 0
  %.fca.0.4.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %.fca.0.3.0.0.0.insert, i1 %29, 0, 4, 0, 0, 0
  %.fca.0.5.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %.fca.0.4.0.0.0.insert, i1 %34, 0, 5, 0, 0, 0
  %.fca.0.6.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %.fca.0.5.0.0.0.insert, i1 %39, 0, 6, 0, 0, 0
  store %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %.fca.0.6.0.0.0.insert, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %8
  %40 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %8 to i8*
  %41 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_push_32(i8* %40, i8* %41)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>.32"(i128* noalias align 512 "unpacked"="0.0" %dst_V_data_V, i16* noalias align 512 "unpacked"="0.1" %dst_V_keep_V, i16* noalias align 512 "unpacked"="0.2" %dst_V_strb_V, i1* noalias align 512 "unpacked"="0.3" %dst_V_user_V, i1* noalias align 512 "unpacked"="0.4" %dst_V_last_V, i1* noalias align 512 "unpacked"="0.5" %dst_V_id_V, i1* noalias align 512 "unpacked"="0.6" %dst_V_dest_V, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>.35"(i128* align 512 %dst_V_data_V, i16* align 512 %dst_V_keep_V, i16* align 512 %dst_V_strb_V, i1* align 512 %dst_V_user_V, i1* align 512 %dst_V_last_V, i1* align 512 %dst_V_id_V, i1* align 512 %dst_V_dest_V, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>.35"(i128* noalias nocapture align 512 "unpacked"="0.0" %_V_data_V, i16* noalias nocapture align 512 "unpacked"="0.1" %_V_keep_V, i16* noalias nocapture align 512 "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture align 512 "unpacked"="0.3" %_V_user_V, i1* noalias nocapture align 512 "unpacked"="0.4" %_V_last_V, i1* noalias nocapture align 512 "unpacked"="0.5" %_V_id_V, i1* noalias nocapture align 512 "unpacked"="0.6" %_V_dest_V, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias nocapture) unnamed_addr #4 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"
  %2 = alloca i128
  %3 = alloca i16
  %4 = alloca i16
  %5 = alloca i1
  %6 = alloca i1
  %7 = alloca i1
  %8 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %9 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %0 to i8*
  %10 = call i1 @fpga_fifo_not_empty_32(i8* %9)
  br i1 %10, label %push, label %ret

push:                                             ; preds = %empty
  %11 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %1 to i8*
  %12 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_32(i8* %11, i8* %12)
  %13 = load volatile %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %1
  %.fca.0.0.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %13, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %13, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %13, 0, 2, 0, 0, 0
  %.fca.0.3.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %13, 0, 3, 0, 0, 0
  %.fca.0.4.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %13, 0, 4, 0, 0, 0
  %.fca.0.5.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %13, 0, 5, 0, 0, 0
  %.fca.0.6.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>" %13, 0, 6, 0, 0, 0
  store i128 %.fca.0.0.0.0.0.extract, i128* %2
  %14 = bitcast i128* %2 to i8*
  %15 = bitcast i128* %_V_data_V to i8*
  call void @fpga_fifo_push_16(i8* %14, i8* %15)
  store i16 %.fca.0.1.0.0.0.extract, i16* %4
  %16 = bitcast i16* %4 to i8*
  %17 = bitcast i16* %_V_keep_V to i8*
  call void @fpga_fifo_push_2(i8* %16, i8* %17)
  store i16 %.fca.0.2.0.0.0.extract, i16* %3
  %18 = bitcast i16* %3 to i8*
  %19 = bitcast i16* %_V_strb_V to i8*
  call void @fpga_fifo_push_2(i8* %18, i8* %19)
  store i1 %.fca.0.3.0.0.0.extract, i1* %8
  %20 = bitcast i1* %8 to i8*
  %21 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_push_1(i8* %20, i8* %21)
  store i1 %.fca.0.4.0.0.0.extract, i1* %7
  %22 = bitcast i1* %7 to i8*
  %23 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %22, i8* %23)
  store i1 %.fca.0.5.0.0.0.extract, i1* %6
  %24 = bitcast i1* %6 to i8*
  %25 = bitcast i1* %_V_id_V to i8*
  call void @fpga_fifo_push_1(i8* %24, i8* %25)
  store i1 %.fca.0.6.0.0.0.extract, i1* %5
  %26 = bitcast i1* %5 to i8*
  %27 = bitcast i1* %_V_dest_V to i8*
  call void @fpga_fifo_push_1(i8* %26, i8* %27)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_fft_mdf_hw(i128*, i16*, i16*, i1*, i1*, i1*, i1*, i128*, i16*, i16*, i1*, i1*, i1*, i1*)

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_back(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias, i128* noalias align 512 "unpacked"="1.0" %_V_data_V, i16* noalias align 512 "unpacked"="1.1" %_V_keep_V, i16* noalias align 512 "unpacked"="1.2" %_V_strb_V, i1* noalias align 512 "unpacked"="1.3" %_V_user_V, i1* noalias align 512 "unpacked"="1.4" %_V_last_V, i1* noalias align 512 "unpacked"="1.5" %_V_id_V, i1* noalias align 512 "unpacked"="1.6" %_V_dest_V, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* noalias, i128* noalias align 512 "unpacked"="3.0" %_V_data_V1, i16* noalias align 512 "unpacked"="3.1" %_V_keep_V2, i16* noalias align 512 "unpacked"="3.2" %_V_strb_V3, i1* noalias align 512 "unpacked"="3.3" %_V_user_V4, i1* noalias align 512 "unpacked"="3.4" %_V_last_V5, i1* noalias align 512 "unpacked"="3.5" %_V_id_V6, i1* noalias align 512 "unpacked"="3.6" %_V_dest_V7) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %0, i128* align 512 %_V_data_V, i16* align 512 %_V_keep_V, i16* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %1, i128* align 512 %_V_data_V1, i16* align 512 %_V_keep_V2, i16* align 512 %_V_strb_V3, i1* align 512 %_V_user_V4, i1* align 512 %_V_last_V5, i1* align 512 %_V_id_V6, i1* align 512 %_V_dest_V7)
  ret void
}

define void @fft_mdf_hw_stub_wrapper(i128*, i16*, i16*, i1*, i1*, i1*, i1*, i128*, i16*, i16*, i1*, i1*, i1*, i1*) #5 {
entry:
  %14 = alloca %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"
  %15 = alloca %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"
  call void @copy_out(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %14, i128* %0, i16* %1, i16* %2, i1* %3, i1* %4, i1* %5, i1* %6, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %15, i128* %7, i16* %8, i16* %9, i1* %10, i1* %11, i1* %12, i1* %13)
  call void @fft_mdf_hw_stub(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %14, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %15)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %14, i128* %0, i16* %1, i16* %2, i1* %3, i1* %4, i1* %5, i1* %6, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"* %15, i128* %7, i16* %8, i16* %9, i1* %10, i1* %11, i1* %12, i1* %13)
  ret void
}

declare void @fft_mdf_hw_stub(%"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"*, %"class.hls::stream<hls::axis<ap_int<128>, 1, 1, 1, '8', false>, 0>"*)

declare i1 @fpga_fifo_not_empty_32(i8*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare void @fpga_fifo_pop_32(i8*, i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_32(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
