; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.39.33523"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @cell_process(ptr nocapture noundef readonly %prev, ptr nocapture noundef writeonly %current) local_unnamed_addr #0 {
entry:
  %invariant.gep = getelementptr i8, ptr %prev, i64 -256
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.cond.cleanup3
  %indvars.iv218 = phi i64 [ 0, %entry ], [ %indvars.iv.next219, %for.cond.cleanup3 ]
  %cmp5 = icmp ne i64 %indvars.iv218, 0
  %conv = zext i1 %cmp5 to i32
  %0 = add nsw i64 %indvars.iv218, -1
  %indvars.iv.next219 = add nuw nsw i64 %indvars.iv218, 1
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  ret void

for.cond.cleanup3:                                ; preds = %if.end152
  %exitcond222.not = icmp eq i64 %indvars.iv.next219, 256
  br i1 %exitcond222.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !5

for.body4:                                        ; preds = %for.cond1.preheader, %if.end152
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %if.end152 ]
  %cmp6 = icmp ne i64 %indvars.iv, 0
  %conv7 = zext i1 %cmp6 to i32
  %arrayidx10 = getelementptr nusw [256 x i8], ptr %invariant.gep, i64 %indvars.iv, i64 %0
  %1 = load i8, ptr %arrayidx10, align 1, !range !8, !noundef !9
  %loadedv = zext nneg i8 %1 to i32
  %2 = and i32 %conv, %loadedv
  %and12 = and i32 %2, %conv7
  %arrayidx19 = getelementptr inbounds [256 x i8], ptr %prev, i64 %indvars.iv, i64 %0
  %3 = load i8, ptr %arrayidx19, align 1, !range !8, !noundef !9
  %loadedv20 = zext nneg i8 %3 to i32
  %and22 = and i32 %loadedv20, %conv
  %neighbors.1 = add nuw nsw i32 %and12, %and22
  %cmp29 = icmp ne i64 %indvars.iv, 511
  %conv30 = zext i1 %cmp29 to i32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx36 = getelementptr inbounds [256 x i8], ptr %prev, i64 %indvars.iv.next, i64 %0
  %4 = load i8, ptr %arrayidx36, align 1, !range !8, !noundef !9
  %loadedv37 = zext nneg i8 %4 to i32
  %5 = and i32 %conv, %loadedv37
  %and39 = and i32 %5, %conv30
  %neighbors.2 = add nuw nsw i32 %neighbors.1, %and39
  %arrayidx50 = getelementptr nusw [256 x i8], ptr %invariant.gep, i64 %indvars.iv, i64 %indvars.iv218
  %6 = load i8, ptr %arrayidx50, align 1, !range !8, !noundef !9
  %loadedv51 = zext nneg i8 %6 to i32
  %and53 = and i32 %loadedv51, %conv7
  %neighbors.3 = add nuw nsw i32 %neighbors.2, %and53
  %arrayidx64 = getelementptr inbounds [256 x i8], ptr %prev, i64 %indvars.iv.next, i64 %indvars.iv218
  %7 = load i8, ptr %arrayidx64, align 1, !range !8, !noundef !9
  %loadedv65 = zext nneg i8 %7 to i32
  %and67 = and i32 %loadedv65, %conv30
  %neighbors.4 = add nuw nsw i32 %neighbors.3, %and67
  %arrayidx82 = getelementptr nusw [256 x i8], ptr %invariant.gep, i64 %indvars.iv, i64 %indvars.iv.next219
  %8 = load i8, ptr %arrayidx82, align 1, !range !8, !noundef !9
  %loadedv83 = zext nneg i8 %8 to i32
  %and85 = and i32 %loadedv83, %conv7
  %neighbors.5 = add nuw nsw i32 %neighbors.4, %and85
  %arrayidx96 = getelementptr inbounds [256 x i8], ptr %prev, i64 %indvars.iv, i64 %indvars.iv.next219
  %9 = load i8, ptr %arrayidx96, align 1, !range !8, !noundef !9
  %inc102 = zext nneg i8 %9 to i32
  %neighbors.6 = add nuw nsw i32 %neighbors.5, %inc102
  %arrayidx114 = getelementptr inbounds [256 x i8], ptr %prev, i64 %indvars.iv.next, i64 %indvars.iv.next219
  %10 = load i8, ptr %arrayidx114, align 1, !range !8, !noundef !9
  %loadedv115 = zext nneg i8 %10 to i32
  %and117 = and i32 %loadedv115, %conv30
  %neighbors.7 = add nuw nsw i32 %neighbors.6, %and117
  %cmp122 = icmp ne i32 %neighbors.7, 2
  %arrayidx127 = getelementptr inbounds [256 x i8], ptr %prev, i64 %indvars.iv, i64 %indvars.iv218
  %11 = load i8, ptr %arrayidx127, align 1, !range !8, !noundef !9
  %tobool133.not214 = icmp eq i8 %11, 0
  %tobool133.not = or i1 %tobool133.not214, %cmp122
  br i1 %tobool133.not, label %if.else, label %if.then134

