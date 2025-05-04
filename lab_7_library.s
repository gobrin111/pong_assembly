	.text
	.global uart_init
	.global gpio_btn_and_LED_init
	.global output_character
	.global read_character
	.global read_string
	.global output_string
	.global read_from_push_btns
	.global illuminate_LEDs
	.global illuminate_RGB_LED
	.global read_tiva_pushbutton
	.global division
	.global multiplication
	.global string2int
	.global int2string


U0FR: 	.equ 0x18	; UART0 Flag Register

uart_init:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here
		MOV r4, #0xE618
		MOVT r4, #0x400F
		MOV r5, #1
		STR r5, [r4]

		MOV r4, #0xE608
		MOVT r4, #0x400F
		STR r5, [r4]

		MOV r4, #0xC030
		MOVT r4, #0x4000
		MOV r5, #0
		STR r5, [r4]

		MOV r4, #0xC024
		MOVT r4, #0x4000
		MOV r5, #8
		STR r5, [r4]

		MOV r4, #0xC028
		MOVT r4, #0x4000
		MOV r5, #44
		STR r5, [r4]

		MOV r4, #0xCFC8
		MOVT r4, #0x4000
		MOV r5, #0
		STR r5, [r4]

		MOV r4, #0xC02C
		MOVT r4, #0x4000
		MOV r5, #0x60
		STR r5, [r4]

		MOV r4, #0xC030
		MOVT r4, #0x4000
		MOV r5, #0x301
		STR r5, [r4]

		; or

		MOV r4, #0x451C
		MOVT r4, #0x4000
		LDR r6, [r4]
		MOV r5, #0x03
		ORR r5, r5, r6
		STR r5, [r4]

		MOV r4, #0x4420
		MOVT r4, #0x4000
		LDR r6, [r4]
		MOV r5, #0x03
		ORR r5, r5, r6
		STR r5, [r4]

		MOV r4, #0x452C
		MOVT r4, #0x4000
		LDR r6, [r4]
		MOV r5, #0x11
		ORR r5, r5, r6
		STR r5, [r4]

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

gpio_btn_and_LED_init:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here

		; enabled all tiva board stuff
		; enable clock port F
		MOV r4, #0xE608
		MOVT r4, #0x400F
		LDR r6, [r4]
		ORR r6, r6, #0x20 ; bit for port f changed to 1
		STR r6, [r4]
		; setting pin direction
		; set 1 2 3 pins as output
		; set 4 pin to input
		MOV r4, #0x5510 ; pull up
		MOVT r4, #0x4002
		LDR r6, [r4]
		ORR r6, r6, #0x10 ; pin 4 direction change
		STR r6, [r4]

		MOV r4, #0x5400
		MOVT r4, #0x4002
		LDR r5, [r4]
		ORR r5, r5, #0x0E ; pin 1 2 3 direction change
		STR r5, [r4]

		; setting pin as digital
		MOV r4, #0x551C
		MOVT r4, #0x4002
		LDR r5, [r4]
		ORR r5, r5, #0x1E
		STR r5, [r4]

		; enable the four pushbuttons and 4 LED on Alice
		; enable port B
		MOV r4, #0xE608
		MOVT r4, #0x400F ; clock address
		LDR r6, [r4]
		ORR r6, r6, #0x02 ; bit for port b changed to 1
		STR r6, [r4]

		;enable port D
		MOV r4, #0xE608
		MOVT r4, #0x400F ; clock address
		LDR r6, [r4]
		ORR r6, r6, #0x08 ; bit for port d changed to 1
		STR r6, [r4]

		; port b direction

		MOV r4, #0x5400
		MOVT r4, #0x4000 ; port b apio
		LDR r5, [r4]
		ORR r5, r5, #0x0F ; pin 1 2 3 4 direction change
		STR r5, [r4]

		MOV r4, #0x7400 ; port d enable
		MOVT r4, #0x4000
		LDR r5, [r4]
		ORR r5, r5, #0x00 ; pin 1 2 3 4 direction change
		STR r5, [r4]


		; setting pin as digital
		MOV r4, #0x551C
		MOVT r4, #0x4000
		LDR r5, [r4]
		ORR r5, r5, #0x0F
		STR r5, [r4]

		; setting pin as digital for port D
		MOV r4, #0x751C
		MOVT r4, #0x4000
		LDR r5, [r4]
		ORR r5, r5, #0x0F
		STR r5, [r4]

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

