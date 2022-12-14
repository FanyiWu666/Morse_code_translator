#include <xc.inc>

global LED_start

extrn result
    
psect	udata_acs   ; reserve data space in access ram
d1:ds 1    ; reserve one byte for counter in the delay routine
d2:ds 1    ; reserve one byte for counter in the delay routine
d3:ds 1    ; reserve one byte for counter in the delay routine
    
psect LED_code, class = CODE

LED_start:
  movlw 0x00 ;all bits out
  movwf TRISE, A
  movlw	0xff
  cpfseq result, B
  bra nextA
  retlw 0x00

  ;A: . _

nextA: ;Convert 'A' to Morse code
    movlw 0x41 ;ASCII number for character 'A'
    cpfseq result, B 
    bra nextB
                
    movlw 0xff ;light up the led
    movwf LATE, A ;portE value
    call delay ;a '.'
    movlw 0x00 ;light off the led
    movwf LATE, A ;portE value
    call delay ;a ' 'a

    movlw 0xff ;light up the led
    movwf LATE, A ;portE value
    call delay 
    call delay
    call delay
    movlw 0x00 ;light off the led
    movwf LATE, A ;portE value
    call delay ;a ' '
    return

;B: _ . . .

nextB: ;Convert 'B' to Morse code
  movlw 0x42 ;ASCII number for character 'B'
  cpfseq result, B 
  bra nextC

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' 'a

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' 'a

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '
  return

;C: _ . _ .

nextC: ;Convert 'C' to Morse code
  movlw 0x43 ;ASCII number for character 'B'
  cpfseq result, B 
  bra nextD

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' 'a

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay 
  call delay
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' 'a
  return 

;D: _ . .
nextD: ;Convert 'C' to Morse code
  movlw 0x44 ;ASCII number for character 'B'
  cpfseq result, B 
  bra nextE

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay 
  call delay
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' 'a

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '
  return

;E: .
nextE: ;Convert 'C' to Morse code
  movlw 0x45 ;ASCII number for character 'B'
  cpfseq result, B 
  bra nextF

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '
  return

;F: . . _ .
nextF: ;Convert 'F' to Morse code
  movlw 0x46 ;ASCII number for character 'F'
  cpfseq result, B 
  bra nextG

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay
  call delay
  call delay
  movlw 0x00 ;light off the led
  movwf LATE, A  ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '
  return

;G: _ _ .
nextG: ;Convert 'G' to Morse code
  movlw 0x47 ;ASCII number for character 'G'
  cpfseq result, B 
  bra nextH

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '
  return


;H: . . . .
  nextH: ;Convert 'H' to Morse code
  movlw 0x48 ;ASCII number for character 'H'
  cpfseq result, B 
  bra nextI
                
  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;portE value
  call delay ;a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;portE value
  call delay ;a '.'
  movlw 0x00 ;light off the led
  movwf LATE, A ;ortE value
  call delay ;a ' '
  return

;I : . .
  nextI: ;Convert 'I' to Morse code
  movlw 0x49 ;#ASCII number for character 'I'
  cpfseq result, B 
  bra nextJ
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

  ;;J : . _ _ _
  nextJ: ;#Convert 'J' to Morse code
  movlw 0x50 ;#ASCII number for character 'J'
  cpfseq result, B 
  bra nextK
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

;K: _ . _
  nextK: ;#Convert 'K' to Morse code
  movlw 0x51 ;#ASCII number for character 'K'
  cpfseq result, B 
  bra nextL

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

;L: . _ . .
  nextL: ;#Convert 'L' to Morse code
  movlw 0x52 ;#ASCII number for character 'L'
  cpfseq result, B 
  bra nextM

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;portE value
  call delay ;#a ' '
  return

  ;M: _ _
  nextM: ;#Convert 'M' to Morse code
  movlw 0x53 ;#ASCII number for character 'M'
  cpfseq result, B 
  bra nextN

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

  ;N: _ . 
  nextN: ;#Convert 'N' to Morse code
  movlw 0x54 ;#ASCII number for character 'N'
  cpfseq result, B 
  bra nextO

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
  
;O: _ _ _ 
  nextO: ;#Convert 'O' to Morse code
  movlw 0x4F ;#ASCII number for character 'N'
  cpfseq result, B 
  bra nextP

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value  call delay 
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return 

  ;P:. _ _ .
  nextP: ;#Convert 'O' to Morse code
  movlw 0x50 ;#ASCII number for character 'N'
  cpfseq result, B 
  bra nextQ

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

  ;Q:_ _ . _
