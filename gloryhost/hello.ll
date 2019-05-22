source_filename = "test"
target datalayout = "e-m:e-p:64:64-i64:64-f80:128-n8:16:32:64-S128"

@global_var_4010.1 = global i64 0
@global_var_2004.3 = constant [13 x i8] c"Hello There!\00"
@global_var_3db8.4 = global i64 4400
@global_var_3dc0.5 = global i64 4336
@0 = external global i32

define i64 @_init() local_unnamed_addr {
dec_label_pc_1000:
  %v0_1004 = load i64, i64* inttoptr (i64 16360 to i64*), align 8
  %v1_100b = icmp eq i64 %v0_1004, 0
  br i1 %v1_100b, label %dec_label_pc_1012, label %dec_label_pc_1010

dec_label_pc_1010:                                ; preds = %dec_label_pc_1000
  call void @__gmon_start__()
  br label %dec_label_pc_1012

dec_label_pc_1012:                                ; preds = %dec_label_pc_1010, %dec_label_pc_1000
  %v0_1016 = phi i64 [ ptrtoint (i32* @0 to i64), %dec_label_pc_1010 ], [ 0, %dec_label_pc_1000 ]
  ret i64 %v0_1016
}

define i32 @function_1030(i8* %format, ...) local_unnamed_addr {
dec_label_pc_1030:
  %v2_1030 = call i32 (i8*, ...) @printf(i8* %format)
  ret i32 %v2_1030
}

define void @function_1040(i64* %d) local_unnamed_addr {
dec_label_pc_1040:
  call void @__cxa_finalize(i64* %d)
  ret void
}

define i64 @_start(i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4) local_unnamed_addr {
dec_label_pc_1050:
  %rdx.global-to-local = alloca i64, align 8
  store i64 %arg3, i64* %rdx.global-to-local, align 8
  %stack_var_8 = alloca i64, align 8
  %v0_1052 = load i64, i64* %rdx.global-to-local, align 8
  %v4_1055 = ptrtoint i64* %stack_var_8 to i64
  %tmp248 = bitcast i64* %stack_var_8 to i8**
  store i64 %v4_1055, i64* %rdx.global-to-local, align 8
  %v2_1074 = trunc i64 %arg4 to i32
  %v13_1074 = inttoptr i64 %v0_1052 to void ()*
  %v14_1074 = call i32 @__libc_start_main(i64 4405, i32 %v2_1074, i8** %tmp248, void ()* inttoptr (i64 4448 to void ()*), void ()* inttoptr (i64 4544 to void ()*), void ()* %v13_1074)
  %v0_107a = call i64 @__asm_hlt()
  unreachable
}

define i64 @deregister_tm_clones() local_unnamed_addr {
dec_label_pc_1080:
  ret i64 ptrtoint (i64* @global_var_4010.1 to i64)
}

define i64 @register_tm_clones() local_unnamed_addr {
dec_label_pc_10b0:
  ret i64 0
}

define i64 @__do_global_dtors_aux() local_unnamed_addr {
dec_label_pc_10f0:
  %rax.global-to-local = alloca i64, align 8
  %rbp.global-to-local = alloca i64, align 8
  %stack_var_-8 = alloca i64, align 8
  %v0_10f0 = load i8, i8* bitcast (i64* @global_var_4010.1 to i8*), align 8
  %v7_10f0 = icmp eq i8 %v0_10f0, 0
  %v1_10f7 = icmp eq i1 %v7_10f0, false
  br i1 %v1_10f7, label %dec_label_pc_1128, label %dec_label_pc_10f9

dec_label_pc_10f9:                                ; preds = %dec_label_pc_10f0
  %v0_10f9 = load i64, i64* %rbp.global-to-local, align 8
  store i64 %v0_10f9, i64* %stack_var_-8, align 8
  %v4_10f9 = ptrtoint i64* %stack_var_-8 to i64
  %v0_10fa = load i64, i64* inttoptr (i64 16376 to i64*), align 8
  %v7_10fa = icmp eq i64 %v0_10fa, 0
  store i64 %v4_10f9, i64* %rbp.global-to-local, align 8
  br i1 %v7_10fa, label %dec_label_pc_1113, label %dec_label_pc_1107

dec_label_pc_1107:                                ; preds = %dec_label_pc_10f9
  %v0_1107 = load i64, i64* inttoptr (i64 16392 to i64*), align 8
  %v1_110e = inttoptr i64 %v0_1107 to i64*
  call void @__cxa_finalize(i64* %v1_110e)
  store i64 ptrtoint (i32* @0 to i64), i64* %rax.global-to-local, align 8
  br label %dec_label_pc_1113

dec_label_pc_1113:                                ; preds = %dec_label_pc_1107, %dec_label_pc_10f9
  %v0_1113 = call i64 @deregister_tm_clones()
  store i64 %v0_1113, i64* %rax.global-to-local, align 8
  store i8 1, i8* bitcast (i64* @global_var_4010.1 to i8*), align 8
  %v2_111f = load i64, i64* %stack_var_-8, align 8
  store i64 %v2_111f, i64* %rbp.global-to-local, align 8
  ret i64 %v0_1113

dec_label_pc_1128:                                ; preds = %dec_label_pc_10f0
  %v0_1128 = load i64, i64* %rax.global-to-local, align 8
  ret i64 %v0_1128
}

define i64 @frame_dummy() local_unnamed_addr {
dec_label_pc_1130:
  %v0_1130 = call i64 @register_tm_clones()
  ret i64 %v0_1130
}

define i64 @main(i64 %argc, i8** %argv) local_unnamed_addr {
dec_label_pc_1135:
  %v3_1145 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @global_var_2004.3, i64 0, i64 0))
  ret i64 0
}

