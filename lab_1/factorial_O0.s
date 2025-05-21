	.file	"factorial.cpp"
	.intel_syntax noprefix
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.section	.text._ZN9MathUtils9factorialEi,"axG",@progbits,_ZN9MathUtils9factorialEi,comdat
	.weak	_ZN9MathUtils9factorialEi
	.type	_ZN9MathUtils9factorialEi, @function
_ZN9MathUtils9factorialEi:
.LFB2011:
	.cfi_startproc
	push	rbp ; Сохраняет предыдущий указатель базы (base pointer)
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp ; Устанавливает текущий base pointer = stack pointer
	.cfi_def_cfa_register 6
	sub	rsp, 16 ; Выделяет 16 байт в стеке для локальных переменных
	mov	DWORD PTR -4[rbp], edi ; Сохраняет аргумент n (из edi) в стек по адресу [rbp-4]
	cmp	DWORD PTR -4[rbp], 1 ; Сравнивает n с 1
	jle	.L2 ; Если n <= 1, переходит к метке .L2 (рекурсия)

	; Рекурсивный вызов factorial(n-1)
	mov	eax, DWORD PTR -4[rbp] ; eax = n
	sub	eax, 1 ; eax = n -1
	mov	edi, eax ; Подготавливает аргумент для вызова: edi = n-1
	call	_ZN9MathUtils9factorialEi ; Рекурсивный вызов factorial(n-1)
	imul	eax, DWORD PTR -4[rbp] ; Умножает результат (eax) на n (eax = eax * [rbp-4])
	jmp	.L4 ; Переходит к завершению функции
.L2:
	mov	eax, 1 ; Базовый случай: возвращает 1 (eax = 1)
.L4:
	leave ; Восстанавливает стек (mov rsp, rbp; pop rbp)
	.cfi_def_cfa 7, 8
	ret ; Возврат из функции
	.cfi_endproc
.LFE2011:
	.size	_ZN9MathUtils9factorialEi, .-_ZN9MathUtils9factorialEi
	.section	.rodata
.LC0:
	.string	"Factorial of " ; Строка для вывода
.LC1:
	.string	" is " ; Строка для вывода
	.text
	.globl	main
	.type	main, @function
main:
.LFB2012:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx ; Сохраняет callee-saved регистр rbx
	sub	rsp, 24 ; Выделяет 24 байта в стеке для локальных переменных
	.cfi_offset 3, -24

	; Инициализация переменной num = 5
	mov	DWORD PTR -20[rbp], 5 ; num хранится в стеке по адресу [rbp-20]

	; Вывод "Factorial of "
	lea	rax, .LC0[rip] ; Загружаем адрес строки "Factorial of " в rax
	mov	rsi, rax ; rsi = указатель на строку (второй аргумент)
	lea	rax, _ZSt4cout[rip] ; rax = адрес объекта cout
	mov	rdi, rax ; rdi = cout (первый аргумент)
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT

	; Вывод значения num (5)
	mov	rdx, rax ; rdx = результат предыдущего вызова (cout)
	mov	eax, DWORD PTR -20[rbp] ; eax = num (5)
	mov	esi, eax ; esi = значение для вывода (второй аргумент)
	mov	rdi, rdx ; rdi = cout (первый аргумент)
	call	_ZNSolsEi@PLT ; cout << num

	; Вывод " is "
	mov	rdx, rax ; rdx = cout (результат предыдущего вызова)
	lea	rax, .LC1[rip] ; rax = адрес строки " is "
	mov	rsi, rax ; rsi = указатель на строку
	mov	rdi, rdx ; rdi = cout
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT

	; Вычисление factorial(num) и вывод результата
	mov	rbx, rax ; Сохраняет cout в rbx
	mov	eax, DWORD PTR -20[rbp] ; eax = num (5)
	mov	edi, eax ; edi = аргумент для factorial
	call	_ZN9MathUtils9factorialEi ; Вызов factorial(5)
	mov	esi, eax ; esi = результат (eax)
	mov	rdi, rbx ; rdi = cout
	call	_ZNSolsEi@PLT ; cout << результат

	; Вывод endl и завершение программы
	mov	rdx, QWORD PTR _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL[rip] ; rdx = адрес endl
	mov	rsi, rdx ; rsi = endl
	mov	rdi, rax ; rdi = cout
	call	_ZNSolsEPFRSoS_E@PLT ; cout << endl
	mov	eax, 0 ; Возвращает 0 (успешное завершение)
	mov	rbx, QWORD PTR -8[rbp] ; Восстанавливает rbx
	leave ; Восстанавливает стек
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2012:
	.size	main, .-main
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