if.then134:                                       ; preds = %for.body4
  %arrayidx138 = getelementptr inbounds [256 x i8], ptr %current, i64 %indvars.iv, i64 %indvars.iv218
  store i8 1, ptr %arrayidx138, align 1
  br label %if.end152

if.else:                                          ; preds = %for.body4
  %cmp139 = icmp eq i32 %neighbors.7, 3
  %arrayidx145 = getelementptr inbounds [256 x i8], ptr %current, i64 %indvars.iv, i64 %indvars.iv218
  br i1 %cmp139, label %if.then141, label %if.else146

if.then141:                                       ; preds = %if.else
  store i8 1, ptr %arrayidx145, align 1
  br label %if.end152

if.else146:                                       ; preds = %if.else
  store i8 0, ptr %arrayidx145, align 1
  br label %if.end152

if.end152:                                        ; preds = %if.then141, %if.else146, %if.then134
  %exitcond.not = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !10
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @gen_initial_frame(ptr nocapture noundef writeonly %frame) local_unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.cond.cleanup3
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.cond.cleanup3 ]
  br label %for.body4

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  ret void

for.cond.cleanup3:                                ; preds = %for.body4
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next25, 256
  br i1 %exitcond27.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !11

for.body4:                                        ; preds = %for.cond1.preheader, %for.body4
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body4 ]
  %call = tail call i32 @simRand() #6
  %0 = and i32 %call, 3
  %tobool.not = icmp ne i32 %0, 0
  %arrayidx10 = getelementptr inbounds [256 x i8], ptr %frame, i64 %indvars.iv, i64 %indvars.iv24
  %. = zext i1 %tobool.not to i8
  store i8 %., ptr %arrayidx10, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond.not, label %for.cond.cleanup3, label %for.body4, !llvm.loop !12
}

declare dso_local i32 @simRand(...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #4 {
entry:
  %current_data = alloca [512 x [256 x i8]], align 16
  %prev_data = alloca [512 x [256 x i8]], align 16
  call void @llvm.lifetime.start.p0(i64 131072, ptr nonnull %current_data) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(131072) %current_data, i8 0, i64 131072, i1 false)
  call void @llvm.lifetime.start.p0(i64 131072, ptr nonnull %prev_data) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(131072) %prev_data, i8 0, i64 131072, i1 false)
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond.cleanup3.i, %entry
  %indvars.iv24.i = phi i64 [ 0, %entry ], [ %indvars.iv.next25.i, %for.cond.cleanup3.i ]
  br label %for.body4.i

for.cond.cleanup3.i:                              ; preds = %for.body4.i
  %indvars.iv.next25.i = add nuw nsw i64 %indvars.iv24.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next25.i, 256
  br i1 %exitcond27.not.i, label %for.cond2.preheader, label %for.cond1.preheader.i, !llvm.loop !11

for.body4.i:                                      ; preds = %for.body4.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i, %for.body4.i ]
  %call.i = tail call i32 @simRand() #6
  %0 = and i32 %call.i, 3
  %tobool.not.i = icmp ne i32 %0, 0
  %arrayidx10.i = getelementptr inbounds [256 x i8], ptr %prev_data, i64 %indvars.iv.i, i64 %indvars.iv24.i
  %. = zext i1 %tobool.not.i to i8
  store i8 %., ptr %arrayidx10.i, align 1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 512
  br i1 %exitcond.not.i, label %for.cond.cleanup3.i, label %for.body4.i, !llvm.loop !12

