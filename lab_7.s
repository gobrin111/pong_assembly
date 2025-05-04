	.data

	.global prompt
	.global mydata

prompt:	.string "Your prompt with instructions is place here", 0
newGamePrompt:	.string 27, "[40mPress Alice Board buttons to select score", 0x0D, 0x0A
new2:			.string 27, "[40mSW5 = 7	SW4 = 9		SW3 = 11	SW2 = No Limit",  0x0D, 0x0A
new3:			.string 27, "[40mPress 'p' to start the game", 0x0D, 0x0A
new4:			.string 27, "[40mPlayer 1 controls: 'w' and 's'", 0x0D, 0x0A
new5:			.string 27, "[40mPlayer 2 controls: 'SW2' and 'SW4' on Alice", 0
pausePromptLocation:	.string 27, "[28;1f", 0
pausePrompt:	.string 27, "[40mPress SW1 to unpause game or Press 'r' to reset scores or Press 'q' to go back to main menu.", 0
continuePrompt:		.string "Do you want to continue y/n", 0x0D, 0x0A
continue1:		.string "Player 1 won: ", 0x0D, 0x0A
continue2:		.string "Player 2 won: ", 0
pauseFlag:	.word 1
gameFlag:	.word 0
endGameFlag:	.word 0
targetscore:	.word 5
framecount:		.word 30
didTimerChange:	.word 1

aliceMoveFlag:	.word 0
aliceOnce:	.word 0

; 0-Black, 1-Red, 2-Blue, 3-Purple, 4-Green, 5-Yellow, 6-Cyan, 7-White

cleartext:	.string 0x0C, 0
clearboard:	.string 27,"[40m",27,"[2J", 0
clearLine:	.string 27, "[K", 0

leftColor:	.word 1
rightColor:	.word 2
ballColor:	.word 3
black:	.string 27, "[40m", 0
red:	.string 27, "[41m", 0
blue:	.string 27, "[44m", 0
purple:	.string 27, "[48;5;57m", 0
green:	.string 27, "[42m", 0
yellow:	.string 27, "[43m", 0
white:	.string 27, "[47m", 0

paddleblock:	.string " ", 0

leftpaddlesize:	.word 6
leftpaddlelocataion:	.word 12

rightpaddlesize:	.word 6
rightpaddlelocation:	.word 12

leftpaddlejump:	.string 27, "[12;1f", 0
rightpaddlejump:	.string 27, "[12;80f", 0
;	2		1
;11				22
;	13		14
balldirection:	.word 11
ballx:	.word 39
bally:	.word 14
ballStartPosition:	.string 27, "[14;39f", 0

powerUpx:	.word 1
powerUpy:	.word 1
powerUpTimeEnd:	.word 0
powerUpRespawnTime:	.word 2

toprightcorner:	.string 27, "[0;80f", 0
topleftcorner:.string 27, "[0;0f", 0
cursorup:	.string 27, "[1A", 0
cursordown: .string 27, "[1B", 0
cursorleft:	.string 27, "[1D", 0
cursorright:	.string 27, "[1C", 0
saveposition:	.string 27, "[s", 0
restoreposition:	.string 27, "[u", 0
hidecursor:		.string 27, "[?25l", 0

; grey border for the top and bottom of the game board area
border:	.string 27, "[48;5;245m                                                                                ", 0
bottomborderlocation:	.string 27, "[27;0f", 0
topborderlocation:	.string 27, "[02;0f", 0
timerline:	.string 27, "[40m  0                             Time: 0                                   0     ", 0
leftscore:	.string "00", 0
rightscore:	.string "00", 0
leftscorelocation:	.string 27, "[1;3f", 0
rightscorelocation:	.string 27, "[1;75f", 0
leftGamesWonLocation:	.string 27, "[2;15f", 0
rightGamesWonLocation:	.string 27, "[3;15f", 0
timerlocation:	.string 27, "[1;39f", 0
timercount:		.word 0
leftGamesWon:	.string "00", 0
rightGamesWon:	.string "00", 0
timer:	.string "1", 0



mydata:	.byte	0x20	; This is where you can store data.
			; The .byte assembler directive stores a byte
			; (initialized to 0x20 in this case) at the label
			; mydata.  Halfwords & Words can be stored using the
			; directives .half & .word

	.text

	.global uart_interrupt_init
	.global gpio_interrupt_init
	.global alice_init
	.global UART0_Handler
	.global Switch_Handler
	.global Timer_Handler		; This is needed for Lab #6
	.global Alice_Handler
	.global simple_read_character	; read_character modified for interrupts
	.global output_character	; This is from your Lab #4 Library
	.global read_string		; This is from your Lab #4 Library
	.global output_string		; This is from your Lab #4 Library
	.global uart_init		; This is from your Lab #4 Library
	.global lab7
	.global illuminate_LEDs
	.global illuminate_RGB_LED
	.global gpio_btn_and_LED_init
	.global int2string
	.global string2int
	.global read_from_push_btns


ptr_to_prompt:		.word prompt
ptr_to_mydata:		.word mydata

ptr_to_newGamePrompt:	.word newGamePrompt
ptr_to_pausePrompt:		.word pausePrompt
ptr_to_pausePromptLocation:	.word pausePromptLocation
ptr_to_continuePrompt:	.word continuePrompt

ptr_to_pauseFlag:	.word pauseFlag
;ptr_to_roundFlag:	.word roundFlag
ptr_to_endGameFlag:	.word endGameFlag

ptr_to_targetscore:	.word targetscore

ptr_to_cleartext	.word cleartext
ptr_to_timerline:	.word timerline
ptr_to_clearboard:	.word clearboard
ptr_to_clearLine:	.word clearLine

ptr_to_leftColor:	.word leftColor
ptr_to_rightColor:	.word rightColor
ptr_to_ballColor:	.word ballColor

ptr_to_black:	.word black
ptr_to_red:		.word red
ptr_to_blue:	.word blue
ptr_to_green:	.word green
ptr_to_purple:	.word purple
ptr_to_yellow:	.word yellow
ptr_to_white:	.word white

ptr_to_paddleblock:	.word paddleblock
ptr_to_leftpaddlesize:	.word leftpaddlesize
ptr_to_leftpaddlelocation:	.word leftpaddlelocataion
ptr_to_rightpaddlesize:	.word rightpaddlesize
ptr_to_rightpaddlelocation:	.word rightpaddlelocation

ptr_to_leftpaddlejump:	.word leftpaddlejump
ptr_to_rightpaddlejump:	.word rightpaddlejump

ptr_to_balldirection:	.word balldirection
ptr_to_ballx:	.word ballx
ptr_to_bally:	.word bally
ptr_to_ballStartPosition:	.word ballStartPosition

ptr_to_powerUpx:	.word powerUpx
ptr_to_powerUpy:	.word powerUpy

ptr_to_toprightcorner:	.word toprightcorner
ptr_to_topleftcorner:		.word topleftcorner
ptr_to_cursorup:	.word cursorup
ptr_to_cursordown:	.word cursordown
ptr_to_cursorleft:	.word cursorleft
ptr_to_cursorright:	.word cursorright
ptr_to_saveposition:	.word saveposition
ptr_to_restoreposition:	.word restoreposition
ptr_to_hidecursor:	.word hidecursor

