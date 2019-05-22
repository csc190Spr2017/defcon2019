	.text
	.file	"hello.c"
	.section	.text.main,"",@
	.hidden	main
	.globl	main
	.type	main,@function
main:
	.result 	i32
	i32.const	$push1=, .L.str
	i32.const	$push0=, 0
	i32.call	$push3=, printf@FUNCTION, $pop1, $pop0
	drop	$pop3
	i32.const	$push2=, 0
	end_function
.Lfunc_end0:
	.size	main, .Lfunc_end0-main

	.type	.L.str,@object
	.section	.rodata..L.str,"",@
.L.str:
	.asciz	"Hello There!"
	.size	.L.str, 13


	.ident	"clang version 7.0.0-3 (tags/RELEASE_700/final)"
	.functype	printf, i32, i32