for.cond2.preheader:                              ; preds = %for.cond.cleanup3.i, %for.cond2.preheader.backedge
  %indvars.iv57 = phi i64 [ %indvars.iv57.be, %for.cond2.preheader.backedge ], [ 0, %for.cond.cleanup3.i ]
  %1 = trunc nuw nsw i64 %indvars.iv57 to i32
  br label %for.body5

for.cond.cleanup:                                 ; preds = %for.cond.cleanup4
  call void @cell_process(ptr noundef nonnull %prev_data, ptr noundef nonnull %current_data)
  br label %for.cond19.preheader

for.cond.cleanup4:                                ; preds = %for.body5
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60.not = icmp eq i64 %indvars.iv.next58, 256
  br i1 %exitcond60.not, label %for.cond.cleanup, label %for.cond2.preheader.backedge

for.cond2.preheader.backedge:                     ; preds = %for.cond.cleanup4, %for.cond.cleanup16
  %indvars.iv57.be = phi i64 [ %indvars.iv.next58, %for.cond.cleanup4 ], [ 0, %for.cond.cleanup16 ]
  br label %for.cond2.preheader, !llvm.loop !13

for.body5:                                        ; preds = %for.cond2.preheader, %for.body5
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.body5 ]
  %arrayidx7 = getelementptr inbounds [512 x [256 x i8]], ptr %prev_data, i64 0, i64 %indvars.iv, i64 %indvars.iv57
  %2 = load i8, ptr %arrayidx7, align 1, !range !8, !noundef !9
  %loadedv = trunc nuw i8 %2 to i1
  %3 = trunc nuw nsw i64 %indvars.iv to i32
  %.68 = select i1 %loadedv, i32 -16733441, i32 0
  tail call void @simPutPixel(i32 noundef %3, i32 noundef %1, i32 noundef %.68) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 512
  br i1 %exitcond.not, label %for.cond.cleanup4, label %for.body5, !llvm.loop !14

for.cond19.preheader:                             ; preds = %for.cond.cleanup, %for.cond.cleanup21
  %indvars.iv64 = phi i64 [ 0, %for.cond.cleanup ], [ %indvars.iv.next65, %for.cond.cleanup21 ]
  br label %for.body22

for.cond.cleanup16:                               ; preds = %for.cond.cleanup21
  tail call void @simFlush() #6
  br label %for.cond2.preheader.backedge

for.cond.cleanup21:                               ; preds = %for.body22
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %cmp15.not = icmp eq i64 %indvars.iv.next65, 256
  br i1 %cmp15.not, label %for.cond.cleanup16, label %for.cond19.preheader, !llvm.loop !15

for.body22:                                       ; preds = %for.cond19.preheader, %for.body22
  %indvars.iv61 = phi i64 [ 0, %for.cond19.preheader ], [ %indvars.iv.next62, %for.body22 ]
  %arrayidx26 = getelementptr inbounds [512 x [256 x i8]], ptr %current_data, i64 0, i64 %indvars.iv61, i64 %indvars.iv64
  %4 = load i8, ptr %arrayidx26, align 1, !range !8, !noundef !9
  %arrayidx31 = getelementptr inbounds [512 x [256 x i8]], ptr %prev_data, i64 0, i64 %indvars.iv61, i64 %indvars.iv64
  store i8 %4, ptr %arrayidx31, align 1
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %cmp20.not = icmp eq i64 %indvars.iv.next62, 512
  br i1 %cmp20.not, label %for.cond.cleanup21, label %for.body22, !llvm.loop !16
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

declare dso_local void @simFlush(...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nocapture noundef readnone %argv) local_unnamed_addr #4 {
entry:
  tail call void @simInit() #6
  tail call void @app()
  unreachable
}

declare dso_local void @simInit(...) local_unnamed_addr #3

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 19.1.6"}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = !{i8 0, i8 2}
!9 = !{}
!10 = distinct !{!10, !6, !7}
!11 = distinct !{!11, !6, !7}
!12 = distinct !{!12, !6, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !6, !7}
!15 = distinct !{!15, !6, !7}
!16 = distinct !{!16, !6, !7}