ptr_to_border:		.word border
ptr_to_topborderlocation:	.word topborderlocation
ptr_to_bottomborderlocation:	.word bottomborderlocation
ptr_to_leftscore:	.word leftscore
ptr_to_rightscore:	.word rightscore
ptr_to_leftscorelocation:	.word leftscorelocation
ptr_to_rightscorelocation:	.word rightscorelocation
ptr_to_leftGamesWon:	.word leftGamesWon
ptr_to_rightGamesWon:	.word rightGamesWon
ptr_to_leftGamesWonLocation:	.word leftGamesWonLocation
ptr_to_rightGamesWonLocation:	.word rightGamesWonLocation
ptr_to_timerlocation:		.word timerlocation

ptr_to_aliceMoveFlag:	.word aliceMoveFlag
ptr_to_aliceOnce:		.word aliceOnce

ptr_to_framecount:	.word framecount
ptr_to_timer:		.word timer
ptr_to_timercount:	.word timercount
ptr_to_powerUpTimeEnd:	.word powerUpTimeEnd
ptr_to_powerUpRespawnTime:	.word powerUpRespawnTime
ptr_to_didTimerChange:	.word didTimerChange
lab7:				; This is your main routine which is called from
				; your C wrapper.
	PUSH {r4-r12,lr}   	; Preserve registers to adhere to the AAPCS
	ldr r4, ptr_to_prompt
	ldr r5, ptr_to_mydata

 	bl uart_init
 	bl gpio_btn_and_LED_init
	bl uart_interrupt_init
	bl gpio_interrupt_init
	bl alice_init
	bl timer_init


	; This is where you should implement a loop, waiting for the user to
	; indicate if they want to end the program.
		; prompt user to press the tiva board to start the game

		ldr r0, ptr_to_hidecursor
		BL output_string
		; clears the screen of any prompt text
		ldr r0, ptr_to_cleartext
		BL output_string
		ldr r0, ptr_to_clearboard
		BL output_string
		; prompt user to choose target score and press p to start game
		ldr r0, ptr_to_newGamePrompt
		BL output_string
gameLoop:
		; when the user chooses the end game, this flag gets set to 1 and ends the loop
		ldr r0, ptr_to_endGameFlag
		ldr r4, [r0]
		CMP r4, #1
		BEQ GameOver
		; reset the aliceonce flag
		ldr r0, ptr_to_aliceOnce
		mov r4, #0
		str r4, [r0]
		B gameLoop

GameOver:
	POP {r4-r12,lr}		; Restore registers to adhere to the AAPCS
	MOV pc, lr

setPowerUpCord:
	PUSH {r4-r12,lr}
		; set randomw y cord for power up
		MOV r4, #0x0050
		MOVT r4, #0x4003
		ldr r5, [r4]
		mov r6, #16
		UDIV r7, r5, r6
		MUL r7, r7, r6
		SUB r5, r5, r7
		ADD r5, r5, #7
		ldr r0, ptr_to_powerUpy
		str r5, [r0]
		; set random x cord for power up
		ldr r5, [r4]
		mov r6, #74
		UDIV r7, r5, r6
		MUL r7, r7, r6
		SUB r5, r5, r7
		ADD r5, r5, #4
		ldr r0, ptr_to_powerUpx
		str r5, [r0]
	POP {r4-r12,lr}
	mov pc, lr

setRandomRespawnTime:
	PUSH {r4-r12,lr}

	POP {r4-r12,lr}
	mov pc,lr

cycleColors:
		PUSH {r4-r12,lr}
		; set the color of the left paddle
		MOV r4, #0x0050
		MOVT r4, #0x4003
		ldr r5, [r4]
		mov r6, #6
		UDIV r7, r5, r6
		MUL r7, r7, r6
		SUB r5, r5, r7
		ADD r5, r5, #1
		ldr r0, ptr_to_leftColor
		str r5, [r0]
		; get color for right paddle and check if it the same as the left
rightColorSame:
		ldr r5, [r4]
		mov r6, #6
		UDIV r7, r5, r6
		MUL r7, r7, r6
		SUB r5, r5, r7
		ADD r5, r5, #1
		ldr r0, ptr_to_leftColor
		ldr r8, [r0]
		CMP r5, r8
		BEQ rightColorSame
		ldr r0, ptr_to_rightColor
		str r5, [r0]
		; same with the ball color
ballColorSame:
		ldr r5, [r4]
		mov r6, #6
		UDIV r7, r5, r6
		MUL r7, r7, r6
		SUB r5, r5, r7
		ADD r5, r5, #1
		ldr r0, ptr_to_leftColor
		ldr r8, [r0]
		CMP r5, r8
		BEQ ballColorSame
		ldr r0, ptr_to_rightColor
		ldr r8, [r0]
		CMP r5, r8
		BEQ ballColorSame
		ldr r0, ptr_to_ballColor
		str r5, [r0]
		POP {r4-r12,lr}
		MOV pc, lr

printBoardReset:
		PUSH {r4-r12,lr}
		; clears the screen of any prompt text
		ldr r0, ptr_to_cleartext
		BL output_string
		ldr r0, ptr_to_clearboard
		BL output_string
		; print the timer and score line
		ldr r0, ptr_to_timerline
		BL output_string
		; reset score when target score is met and the whole game restarts
		ldr r0, ptr_to_leftscore
		MOV r1, #0
		BL int2string
		ldr r0, ptr_to_rightscore
		MOV r1, #0
		BL int2string
		ldr r0, ptr_to_leftscorelocation
		BL output_string
		ldr r0, ptr_to_leftscore
		BL output_string
		ldr r0, ptr_to_rightscorelocation
		BL output_string
		ldr r0, ptr_to_rightscore
		BL output_string
		;print borders above and below the game area
		ldr r0, ptr_to_topborderlocation
		BL output_string
		ldr r0, ptr_to_border
		BL output_string
		ldr r0, ptr_to_bottomborderlocation
		BL output_string
		ldr r0, ptr_to_border
		BL output_string
		; reset paddle sizes and location
		ldr r0, ptr_to_leftpaddlelocation
		mov r1, #12
		str r1, [r0]
		ldr r0, ptr_to_rightpaddlelocation
		str r1, [r0]
		mov r1, #6
		ldr r0, ptr_to_leftpaddlesize
		str r1, [r0]
		ldr r0, ptr_to_rightpaddlesize
		str r1, [r0]
		; print out the paddles
		BL buildLeftPaddle
		BL buildRightPaddle
		; set starting position of ball and save it
		ldr r0, ptr_to_ballStartPosition
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		; print power up if possible
		ldr r0, ptr_to_powerUpx
		ldr r4, [r0]
		CMP r4, #1
		IT NE
		BLNE drawPowerUp
		; reset FPS and timercount
		BL resetFPS
		POP {r4-r12,lr}
		MOV pc, lr

resetFPS:
	PUSH {r4-r12,lr}
		; reset fps to 30
		MOV r4, #0x0028
		MOVT r4, #0x4003
		MOV r5, #0x2355
		MOVT r5, #0x0008
		str r5, [r4] ; 30 fps
		; set the fpscount back to 30 and the timercount to 0
		ldr r0, ptr_to_framecount
		MOV r4, #30
		str r4, [r0]
		ldr r0, ptr_to_timercount
		MOV r4, #0
		str r4, [r0]
	POP {r4-r12,lr}
	mov pc,lr

