#include <xc.inc>
    
global Encode_start
    
extrn result, LCD_Send_Byte_D
;store ASCII hex number for a character in W
    
psect	encode_code, class=CODE
Encode_start:
    cpfseq result, B
    bra next1
    retlw 0x00

   

next1: ;Convert '1' to Morse code
    movlw 0x31 ;ASCII number for character '1'
    cpfseq result, B
    bra next2
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    return

next2: ;Convert '2' to Morse code
    movlw 0x32 ;ASCII number for character '2'
    cpfseq result, B
    bra next3
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    return

next3: ;Convert '3' to Morse code
    movlw 0x33 ;ASCII number for character '3'
    cpfseq result, B
    bra next4
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    return

  next4: ;Convert '4' to Morse code
    movlw 0x34 ;ASCII number for character '4'
    cpfseq result, B
    bra next5
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    return

 next5: ;Convert '5' to Morse code
    movlw 0x35 ;ASCII number for character '5'
    cpfseq result, B
    bra next6
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    return

  next6: ;Convert '6' to Morse code
    movlw 0x36 ;ASCII number for character '6'
    cpfseq result, B
    bra next7
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    return

  next7: ;Convert '7' to Morse code
    movlw 0x37 ;ASCII number for character '7'
    cpfseq result, B
    bra next8
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    return

  next8: ;Convert '8' to Morse code
    movlw 0x38 ;ASCII number for character '8'
    cpfseq result, B
    bra next9
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    return

  next9: ;Convert '9' to Morse code
    movlw 0x39 ;ASCII number for character '9'
    cpfseq result, B
    bra next0
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    return

  next0: ;Convert '0' to Morse code
    movlw 0x30 ;ASCII number for character '0'
    cpfseq result, B
    bra nextA
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    return


nextA: ;Convert 'A' to Morse code
    movlw 0x41 ;ASCII number for character 'A'
    cpfseq result, B
    bra nextB
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    return  

nextB: ;Convert 'B' to Morse code
    movlw 0x42 ;ASCII number for character 'B'
    cpfseq result, B
    bra nextC
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    return

nextC: ;Convert 'C' to Morse code
    movlw 0x43 ;ASCII number for character 'C'
    cpfseq result, B
    bra nextE
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    return

nextD: ;Convert 'D' to Morse code
    movlw 0x44 ;ASCII number for character 'D'
    cpfseq result, B
    bra nextE
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    return

nextE: ;Convert 'E' to Morse code
    movlw 0x45 ;ASCII number for character 'E'
    cpfseq result, B
    bra nextF
    movlw '.'
    call LCD_Send_Byte_D
    return

nextF: ;Convert 'F' to Morse code
    movlw 0x46 ;ASCII number for character 'F'
    cpfseq result, B
    bra nextG
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '_'
    call LCD_Send_Byte_D
    movlw ' '
    call LCD_Send_Byte_D
    movlw '.'
    call LCD_Send_Byte_D
    return

nextG: ;Convert 'G' to Morse code
  movlw 0x47 ;ASCII number for character 'G'
  cpfseq result, B
  bra nextH
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  return

nextH: ;Convert 'H' to Morse code
  movlw 0x48 ;ASCII number for character 'H'
  cpfseq result, B
  bra nextI
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  return

nextI: ;Convert 'I' to Morse code
  movlw 0x49 ;ASCII number for character 'I'
  cpfseq result, B
  bra nextJ
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  return

nextJ: ;Convert 'J' to Morse code
  movlw 0x4A ;ASCII number for character 'J'
  cpfseq result, B
  bra nextK
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  return
  
nextK: ;Convert 'K' to Morse code
  movlw 0x4B ;ASCII number for character 'K'
  cpfseq result, B
  bra nextL
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  return

nextL: ;Convert 'L' to Morse code
  movlw 0x4C ;ASCII number for character 'L'
  cpfseq result, B
  bra nextM
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  return

nextM: ;Convert 'M' to Morse code
  movlw 0x4D ;ASCII number for character 'M'
  cpfseq result, B
  bra nextN
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  return

nextN: ;Convert 'N' to Morse code
  movlw 0x4E ;ASCII number for character 'N'
  cpfseq result, B
  bra nextO
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  return

nextO: ;Convert 'O' to Morse code
  movlw 0x4F ;ASCII number for character 'O'
  cpfseq result, B
  bra nextP
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  return

nextP: ;Convert 'P' to Morse code
  movlw 0x50 ;ASCII number for character 'P'
  cpfseq result, B
  bra nextQ
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  return

nextQ: ;Convert 'Q' to Morse code
  movlw 0x51 ;ASCII number for character 'Q'
  cpfseq result, B
  bra nextR
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  return

nextR: ;Convert 'R' to Morse code
  movlw 0x52 ;ASCII number for character 'R'
  cpfseq result, B
  bra nextS
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  return

nextS: ;Convert 'S' to Morse code
  movlw 0x53 ;ASCII number for character 'S'
  cpfseq result, B
  bra nextT
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  return

nextT: ;Convert 'T' to Morse code
  movlw 0x54 ;ASCII number for character 'T'
  cpfseq result, B
  bra nextU
  movlw '_'
  call LCD_Send_Byte_D
  return

nextU: ;Convert 'U' to Morse code
  movlw 0x55 ;ASCII number for character 'U'
  cpfseq result, B
  bra nextV
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  return

nextV: ;Convert 'V' to Morse code
  movlw 0x56 ;ASCII number for character 'V'
  cpfseq result, B
  bra nextW
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  return

nextW: ;Convert 'W' to Morse code
  movlw 0x57 ;ASCII number for character 'W'
  cpfseq result, B
  bra nextX
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  return

nextX: ;Convert 'X' to Morse code
  movlw 0x58 ;ASCII number for character 'X'
  cpfseq result, B
  bra nextY
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  return

nextY: ;Convert 'Y' to Morse code
  movlw 0x59 ;ASCII number for character 'Y'
  cpfseq result, B
  bra nextZ
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  return

nextZ: ;Convert 'Z' to Morse code
  movlw 0x5A ;ASCII number for character 'Z'
  cpfseq result, B
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '_'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  movlw ' '
  call LCD_Send_Byte_D
  movlw '.'
  call LCD_Send_Byte_D
  return

end