set ModuleHierarchy {[{
"Name" : "fft_mdf","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "axis_to_word_U0","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_301_1","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_95_1_proc10_U0","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_95_1","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_95_1_proc111_U0","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_95_1","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_95_1_proc212_U0","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_95_1","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_95_1_proc313_U0","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_95_1","ID" : "10","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_95_1_proc414_U0","ID" : "11","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_95_1","ID" : "12","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_95_1_proc515_U0","ID" : "13","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_95_1","ID" : "14","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_95_1_proc616_U0","ID" : "15","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_95_1","ID" : "16","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_95_1_proc717_U0","ID" : "17","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_95_1","ID" : "18","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_168_1_proc18_U0","ID" : "19","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_168_1","ID" : "20","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_168_1_proc819_U0","ID" : "21","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_168_1","ID" : "22","Type" : "pipeline"},]},
	{"Name" : "rd_bank_cast_loc_channel_U","ID" : "23","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_Block_ZL8stage_nfILi1EEvRN3hls6streamI10mdf_word_tLi0EEES4_exit_proc20_Pipelin_fu_26","ID" : "24","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "write_loop","ID" : "25","Type" : "pipeline"},]},]},
	{"Name" : "Loop_read_loop_proc_U0","ID" : "26","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "read_loop","ID" : "27","Type" : "pipeline"},]},
	{"Name" : "word_to_axis_U0","ID" : "28","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_313_1","ID" : "29","Type" : "pipeline"},]},]
}]}