UART0_Handler:
	; Your code for your UART handler goes here.
	; Remember to preserver registers r4-r12 by pushing then popping
	; them to & from the stack at the beginning & end of the handler
		PUSH {r4-r12,lr}
		MOV r4, #0xC044
		MOVT r4, #0x4000
		ldr r5, [r4]
		ORR r5, r5, #0x10
		str r5, [r4]
		;gets what the user typed for the direction change
		MOV r4, #0xC000 ; address from keyboard input
		MOVT r4, #0x4000
		ldrb r5, [r4]
		CMP r5, #112	; if p pressed to start game
		BEQ gameStartSequence
		CMP r5, #114	; if r pressed to restart scores and game
		BEQ restartRound
		CMP r5, #110	; if n pressed to end game
		BEQ nPress
		CMP r5, #121	; if y is pressed to reset board, cycle colors, and scores and timers, prompt user again
		BEQ yPress
		CMP r5, #113	; if q is pressed, sends back to main menu
		BEQ yPress
		; check pause flag, if 1 then skip everything
		ldr r4, ptr_to_pauseFlag
		ldr r6, [r4]
		CMP r6, #1
		BEQ moveDone
		CMP r5, #119 ;if w pressed
		BEQ left_up
		CMP r5, #115 ; if s pressed
		BEQ left_down
		;CMP r5, #105 ;if i pressed
		;BEQ right_up
		;CMP r5, #107 ; if k pressed
		;BEQ right_down
moveDone:
		POP {r4-r12,lr}
	BX lr       	; Return

yPress:
		; set aliceMoveFlag to 0 so that they can choose scores
		ldr r4, ptr_to_aliceMoveFlag
		mov r5, #0
		str r5, [r4]
		; cycle paddle and ball colors
		BL cycleColors
		; reset ball position
		ldr r0, ptr_to_ballx
		mov r1, #39
		str r1, [r0]
		ldr r0, ptr_to_bally
		mov r1, #14
		ldr r0, ptr_to_ballStartPosition
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		; reset ball direction
		ldr r0, ptr_to_balldirection
		mov r1, #11
		str r1, [r0]
		; clears the screen of any prompt text
		ldr r0, ptr_to_cleartext
		BL output_string
		ldr r0, ptr_to_clearboard
		BL output_string
		; prompt user to choose target score and press p to start game
		ldr r0, ptr_to_newGamePrompt
		BL output_string
		B moveDone

nPress:
		ldr r0, ptr_to_endGameFlag
		MOV r4, #1
		str r4, [r0]
		B moveDone
restartRound:
		; turn off tiva board light
		MOV r0, #0
		BL illuminate_RGB_LED
		; turn off alice lights
		mov r0, #0
		BL illuminate_LEDs
		; reset fps back to 30 and the framecount back
		BL resetFPS
		; reset score
		ldr r0, ptr_to_black
		BL output_string
		ldr r0, ptr_to_leftscore
		MOV r1, #0
		BL int2string
		ldr r0, ptr_to_rightscore
		MOV r1, #0
		BL int2string
		ldr r0, ptr_to_topleftcorner
		BL output_string
		ldr r0, ptr_to_timerline
		BL output_string
		; reset ball position and sets direction to go left
		BL clearBall
		ldr r0, ptr_to_ballx
		MOV r1, #39
		str r1, [r0]
		ldr r0, ptr_to_bally
		MOV r1, #14
		str r1, [r0]
		ldr r0, ptr_to_balldirection
		mov r1, #11
		str r1, [r0]
		ldr r0, ptr_to_ballStartPosition
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		; reset the powerupTimeEnd
		ldr r0, ptr_to_powerUpTimeEnd
		mov r4, #0
		str r4, [r0]
		; reset power up respawn time
		ldr r0, ptr_to_powerUpRespawnTime
		mov r4, #2
		str r4, [r0]
		; reset timer and timer count
		ldr r0, ptr_to_timer
		mov r1, #1
		BL int2string

		B moveDone

gameStartSequence:
		; set aliceMoveFlag to 1 so next inputs are for movement
		ldr r4, ptr_to_aliceMoveFlag
		mov r5, #1
		str r5, [r4]
		; changes to different colors
		BL cycleColors
		BL printBoardReset	; print out the board first
		ldr r0, ptr_to_pauseFlag;	then let the timer interrrupt start
		mov r4, #0
		str r4, [r0]
		B moveDone

setColor:	; takes in r0 which is a number
		PUSH {r4-r12,lr}
		CMP r0, #1
		IT EQ
		ldrEQ r0, ptr_to_red
		CMP r0, #2
		IT EQ
		ldrEQ r0, ptr_to_blue
		CMP r0, #3
		IT EQ
		ldrEQ r0, ptr_to_purple
		CMP r0, #4
		IT EQ
		ldrEQ r0, ptr_to_green
		CMP r0, #5
		IT EQ
		ldrEQ r0, ptr_to_yellow
		CMP r0, #6
		IT EQ
		ldrEQ r0, ptr_to_white
		BL output_string
		POP {r4-r12,lr}
		MOV pc, lr

left_up:
		ldr r0, ptr_to_leftpaddlelocation
		ldr r4, [r0]
		; r4 is the location
		CMP r4, #3 ; if the paddle is already at the top then it don't do anything
		BEQ moveDone
		BL clearLeftPaddle
		SUB r4, r4, #1
		ldr r0, ptr_to_leftpaddlelocation
		str r4, [r0]
		BL buildLeftPaddle
		B moveDone
left_down:
		ldr r0, ptr_to_leftpaddlelocation
		ldr r4, [r0]
		ldr r0, ptr_to_leftpaddlesize
		ldr r5, [r0]
		; r4 is the location	r5 is the size
		MOV r7, #27
		SUB r7, r7, r5 ; calculate where the pointer shouldn't move past based on paddle size
		CMP r4, r7 ; if the paddle is already at the bottom then it won't change
		BGE moveDone
		BL clearLeftPaddle
		ADD r4, r4, #1
		ldr r0, ptr_to_leftpaddlelocation
		str r4, [r0]
		BL buildLeftPaddle
		B moveDone
right_up:
		ldr r0, ptr_to_rightpaddlelocation
		ldr r4, [r0]
		; r4 is the location
		CMP r4, #3 ; if the paddle is already at the top then it don't do anything
		BEQ AliceDone
		BL clearRightPaddle
		ldr r0, ptr_to_rightpaddlelocation
		SUB r4, r4, #1
		str r4, [r0]
		BL buildRightPaddle
		B AliceDone
right_down:
		ldr r0, ptr_to_rightpaddlelocation
		ldr r4, [r0]
		ldr r0, ptr_to_rightpaddlesize
		ldr r5, [r0]
		; r4 is the location	r5 is the size
		MOV r7, #27
		SUB r7, r7, r5 ; calculate where the pointer shouldn't move past based on paddle size
		CMP r4, r7 ; if the paddle is already at the bottom then it won't change
		BGE AliceDone
		BL clearRightPaddle
		ADD r4, r4, #1
		ldr r0, ptr_to_rightpaddlelocation
		str r4, [r0]
		BL buildRightPaddle
		B AliceDone

buildLeftPaddle:
	PUSH {r4-r12,lr}
		ldr r0, ptr_to_leftpaddlelocation
		ldr r4, [r0]
		ldr r0, ptr_to_leftpaddlesize
		ldr r5, [r0]
		ldr r0, ptr_to_topleftcorner ; move cursor to top left corner
		BL output_string
		; move cursor down to the top of the paddle location
		MOV r6, #1
left_move2build:
		ldr r0, ptr_to_cursordown
		BL output_string
		ADD r6, r6, #1
		CMP r6, r4
		BNE left_move2build

		; set color of paddle
		ldr r4, ptr_to_leftColor
		ldr r0, [r4]
		BL setColor

		MOV r6, #0 ; initilize counter for building paddle size
left_buildpaddle:
		ldr r0, ptr_to_paddleblock
		BL output_string
		ADD r6, r6, #1
		ldr r0, ptr_to_cursordown
		BL output_string
		ldr r0, ptr_to_cursorleft
		BL output_string
		CMP r6, r5
		BNE left_buildpaddle
	POP {r4-r12,lr}
	MOV pc, lr

