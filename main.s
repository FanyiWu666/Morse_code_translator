#include <xc.inc>

extrn	UART_Setup, UART_Transmit_Message, UART_Load_Byte, UART_Transmit_Byte  ; external subroutines
extrn	LCD_Setup, LCD_Write_Message, LCD_Send_Byte_D
extrn	Encode_start
extrn	LED_start
	
psect	udata_acs   ; reserve data space in access ram
counter:    ds 1    ; reserve one byte for a counter variable
d1:ds 1    ; reserve one byte for counter in the delay routine
d2:ds 1    ; reserve one byte for counter in the delay routine
d3:ds 1    ; reserve one byte for counter in the delay routine
   
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
	   movlw
	   call          UART_Transmit_Byte
test:      call          UART_Load_Byte
	   call          Encode_start
	   call		 LED_start
           bra           test
                
           
           call          LCD_Write_Message

           goto       $                              ; goto current line in code   


	       
	
	
delay:	
    movlw 0x08
    movwf d1
    movlw 0x2F
    movwf d2
    movlw 0x03
    movwf d3
    
delay_loop:
    decfsz	d1, A	; decrement until zero
    bra	delay_loop
    decfsz	d2, A
    bra delay_loop
    decfsz	d3, A
    bra delay_loop
    return
	
	end	rst