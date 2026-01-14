	.file	"axpy_v1.cc"
	.intel_syntax noprefix
	.text
	.section	.text._Z7axpy_v1IfiEvT0_T_PKS1_PS1_,"axG",@progbits,_Z7axpy_v1IfiEvT0_T_PKS1_PS1_,comdat
	.p2align 4
	.weak	_Z7axpy_v1IfiEvT0_T_PKS1_PS1_
	.type	_Z7axpy_v1IfiEvT0_T_PKS1_PS1_, @function
_Z7axpy_v1IfiEvT0_T_PKS1_PS1_:
.LFB6444:
	.cfi_startproc
	movsx	rax, edi
	test	eax, eax
	jle	.L19
	lea	ecx, [rax-1]
	mov	r8d, eax
	cmp	ecx, 2
	jbe	.L3
	lea	r9, [rsi+4]
	mov	rdi, rdx
	sub	rdi, r9
	cmp	rdi, 24
	ja	.L21
.L3:
	lea	rcx, [0+rax*4]
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L9:
	vmovss	xmm1, DWORD PTR [rsi+rax]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [rdx+rax]
	vmovss	DWORD PTR [rdx+rax], xmm1
	add	rax, 4
	cmp	rax, rcx
	jne	.L9
	ret
.L17:
	vzeroupper
.L19:
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	cmp	ecx, 6
	jbe	.L11
	mov	edi, eax
	vbroadcastss	ymm2, xmm0
	xor	ecx, ecx
	shr	edi, 3
	sal	rdi, 5
	.p2align 4,,10
	.p2align 3
.L5:
	vmovups	ymm1, YMMWORD PTR [rsi+rcx]
	vfmadd213ps	ymm1, ymm2, YMMWORD PTR [rdx+rcx]
	vmovups	YMMWORD PTR [rdx+rcx], ymm1
	add	rcx, 32
	cmp	rdi, rcx
	jne	.L5
	mov	ecx, eax
	and	ecx, -8
	mov	edi, ecx
	cmp	eax, ecx
	je	.L17
	mov	r8d, eax
	sub	r8d, ecx
	lea	r9d, [r8-1]
	cmp	r9d, 2
	jbe	.L22
	vzeroupper
.L4:
	lea	r9, [rdx+rdi*4]
	vshufps	xmm1, xmm0, xmm0, 0
	vmovups	xmm3, XMMWORD PTR [r9]
	vfmadd132ps	xmm1, xmm3, XMMWORD PTR [rsi+rdi*4]
	mov	edi, r8d
	and	edi, -4
	add	ecx, edi
	and	r8d, 3
	vmovups	XMMWORD PTR [r9], xmm1
	je	.L19
.L7:
	movsx	r9, ecx
	lea	rdi, [0+r9*4]
	vmovss	xmm1, DWORD PTR [rsi+r9*4]
	lea	r8, [rdx+rdi]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	lea	r8d, [rcx+1]
	cmp	eax, r8d
	jle	.L19
	lea	r8, [rdx+4+rdi]
	vmovss	xmm1, DWORD PTR [rsi+4+rdi]
	add	ecx, 2
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	cmp	eax, ecx
	jle	.L19
	lea	rax, [rdx+8+rdi]
	vmovss	xmm4, DWORD PTR [rax]
	vfmadd132ss	xmm0, xmm4, DWORD PTR [rsi+8+rdi]
	vmovss	DWORD PTR [rax], xmm0
	ret
.L11:
	xor	edi, edi
	xor	ecx, ecx
	jmp	.L4
.L22:
	vzeroupper
	jmp	.L7
	.cfi_endproc
.LFE6444:
	.size	_Z7axpy_v1IfiEvT0_T_PKS1_PS1_, .-_Z7axpy_v1IfiEvT0_T_PKS1_PS1_
	.section	.text._Z7axpy_v1IdiEvT0_T_PKS1_PS1_,"axG",@progbits,_Z7axpy_v1IdiEvT0_T_PKS1_PS1_,comdat
	.p2align 4
	.weak	_Z7axpy_v1IdiEvT0_T_PKS1_PS1_
	.type	_Z7axpy_v1IdiEvT0_T_PKS1_PS1_, @function
_Z7axpy_v1IdiEvT0_T_PKS1_PS1_:
.LFB6445:
	.cfi_startproc
	movsx	rax, edi
	test	eax, eax
	jle	.L47
	cmp	eax, 1
	je	.L25
	lea	rdi, [rsi+8]
	mov	rcx, rdx
	sub	rcx, rdi
	cmp	rcx, 16
	ja	.L48