; function to clear the left side of the board to print new location of paddle
clearLeftPaddle:
	PUSH {r4-r12,lr}
		ldr r0, ptr_to_topleftcorner ; move cursor to top left corner
		BL output_string
		ldr r0, ptr_to_cursordown
		BL output_string
		ldr r0, ptr_to_cursordown
		BL output_string ; go to the top left of the game board
		ldr r0, ptr_to_black ; set next backgrounds to black
		BL output_string
		MOV r4, #0
clearleftnext:
		ldr r0, ptr_to_paddleblock
		BL output_string
		ldr r0, ptr_to_cursorleft
		BL output_string
		ldr r0, ptr_to_cursordown
		BL output_string
		ADD r4, r4, #1
		CMP r4, #24
		BNE clearleftnext
	POP {r4-r12,lr}
	MOV pc, lr

buildRightPaddle:
	PUSH {r4-r12,lr}
		ldr r0, ptr_to_rightpaddlelocation
		ldr r4, [r0]
		ldr r0, ptr_to_rightpaddlesize
		ldr r5, [r0]
		ldr r0, ptr_to_toprightcorner ; move cursor to top left corner
		BL output_string
		; move cursor down to the top of the paddle location
		MOV r6, #1
right_move2build:
		ldr r0, ptr_to_cursordown
		BL output_string
		ADD r6, r6, #1
		CMP r6, r4
		BNE right_move2build

		; set color of paddle
		ldr r4, ptr_to_rightColor
		ldr r0, [r4]
		BL setColor

		MOV r6, #0 ; initilize counter for building paddle size
right_buildpaddle:
		ldr r0, ptr_to_paddleblock
		BL output_string
		ADD r6, r6, #1
		ldr r0, ptr_to_cursordown
		BL output_string
		ldr r0, ptr_to_cursorleft
		BL output_string
		CMP r6, r5
		BNE right_buildpaddle
	POP {r4-r12,lr}
	MOV pc, lr

; function to clear the right side
clearRightPaddle:
	PUSH {r4-r12,lr}
		ldr r0, ptr_to_toprightcorner ; move cursor to top right corner
		BL output_string
		ldr r0, ptr_to_cursordown
		BL output_string
		ldr r0, ptr_to_cursordown
		BL output_string ; go to the top left of the game board
		ldr r0, ptr_to_black ; set next backgrounds to black
		BL output_string
		MOV r4, #0
clearrightnext:
		ldr r0, ptr_to_paddleblock
		BL output_string
		ldr r0, ptr_to_cursorleft
		BL output_string
		ldr r0, ptr_to_cursordown
		BL output_string
		ADD r4, r4, #1
		CMP r4, #24
		BNE clearrightnext
	POP {r4-r12,lr}
	MOV pc, lr

drawPowerUp:
	PUSH {r4-r12,lr}
		ldr r0, ptr_to_powerUpx
		ldr r4, [r0]
		ldr r0, ptr_to_powerUpy
		ldr r5, [r0]
		;	r4 has x cord	r5 has y cord
		ldr r0, ptr_to_topleftcorner ; move cursor to top left corner
		BL output_string
		; move cursor down to the power up
		MOV r6, #1
moveDrawPowerX:
		ldr r0, ptr_to_cursorright
		BL output_string
		ADD r6, r6, #1
		CMP r6, r4
		BNE moveDrawPowerX
		MOV r6, #1
moveDrawPowerY:
		ldr r0, ptr_to_cursordown
		BL output_string
		ADD r6, r6, #1
		CMP r6, r5
		BNE moveDrawPowerY
		; set color of power up
		ldr r0, ptr_to_green
		BL output_string
		; draws the power up
		ldr r0, ptr_to_paddleblock
		BL output_string
	POP {r4-r12,lr}
	MOV pc, lr

clearPowerUp:
	PUSH {r4-r12,lr}
		ldr r0, ptr_to_powerUpx
		ldr r4, [r0]
		ldr r0, ptr_to_powerUpy
		ldr r5, [r0]
		;	r4 has x cord	r5 has y cord
		ldr r0, ptr_to_topleftcorner ; move cursor to top left corner
		BL output_string
		; move cursor down to the power up
		MOV r6, #1
moveClearPowerX:
		ldr r0, ptr_to_cursorright
		BL output_string
		ADD r6, r6, #1
		CMP r6, r4
		BNE moveClearPowerX
		MOV r6, #1
moveClearPowerY:
		ldr r0, ptr_to_cursordown
		BL output_string
		ADD r6, r6, #1
		CMP r6, r5
		BNE moveClearPowerY
		; set color of power up
		ldr r0, ptr_to_black
		BL output_string
		; draws the power up
		ldr r0, ptr_to_paddleblock
		BL output_string
	POP {r4-r12,lr}
	mov pc, lr

Alice_Handler:
		PUSH {r4-r12,lr}
		BL read_from_push_btns
		; r0 has the button read from the alice board

		; check if alice board already looped
		ldr r4, ptr_to_aliceOnce
		ldr r4, [r4]
		CMP r4, #1
		BEQ AliceDone

		; check if alice is being used for movement controls or for score selection
		ldr r4, ptr_to_aliceMoveFlag
		ldr r4, [r4]
		CMP r4, #0	; if the flag is 0 then alice is used for score select
		BEQ selectScore
		; check pause flag, if 1 then skip everything
		ldr r4, ptr_to_pauseFlag
		ldr r6, [r4]
		CMP r6, #1
		BEQ AliceDone
		CMP r0, #8 ; sw2 click
		BEQ right_up
		CMP r0, #2	; sw 4 click
		BEQ right_down
		B AliceDone
selectScore:
		; check score select
		CMP r0, #1 ; sw 5 press
		ITTT EQ
		ldrEQ r4, ptr_to_targetscore
		movEQ r5, #7
		strEQ r5, [r4]
		CMP r0, #2 ; sw 4 press
		ITTT EQ
		ldrEQ r4, ptr_to_targetscore
		movEQ r5, #9
		strEQ r5, [r4]
		CMP r0, #4	; sw 3 press
		ITTT EQ
		ldrEQ r4, ptr_to_targetscore
		movEQ r5, #11
		strEQ r5, [r4]
		CMP r0, #8	; sw2 press
		ITTT EQ
		ldrEQ r4, ptr_to_targetscore
		movEQ r5, #0
		strEQ r5, [r4]
AliceDone:
		; update the flag to prevent loops
		ldr r4, ptr_to_aliceOnce
		mov r5, #1
		str r5, [r4]
		POP {r4-r12,lr}
	BX lr       	; Return


Switch_Handler:
		PUSH {r4-r12,lr}
		MOV r4, #0x541C
		MOVT r4, #0x4002
		ldr r5, [r4]
		ORR r5, r5, #0x10
		str r5, [r4]

		; and 0x10   0 for press   1 for not pressed

		MOV r4, #0x53FC ; address from tiva input
		MOVT r4, #0x4002
		ldr r5, [r4]
		AND r5, r5, #0x10 ; checks the sw1 pin, if sw1 was pressed
		CMP r5, #0x10
		; if the button was pressed then flip the pause flag
		ITTTT NE
		ldrNE r4, ptr_to_pauseFlag
		ldrNE r0, [r4]
		EORNE r0, r0, #1
		strNE r0, [r4]
		; check if pause flag is 0, game unpaused, to delete the prompt at the bottom
		ldr r4, ptr_to_pauseFlag
		ldr r7, [r4]
		CMP r7, #0 ; make sure that the pause line is cleared if pause is gone
		BEQ clearPauseLine
		; check if game paused manually then print prompt
		CMP r7, #1
		ITTTT EQ
		ldrEQ r0, ptr_to_pausePromptLocation
		BLEQ output_string
		ldrEQ r0, ptr_to_pausePrompt
		BLEQ output_string
