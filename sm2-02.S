.intel_syntax noprefix
.global process, A, B, R
.text

process:
	push	rbp
	mov		rbp, rsp

	mov		eax, [rip+A]
	mov		ebx, [rip+B]
	xor		ecx, ecx 
multiply_loop:
	test	ebx, 1
	jz		skip_add
	add		ecx, eax
skip_add:
	shl		eax, 1
	shr		ebx, 1
	test	ebx, ebx
	jnz		multiply_loop 

	mov		[rip+R], ecx
	mov		rsp, rbp
	pop		rbp
	ret

	.data
A:
	.int	0
B:
	.int	0
R:
	.int	0

	.section .note.GNU-stack,"",@progbits