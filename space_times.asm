default rel

section .rodata
planets_orbital_periods:
    dq 0.2408467    ; Mercury
    dq 0.61519726   ; Venus
    dq 1.0          ; Earth
    dq 1.8808158    ; Mars
    dq 11.862615    ; Jupiter
    dq 29.447498    ; Saturn
    dq 84.016846    ; Uranus
    dq 164.79132    ; Neptune

earth_year_in_seconds:
    dq 31557600.0


section .text
global age
age:
    cvtsi2sd    xmm0, esi
    divsd       xmm0, [rel earth_year_in_seconds]
    lea         r8, [rel planets_orbital_periods]
    divsd       xmm0, [r8 + 8 * rdi]
    cvtsd2ss    xmm0, xmm0
    ret