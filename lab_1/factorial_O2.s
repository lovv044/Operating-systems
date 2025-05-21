	.file	"factorial.cpp"
	.intel_syntax noprefix
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1791:
	.cfi_startproc
	mov	eax, esi
	ret
	.cfi_endproc
.LFE1791:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Factorial of "
.LC1:
	.string	" is "
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.section	.text.startup,"ax",@progbits
.LHOTB2:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2039:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	lea	rsi, .LC0[rip]
	lea	rdi, _ZSt4cout[rip]
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	esi, 5
	mov	rdi, rax
	call	_ZNSolsEi@PLT
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	mov	esi, 120
	mov	rdi, rax
	call	_ZNSolsEi@PLT
	mov	rbx, rax
	mov	rax, QWORD PTR [rax]
	mov	rax, QWORD PTR -24[rax]
	mov	rbp, QWORD PTR 240[rbx+rax]
	test	rbp, rbp
	je	.L8
	cmp	BYTE PTR 56[rbp], 0
	je	.L5
	movsx	esi, BYTE PTR 67[rbp]
.L6:
	mov	rdi, rbx
	call	_ZNSo3putEc@PLT
	mov	rdi, rax
	call	_ZNSo5flushEv@PLT
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	mov	rdi, rbp
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	mov	rax, QWORD PTR 0[rbp]
	mov	esi, 10
	lea	rdx, _ZNKSt5ctypeIcE8do_widenEc[rip]
	mov	rax, QWORD PTR 48[rax]
	cmp	rax, rdx
	je	.L6
	mov	esi, 10
	mov	rdi, rbp
	call	rax
	movsx	esi, al
	jmp	.L6
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB2039:
.L8:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2039:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE2:
	.section	.text.startup
.LHOTE2:
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
