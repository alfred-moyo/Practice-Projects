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
