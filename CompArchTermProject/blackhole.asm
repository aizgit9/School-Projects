.include "SysCalls.asm"

.eqv SCREEN_WIDTH_BYTES 256
.eqv SCREEN_HEIGHT 64
.eqv SCREEN_WIDTH 64
.eqv BACKGROUND_COLOR 0x00E6E6E6
.eqv P1_COLOR 0x00F54927
.eqv P2_COLOR 0x005567ED

.data

.text
	# Allocate memory for screen on the heap
	
	li $t0, SCREEN_WIDTH_BYTES
	li $t1, SCREEN_HEIGHT
	mul $a0, $t0, $t1 # 256 * 64
	li $v0, SysAlloc
	syscall # Allocate 256 * 64 Bytes on the heap
	
	move $s0, $v0 # HEAP BASE POINTER - DO NOT CHANGE
	
	move $a0, $s0
	li $a1, BACKGROUND_COLOR
	jal ClearScreen
	
	move $a0, $s0
	jal DrawBoard
	
	
	


li $v0, SysExit
syscall

# Need special procedures to draw every number 0-9

.include "drawfuncs.asm"
	
	
	
