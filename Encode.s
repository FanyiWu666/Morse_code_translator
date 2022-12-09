#include <xc.inc>
      
global  Encode_Setup, Key_pressed, row_module, column_module, decode
    
  

psect	udata_acs   ; reserve data space in access ram
row_data: ds    1	    ; reserve 1 byte for variable row_data (4 pins)
col_data: ds    1	    ; reserve 1 byte for variable row_data (4 pins)
time_step: ds	1
result: ds  1
psect	keypad_code,class=CODE 
    
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
                                                         
	
next1:
	movlw 0x77
	cpfseq result, B
	bra next2
	retlw '1'


end

