section .text
global leap_year

leap_year:
    mov eax, edi
    mov edx, 0
    mov ebx, 4
    div ebx
    cmp edx, 0
    je div_4
    mov eax, 0
    ret

div_4:
    mov eax, edi
    mov edx, 0
    mov ebx, 100
    div ebx
    cmp edx, 0
    je div_100
    mov eax, 1
    ret

div_100:
    mov eax, edi
    mov edx, 0
    mov ebx, 400
    div ebx
    cmp edx, 0
    je is_leap_year
    mov eax, 0
    ret

is_leap_year:
    mov eax, 1
    ret