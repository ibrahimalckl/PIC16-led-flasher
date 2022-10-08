   list p= 16f628A
   include "P16F628A.INC"
   __config _HS_OSC
   
   #define LED PORTB,0
   #define LED_ON bsf LED
   #define LED_OFF bcf LED
   
      cblock h'20'
      S1,S2,S3
      endc
      
      org 0
      clrf	PORTB
      
      bsf	STATUS, RP0
      bcf	TRISB,0
      bcf	STATUS, RP0
      
Basla
   LED_OFF
   call Bekle
   LED_ON
   call Bekle
   goto Basla
   
Bekle
   movlw d'2'
   movwf S1

D1
   movlw d'250'
   movwf S2

D2
   movlw d'250'
   movwf S3

D3
   nop
   decfsz 	S3
   goto	D3
   decfsz	S2
   goto	D2
   decfsz	S1
   goto	D1
   
   return
   END
   