switchDone:
		POP {r4-r12,lr}
	BX lr       	; Return

clearPauseLine:
		ldr r0, ptr_to_black
		BL output_string
		ldr r0, ptr_to_pausePromptLocation
		BL output_string
		ldr r0, ptr_to_clearLine
		BL output_string
		B switchDone

updateTimer:
		MOV r4, #0
		ldr r0, ptr_to_timercount
		str r4, [r0]	; reset counter
		ldr r0, ptr_to_timer	; update the actual timer string to print out to board
		BL string2int
		ADD r0, r0, #1
		MOV r1, r0
		;prints the new time to the top line
		ldr r0, ptr_to_timer
		BL int2string
		ldr r0, ptr_to_black
		BL output_string
		ldr r0, ptr_to_timerlocation
		BL output_string
		ldr r0, ptr_to_timer
		BL output_string
		; set change flag to 1
		ldr r0, ptr_to_didTimerChange
		mov r4, #1
		str r4, [r0]
		B timerUpdateDone

LEDCounter:
	PUSH {r4-r12,lr}
		; r0 is passed in as a number for the time left
		CMP r0, #0
		ITT LE
		BLLE illuminate_LEDs
		BLE LEDCounterDone
		CMP r0, #3
		ITTT LE
		movLE r0, #8
		BLLE illuminate_LEDs
		BLE LEDCounterDone
		CMP r0, #6
		ITTT LE
		movLE r0, #12
		BLLE illuminate_LEDs
		BLE LEDCounterDone
		CMP r0, #9
		ITTT LE
		movLE r0, #14
		BLLE illuminate_LEDs
		BLE LEDCounterDone
		CMP r0, #12
		ITTT LE
		movLE r0, #15
		BLLE illuminate_LEDs
		BLE LEDCounterDone
LEDCounterDone:
	POP {r4-r12,lr}
	mov pc,lr

Timer_Handler:

	PUSH {r4-r12,lr}
		; clear interrupt
		MOV r4, #0x0024
		MOVT r4, #0x4003
		ldr r5, [r4]
		ORR r5, r5, #1
		str r5, [r4] ; write 1 to the TATOCINT
		; check pause flag, if 1 then skip everything
		ldr r4, ptr_to_pauseFlag
		ldr r5, [r4]
		CMP r5, #1
		BEQ hitDetectionDone
		; update the alice board led count down
		ldr r0, ptr_to_timer
		BL string2int
		ldr r4, ptr_to_powerUpTimeEnd
		ldr r4, [r4]
		SUB r0, r4, r0	; r4 has the time left
		CMP r0, #0
		IT GE
		BLGE LEDCounter
		; timer count incremented and updated
		ldr r0, ptr_to_timercount
		ldr r4, [r0]	; counts the number of frames since last timer update
		ADD r4, r4, #1
		str r4, [r0]	; stores number back
		ldr r5, ptr_to_framecount
		ldr r6, [r5]	; r6 current fps of the ball

		CMP r4, r6	; if the timercount and current fps are the same, then it increments the second
		BEQ updateTimer
		; skips over power up updates if changes were already made
		ldr r0, ptr_to_didTimerChange
		ldr r4, [r0]
		CMP r4, #0
		BEQ timerUpdateDone
		; check if power up needs to end
		ldr r0, ptr_to_timer
		BL string2int
		ldr r5, ptr_to_powerUpTimeEnd
		ldr r4, [r5]
		CMP r0, r4
		BEQ resetPaddleSizes
		; check if power up needs to respawn
		ldr r0, ptr_to_timer
		BL string2int
		ldr r5, ptr_to_powerUpRespawnTime
		ldr r4, [r5]
		CMP r0, r4
		ITT EQ
		; set random location for powerup
		BLEQ setPowerUpCord
		; draw power up ball
		BLEQ drawPowerUp
		; set change flag to 0
		ldr r0, ptr_to_didTimerChange
		mov r4, #0
		str r4, [r0]
timerUpdateDone:
		; clears the ball from its current location
		BL clearBall
		ldr r0, ptr_to_restoreposition ; sets cursor back to where the ball is
		BL output_string
		ldr r4, ptr_to_balldirection ; sets r0 as the direction number
		ldr r0, [r4]
		; checks which direction the ball should be moving

		CMP r0, #11 ; move left
		BEQ moveLeft
		CMP r0, #22 ; move right
		BEQ moveRight
		CMP r0, #1 ; move up right
		BEQ moveUpRight
		CMP r0, #14 ; move down right
		BEQ moveDownRight
		CMP r0, #2 ; move up left
		BEQ moveUpLeft
		CMP r0, #13 ; move down left
		BEQ moveDownLeft

moveBallDone:
		; check if the ball hit anything
		; paddle center left and right
		; hit top or bottom of paddle, left and right
		; top and bottom border
		; and change the direction according to the current direction of the ball
		; and if no hit, then just render based on the above cord change
		ldr r0, ptr_to_bally
		ldr r4, [r0]
		ldr r0, ptr_to_ballx
		ldr r5, [r0]
		; r4 contains y 	r5 contains x
		ldr r0, ptr_to_balldirection
		ldr r6, [r0]	;r6 contains direction ball is moving
		ldr r0, ptr_to_powerUpx
		ldr r7, [r0]
		ldr r0, ptr_to_powerUpy
		ldr r8, [r0]
		;	r7 has power x cord		r8 has power y cord
		;;;;;;;;;;;;;;;;		check power up hit		hit box bigger		;;;;;;;;;;;;;;;;;;;;;;;
		EOR r9, r5, r7	; compare x
		EOR r10, r4, r8	; compare y
		ADD r9, r9, r10
		CMP r9, #0	; if both cords are the same
		BEQ handlePowerUpHit
		ADD r7, r7, #1	; right of box
		EOR r9, r5, r7	; compare x
		EOR r10, r4, r8	; compare y
		ADD r9, r9, r10
		CMP r9, #0	; if both cords are the same
		BEQ handlePowerUpHit
		SUB r7, r7, #2	; left of box
		EOR r9, r5, r7	; compare x
		EOR r10, r4, r8	; compare y
		ADD r9, r9, r10
		CMP r9, #0	; if both cords are the same
		BEQ handlePowerUpHit
		ADD r7, r7, #1	; restore x
		ADD r8, r8, #1	; bottom of box
		EOR r9, r5, r7	; compare x
		EOR r10, r4, r8	; compare y
		ADD r9, r9, r10
		CMP r9, #0	; if both cords are the same
		BEQ handlePowerUpHit
		ADD r7, r7, #1	; bottom right box
		EOR r9, r5, r7	; compare x
		EOR r10, r4, r8	; compare y
		ADD r9, r9, r10
		CMP r9, #0	; if both cords are the same
		BEQ handlePowerUpHit
		SUB r7, r7, #2	; bottom left box
		EOR r9, r5, r7	; compare x
		EOR r10, r4, r8	; compare y
		ADD r9, r9, r10
		CMP r9, #0	; if both cords are the same
		BEQ handlePowerUpHit
		SUB r8, r8, #2	; top left of box
		EOR r9, r5, r7	; compare x
		EOR r10, r4, r8	; compare y
		ADD r9, r9, r10
		CMP r9, #0	; if both cords are the same
		BEQ handlePowerUpHit
		ADD r7, r7, #1	;top of box
		EOR r9, r5, r7	; compare x
		EOR r10, r4, r8	; compare y
		ADD r9, r9, r10
		CMP r9, #0	; if both cords are the same
		BEQ handlePowerUpHit
		ADD r7, r7, #1	;top right of box
		EOR r9, r5, r7	; compare x
		EOR r10, r4, r8	; compare y
		ADD r9, r9, r10
		CMP r9, #0	; if both cords are the same
		BEQ handlePowerUpHit
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;;;;;;;;;;;;;		check ball hit paddles 			;;;;;;;;;;;;;;;;;;;;;;;
		CMP r5, #2 ;if in the left paddle side, set to 2 so it doesn't go on top of the paddle
		BEQ handleLeftSideHits
		CMP r5, #79 ; if in the right paddle side, set to 79 so it doesn't go on top of the paddle
		BEQ handleRightSideHits
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;;;;;;;;;;;;;;;;;;;;		ball hitting borders		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		ldr r0, ptr_to_balldirection
		CMP r4, #3 ;if hit top border
		ITT EQ	; changes the direction of the ball
		EOREQ r6, r6, #0xF
		strEQ r6, [r0]
		CMP r4, #26 ;if hit bottom border
		ITT EQ	; changes the direction of the ball
		EOREQ r6, r6, #0xF
		strEQ r6, [r0]
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