.L25:
	lea	rcx, [0+rax*8]
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L31:
	vmovsd	xmm1, QWORD PTR [rsi+rax]
	vfmadd213sd	xmm1, xmm0, QWORD PTR [rdx+rax]
	vmovsd	QWORD PTR [rdx+rax], xmm1
	add	rax, 8
	cmp	rax, rcx
	jne	.L31
	ret
.L45:
	vzeroupper
.L47:
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	lea	ecx, [rax-1]
	mov	r8d, eax
	cmp	ecx, 2
	jbe	.L33
	mov	edi, eax
	vbroadcastsd	ymm2, xmm0
	xor	ecx, ecx
	shr	edi, 2
	sal	rdi, 5
	.p2align 4,,10
	.p2align 3
.L27:
	vmovupd	ymm1, YMMWORD PTR [rsi+rcx]
	vfmadd213pd	ymm1, ymm2, YMMWORD PTR [rdx+rcx]
	vmovupd	YMMWORD PTR [rdx+rcx], ymm1
	add	rcx, 32
	cmp	rdi, rcx
	jne	.L27
	mov	ecx, eax
	and	ecx, -4
	mov	edi, ecx
	cmp	eax, ecx
	je	.L45
	sub	eax, ecx
	mov	r8d, eax
	cmp	eax, 1
	je	.L49
	vzeroupper
.L26:
	mov	eax, edi
	vmovddup	xmm1, xmm0
	lea	rdi, [rdx+rax*8]
	vmovupd	xmm4, XMMWORD PTR [rdi]
	vfmadd132pd	xmm1, xmm4, XMMWORD PTR [rsi+rax*8]
	vmovupd	XMMWORD PTR [rdi], xmm1
	test	r8b, 1
	je	.L47
	and	r8d, -2
	add	ecx, r8d
.L29:
	movsx	rax, ecx
	lea	rdx, [rdx+rax*8]
	vmovsd	xmm3, QWORD PTR [rdx]
	vfmadd132sd	xmm0, xmm3, QWORD PTR [rsi+rax*8]
	vmovsd	QWORD PTR [rdx], xmm0
	ret
.L33:
	xor	edi, edi
	xor	ecx, ecx
	jmp	.L26
.L49:
	vzeroupper
	jmp	.L29
	.cfi_endproc
.LFE6445:
	.size	_Z7axpy_v1IdiEvT0_T_PKS1_PS1_, .-_Z7axpy_v1IdiEvT0_T_PKS1_PS1_
	.text
	.p2align 4
	.globl	_Z7axpy_v2ifPKfPf
	.type	_Z7axpy_v2ifPKfPf, @function
_Z7axpy_v2ifPKfPf:
.LFB6440:
	.cfi_startproc
	mov	rcx, rsi
	vbroadcastss	ymm2, xmm0
	cmp	edi, 7
	jle	.L60
	lea	esi, [rdi-7]
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L52:
	vmovups	ymm1, YMMWORD PTR [rcx+rax*4]
	vfmadd213ps	ymm1, ymm2, YMMWORD PTR [rdx+rax*4]
	vmovups	YMMWORD PTR [rdx+rax*4], ymm1
	add	rax, 8
	cmp	esi, eax
	jg	.L52
	lea	eax, [rdi-8]
	shr	eax, 3
	lea	eax, [8+rax*8]
.L51:
	cmp	edi, eax
	jle	.L73
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r8d, edi
	movsx	r9, eax
	sub	r8d, eax
	lea	r11d, [r8-1]
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	.cfi_offset 3, -24
	cmp	r11d, 2
	jbe	.L54
	lea	rsi, [0+r9*4]
	lea	r10, [rdx+rsi]
	lea	rbx, [rcx+4+rsi]
	mov	rsi, r10
	sub	rsi, rbx
	cmp	rsi, 24
	ja	.L76
