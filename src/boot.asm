CLS      equ $0d6b ; https://skoolkid.github.io/rom/asm/0D6B.html
BORDCR   equ $5c48 ; https://skoolkid.github.io/rom/asm/5C48.html
ATTR_P   equ $5c8d ; https://skoolkid.github.io/rom/asm/5C8D.html

; Clear the screen
    ld      a, $07
    ld      (ATTR_P), a
    ld      (BORDCR), a
    xor     a
    out     ($fe), a
    call    CLS

include src/loader.asm