hitDetectionDone:
		BL drawBall
	POP {r4-r12,lr}
	BX lr       	; Return

resetPaddleSizes: ; reset paddle sizes after the power up ends, im too lazy to check which one has the power up, so both paddle are getting reset
					; also im setting the respwan timer for the powerup
		; set change flag to 0
		ldr r0, ptr_to_didTimerChange
		mov r4, #0
		str r4, [r0]
		; set respawn timer
		MOV r4, #0x0050
		MOVT r4, #0x4003
		ldr r5, [r4]
		mov r6, #14
		UDIV r7, r5, r6
		MUL r7, r7, r6
		SUB r5, r5, r7
		ADD r5, r5, #2	; r5 contains the random number from 2 - 15
		ldr r0, ptr_to_timer
		BL string2int
		ADD r0, r0, r5	; respawn time
		ldr r4, ptr_to_powerUpRespawnTime
		str r0, [r4]		; store the respawn time
		; reset paddle sizes
		ldr r0, ptr_to_leftpaddlesize
		mov r1, #6
		str r1, [r0]
		ldr r0, ptr_to_rightpaddlesize
		str r1, [r0]
		BL clearLeftPaddle
		BL clearRightPaddle
		BL buildLeftPaddle
		BL buildRightPaddle
		B timerUpdateDone

handlePowerUpHit:
		BL clearPowerUp
		BL clearLeftPaddle
		BL clearRightPaddle
		; when power up is hit, it will double the size of the paddle based on the direction of the ball
		ldr r0, ptr_to_balldirection
		ldr r4, [r0]
		mov r5, #12
		ldr r0, ptr_to_leftpaddlesize
		CMP r4, #1
		IT EQ
		strEQ r5, [r0]
		CMP r4, #22
		IT EQ
		strEQ r5, [r0]
		CMP r4, #14
		IT EQ
		strEQ r5, [r0]
		ldr r0, ptr_to_rightpaddlesize
		CMP r4, #2
		IT EQ
		strEQ r5, [r0]
		CMP r4, #11
		IT EQ
		strEQ r5, [r0]
		CMP r4, #13
		IT EQ
		strEQ r5, [r0]
		; draw new sizes
		BL buildLeftPaddle
		BL buildRightPaddle
		; set power up end time
		ldr r0, ptr_to_timer
		BL string2int
		ADD r4, r0, #12
		ldr r0, ptr_to_powerUpTimeEnd
		str r4, [r0]
		; set the cord for the power up to some where unreachable
		ldr r0, ptr_to_powerUpx
		mov r1, #1
		str r1, [r0]
		ldr r0, ptr_to_powerUpy
		str r1, [r0]
		B hitDetectionDone

;changes the location of the ball
moveLeft:
		ldr r0, ptr_to_ballx
		ldr r1, [r0]
		SUB r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_cursorleft
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		B moveBallDone
moveRight:
		ldr r0, ptr_to_ballx
		ldr r1, [r0]
		ADD r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_cursorright
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		B moveBallDone
moveUpRight:
		ldr r0, ptr_to_ballx
		ldr r1, [r0]
		ADD r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_bally
		ldr r1, [r0]
		SUB r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_cursorright
		BL output_string
		ldr r0, ptr_to_cursorup
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		B moveBallDone
moveDownRight:
		ldr r0, ptr_to_ballx
		ldr r1, [r0]
		ADD r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_bally
		ldr r1, [r0]
		ADD r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_cursorright
		BL output_string
		ldr r0, ptr_to_cursordown
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		B moveBallDone
moveUpLeft:
		ldr r0, ptr_to_ballx
		ldr r1, [r0]
		SUB r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_bally
		ldr r1, [r0]
		SUB r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_cursorleft
		BL output_string
		ldr r0, ptr_to_cursorup
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		B moveBallDone
moveDownLeft:
		ldr r0, ptr_to_ballx
		ldr r1, [r0]
		SUB r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_bally
		ldr r1, [r0]
		ADD r1, r1, #1
		str r1, [r0]
		ldr r0, ptr_to_cursorleft
		BL output_string
		ldr r0, ptr_to_cursordown
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		B moveBallDone
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

continuePromptBranch:
	PUSH {r4-r12,lr}
		; clears the screen of any prompt text
		ldr r0, ptr_to_cleartext
		BL output_string
		ldr r0, ptr_to_clearboard
		BL output_string
		; print prompt for the continue
		ldr r0, ptr_to_black
		BL output_string
		ldr r0, ptr_to_continuePrompt
		BL output_string
		; print out the current game scores
		ldr r0, ptr_to_leftGamesWonLocation
		BL output_string
		ldr r0, ptr_to_leftGamesWon
		BL output_string
		ldr r0, ptr_to_rightGamesWonLocation
		BL output_string
		ldr r0, ptr_to_rightGamesWon
		BL output_string
	POP {r4-r12,lr}
	MOV pc, lr

;;;;;;;;;;;	when target score is reached by any player ;;;;;;;;;;;;;;;
;targetScoreReached:
;		BL continuePromptBranch
;		B hitDetectionDone
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

