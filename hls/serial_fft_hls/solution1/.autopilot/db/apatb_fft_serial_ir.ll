; ModuleID = 'C:/Users/ntoum/Desktop/thesis_repo/hls/serial_fft_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_fft_serial_ir(i16* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1024" "maxi" %in_re, i16* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1024" "maxi" %in_im, i16* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" "maxi" %out_re, i16* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" "maxi" %out_im, i8* noalias nocapture nonnull %blk_exp) local_unnamed_addr #0 {
entry:
  %in_re_copy = alloca [1024 x i16], align 512
  %in_im_copy = alloca [1024 x i16], align 512
  %out_re_copy = alloca [1024 x i16], align 512
  %out_im_copy = alloca [1024 x i16], align 512
  %blk_exp_copy = alloca i8, align 512
  %0 = bitcast i16* %in_re to [1024 x i16]*
  %1 = bitcast i16* %in_im to [1024 x i16]*
  %2 = bitcast i16* %out_re to [1024 x i16]*
  %3 = bitcast i16* %out_im to [1024 x i16]*
  call fastcc void @copy_in([1024 x i16]* nonnull %0, [1024 x i16]* nonnull align 512 %in_re_copy, [1024 x i16]* nonnull %1, [1024 x i16]* nonnull align 512 %in_im_copy, [1024 x i16]* nonnull %2, [1024 x i16]* nonnull align 512 %out_re_copy, [1024 x i16]* nonnull %3, [1024 x i16]* nonnull align 512 %out_im_copy, i8* nonnull %blk_exp, i8* nonnull align 512 %blk_exp_copy)
  call void @apatb_fft_serial_hw([1024 x i16]* %in_re_copy, [1024 x i16]* %in_im_copy, [1024 x i16]* %out_re_copy, [1024 x i16]* %out_im_copy, i8* %blk_exp_copy)
  call void @copy_back([1024 x i16]* %0, [1024 x i16]* %in_re_copy, [1024 x i16]* %1, [1024 x i16]* %in_im_copy, [1024 x i16]* %2, [1024 x i16]* %out_re_copy, [1024 x i16]* %3, [1024 x i16]* %out_im_copy, i8* %blk_exp, i8* %blk_exp_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([1024 x i16]* noalias readonly, [1024 x i16]* noalias align 512, [1024 x i16]* noalias readonly, [1024 x i16]* noalias align 512, [1024 x i16]* noalias readonly, [1024 x i16]* noalias align 512, [1024 x i16]* noalias readonly, [1024 x i16]* noalias align 512, i8* noalias readonly, i8* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* align 512 %1, [1024 x i16]* %0)
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* align 512 %3, [1024 x i16]* %2)
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* align 512 %5, [1024 x i16]* %4)
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* align 512 %7, [1024 x i16]* %6)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %9, i8* %8)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* noalias align 512 %dst, [1024 x i16]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1024 x i16]* %dst, null
  %1 = icmp eq [1024 x i16]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1024i16([1024 x i16]* nonnull %dst, [1024 x i16]* nonnull %src, i64 1024)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1024i16([1024 x i16]* %dst, [1024 x i16]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1024 x i16]* %src, null
  %1 = icmp eq [1024 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1024 x i16], [1024 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1024 x i16], [1024 x i16]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i16, i16* %src.addr, align 2
  store i16 %3, i16* %dst.addr, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0i8(i8* noalias align 512 %dst, i8* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq i8* %dst, null
  %1 = icmp eq i8* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = load i8, i8* %src, align 1
  store i8 %3, i8* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([1024 x i16]* noalias, [1024 x i16]* noalias readonly align 512, [1024 x i16]* noalias, [1024 x i16]* noalias readonly align 512, [1024 x i16]* noalias, [1024 x i16]* noalias readonly align 512, [1024 x i16]* noalias, [1024 x i16]* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* %0, [1024 x i16]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* %2, [1024 x i16]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* %4, [1024 x i16]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* %6, [1024 x i16]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %8, i8* align 512 %9)
  ret void
}

declare void @apatb_fft_serial_hw([1024 x i16]*, [1024 x i16]*, [1024 x i16]*, [1024 x i16]*, i8*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([1024 x i16]* noalias, [1024 x i16]* noalias readonly align 512, [1024 x i16]* noalias, [1024 x i16]* noalias readonly align 512, [1024 x i16]* noalias, [1024 x i16]* noalias readonly align 512, [1024 x i16]* noalias, [1024 x i16]* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* %4, [1024 x i16]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a1024i16([1024 x i16]* %6, [1024 x i16]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %8, i8* align 512 %9)
  ret void
}

define void @fft_serial_hw_stub_wrapper([1024 x i16]*, [1024 x i16]*, [1024 x i16]*, [1024 x i16]*, i8*) #5 {
entry:
  call void @copy_out([1024 x i16]* null, [1024 x i16]* %0, [1024 x i16]* null, [1024 x i16]* %1, [1024 x i16]* null, [1024 x i16]* %2, [1024 x i16]* null, [1024 x i16]* %3, i8* null, i8* %4)
  %5 = bitcast [1024 x i16]* %0 to i16*
  %6 = bitcast [1024 x i16]* %1 to i16*
  %7 = bitcast [1024 x i16]* %2 to i16*
  %8 = bitcast [1024 x i16]* %3 to i16*
  call void @fft_serial_hw_stub(i16* %5, i16* %6, i16* %7, i16* %8, i8* %4)
  call void @copy_in([1024 x i16]* null, [1024 x i16]* %0, [1024 x i16]* null, [1024 x i16]* %1, [1024 x i16]* null, [1024 x i16]* %2, [1024 x i16]* null, [1024 x i16]* %3, i8* null, i8* %4)
  ret void
}

declare void @fft_serial_hw_stub(i16*, i16*, i16*, i16*, i8*)

attributes #0 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
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
