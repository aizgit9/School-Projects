# CS 2340 Assignment 5
# Author: Asher Isgitt
# Date: 3/24/2026
# blackhole.asm: must have drawfuncs.asm in the directory
# main testing program: simply swap out the pairs of arrays in the drawBoard arguments
# to see each display as the game progresses
# Bitmap display must be set to some 64x64 resolution (I use unit size 4 and 256x256px)
# Bitmap base address should be 0x10040000 (heap)

.include "SysCalls.asm"

.eqv SCREEN_WIDTH_BYTES 256 # Screen width in bytes for utility in draw functions
.eqv SCREEN_HEIGHT 64 # Screen width in pixels
.eqv SCREEN_WIDTH 64 # Screen height in pixels
.eqv BACKGROUND_COLOR 0x00E6E6E6 # Background color
.eqv SQUARE_COLOR 0x4D4646 # Square color
.eqv P1_COLOR 0x00F54927 # Player 1 number color
.eqv P2_COLOR 0x005567ED # Player 2 number color

# Num arrays:
# -1 means none or black hole, numbers are as is
# Team arrays:
# -1 means none or black hole, 1 is player 1 and 2 is player 2
.data
num_array_start: 	.word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1 # Numbers on the board
team_array_start: 	.word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1 # Player labels on the board

num_array_mid:		.word 1,2,3,4,5,-1,-1,-1,-1,-1,-1,1,2,3,4,5,-1,-1,-1,-1,-1 # Numbers on the board
team_array_mid:		.word 1,2,1,2,1,-1,-1,-1,-1,-1,-1,1,2,1,2,1,-1,-1,-1,-1,-1 # Player labels on the board

num_array_end:		.word 1,2,3,4,5,6,7,8,9,10,-1,1,2,3,4,5,6,7,8,9,10 # Numbers on the board
team_array_end:		.word 1,2,1,2,1,2,1,2,1, 2,-1,1,2,1,2,1,2,1,2,1, 2 # Player labels on the board

.text
	# Allocate memory for screen on the heap
	li $t0, SCREEN_WIDTH_BYTES # Load SCREEN_WIDTH_BYTES into $t0
	li $t1, SCREEN_HEIGHT # Load SCREEN_HEIGHT into $t1
	mul $a0, $t0, $t1 # 256 * 64 into $a0
	li $v0, SysAlloc # Load memory allocation code
	syscall # Allocate 256 * 64 Bytes on the heap
	
	move $s0, $v0 # HEAP BASE POINTER - PRESERVE
	
	move $a0, $s0 # Load top left corner into $a0
	li $a1, BACKGROUND_COLOR # Load background color into $a1
	jal ClearScreen # Clear the bitmap display
	
	move $a0, $s0 # Load top left corner into $a0
	la $a1, team_array_end # Load the preferred team array *change to see different displays
	la $a2, num_array_end # Load the preferred num array *change to see different displays
	jal DrawBoard # Draw the game board onto the bitmap display
	
li $v0, SysExit # Load exit code
syscall # Exit program

.include "drawfuncs.asm" # Include drawing utility functions
	
	
	