.L54:
	lea	rsi, [0+r9*4]
	vmovss	xmm1, DWORD PTR [rcx+r9*4]
	lea	r8, [rdx+rsi]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	lea	r8d, [rax+1]
	cmp	edi, r8d
	jle	.L71
	lea	r8, [rdx+4+rsi]
	vmovss	xmm1, DWORD PTR [rcx+4+rsi]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	lea	r8d, [rax+2]
	cmp	edi, r8d
	jle	.L71
	lea	r8, [rdx+8+rsi]
	vmovss	xmm1, DWORD PTR [rcx+8+rsi]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	lea	r8d, [rax+3]
	cmp	edi, r8d
	jle	.L71
	lea	r8, [rdx+12+rsi]
	vmovss	xmm1, DWORD PTR [rcx+12+rsi]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	lea	r8d, [rax+4]
	cmp	edi, r8d
	jle	.L71
	lea	r8, [rdx+16+rsi]
	vmovss	xmm1, DWORD PTR [rcx+16+rsi]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	lea	r8d, [rax+5]
	cmp	edi, r8d
	jle	.L71
	lea	r8, [rdx+20+rsi]
	vmovss	xmm1, DWORD PTR [rcx+20+rsi]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	lea	r8d, [rax+6]
	cmp	edi, r8d
	jle	.L71
	lea	r8, [rdx+24+rsi]
	vmovss	xmm1, DWORD PTR [rcx+24+rsi]
	add	eax, 7
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	cmp	edi, eax
	jle	.L71
	lea	rax, [rdx+28+rsi]
	vmovss	xmm6, DWORD PTR [rax]
	vfmadd132ss	xmm0, xmm6, DWORD PTR [rcx+28+rsi]
	vmovss	DWORD PTR [rax], xmm0
	vzeroupper
	mov	rbx, QWORD PTR [rbp-8]
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
	cmp	r11d, 6
	jbe	.L61
	vmovups	ymm4, YMMWORD PTR [r10]
	vfmadd132ps	ymm2, ymm4, YMMWORD PTR [rcx+r9*4]
	mov	esi, r8d
	and	esi, -8
	add	eax, esi
	vmovups	YMMWORD PTR [r10], ymm2
	test	r8b, 7
	je	.L71
	sub	r8d, esi
	lea	r10d, [r8-1]
	cmp	r10d, 2
	jbe	.L57
.L55:
	add	rsi, r9
	vshufps	xmm1, xmm0, xmm0, 0
	lea	r9, [rdx+rsi*4]
	vmovups	xmm3, XMMWORD PTR [r9]
	vfmadd132ps	xmm1, xmm3, XMMWORD PTR [rcx+rsi*4]
	mov	esi, r8d
	and	esi, -4
	add	eax, esi
	and	r8d, 3
	vmovups	XMMWORD PTR [r9], xmm1
	je	.L71
.L57:
	movsx	r9, eax
	lea	rsi, [0+r9*4]
	vmovss	xmm1, DWORD PTR [rcx+r9*4]
	lea	r8, [rdx+rsi]
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	lea	r8d, [rax+1]
	cmp	edi, r8d
	jle	.L71
	lea	r8, [rdx+4+rsi]
	vmovss	xmm1, DWORD PTR [rcx+4+rsi]
	add	eax, 2
	vfmadd213ss	xmm1, xmm0, DWORD PTR [r8]
	vmovss	DWORD PTR [r8], xmm1
	cmp	edi, eax
	jle	.L71
	lea	rax, [rdx+8+rsi]
	vmovss	xmm5, DWORD PTR [rax]
	vfmadd132ss	xmm0, xmm5, DWORD PTR [rcx+8+rsi]
	vmovss	DWORD PTR [rax], xmm0
.L71:
	vzeroupper
	mov	rbx, QWORD PTR [rbp-8]
	leave
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore 3
	.cfi_restore 6
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L60:
	xor	eax, eax
	jmp	.L51
.L61:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	xor	esi, esi
	jmp	.L55
	.cfi_endproc
.LFE6440:
	.size	_Z7axpy_v2ifPKfPf, .-_Z7axpy_v2ifPKfPf
	.p2align 4
	.globl	_Z7axpy_v3ifPKfPf
	.type	_Z7axpy_v3ifPKfPf, @function
_Z7axpy_v3ifPKfPf:
.LFB6441:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vbroadcastss	ymm1, xmm0
	mov	r8d, edi
	vmovaps	xmm2, xmm0
	mov	r9, rsi
	mov	rcx, rdx
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r12
	push	rbx
	and	rsp, -32
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	vmovaps	YMMWORD PTR [rsp-32], ymm1
	cmp	edi, 63
	jle	.L89
	lea	edi, [rdi-64]
	mov	rax, rdx
	mov	rdx, rsi
	shr	edi, 6
	mov	esi, edi
	sal	rsi, 8
	lea	rsi, [rcx+256+rsi]
	.p2align 4,,10
	.p2align 3