handleLeftSideHits:
		BL frameIncrement
		ldr r0, ptr_to_bally
		ldr r4, [r0]
		;ldr r0, ptr_to_ballx
		;BL string2int
		;MOV r5, r0
		; r4 contains y 	r5 contains x	for the ball cord
		ldr r0, ptr_to_leftpaddlelocation
		ldr r6, [r0]
		ldr r0, ptr_to_leftpaddlesize
		ldr r7, [r0]
		; r6 contains paddle location	r7 contains the size
		; if ball y cord is less than location and greater than location+size, then point is scored by right side

		MOV r9, #2
		UDIV r8, r7, r9
		ADD r8, r8, r6	; r8 has the location 14

		CMP r4, r6 ; missed the paddle from above
		BLT leftSideMiss
		ADD r9, r6, r7	; r9 contains the location after the paddle
		CMP r4, r9	; check if the ball went below the paddle
		BGE leftSideMiss
		;; after this we know that the ball has hit the left paddle
		;; check if the ball is in the top and down corners to handle that special case
		CMP r4, #3 ; top corner
		ITTTT EQ
		ldrEQ r0, ptr_to_balldirection
		MOVEQ r1, #14		;set ball direction to bottom right
		strEQ r1, [r0]
		BEQ hitDetectionDone
		CMP r4, #26 ; bottom corner
		ITTTT EQ
		ldrEQ r0, ptr_to_balldirection
		MOVEQ r1, #1		;set ball direction to top right
		strEQ r1, [r0]
		BEQ hitDetectionDone

		CMP r4, r8 ; check if it hit bottom part of the left paddle
		ITTTT GT
		ldrGT r0, ptr_to_balldirection
		MOVGT r1, #14		;set ball direction to bottom right
		strGT r1, [r0]
		BGT hitDetectionDone
		CMP r4, r8 ; it hit the bottom center of paddle
		ITTTT EQ
		ldrEQ r0, ptr_to_balldirection
		MOVEQ r1, #22		;set ball direction to the right
		strEQ r1, [r0]
		BEQ hitDetectionDone
		SUB r8, r8, #1 ;r8 updated to location of top of center
		CMP r4, r8 ; it hit the top center of paddle
		ITTTT EQ
		ldrEQ r0, ptr_to_balldirection
		MOVEQ r1, #22		;set ball direction to the right
		strEQ r1, [r0]
		BEQ hitDetectionDone
		CMP r4, r8 ; check if it hit top part of paddle
		ITTTT LT
		ldrLT r0, ptr_to_balldirection
		MOVLT r1, #1		;set ball direction to top right
		strLT r1, [r0]
		BLT hitDetectionDone

leftSideMiss:
		BL resetFPS
		; light up tiva with right side color
		ldr r4, ptr_to_rightColor
		ldr r0, [r4]
		CMP r0, #6
		IT EQ
		MOVEQ r0, #7
		BL illuminate_RGB_LED
		; update the score for the right player
		ldr r0, ptr_to_rightscore
		BL string2int
		ADD r0, r0, #1
		MOV r1, r0
		ldr r0, ptr_to_rightscore
		BL int2string
		;; update the right player score on putty
		ldr r0, ptr_to_black
		BL output_string
		ldr r0, ptr_to_rightscorelocation
		BL output_string
		ldr r0, ptr_to_rightscore
		BL output_string
		; reset ball position and sets direction to go left
		ldr r0, ptr_to_ballx
		MOV r1, #39
		str r1, [r0]
		ldr r0, ptr_to_bally
		MOV r1, #14
		str r1, [r0]
		ldr r0, ptr_to_ballStartPosition
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		ldr r0, ptr_to_balldirection
		MOV r1, #11
		str r1, [r0]
		; pause game and print pause prompt
		ldr r0, ptr_to_pauseFlag
		MOV r1, #1
		str r1, [r0]
		ldr r0, ptr_to_pausePromptLocation
		BL output_string
		ldr r0, ptr_to_pausePrompt
		BL output_string
		; check if target score is reached
		ldr r0, ptr_to_rightscore
		BL string2int
		ldr r4, ptr_to_targetscore
		ldr r5, [r4]
		CMP r0, r5
		BEQ rightWonGame
		B hitDetectionDone

aliceDance:
	PUSH {r4-r12,lr}
		mov r6, #0x6A00
		movt r6, #0x0010
		mov r4, #0
flash:
		mov r0, #15
		BL illuminate_LEDs
		mov r5, #0
stay:
		ADD r5, r5, #1
		CMP r5, r6
		BNE stay
		mov r0, #0
		BL illuminate_LEDs
		mov r8, #0
stay2:
		ADD r8, r8, #1
		CMP r8, r6
		BNE stay2
		ADD r4, r4, #1
		CMP r4, #4
		BNE flash


	POP {r4-r12,lr}
	mov pc,lr

rightWonGame:
		ldr r0, ptr_to_rightGamesWon
		BL string2int
		ADD r1, r0, #1
		ldr r0, ptr_to_rightGamesWon
		BL int2string
		BL continuePromptBranch
		BL aliceDance
		B hitDetectionDone

handleRightSideHits:
		BL frameIncrement
		ldr r0, ptr_to_bally
		ldr r4, [r0]
		;ldr r0, ptr_to_ballx
		;BL string2int
		;MOV r5, r0
		; r4 contains y 	r5 contains x	for the ball cord
		ldr r0, ptr_to_rightpaddlelocation
		ldr r6, [r0]
		ldr r0, ptr_to_rightpaddlesize
		ldr r7, [r0]
		; r6 contains paddle location	r7 contains the size
		; if ball y cord is less than location and greater than location+size, then point is scored by left side
		;
		MOV r9, #2
		UDIV r8, r7, r9
		ADD r8, r8, r6	; r8 has the location 14

		CMP r4, r6 ; missed the paddle from above
		BLT rightSideMiss
		ADD r9, r6, r7	; r9 contains the location after the paddle
		CMP r4, r9	; check if the ball went below the paddle
		BGE rightSideMiss
		;; check the corner special cases;;;;;;;
		CMP r4, #3 ; top corner
		ITTTT EQ
		ldrEQ r0, ptr_to_balldirection
		MOVEQ r1, #13		;set ball direction to bottom left
		strEQ r1, [r0]
		BEQ hitDetectionDone
		CMP r4, #26 ; bottom corner
		ITTTT EQ
		ldrEQ r0, ptr_to_balldirection
		MOVEQ r1, #2		;set ball direction to top left
		strEQ r1, [r0]
		BEQ hitDetectionDone
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		CMP r4, r8 ; check if it hit bottom part of the right paddle
		ITTTT GT
		ldrGT r0, ptr_to_balldirection
		MOVGT r1, #13	;set ball direction to bottom right
		strGT r1, [r0]
		BGT hitDetectionDone
		CMP r4, r8 ; it hit the bottom center of paddle
		ITTTT EQ
		ldrEQ r0, ptr_to_balldirection
		MOVEQ r1, #11		;set ball direction to the left
		strEQ r1, [r0]
		BEQ hitDetectionDone
		SUB r8, r8, #1 ;r8 updated to location of top of center
		CMP r4, r8 ; it hit the top center of paddle
		ITTTT EQ
		ldrEQ r0, ptr_to_balldirection
		MOVEQ r1, #11		;set ball direction to the left
		strEQ r1, [r0]
		BEQ hitDetectionDone
		CMP r4, r8 ; check if it hit top part of paddle
		ITTTT LT
		ldrLT r0, ptr_to_balldirection
		MOVLT r1, #2		;set ball direction to top right
		strLT r1, [r0]
		BLT hitDetectionDone
rightSideMiss:
		BL resetFPS
		; light up tiva with left side color
		ldr r4, ptr_to_leftColor
		ldr r0, [r4]
		CMP r0, #6
		IT EQ
		MOVEQ r0, #7
		BL illuminate_RGB_LED
		; update the score for the left player
		ldr r0, ptr_to_leftscore
		BL string2int
		ADD r0, r0, #1
		MOV r1, r0
		ldr r0, ptr_to_leftscore
		BL int2string
		;; update the left player score on putty
		ldr r0, ptr_to_black
		BL output_string
		ldr r0, ptr_to_leftscorelocation
		BL output_string
		ldr r0, ptr_to_leftscore
		BL output_string
		; reset ball position and sets direction to go right
		ldr r0, ptr_to_ballx
		MOV r1, #39
		str r1, [r0]
		ldr r0, ptr_to_bally
		MOV r1, #14
		str r1, [r0]
		ldr r0, ptr_to_ballStartPosition
		BL output_string
		ldr r0, ptr_to_saveposition
		BL output_string
		ldr r0, ptr_to_balldirection
		MOV r1, #22
		str r1, [r0]
		; pause game and print pause prompt
		ldr r0, ptr_to_pauseFlag
		MOV r1, #1
		str r1, [r0]
		ldr r0, ptr_to_pausePromptLocation
		BL output_string
		ldr r0, ptr_to_pausePrompt
		BL output_string
		; check if target score is reached
		ldr r0, ptr_to_leftscore
		BL string2int
		ldr r4, ptr_to_targetscore
		ldr r5, [r4]
		CMP r0, r5
		BEQ leftWonGame
		B hitDetectionDone

