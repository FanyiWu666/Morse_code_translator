#include <xc.inc>

extrn	UART_Setup, UART_Load_Byte, UART_Transmit_Byte  ; external subroutines
extrn	LCD_Setup, LCD_clear_display
extrn	Encode_start
extrn	LED_start

psect	udata_acs   ; reserve data space in access ram
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
	   call          UART_Transmit_Byte

test:      call          UART_Load_Byte
	   call          Encode_start
	   call		 delay
	   call		 delay
	   call		 delay
	   call		 delay
	   call		 delay
	   call		 LED_start
	   call		 delay
	   call		 LCD_clear_display
	   call		 delay
           bra           test
            
           goto       $                              ; goto current line in code   

delay:	
    movlw 0x0D
    movwf d1, A
    movlw 0x0D
    movwf d2, A
    movlw 0x0D
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
	
	end	rst