.L79:
	vmovaps	ymm0, YMMWORD PTR [rsp-32]
	vmovups	ymm3, YMMWORD PTR [rax]
	add	rax, 256
	add	rdx, 256
	vfmadd132ps	ymm0, ymm3, YMMWORD PTR [rdx-256]
	vmovups	ymm4, YMMWORD PTR [rax-224]
	vmovups	ymm5, YMMWORD PTR [rax-192]
	vmovups	ymm6, YMMWORD PTR [rax-160]
	vmovups	ymm7, YMMWORD PTR [rax-128]
	vmovups	ymm3, YMMWORD PTR [rax-96]
	vmovups	YMMWORD PTR [rax-256], ymm0
	vmovaps	ymm0, YMMWORD PTR [rsp-32]
	vfmadd132ps	ymm0, ymm4, YMMWORD PTR [rdx-224]
	vmovups	ymm4, YMMWORD PTR [rax-64]
	vmovups	YMMWORD PTR [rax-224], ymm0
	vmovaps	ymm0, YMMWORD PTR [rsp-32]
	vfmadd132ps	ymm0, ymm5, YMMWORD PTR [rdx-192]
	vmovups	ymm5, YMMWORD PTR [rax-32]
	vmovups	YMMWORD PTR [rax-192], ymm0
	vmovaps	ymm0, YMMWORD PTR [rsp-32]
	vfmadd132ps	ymm0, ymm6, YMMWORD PTR [rdx-160]
	vmovups	YMMWORD PTR [rax-160], ymm0
	vmovaps	ymm0, YMMWORD PTR [rsp-32]
	vfmadd132ps	ymm0, ymm7, YMMWORD PTR [rdx-128]
	vmovups	YMMWORD PTR [rax-128], ymm0
	vmovaps	ymm0, YMMWORD PTR [rsp-32]
	vfmadd132ps	ymm0, ymm3, YMMWORD PTR [rdx-96]
	vmovups	YMMWORD PTR [rax-96], ymm0
	vmovaps	ymm0, YMMWORD PTR [rsp-32]
	vfmadd132ps	ymm0, ymm4, YMMWORD PTR [rdx-64]
	vmovups	YMMWORD PTR [rax-64], ymm0
	vmovaps	ymm0, YMMWORD PTR [rsp-32]
	vfmadd132ps	ymm0, ymm5, YMMWORD PTR [rdx-32]
	vmovups	YMMWORD PTR [rax-32], ymm0
	cmp	rax, rsi
	jne	.L79
	lea	edx, [rdi+1]
	sal	edx, 6
.L78:
	cmp	r8d, edx
	jle	.L122
	mov	esi, r8d
	movsx	rax, edx
	sub	esi, edx
	lea	r11d, [rsi-1]
	cmp	r11d, 2
	jbe	.L87
	lea	r10, [0+rax*4]
	lea	rdi, [rcx+r10]
	lea	r12, [r9+4+r10]
	mov	rbx, rdi
	sub	rbx, r12
	cmp	rbx, 24
	ja	.L124
	.p2align 4,,10
	.p2align 3
.L87:
	vmovss	xmm0, DWORD PTR [r9+rax*4]
	vfmadd213ss	xmm0, xmm2, DWORD PTR [rcx+rax*4]
	vmovss	DWORD PTR [rcx+rax*4], xmm0
	add	rax, 1
	cmp	r8d, eax
	jg	.L87
.L122:
	vzeroupper
	lea	rsp, [rbp-16]
	pop	rbx
	pop	r12
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L124:
	.cfi_restore_state
	cmp	r11d, 6
	jbe	.L90
	add	r10, r9
	mov	r11d, esi
	vmovups	ymm0, YMMWORD PTR [r10]
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR [rdi]
	shr	r11d, 3
	vmovups	YMMWORD PTR [rdi], ymm0
	cmp	r11d, 1
	je	.L83
	vmovups	ymm0, YMMWORD PTR [r10+32]
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR [rdi+32]
	vmovups	YMMWORD PTR [rdi+32], ymm0
	cmp	r11d, 2
	je	.L83
	vmovups	ymm0, YMMWORD PTR [r10+64]
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR [rdi+64]
	vmovups	YMMWORD PTR [rdi+64], ymm0
	cmp	r11d, 3
	je	.L83
	vmovups	ymm0, YMMWORD PTR [r10+96]
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR [rdi+96]
	vmovups	YMMWORD PTR [rdi+96], ymm0
	cmp	r11d, 4
	je	.L83
	vmovups	ymm0, YMMWORD PTR [r10+128]
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR [rdi+128]
	vmovups	YMMWORD PTR [rdi+128], ymm0
	cmp	r11d, 5
	je	.L83
	vmovups	ymm0, YMMWORD PTR [r10+160]
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR [rdi+160]
	vmovups	YMMWORD PTR [rdi+160], ymm0
	cmp	r11d, 6
	je	.L83
	vmovups	ymm0, YMMWORD PTR [r10+192]
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR [rdi+192]
	vmovups	YMMWORD PTR [rdi+192], ymm0
	cmp	r11d, 7
	je	.L83
	vmovups	ymm6, YMMWORD PTR [rdi+224]
	vfmadd132ps	ymm1, ymm6, YMMWORD PTR [r10+224]
	vmovups	YMMWORD PTR [rdi+224], ymm1
