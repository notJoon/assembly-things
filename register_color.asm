; Black: 0
; Brown: 1
; Red: 2
; Orange: 3
; Yellow: 4
; Green: 5
; Blue: 6
; Violet: 7
; Grey: 8
; White: 9
default rel

section .data
black:  db 0, "black",  0
brown:  db 1, "brown",  0
red:    db 2, "red",    0
orange: db 3, "orange", 0
yellow: db 4, "yellow", 0
green:  db 5, "green",  0
blue:   db 6, "blue",   0
violet: db 7, "violet", 0
grey:   db 8, "grey",   0
white:  db 9, "white",  0

color_array:
    dq black+1, brown+1, red+1, orange+1, yellow+1, green+1, blue+1, violet+1, grey+1, white+1, 0

section .text
global color_code
color_code:
    xor r9, r9
    xor rcx, rcx

    loop:
        xor rax, rax
        xor rbx, rbx
        lea r10, [color_array]
        mov r8, qword[r10 + r9 * 8]
        mov bl, byte[r8 + rcx]
        mov al, byte[rdi + rcx]
        cmp bl, al

        je  matching
        jne get_next

        matching:
            inc rcx
            cmp bl, 0
            je  return_key
            jne loop

        get_next:
            xor rcx, rcx
            inc r9
            cmp r9, 10
            jne loop
            je  throw_error
    
    throw_error:
        mov rax, -1
        ret

    return_key:
        xor rax, rax
        mov al, byte[r8 - 1]
        ret

global colors
colors:
    lea rax, [color_array]
    ret