output_character:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here
Tran:	MOV r4, #0xC000
		MOVT r4, #0x4000
		LDRB r5, [r4, #U0FR]

		AND r6, r5, #0x20

		CMP r6, #0x20
		BEQ Tran

		STRB r0, [r4]
	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

read_character:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here
Read:
        MOV r4, #0xC000
		MOVT r4, #0x4000
		LDRB r5, [r4, #U0FR]

		AND r6, r5, #0x10

		CMP r6, #0x10
		BEQ Read

		LDRB r0, [r4]

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

read_string:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here

		MOV r4, r0 ; r4 contains original address
		MOV r6, #0
rs:		BL read_character
		; check if enter key is pressed
		; yes, then store null
		; else store r0 value
		CMP r0, #13 ; check if r0 is enter
 		BEQ null
 		BL output_character ; prints character to screen as user types
		STRB r0, [r4]
		ADD r4, r4, #1 ; iterate to next memeory location
		ADD r6, r6, #1
		B rs
null:
		MOV r5, #0 ; store null
		STRB r5, [r4] ; memory location here

	SUB r4, r4, r6 ; moves ptr back to original location
	MOV r0, r4 ; restore r0

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

output_string:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here

		; r4 contains moving ptr from r0
		; r5 has the current character
		; r0 is used to pass it into



		MOV r4, r0 ; puts the string location into r4

next:	LDRB r5, [r4] ; loads in the character
		CMP r5, #0
		BEQ hasNULL ; jumps to the end if the character is NULL
		MOV r0, r5 ; passes the character into r0 for the function call
		BL output_character
		ADD r4, r4, #1 ; goes to the next point in memory
		B next ; loops back to load the next character

hasNULL:
	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

read_from_push_btns:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here

		MOV r4, #0x7000
		MOVT r4, #0x4000
		LDR r5, [r4, #0x3FC]
		AND r5, r5, #0x0F
		MOV r0, r5

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

illuminate_LEDs:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here

		MOV r4, #0x5000
		MOVT r4, #0x4000
		LDR r5, [r4, #0x3FC] ; using gpio for port B
		BIC r5, r5, #0xF ; clear bits from 0 to 3

		AND r6, r0, #0xF ; checks all four bits
		ORR r5, r5, r6
		STR r5, [r4, #0x3FC] ; !!!!!!checks this later!!!!!!!!!!!!!!!!

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

illuminate_RGB_LED:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here

		MOV r4, #0x5000
		MOVT r4, #0x4002
		LDR r5, [r4, #0x3FC]
		BIC r5, r5, #0xE ; clear bits from 1 to 3

		AND r6, r0, #0x7 ; pins 1 2 3 checked
		ORR r5, r5, r6, LSL #1 ; left shift read led pattern to match bits to set
		STR r5, [r4, #0x3FC]

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

read_tiva_pushbutton:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here

		MOV r4, #0x5000
		MOVT r4, #0x4002
		LDR r5, [r4, #0x3FC]
		AND r5, r5, #0x10
		CMP r5, #0
		BEQ button_press
		MOV r0, #0
		B button_end

button_press:
		MOV r0, #1

button_end:

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

division:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here

	; r0 is dividend
	; r1 is divisor

	; r4 is counter
	; r5 is quotient
	; r6 is remainder

		MOV r4, #15 ;counter to 15
		MOV r5, #0 ; quotient to 0
		LSL r1, r1, #15 ; left shift by 15
		MOV r6, r0 ; set remainder as dividend
Loop:	SUB r6, r6, r1 ; remainder - divisor

		CMP r6, #0
		BLT Jump

		LSL r5, r5, #1
		ORR r5, r5, #1
Skip:	LSR r1, r1, #1
		CMP r4, #0
		SUB r4, r4, #1
		BGT Loop
		MOV r0, r5

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr

Jump:	ADD r6, r6, r1
		LSL r5, r5, #1
		B Skip


multiplication:
	PUSH {r4-r12,lr}	; Spill registers to stack

          ; Your code is placed here

		; r4 is counter
		; r5 is product


		MOV r4, #0
		MOV r5, #0
		CMP r4, r1
		BEQ Jump1

Loop1:	ADD r5, r5, r0 ;add the other factor into the total
		ADD r4, r4, #1 ;increment counter
		CMP r4, r1 ; checks if it's done
		BNE Loop1
Jump1:	MOV r0, r5 ; if done then just move the answer into r0

	POP {r4-r12,lr}  	; Restore registers from stack
	MOV pc, lr



string2int:
	PUSH {r4-r12,lr} 	; Store any registers in the range of r4 through r12
				; that are used in your routine.  Include lr if this
				; routine calls another routine.

		; Your code for your string2int routine is placed here
		MOV r4, r0 ; r4 contains address
		MOV r5, #1 ; counter
		MOV r6, #10 ; holds 10

next_char:
		LDRB r7, [r4] ; r7 contains current place
		ADD r4, #1 ; increment address

		CMP r7, #44 ; checks if current is a comma
		BEQ next_char

		MUL r5, r5, r6 ; add another 10s
		CMP r7, #0		; if string not end loop back
		BNE next_char

		UDIV r5, r5, r6
		UDIV r5, r5, r6 ; double divide to get rid of extra places
		MOV r4, r0 ; reset address
		MOV r0, #0 ; set r0 as my counter
get_sum:
		LDRB r7, [r4] ; get current character
		ADD r4, r4, #1 ; increment address

		CMP r7, #44 ; skips over the comma
		BEQ get_sum

		CMP r7, #0 ; if null hit, end
		BEQ sum_done
		SUB r7, r7, #48 ; convert to int
		MUL r7, r7, r5 ; get the actual num
		UDIV r5, r5, r6 ; decrement r5 by 10s
		ADD r0, r0, r7 ; add current num to r0 sum
		CMP r5, #0
		BGT get_sum
sum_done:





	POP {r4-r12,lr}   	; Restore registers all registers preserved in the
				; PUSH at the top of this routine from the stack.
	mov pc, lr



int2string:
	PUSH {r4-r12,lr} 	; Store any registers in the range of r4 through r12
				; that are used in your routine.  Include lr if this
				; routine calls another routine.

		; Your code for your int2string routine is placed here

		MOV r4, #10
		MOV r5, r1 ; r5 contains integer
		MOV r6, #1 ; 10s counter
		MOV r9, r0 ; original address

find_pl:
		CMP r5, #0 ; if input is 0
		BEQ zero
		CMP r5, r6 ; branch if r5 less than counter
		BLT extract
		MUL r6, r6, r4
		B find_pl

extract:
		UDIV r6, r6, r4 ; gets rid of that extra 10s
zero:
		UDIV r7, r5, r6 ; r7 contains the current place value
		MUL r8, r7, r6 ; r8 contains the num to subtract
		SUB r5, r5, r8 ; iterates r5

		ADD r7, r7, #48 ; ascii value convert
		STRB r7, [r9] ; store value
		ADD r9, r9, #1 ; increment value

		CMP r6, #1000
		BNE noComma
		MOV r8, #44 ; r8 contains comma for now
		STRB r8, [r9] ; stores comma
		ADD r9, r9, #1

noComma:
		CMP r6, #1		; checks 10s counter
		BGT extract

		MOV r5, #0		; adding the null terminater
		STRB r5, [r9]




	POP {r4-r12,lr}   	; Restore registers all registers preserved in the
				; PUSH at the top of this routine from the stack.
	mov pc, lr


	.end
