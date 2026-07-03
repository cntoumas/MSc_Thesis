# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
in_re { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
in_im { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
out_re { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
out_im { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 52
	offset_end 63
}
blk_exp { 
	dir O
	width 8
	depth 1
	mode ap_vld
	offset 64
	offset_end 71
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


