ORG  50000
LD   IX,$4000
PUSH IX
LD   DE,$0020
SUB  A
DEC  A
SCF
DI
INC  D
EX   AF,AF'
DEC  D
CALL $056A
POP  DE
LD   B,$03
PUSH BC
LD   B,$08
PUSH BC
PUSH DE
PUSH BC
JR   K1
;
L1     PUSH BC
LD   B,$08
L2     PUSH BC
PUSH IX
LD   B,$08
L3     PUSH BC
LD   DE,$0020
CALL $05A9
K1     POP  BC
LD   DE,224
ADD  IX,DE
DJNZ L3
POP  IX
POP  BC
LD   DE,$0020
ADD  IX,DE
DJNZ L2
POP  BC
LD   DE,1792
ADD  IX,DE
DJNZ L1
LD   IX,$5800
LD   DE,$0300
CALL $05A9
EI
RET  C
JP   $0806
