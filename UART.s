#include <xc.inc>
    
global  UART_Setup, UART_Transmit_Message, UART_Load_Byte, UART_Transmit_Byte, result

psect	udata_acs   ; reserve data space in access ram
UART_counter: ds    1	    ; reserve 1 byte for variable UART_counter
result: ds	    1 ; reserve 1 byte for variable UART_input
    
psect	uart_code,class=CODE
UART_Setup:
    bsf	    SPEN	; enable
    bcf	    SYNC	; synchronous
    bcf	    BRGH	; slow speed
    bsf	    TXEN	; enable transmit
    bsf	    CREN	; enable receive
    bcf	    BRG16	; 8-bit generator only
    movlw   103		; gives 9600 Baud rate (actually 9615)
    movwf   SPBRG1, A	; set baud rate
    bsf	    TRISC, PORTC_TX1_POSN, A	; TX1 pin is output on RC6 pin
					; must set TRISC6 to 1
    return

UART_Transmit_Message:	    ; Message stored at FSR2, length stored in W
    movwf   UART_counter, A
UART_Loop_message:
    movf    POSTINC2, W, A ; ;Accsess the value in FSR2 and automatically increaments it by '1' afterwards, and move the value to W
    call    UART_Transmit_Byte
    decfsz  UART_counter, A
    bra	    UART_Loop_message
    return
    
UART_Transmit_Byte:	    ; Transmits byte stored in W
    btfss   TX1IF	    ; TX1IF is set when TXREG1 is empty
    bra	    UART_Transmit_Byte
    movwf   TXREG1, A
    return

UART_Load_Byte:	    ; Loads RECEIVED byte to W
    btfss   RC1IF	    ; RC1IF is set when TXREG1 is empty
    ;bra	    UART_Load_Byte
    movf    RCREG1, W ;READ 8-BIT DATA ONLY
    movwf   result
    movlw   0x00
    movwf   RCREG1
    return   
        
    ;NEED TO SPLIT THE INPUT MESSAGE 
    ;NEED TO CREATE A NEW ADDRESS MENMORY STORING ENOUGH INPUT CHARACTERS
Loop_Load_message: ; Message stored at RCREG1
    movf    RCREG1, W, A ;Accsess the value in FSR2 and automatically increaments it by '1' afterwards, and move the value to W
    call    UART_Load_Byte
    decfsz  UART_counter, A
    bra	    Loop_Load_message
    return