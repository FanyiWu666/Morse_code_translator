#include <xc.inc>

extrn	UART_Setup, UART_Transmit_Message, UART_Load_Byte, UART_Transmit_Byte  ; external subroutines
extrn	LCD_Setup, LCD_Write_Message, LCD_Send_Byte_D
extrn	Encode_start
	
psect	udata_acs   ; reserve data space in access ram
counter:    ds 1    ; reserve one byte for a counter variable
delay_count:ds 1    ; reserve one byte for counter in the delay routine
   
psect	code, abs	
rst: 	org 0x0
 	goto	setup

	; ******* Programme FLASH read Setup Code ***********************
setup:	bcf	CFGS	; point to Flash program memory  
	bsf	EEPGD 	; access Flash program memory
	call	UART_Setup	; setup UART
	call	LCD_Setup	; setup LCD
	goto	start

	; ******* Main programme ****************************************
start:     ;movlw	 'A'
	   call          UART_Transmit_Byte
test:      call          UART_Load_Byte
	   call          Encode_start
           bra           test
                
           
           call          LCD_Write_Message

           goto       $                              ; goto current line in code   


	       
	
	
delay:	decfsz	delay_count, A	; decrement until zero
	bra	delay
	return
	
	end	rst