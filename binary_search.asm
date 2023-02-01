section .text
global search

; implementing binary search
search:
    xor ecx, ecx

    loop:
        ; set range: `[a, b]`
        ; if `a` and `b` are equal, then the range is empty
        cmp ecx, esi
        je  no_value

        ; params:
        ;  - `rdi`: pointer to an array of integers that is being searched
        ;  - `rsi`: length of the array
        ;  - `rdx`: target value

        ; rax = (a + b) / 2
        lea rax, [rsi + rcx]
        shr rax, 1

        ;  - `rdi`: pointer to an array of integers that is being searched
        ;  - `rax`: index of the middle element
        ;  - 4: size of an integer
        ;  - `rdi + rax * 4`: pointer to the middle element
        ;  - `edx`: curr[i]
        cmp edx, [rdi + rax * 4]
        ; so, if the `curr[i].value` is equal to the target value, return the current index.

        ; if the `curr[i].value < target value`, update the range [a, mid)
        jl  left
        ; if the `curr[i].value > target value`, update the range (mid + 1, b]
        ja  right

        ret
left:
    mov esi, eax
    jmp loop

right:
    lea ecx, [eax + 1]
    jmp loop

no_value:
    mov eax, -1
    ret