.L83:
	mov	edi, esi
	and	edi, -8
	add	edx, edi
	test	sil, 7
	je	.L122
	sub	esi, edi
	lea	r10d, [rsi-1]
	cmp	r10d, 2
	jbe	.L85
.L82:
	add	rax, rdi
	vshufps	xmm0, xmm2, xmm2, 0
	lea	rdi, [rcx+rax*4]
	vmovups	xmm1, XMMWORD PTR [rdi]
	vfmadd132ps	xmm0, xmm1, XMMWORD PTR [r9+rax*4]
	mov	eax, esi
	and	eax, -4
	add	edx, eax
	and	esi, 3
	vmovups	XMMWORD PTR [rdi], xmm0
	je	.L122
.L85:
	movsx	rdi, edx
	lea	rax, [0+rdi*4]
	vmovss	xmm0, DWORD PTR [r9+rdi*4]
	lea	rsi, [rcx+rax]
	vfmadd213ss	xmm0, xmm2, DWORD PTR [rsi]
	vmovss	DWORD PTR [rsi], xmm0
	lea	esi, [rdx+1]
	cmp	r8d, esi
	jle	.L122
	lea	rsi, [rcx+4+rax]
	vmovss	xmm0, DWORD PTR [r9+4+rax]
	add	edx, 2
	vfmadd213ss	xmm0, xmm2, DWORD PTR [rsi]
	vmovss	DWORD PTR [rsi], xmm0
	cmp	r8d, edx
	jle	.L122
	lea	rdx, [rcx+8+rax]
	vmovss	xmm1, DWORD PTR [rdx]
	vfmadd132ss	xmm2, xmm1, DWORD PTR [r9+8+rax]
	vmovss	DWORD PTR [rdx], xmm2
	vzeroupper
	lea	rsp, [rbp-16]
	pop	rbx
	pop	r12
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L89:
	.cfi_restore_state
	xor	edx, edx
	jmp	.L78
.L90:
	xor	edi, edi
	jmp	.L82
	.cfi_endproc
.LFE6441:
	.size	_Z7axpy_v3ifPKfPf, .-_Z7axpy_v3ifPKfPf
	.p2align 4
	.globl	_Z7axpy_v4ifPKfPf
	.type	_Z7axpy_v4ifPKfPf, @function
_Z7axpy_v4ifPKfPf:
.LFB6442:
	.cfi_startproc
	vmovaps	xmm2, xmm0
	mov	r8, rsi
	mov	r9, rdx
	cmp	edi, 63
	jle	.L137
	lea	r10d, [rdi-64]
	mov	rax, rsi
	shr	r10d, 6
	mov	ecx, r10d
	sal	rcx, 8
	lea	r11, [rsi+256+rcx]
	.p2align 4,,10
	.p2align 3
.L127:
#APP
# 89 "../axpy_v1.cc" 1
	vmovups  ymm0, YMMWORD PTR [rax]        
	vmovups  ymm1, YMMWORD PTR [rdx]        
	vfmadd231ps ymm1, ymm0, ymm2              
	vmovups  YMMWORD PTR [rdx], ymm1        
	
# 0 "" 2
#NO_APP
	lea	rcx, [rax+32]
	lea	rsi, [rdx+32]
#APP
# 90 "../axpy_v1.cc" 1
	vmovups  ymm0, YMMWORD PTR [rcx]        
	vmovups  ymm1, YMMWORD PTR [rsi]        
	vfmadd231ps ymm1, ymm0, ymm2              
	vmovups  YMMWORD PTR [rsi], ymm1        
	
# 0 "" 2
#NO_APP
	lea	rcx, [rax+64]
	lea	rsi, [rdx+64]
#APP
# 91 "../axpy_v1.cc" 1
	vmovups  ymm0, YMMWORD PTR [rcx]        
	vmovups  ymm1, YMMWORD PTR [rsi]        
	vfmadd231ps ymm1, ymm0, ymm2              
	vmovups  YMMWORD PTR [rsi], ymm1        
	
# 0 "" 2
#NO_APP
	lea	rcx, [rax+96]
	lea	rsi, [rdx+96]
#APP
# 92 "../axpy_v1.cc" 1
	vmovups  ymm0, YMMWORD PTR [rcx]        
	vmovups  ymm1, YMMWORD PTR [rsi]        
	vfmadd231ps ymm1, ymm0, ymm2              
	vmovups  YMMWORD PTR [rsi], ymm1        
	