define i64 @__libc_csu_init(i64 %arg1, i64 %arg2, i64 %arg3) local_unnamed_addr {
dec_label_pc_1160:
  %r12.global-to-local = alloca i64, align 8
  %r13.global-to-local = alloca i64, align 8
  %r14.global-to-local = alloca i64, align 8
  %r15.global-to-local = alloca i64, align 8
  %rbp.global-to-local = alloca i64, align 8
  %rbx.global-to-local = alloca i64, align 8
  %rdi.global-to-local = alloca i64, align 8
  %rdx.global-to-local = alloca i64, align 8
  %rsi.global-to-local = alloca i64, align 8
  store i64 %arg3, i64* %rdx.global-to-local, align 8
  store i64 %arg2, i64* %rsi.global-to-local, align 8
  store i64 %arg1, i64* %rdi.global-to-local, align 8
  %v0_1160 = load i64, i64* %r15.global-to-local, align 8
  %v0_1162 = load i64, i64* %rdx.global-to-local, align 8
  store i64 %v0_1162, i64* %r15.global-to-local, align 8
  %v0_1165 = load i64, i64* %r14.global-to-local, align 8
  %v0_1167 = load i64, i64* %rsi.global-to-local, align 8
  store i64 %v0_1167, i64* %r14.global-to-local, align 8
  %v0_116a = load i64, i64* %r13.global-to-local, align 8
  %v0_116c = load i64, i64* %rdi.global-to-local, align 8
  store i64 %v0_116c, i64* %r13.global-to-local, align 8
  %v0_116f = load i64, i64* %r12.global-to-local, align 8
  store i64 ptrtoint (i64* @global_var_3db8.4 to i64), i64* %r12.global-to-local, align 8
  %v0_1178 = load i64, i64* %rbp.global-to-local, align 8
  %v0_1180 = load i64, i64* %rbx.global-to-local, align 8
  store i64 sub (i64 ptrtoint (i64* @global_var_3dc0.5 to i64), i64 ptrtoint (i64* @global_var_3db8.4 to i64)), i64* %rbp.global-to-local, align 8
  %v0_1188 = call i64 @_init()
  store i64 sdiv (i64 sub (i64 ptrtoint (i64* @global_var_3dc0.5 to i64), i64 ptrtoint (i64* @global_var_3db8.4 to i64)), i64 8), i64* %rbp.global-to-local, align 8
  br i1 icmp eq (i64 sdiv (i64 sub (i64 ptrtoint (i64* @global_var_3dc0.5 to i64), i64 ptrtoint (i64* @global_var_3db8.4 to i64)), i64 8), i64 0), label %dec_label_pc_11ae, label %dec_label_pc_1193

dec_label_pc_1193:                                ; preds = %dec_label_pc_1160
  store i64 0, i64* %rbx.global-to-local, align 8
  %v0_1198 = load i64, i64* %r15.global-to-local, align 8
  %v0_119b = load i64, i64* %r14.global-to-local, align 8
  %v0_119e = load i64, i64* %r13.global-to-local, align 8
  br label %dec_label_pc_1198

dec_label_pc_1198:                                ; preds = %dec_label_pc_1198, %dec_label_pc_1193
  %v1_11a52 = phi i64 [ %v1_11a5, %dec_label_pc_1198 ], [ 0, %dec_label_pc_1193 ]
  %v1_11a5 = add i64 %v1_11a52, 1
  %v12_11a9 = icmp eq i64 %v1_11a5, sdiv (i64 sub (i64 ptrtoint (i64* @global_var_3dc0.5 to i64), i64 ptrtoint (i64* @global_var_3db8.4 to i64)), i64 8)
  %v1_11ac = icmp eq i1 %v12_11a9, false
  br i1 %v1_11ac, label %dec_label_pc_1198, label %dec_label_pc_11ae.loopexit

dec_label_pc_11ae.loopexit:                       ; preds = %dec_label_pc_1198
  store i64 %v0_1198, i64* %rdx.global-to-local, align 8
  store i64 %v0_119b, i64* %rsi.global-to-local, align 8
  store i64 %v0_119e, i64* %rdi.global-to-local, align 8
  store i64 %v1_11a5, i64* %rbx.global-to-local, align 8
  br label %dec_label_pc_11ae

dec_label_pc_11ae:                                ; preds = %dec_label_pc_11ae.loopexit, %dec_label_pc_1160
  store i64 %v0_1180, i64* %rbx.global-to-local, align 8
  store i64 %v0_1178, i64* %rbp.global-to-local, align 8
  store i64 %v0_116f, i64* %r12.global-to-local, align 8
  store i64 %v0_116a, i64* %r13.global-to-local, align 8
  store i64 %v0_1165, i64* %r14.global-to-local, align 8
  store i64 %v0_1160, i64* %r15.global-to-local, align 8
  ret i64 %v0_1188
}

define i64 @__libc_csu_fini() local_unnamed_addr {
dec_label_pc_11c0:
  %rax.global-to-local = alloca i64, align 8
  %v0_11c0 = load i64, i64* %rax.global-to-local, align 8
  ret i64 %v0_11c0
}

define i64 @_fini() local_unnamed_addr {
dec_label_pc_11c4:
  %rax.global-to-local = alloca i64, align 8
  %v0_11cc = load i64, i64* %rax.global-to-local, align 8
  ret i64 %v0_11cc
}

declare i32 @printf(i8*, ...) local_unnamed_addr

declare i32 @__libc_start_main(i64, i32, i8**, void ()*, void ()*, void ()*) local_unnamed_addr

declare void @__gmon_start__() local_unnamed_addr

declare void @__cxa_finalize(i64*) local_unnamed_addr

declare i64 @__asm_hlt() local_unnamed_addr
