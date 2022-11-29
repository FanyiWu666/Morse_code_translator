#include <xc.inc>
      
global  Encode_Setup, Key_pressed, row_module, column_module, decode
    
  

psect	udata_acs   ; reserve data space in access ram
row_data: ds    1	    ; reserve 1 byte for variable row_data (4 pins)
col_data: ds    1	    ; reserve 1 byte for variable row_data (4 pins)
time_step: ds	1
result: ds  1
psect	keypad_code,class=CODE 
    
Keypad_Setup:
	movlb	15
	bsf	REPU
	movlb	0
	return

row_module:
	movlw	0xF
	movwf	TRISE, A
	;call	delay
	movf	PORTE, W, A
	movwf   row_data, B
	return
	
column_module:
	movlw	0xF0
	movwf	TRISE, A
	;call	delay
	movf	PORTE, W, A
	movwf   col_data, B
	return

delay:
	movlw	0x10
	movwf	time_step, A
delay_1:	
	
	decfsz	time_step, F, A
	bra	delay_1
	return
	
decode:
	movf	col_data, W, A
	iorwf	row_data, W, A	;combined value
	call	delay
	return                                                                  
                                                         
Key_pressed:
	movwf result, B
	movlw 0xFF
	cpfseq result, B
	bra next1
	retlw 0x00
	
next1:
	movlw 0x77
	cpfseq result, B
	bra next2
	retlw '1'

next2:
	movlw  0xB7
	cpfseq result, B
	bra next3
	retlw '2'

next3:
	movlw  0xD7
	cpfseq result, B
	bra nextF
	retlw '3'
	
nextF:
	movlw  0xE7
	cpfseq result, B
	bra next4
	retlw 'F'
	
next4:
	movlw  0x7B
	cpfseq result, B
	bra next5
	retlw '4'
	
next5:
	movlw  0xBB
	cpfseq result, B
	bra next6
	retlw '5'
	
next6:
	movlw  0xDB
	cpfseq result, B
	bra nextE
	retlw '6'
	
nextE:
	movlw  0xEB
	cpfseq result, B
	bra next7
	retlw 'E'
		
next7:
	movlw  0x7D
	cpfseq result, B
	bra next8
	retlw '7'
	
next8:
	movlw  0xBD
	cpfseq result, B
	bra next9
	retlw '8'
	
next9:
	movlw  0xDD
	cpfseq result, B
	bra nextD
	retlw '9'
	
nextD:
	movlw  0xED
	cpfseq result, B
	bra nextA
	retlw 'D'
	
nextA:
	movlw  0x7E
	cpfseq result, B
	bra next0
	retlw 'A'
	
next0:
	movlw  0xBE
	cpfseq result, B
	bra nextB
	retlw '0'
	
nextB:
	movlw  0xDE
	cpfseq result, B
	bra nextD
	retlw 'B'
	
nextC:
	movlw  0xEE
	cpfseq result, B
	retlw 'C'
	
end