# 0 "" 2
#NO_APP
	lea	rcx, [rax+128]
	lea	rsi, [rdx+128]
#APP
# 93 "../axpy_v1.cc" 1
	vmovups  ymm0, YMMWORD PTR [rcx]        
	vmovups  ymm1, YMMWORD PTR [rsi]        
	vfmadd231ps ymm1, ymm0, ymm2              
	vmovups  YMMWORD PTR [rsi], ymm1        
	
# 0 "" 2
#NO_APP
	lea	rcx, [rax+160]
	lea	rsi, [rdx+160]
#APP
# 94 "../axpy_v1.cc" 1
	vmovups  ymm0, YMMWORD PTR [rcx]        
	vmovups  ymm1, YMMWORD PTR [rsi]        
	vfmadd231ps ymm1, ymm0, ymm2              
	vmovups  YMMWORD PTR [rsi], ymm1        
	
# 0 "" 2
#NO_APP
	lea	rcx, [rax+192]
	lea	rsi, [rdx+192]
#APP
# 95 "../axpy_v1.cc" 1
	vmovups  ymm0, YMMWORD PTR [rcx]        
	vmovups  ymm1, YMMWORD PTR [rsi]        
	vfmadd231ps ymm1, ymm0, ymm2              
	vmovups  YMMWORD PTR [rsi], ymm1        
	
# 0 "" 2
#NO_APP
	lea	rcx, [rax+224]
	lea	rsi, [rdx+224]
#APP
# 96 "../axpy_v1.cc" 1
	vmovups  ymm0, YMMWORD PTR [rcx]        
	vmovups  ymm1, YMMWORD PTR [rsi]        
	vfmadd231ps ymm1, ymm0, ymm2              
	vmovups  YMMWORD PTR [rsi], ymm1        
	
# 0 "" 2
#NO_APP
	add	rax, 256
	add	rdx, 256
	cmp	rax, r11
	jne	.L127
	add	r10d, 1
	sal	r10d, 6
	cmp	edi, r10d
	jle	.L172
.L176:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r11d, edi
	movsx	rax, r10d
	sub	r11d, r10d
	lea	esi, [r11-1]
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r12
	push	rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	cmp	esi, 2
	jbe	.L135
	lea	rcx, [0+rax*4]
	lea	rdx, [r9+rcx]
	lea	r12, [r8+4+rcx]
	mov	rbx, rdx
	sub	rbx, r12
	cmp	rbx, 24
	ja	.L175
	.p2align 4,,10
	.p2align 3
.L135:
	vmovss	xmm0, DWORD PTR [r8+rax*4]
	vfmadd213ss	xmm0, xmm2, DWORD PTR [r9+rax*4]
	vmovss	DWORD PTR [r9+rax*4], xmm0
	add	rax, 1
	cmp	edi, eax
	jg	.L135
.L170:
	vzeroupper
	pop	rbx
	pop	r12
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L175:
	.cfi_restore_state
	cmp	esi, 6
	jbe	.L138
	add	rcx, r8
	vbroadcastss	ymm0, xmm2
	mov	esi, r11d
	vmovups	ymm1, YMMWORD PTR [rcx]
	vfmadd213ps	ymm1, ymm0, YMMWORD PTR [rdx]
	shr	esi, 3
	vmovups	YMMWORD PTR [rdx], ymm1
	cmp	esi, 1
	je	.L131
	vmovups	ymm1, YMMWORD PTR [rcx+32]
	vfmadd213ps	ymm1, ymm0, YMMWORD PTR [rdx+32]
	vmovups	YMMWORD PTR [rdx+32], ymm1
	cmp	esi, 2
	je	.L131
	vmovups	ymm1, YMMWORD PTR [rcx+64]
	vfmadd213ps	ymm1, ymm0, YMMWORD PTR [rdx+64]
	vmovups	YMMWORD PTR [rdx+64], ymm1
	cmp	esi, 3
	je	.L131
	vmovups	ymm1, YMMWORD PTR [rcx+96]
	vfmadd213ps	ymm1, ymm0, YMMWORD PTR [rdx+96]
	vmovups	YMMWORD PTR [rdx+96], ymm1
	cmp	esi, 4
	je	.L131
	vmovups	ymm1, YMMWORD PTR [rcx+128]
	vfmadd213ps	ymm1, ymm0, YMMWORD PTR [rdx+128]
	vmovups	YMMWORD PTR [rdx+128], ymm1
	cmp	esi, 5
	je	.L131
	vmovups	ymm1, YMMWORD PTR [rcx+160]
	vfmadd213ps	ymm1, ymm0, YMMWORD PTR [rdx+160]
	vmovups	YMMWORD PTR [rdx+160], ymm1
	cmp	esi, 6
	je	.L131
	vmovups	ymm1, YMMWORD PTR [rcx+192]
	vfmadd213ps	ymm1, ymm0, YMMWORD PTR [rdx+192]
	vmovups	YMMWORD PTR [rdx+192], ymm1
	cmp	esi, 7
	je	.L131
	vmovups	ymm5, YMMWORD PTR [rdx+224]
	vfmadd132ps	ymm0, ymm5, YMMWORD PTR [rcx+224]
	vmovups	YMMWORD PTR [rdx+224], ymm0
