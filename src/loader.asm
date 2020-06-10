LD_LOOP  equ $05A9 ; https://skoolkid.github.io/rom/asm/0556.html#05A9
LD_BREAK equ $056B ; https://skoolkid.github.io/rom/asm/0556.html#056B

    xor     a
    ld      c, a
    ld      ix, $4000
    push    ix
    ld      de, $0020
    sub     a
    dec     a
    scf
    di
    inc     d
    ex      af, af'
    dec     d
    call    LD_BREAK-1
    pop     de
    ld      b, $03
    push    bc
    ld      b, $08
    push    bc
    push    de
    push    bc
    jr      k1

l1:
    push    bc
    ld      b, $08

l2:
    push    bc
    push    ix
    ld      b, $08

l3:
    push    bc
    ld      de, $0020
    call    LD_LOOP

k1:
    pop     bc
    ld      de, $e0
    add     ix, de
    djnz    l3
    pop     ix
    pop     bc
    ld      de, $0020
    add     ix, de
    djnz    l2
    pop     bc
    ld      de, $0700
    add     ix, de
    djnz    l1
    ld      ix, $5800
    ld      de, $0300
    call    LD_LOOP
    ei
    ret     c
    jp      $0806
