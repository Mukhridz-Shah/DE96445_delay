			#include<p18f4550.inc>

loop_cnt	set 0x00
loop_cnt1	set 0x01
loop_cnt2	set 0x02

			org 0x00
			goto start
			org 0x08
			retfie
			org 0x18
			retfie

show3		movlw	B'01001111'	
			movwf	PORTD,A
			return

show2		movlw	B'01011011'
			movwf	PORTD,A
			return

show8		movlw	B'01111111'
			movwf	PORTD,A
			return

offLED		clrf	PORTD,A
			return

dup_nop		macro	kk
			variable i
i=0
			while i < kk
			nop
i+=1		
			endw
			endm

delay0.045sec	movlw D'252'
			movwf loop_cnt1,A
again1		movlw D'250'
			movwf loop_cnt,A
			movlw D'250'
			movwf loop_cnt2,A
again		dup_nop D'17'
			decfsz		loop_cnt,F,A
			decfsz		loop_cnt1,F,A
			decfsz		loop_cnt2,F,A
			return

start		clrf	TRISD,A
			clrf	PORTD,A

loop		call	show8
			call	delay0.045sec
			call	offLED
			call	delay0.045sec

			call	show2
			call	delay0.045sec
			call	offLED
			call	delay0.045sec

			call	show3
			call	delay0.045sec
			call	offLED
			call	delay0.045sec

			bra		loop
			end