.L131:
	mov	edx, r11d
	and	edx, -8
	add	r10d, edx
	test	r11b, 7
	je	.L170
	sub	r11d, edx
	lea	ecx, [r11-1]
	cmp	ecx, 2
	jbe	.L133
.L130:
	add	rax, rdx
	vshufps	xmm0, xmm2, xmm2, 0
	lea	rdx, [r9+rax*4]
	vmovups	xmm3, XMMWORD PTR [rdx]
	vfmadd132ps	xmm0, xmm3, XMMWORD PTR [r8+rax*4]
	mov	eax, r11d
	and	eax, -4
	add	r10d, eax
	and	r11d, 3
	vmovups	XMMWORD PTR [rdx], xmm0
	je	.L170
.L133:
	movsx	rcx, r10d
	lea	rax, [0+rcx*4]
	vmovss	xmm0, DWORD PTR [r8+rcx*4]
	lea	rdx, [r9+rax]
	vfmadd213ss	xmm0, xmm2, DWORD PTR [rdx]
	vmovss	DWORD PTR [rdx], xmm0
	lea	edx, [r10+1]
	cmp	edi, edx
	jle	.L170
	lea	rdx, [r9+4+rax]
	vmovss	xmm0, DWORD PTR [r8+4+rax]
	add	r10d, 2
	vfmadd213ss	xmm0, xmm2, DWORD PTR [rdx]
	vmovss	DWORD PTR [rdx], xmm0
	cmp	edi, r10d
	jle	.L170
	lea	rdx, [r9+8+rax]
	vmovss	xmm4, DWORD PTR [rdx]
	vfmadd132ss	xmm2, xmm4, DWORD PTR [r8+8+rax]
	vmovss	DWORD PTR [rdx], xmm2
	vzeroupper
	pop	rbx
	pop	r12
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L137:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	xor	r10d, r10d
	cmp	edi, r10d
	jg	.L176
.L172:
	vzeroupper
	ret
.L138:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -32
	.cfi_offset 6, -16
	.cfi_offset 12, -24
	xor	edx, edx
	jmp	.L130
	.cfi_endproc
.LFE6442:
	.size	_Z7axpy_v4ifPKfPf, .-_Z7axpy_v4ifPKfPf
	.p2align 4
	.globl	_Z7axpy_v5ifPKfPf
	.type	_Z7axpy_v5ifPKfPf, @function
_Z7axpy_v5ifPKfPf:
.LFB6443:
	.cfi_startproc
	mov	r8, rdx
	mov	edx, edi
	vmovaps	xmm13, xmm0
	and	edx, -48
	mov	r10, r8
	movsx	rax, edx
	mov	ecx, edx
	imul	rax, rax, 715827883
	sar	ecx, 31
	sar	rax, 35
	sub	eax, ecx
	mov	ecx, edi
	and	ecx, -8
	mov	r9d, ecx
	sub	r9d, edx
	lea	edx, [r9+7]
	cmovns	edx, r9d
	mov	r9, rsi
	sar	edx, 3
