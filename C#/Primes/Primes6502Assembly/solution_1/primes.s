; Sieve of Eratosthenes implementation for the Commodore 128
;
; Peculiarities:
; * The sieve size needs to be divisable by 32
; * The square root of the sieve size needs to be divisible by 8, or else rounded up to the nearest multiple of 8

SIEVE_SIZE=1000000
SIEVE_SQRT=1000

; expected prime count is 78498 = $0132a2
CNT_LOW=$a2
CNT_MIDDLE=$32
CNT_HIGH=$01

BUF_BITS=SIEVE_SIZE/2
BUF_BYTES=BUF_BITS/8
HALF_BUF_SIZE=BUF_BYTES/2
HALF_BUF_LAST=HALF_BUF_SIZE-1
SQRT_BYTES=SIEVE_SQRT/8

CURPTR=$fa

MMUCR=$ff00
MMURCR=$d506
RAM_0=%00001110
RAM_1=%01001110
LOGICAL_NUM=$01

SETNAM=$ffbd
SETLFS=$ffba
OPEN=$ffc0
CKOUT=$ffc9
CLOSE=$ffc3
CLRCH=$ffcc
BSOUT=$ffd2
SETTIM=$ffdb
RDTIM=$ffde

EOL=13
SYS=$9e

BASIC_START=$1c01
PROGRAM_START=$1300     ; 4864
BUF_START=$2000
BUF_END=BUF_START+HALF_BUF_LAST

    ; load BASIC program to start
    .org BASIC_START
    .word basic_end             ; address of next BASIC line
    .byte 10,0,SYS," 4864",0    ; 10 SYS 4864
basic_end:
    .word $00                   ; end of program

    .org PROGRAM_START
    jmp start

counter: .byte 0,0,0 
fctr_byte: .byte $00
fctr_bitcnt: .byte $03
curptr_bit: .byte $01
cndptr: .word 0
cndptr_bit: .byte 0
fname: .byte "OUTPUT,S,W"
fname_end: 
clock: .storage 3
time_label: .byte "TIME ",0
valid_label: .byte "VALID ",0
clock_string: .byte 0
    .storage 8
remainder: .storage 1
ram_config: .word 0
