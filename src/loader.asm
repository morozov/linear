LD_LOOP  equ $05A9 ; https://skoolkid.github.io/rom/asm/0556.html#05A9
LD_BREAK equ $056B ; https://skoolkid.github.io/rom/asm/0556.html#056B

; (c) by Kabanov Alexandr
; ZX-Review 1996 #07-08
    di
    xor  a
    sub  $01
    ex   af, af'
    ld   c, $00
    ld   ix, $4000
    ld   de, $0020
    call LD_BREAK-1
    ld   b, $bf
loop:
    push bc
    ld   h, c
    ld   bc, $e0
    add  ix, bc
    ld   a, $07
    and  ixh
    jr   nz, prod
    ld   a, ixl
    add  a, $20
    ld   ixl, a
    jr   c, prod
    ld   bc, $f800
    add  ix, bc
prod:
    ld   c, h
    ld   e, $20
    call LD_LOOP
    pop  bc
    djnz loop
    ld   d, $03
    call LD_LOOP
    ei
    ret
