#include <xc.inc>

extrn	UART_Setup, UART_Load_Byte, UART_Transmit_Byte  ; external subroutines
extrn	LCD_Setup, LCD_clear_display
extrn	Encode_start
extrn	LED_start
   
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
	   call		 LED_start
	   call		 LCD_clear_display
           bra           test
            
           goto       $                              ; goto current line in code   

	
	end	rst