#APP
# 115 "../axpy_v1.cc" 1
	vbroadcastss ymm2, xmm13              
	test  eax, eax                
	jz    2f                                 
	1:                                       
	vmovups ymm0,  YMMWORD PTR [r9 + 0]   
	vmovups ymm1,  YMMWORD PTR [r10 + 0]   
	vmovups ymm3,  YMMWORD PTR [r9 + 32]  
	vmovups ymm4,  YMMWORD PTR [r10 + 32]  
	vmovups ymm5,  YMMWORD PTR [r9 + 64]  
	vmovups ymm6,  YMMWORD PTR [r10 + 64]  
	vmovups ymm7,  YMMWORD PTR [r9 + 96]  
	vmovups ymm8,  YMMWORD PTR [r10 + 96]  
	vmovups ymm9,  YMMWORD PTR [r9 + 128] 
	vmovups ymm10, YMMWORD PTR [r10 + 128] 
	vmovups ymm11, YMMWORD PTR [r9 + 160] 
	vmovups ymm12, YMMWORD PTR [r10 + 160] 
	vfmadd231ps ymm1,  ymm0,  ymm2           
	vfmadd231ps ymm4,  ymm3,  ymm2           
	vfmadd231ps ymm6,  ymm5,  ymm2           
	vfmadd231ps ymm8,  ymm7,  ymm2           
	vfmadd231ps ymm10, ymm9,  ymm2           
	vfmadd231ps ymm12, ymm11, ymm2           
	vmovups YMMWORD PTR [r10 + 0],   ymm1  
	vmovups YMMWORD PTR [r10 + 32],  ymm4  
	vmovups YMMWORD PTR [r10 + 64],  ymm6  
	vmovups YMMWORD PTR [r10 + 96],  ymm8  
	vmovups YMMWORD PTR [r10 + 128], ymm10 
	vmovups YMMWORD PTR [r10 + 160], ymm12 
	add   r9, 192                         
	add   r10, 192                         
	dec   eax                           
	jnz   1b                                 
	2:                                       
	test  edx, edx                   
	jz    4f                                 
	3:                                       
	vmovups ymm0, YMMWORD PTR [r9]        
	vmovups ymm1, YMMWORD PTR [r10]        
	vfmadd231ps ymm1, ymm0, ymm2             
	vmovups YMMWORD PTR [r10], ymm1        
	add   r9, 32                          
	add   r10, 32                          
	dec   edx                            
	jnz   3b                                 
	4:                                       
	
# 0 "" 2
#NO_APP
	cmp	edi, ecx
	jle	.L192
	mov	r9d, edi
	sub	r9d, ecx
	lea	eax, [r9-1]
	cmp	eax, 6
	jbe	.L184
	movsx	rdx, ecx
	mov	r10d, r9d
	vbroadcastss	ymm1, xmm13
	xor	eax, eax
	sal	rdx, 2
	shr	r10d, 3
	lea	r11, [rsi+rdx]
	sal	r10, 5
	add	rdx, r8
	.p2align 4,,10
	.p2align 3
.L180:
	vmovups	ymm0, YMMWORD PTR [r11+rax]
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR [rdx+rax]
	vmovups	YMMWORD PTR [rdx+rax], ymm0
	add	rax, 32
	cmp	rax, r10
	jne	.L180
	mov	eax, r9d
	and	eax, -8
	lea	edx, [rax+rcx]
	test	r9b, 7
	je	.L192
.L179:
	sub	r9d, eax
	lea	r10d, [r9-1]
	cmp	r10d, 2
	jbe	.L182
	movsx	rcx, ecx
	vshufps	xmm0, xmm13, xmm13, 0
	add	rcx, rax
	lea	rax, [r8+rcx*4]
	vmovups	xmm2, XMMWORD PTR [rax]
	vfmadd132ps	xmm0, xmm2, XMMWORD PTR [rsi+rcx*4]
	vmovups	XMMWORD PTR [rax], xmm0
	mov	eax, r9d
	and	eax, -4
	add	edx, eax
	and	r9d, 3
	je	.L192
.L182:
	movsx	r9, edx
	lea	rax, [0+r9*4]
	vmovss	xmm0, DWORD PTR [rsi+r9*4]
	lea	rcx, [r8+rax]
	vfmadd213ss	xmm0, xmm13, DWORD PTR [rcx]
	vmovss	DWORD PTR [rcx], xmm0
	lea	ecx, [rdx+1]
	cmp	edi, ecx
	jle	.L192
	lea	rcx, [r8+4+rax]
	vmovss	xmm0, DWORD PTR [rsi+4+rax]
	add	edx, 2
	vfmadd213ss	xmm0, xmm13, DWORD PTR [rcx]
	vmovss	DWORD PTR [rcx], xmm0
	cmp	edi, edx
	jle	.L192
	lea	rdx, [r8+8+rax]
	vmovss	xmm3, DWORD PTR [rdx]
	vfmadd132ss	xmm13, xmm3, DWORD PTR [rsi+8+rax]
	vmovss	DWORD PTR [rdx], xmm13
.L192:
	vzeroupper
	ret
.L184:
	mov	edx, ecx
	xor	eax, eax
	jmp	.L179
	.cfi_endproc
.LFE6443:
	.size	_Z7axpy_v5ifPKfPf, .-_Z7axpy_v5ifPKfPf
	.ident	"GCC: (GNU) 13.1.0"
	.section	.note.GNU-stack,"",@progbits