leftWonGame:
		ldr r0, ptr_to_leftGamesWon
		BL string2int
		ADD r1, r0, #1
		ldr r0, ptr_to_leftGamesWon
		BL int2string
		BL continuePromptBranch
		BL aliceDance
		B hitDetectionDone

frameIncrement:
		PUSH {r4-r12,lr}
		; update frame count
		ldr r0, ptr_to_framecount
		ldr r4, [r0]
		CMP r4, #60
		ITT NE
		ADDNE r4, r4, #5
		strNE r4, [r0]
		; update the fps based on the framecount number
		MOV r6, #0x0028
		MOVT r6, #0x4003
		MOV r5, #0x2400
		MOVT r5, #0x00F4
		UDIV r5, r5, r4
		str r5, [r6]
		POP {r4-r12,lr}
		mov pc, lr

drawBall:
		PUSH {r4-r12,lr}
		ldr r0, ptr_to_pauseFlag
		ldr r4, [r0]
		CMP r4, #1
		BEQ drawballskipborder
		ldr r0, ptr_to_bally
		ldr r4, [r0]
		ldr r0, ptr_to_ballx
		ldr r5, [r0]
		; r4 contains y 	r5 contains x

		; move to ball position
		ldr r0, ptr_to_restoreposition
		BL output_string

		; set color of ball
		ldr r4, ptr_to_ballColor
		ldr r0, [r4]
		BL setColor

		ldr r0, ptr_to_paddleblock
		BL output_string
drawballskipborder:
		;ldr r0, ptr_to_topleftcorner
		;BL output_string ; moving cursor out of the way, so the ball is alone
		POP {r4-r12,lr}
		mov pc, lr

clearBall:
		PUSH {r4-r12,lr}
		; move to current ball position
		ldr r0, ptr_to_restoreposition
		BL output_string
		ldr r0, ptr_to_black ; use black to remove ball
		BL output_string
		ldr r0, ptr_to_paddleblock
		BL output_string
		POP {r4-r12,lr}
		mov pc, lr

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; jerry initialized the timer from slides
timer_init:
		MOV r4, #0xE604
		MOVT r4, #0x400F
		ldr r5, [r4]
		ORR r5, r5, #1 ; connect clock to timer
		str r5, [r4]
		; TAEN
		MOV r4, #0x000C
		MOVT r4, #0x4003
		ldr r5, [r4]
		BIC r5, r5, #0x1  ; write 0 to TAEN
		str r5, [r4]
		; 32 bit mode
		MOV r4, #0x0000
		MOVT r4, #0x4003
		ldr r5, [r4]
		BIC r5, r5, #7 ; clears bits 0 1 and 2
		str r5, [r4]
		; periodic mode
		MOV r4, #0x0004
		MOVT r4, #0x4003
		ldr r5, [r4]
		BIC r5, r5, #3 ; clears bits 0 and 1
		ORR r5, r5, #2 ; puts 2 there
		str r5, [r4]
		; interval setup
		MOV r4, #0x0028
		MOVT r4, #0x4003
		MOV r5, #0x2355
		MOVT r5, #0x0008
		str r5, [r4] ; 30 fps
		; TATOIM
		MOV r4, #0x0018
		MOVT r4, #0x4003
		ldr r5, [r4]
		ORR r5, r5, #1
		str r5, [r4] ; write 1 to TATOIM
		; EN0
		MOV r4, #0xE100
		MOVT r4, #0xE000
		MOV r6, #1
		LSL r6, r6, #19
		ldr r5, [r4]
		ORR r5, r5, r6 ; set bit 19 to 1
		str r5, [r4]
		; GPTMCTL
		MOV r4, #0x000C
		MOVT r4, #0x4003
		ldr r5, [r4]
		ORR r5, r5, #1
		str r5, [r4]
	MOV pc, lr



; from lab5
uart_interrupt_init:
	; Your code to initialize the UART0 interrupt goes here
	PUSH {r4-r12,lr}
		MOV r4, #0xC038
		MOVT r4, #0x4000
		ldr r5, [r4]
		ORR r5, r5, #0x10 ; bit 5 set to 1
		str r5, [r4]
		; EN0
		MOV r4, #0xE100
		MOVT r4, #0xE000
		ldr r5, [r4]
		ORR r5, r5, #0x20
		str r5, [r4]
	POP {r4-r12,lr}
	MOV pc, lr

; from lab5
gpio_interrupt_init:

	; Your code to initialize the SW1 interrupt goes here
	; Don't forget to follow the procedure you followed in Lab #4
	; to initialize SW1.


;basically just copied what was on the slides for this routine
		MOV r4, #0x5404
		MOVT r4, #0x4002
		ldr r5, [r4]
		BIC r5, r5, #0x10
		str r5, [r4]

		MOV r4, #0x5408
		MOVT r4, #0x4002
		ldr r5, [r4]
		BIC r5, r5, #0x10
		str r5, [r4]

		MOV r4, #0x540C
		MOVT r4, #0x4002
		ldr r5, [r4]
		BIC r5, r5, #0x10
		str r5, [r4]

		MOV r4, #0x5410
		MOVT r4, #0x4002
		ldr r5, [r4]
		ORR r5, r5, #0x10
		str r5, [r4]

		MOV r4, #0xE100
		MOVT r4, #0xE000
		ldr r5, [r4]
		MOV r6, #0x4000
		LSL r6, r6, #16
		ORR r5, r5, r6
		str r5, [r4]

	MOV pc, lr


alice_init:
    PUSH {r4-r12,lr}

    ; Your code to initialize the SW1 interrupt goes here
    ; Don't forget to follow the procedure you followed in Lab #4
    ; to initialize SW1.

    ; Enables LEVEL sensitive
    MOV r0, #0x7404        ; Load address
    MOVT r0, #0x4000
    LDR r1, [r0]        ; Load value at r0 address into r1
    ;BFC r1, #4, #1        ; Clear bit 4
    ORR r1, r1, #0xF        ; SETS PINS TO ENABLE LEVELING
    STR r1, [r0]        ; Store value back into r0


    ; Sets LEVELING HIGH
    MOV r0, #0x740C        ; Load address
    MOVT r0, #0x4000
    LDR r1, [r0]        ; Load value at r0 address into r1
    ;BFC r1, #4, #1        ; Clear bit 4
    ORR r1, r1, #0xF
    STR r1, [r0]        ; Store value back into r0

    ; Enables interrupt
    MOV r0, #0x7410        ; Load address
    MOVT r0, #0x4000
    LDR r1, [r0]        ; Load value at r0 address into r1
    ORR r1, r1, #0xF    ; ENABLES ALL BTNS FOR INTERRUPT
    STR r1, [r0]        ; Store value back into r0

    ; Set bit 3 in Enable Register
    MOV r0, #0xE100        ; Load address
    MOVT r0, #0xE000
    LDR r1, [r0]        ; Load value at r0 address into r1
    ORR r1, r1, #0x8    ; Set bit 3
    STR r1, [r0]        ; Store value back into r0

    POP {r4-r12,lr}
    MOV pc, lr

simple_read_character:

	MOV pc, lr	; Return

	.end