nextQ: ;#Convert 'Q' to Morse code
movlw 0x51 ;#ASCII number for character 'Q'
cpfseq result, B 
bra nextR

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

  ;R:. _ .
  nextR: ;#Convert 'R' to Morse code
movlw 0x52 ;#ASCII number for character 'R'
cpfseq result, B 
bra nextS

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;portE value
  call delay ;#a ' '
  return

 ; S:. . .
nextS: ;#Convert 'S' to Morse code
movlw 0x53 ;#ASCII number for character 'S'
cpfseq result, B 
bra nextT

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

  ;T:_
nextT: ;#Convert 'T' to Morse code
movlw 0x54 ;#ASCII number for character 'T'
cpfseq result, B 
bra nextU

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
  
  ;U:. . _
nextU: ;#Convert 'U' to Morse code
movlw 0x55 ;#ASCII number for character 'U'
cpfseq result, B 
bra nextV

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return


  ;V: . . . _
  nextV: ;#Convert 'V' to Morse code
movlw 0x56 ;#ASCII number for character 'V'
cpfseq result, B 
bra nextW

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;;#portE value
  call delay ;#a ' '
  return

  ;W:. _ _
  nextW: ;#Convert 'W' to Morse code
movlw 0x57 ;#ASCII number for character 'W'
cpfseq result, B 
bra nextX

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

  ;X:_ . . _ 
  nextX: ;#Convert 'X' to Morse code
movlw 0x58 ;#ASCII number for character 'X'
cpfseq result, B 
bra nextY

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;portE value
  call delay ;#a ' '
  return

  ;Y:_ . _ _ 
  nextY: ;#Convert 'Y' to Morse code
movlw 0x59 ;#ASCII number for character 'Y'
cpfseq result, B 
bra nextZ

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

  ;Z:_ _ . . 
nextZ:; #Convert 'Z' to Morse code
movlw 0x5A ;#ASCII number for character 'Z'
cpfseq result, B 
bra next1

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;portE value
  call delay ;#;a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

;1: '.'' ''_'' ''_'' ''_'' ''_'
next1: ;#Convert '1' to Morse code
    movlw 0x31 ;#ASCII number for character '1'
    cpfseq result, B 
    bra next2
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' 'a

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
  
;2: . . _ _ _
next2: ;#Convert '2' to Morse code
movlw 0x32 ;#ASCII number for character '2'
cpfseq result, B 
bra next3
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
;3: . . . _ _
  next3: ;#Convert '3' to Morse code
movlw 0x33 ;#ASCII number for character '2'
cpfseq result, B 
bra next4
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
;4: . . . . _
  next4: ;#Convert '3' to Morse code
movlw 0x34 
cpfseq result, B 
bra next5
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
;5: . . . . .
  next5:; #Convert '5' to Morse code
movlw 0x35 ;#ASCII number for character '5'
cpfseq result, B 
bra next6
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff; #light up the led
  movwf LATE, A; #portE value
  call delay ;#a '.'
  movlw 0x00 ;;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
;6: _ . . . .
  next6: ;Convert '6' to Morse code
movlw 0x36 ;ASCII number for character '5'
cpfseq result, B 
bra next7
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
;7: _ _ . . .
  next7: ;#Convert '6' to Morse code
movlw 0x37 ;#ASCII number for character '5'
cpfseq result, B 
bra next8
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;l#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
;8: _ _ _ . .
  next8: ;#Convert '6' to Morse code
movlw 0x38 ;#ASCII number for character '5'
cpfseq result, B 
bra next9
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
;9: _ _ _ _ .
  next9: ;#Convert '6' to Morse code
movlw 0x39 ;#ASCII number for character '5'
cpfseq result, B 
bra next0
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay ;#a '.'
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return
;0: _ _ _ _ _
  next0: ;#Convert '6' to Morse code
movlw 0x39 ;#ASCII number for character '5'
cpfseq result, B 
bra next0
                
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;portE value
  call delay ;#a ' '
  
  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '

  movlw 0xff ;#light up the led
  movwf LATE, A ;#portE value
  call delay 
  call delay
  call delay
  movlw 0x00 ;#light off the led
  movwf LATE, A ;#portE value
  call delay ;#a ' '
  return

delay:	
    movlw 0x0B
    movwf d1, A
    movlw 0x0B
    movwf d2, A
    movlw 0x0B
    movwf d3, A
    
delay_0:
    decfsz	 d1, f	; decrement until zero
    bra	delay_1
    decfsz	d2, f
delay_1:
    bra delay_2
    decfsz	d3, f
delay_2:
    bra delay_0
    return


