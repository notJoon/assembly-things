section .rodata
    msg1: db "One for ", 0
    msg2: db "you", 0
    msg3: db ", one for me.", 0

section .text
global two_fer
two_fer:
    mov rdx, rdi
    mov rdi, rsi
    lea rsi, [rel msg1]

    call add_msg

    cmp rdx, 0
    je  load_msg2
    mov rsi, rdx
    jmp continue_2

    load_msg2:
        lea rsi, [rel msg2]

    continue_2:
        call add_msg
        lea  rsi, [rel msg3]
        call add_msg

    finish:
        mov byte [rax], 0
        ret

add_msg:
    cmp byte [rsi], 0
    jz  loop_end

    loop_top:
        movsb
        cmp  byte [rsi], 0
        jnz  loop_top
    
    loop_end:
        mov rax, rdi
        ret