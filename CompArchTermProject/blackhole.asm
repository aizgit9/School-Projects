# CS 2340 Term Project
# Author: Asher Isgitt
# Date: 4/3/2026
# blackhole.asm: must have drawfuncs.asm, syscalls.asm, findwinner.asm in the directory
# to see each display as the game progresses
# Bitmap display must be set to some 64x64 resolution (I use unit size 4 and 256x256px)
# Bitmap base address should be 0x10040000 (heap)

.include "SysCalls.asm"

.eqv SCREEN_WIDTH_BYTES 256 		# Screen width in bytes for utility in draw functions
.eqv SCREEN_HEIGHT 64 				# Screen width in pixels
.eqv SCREEN_WIDTH 64 				# Screen height in pixels
.eqv BACKGROUND_COLOR 0x00E6E6E6 	# Background color
.eqv SQUARE_COLOR 0x4D4646 			# Square color
.eqv P1_COLOR 0x00F54927 			# Player 1 number color
.eqv P2_COLOR 0x005567ED 			# Player 2 number color

.data
	newline: 			.asciiz "\n"
	v_input_msg: 		.asciiz	"[Enter an Integer] Vertical offset from top: "
	h_input_msg: 		.asciiz	"[Enter an Integer] Horizontal offset from left: "
	computer_msg: 		.asciiz "Computer moved at index: "
	out_of_bounds_msg: 	.asciiz	"Out of bounds, try again."
	taken_msg: 			.asciiz	"That spot is taken, try again."
	lose_msg:			.asciiz	"Sorry, you lost."
	win_msg:			.asciiz "Congratulations, you won!"
	num_array: 	.word 	-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	# Holds numbers
	team_array: .word 	-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1	# Holds team indicators

.text
	li $v0, SysTime				# Load SysTime code into $v0
	syscall 					# Retrieve system time
	move $a1, $a0				# Move $a1 (time) into $a0
	li $a0, 0					# Load 0 into $a0 for generator ID
	li $v0, SysSetSeed			# Load SysSetSeed code into $v0
	syscall 					# Seed random number generator
	li $t0, SCREEN_WIDTH_BYTES 	# Load SCREEN_WIDTH_BYTES into $t0
	li $t1, SCREEN_HEIGHT 		# Load SCREEN_HEIGHT into $t1
	mul $a0, $t0, $t1 			# 256 * 64 into $a0
	li $v0, SysAlloc 			# Load SysAlloc code into $v0
	syscall 					# Allocate 256 * 64 bytes on the heap for bitmap display
	move $s0, $v0 				# HEAP BASE POINTER - PRESERVE
	la $s1, team_array 			# Load the preferred team array
	la $s2, num_array 			# Load the preferred num array
	move $a0, $s0 				# Load top left corner into $a0
	jal ClearScreen 			# Clear the bitmap display
	move $a0, $s0 				# Load top left corner into $a0
	move $a1, $s1 				# Load $s1 (team array) into $a1
	move $a2, $s2 				# Load $s2 (num array) into $a2
	jal DrawBoard 				# Draw the game board onto the bitmap display
	li $s3, 0 					# Player move counter
	li $s4, 0 					# Computer move counter
	li $s5, 10 					# Max move count
InteractionLoop:				# Main interaction loop
Get_V_Input:					# Get vertical offset from user
	la $a0, v_input_msg			# Load v_input_msg into $v0
	li $v0, SysPrintString		# Load SysPrintString code into $v0
	syscall						# Print
	li $v0, SysReadInt			# Load SysReadCode into $v0
	syscall						# Read
	move $t1, $v0 				# Store user input in $t1
	blt $t1, $zero, V_OutOfBounds	# If $t1 < 0, jump to V_OutOfBounds
	li $t2, 5						# Load 5 into $t2 for comparison
	bgt $t1, $t2, V_OutOfBounds		# If $t1 > $t2, jump to V_OutOfBounds
	j V_Valid						# Jump to V_Valid
V_OutOfBounds:					# Vertical offset is out of bounds
	la $a0, out_of_bounds_msg	# Load out_of_bounds_msg into $a0
	li $v0, SysPrintString		# Load SysPrintString code into $v0
	syscall 					# Print
	la $a0, newline				# Load newline into $a0
	li $v0, SysPrintString		# Load SysPrintString code into $v0
	syscall 					# Print
	j Get_V_Input				# Jump to Get_V_Input
V_Valid:						# Vertical offset was valid
	mul $t3, $t1, $t1 		# $t3 = $t1 * $t1
	add $t3, $t3, $t1 		# $t3 = $t3 + $t1
	li $t4, 2 				# Load 2 into $t4 for division
	div $t3, $t3, $t4 		# $t3 = $t3 / $t4, $t3 holds row starting index
Get_H_Input:				# Get horizontal offset from user
	la $a0, h_input_msg		# Load h_input_msg into $a0
	li $v0, SysPrintString	# Load SysPrintString code into $v0
	syscall					# Print
	li $v0, SysReadInt		# Load SysReadInt code into $v0
	syscall					# Read Int
	move $t2, $v0 			# $t2 holds horizontal offset
	blt $t2, $zero, H_OutOfBounds	# If $t2 < 0, jump to H_OutOfBounds
	add $s6, $t3, $t2 				# $s6 = $t3 + $t2
	addi $t0, $t1, 1 				# $t0 = $t1 + 1
	mul $t6, $t0, $t0 				# $t6 = $t0 * $t0
	add $t6, $t6, $t0 				# $t6 = $t6 * $t0
	li $t7, 2 						# Load 2 into $t7 for division
	div $t6, $t6, $t7 				# $t6 = $t6 / $t7, $t6 holds row starting index
	bge $s6, $t6, H_OutOfBounds		# If $s6 >= $t6, jump to H_OutOfBounds
	j H_Valid						# Jump to H_Valid
H_OutOfBounds:						# Horizontal offset is out of bounds
	la $a0, out_of_bounds_msg		# Load out_of_bounds_msg into $a0
	li $v0, SysPrintString			# Load SysPrintString code into $v0
	syscall 						# Print
	la $a0, newline					# Load newline into $a0
	li $v0, SysPrintString			# Load SysPrintString code into $v0
	syscall 						# Print
	j Get_H_Input					# Jump to Get_H_Input
H_Valid:							# Horizontal offset was valid
	sll $t4, $s6, 2 				# $t4 = $s6 << 2
	add $t6, $s1, $t4 				# $t6 = $s1 + $t4
	li $t7, -1				# Load -1 into $t7 for comparison
	lw $t5, 0($t6)			# Load word at $t6 into $t5
	bne $t5, $t7, Taken 	# If $t5 != -1, jump to Taken
	j Not_Taken				# Jump to Not_Taken
Taken:						# Space was taken
	la $a0, taken_msg		# Load taken_msg into $a0
	li $v0, SysPrintString	# Load SysPrintString code into $v0
	syscall 				# Print
	la $a0, newline			# Load newline into $a0
	li $v0, SysPrintString	# Load SysPrintString code into $v0
	syscall 				# Print
	j Get_V_Input			# Jump to Get_V_Input
Not_Taken:					# Space was not taken
	li $t1, 1			# Load 1 into $t1
	sw $t1, 0($t6) 		# Write $t1 into $t6
	add $t5, $s2, $t4 	# $t5 = $s2 + $t4
	addi $t2, $s3, 1	# $t2 = $s3 + 1
	sw $t2, 0($t5) 		# Write $t2 into $t5
	move $a0, $s0 		# Move $s0 into $a0
	move $a1, $s1 		# Move $s1 into $a1
	move $a2, $s2 		# Move $s2 into $a2
	jal DrawBoard 		# Draw the game board onto the bitmap display
	addi $s3, $s3, 1 	# $s3 = $s3 + 1
	move $a0, $s6 		# Move $s6 into $a0
	jal PlayerSound		# Call PlayerSound
Generate_Index:			# Choose random index to place number
	li $v0, SysRandIntRange			# Load SysRandIntRange code into $v0
	li $a0, 0 						# Load 0 into $a0 for generator ID
	li $a1, 21 						# Load 21 into $a1 for upper bound
	syscall							# Generate random number
	move $s6, $a0 					# Save $a0 into $s6
	sll $t4, $s6, 2 				# $t4 = $s6 << 2
	add $t5, $s2, $t4 				# $t5 = $s2 + $t4
	lw $t6, 0($t5) 					# Load word at $t5 into $t6
	li $t7, -1						# Load -1 into $t7 for comparison
	bne $t6, $t7, Generate_Index 	# If $t6 != $t7, jump to Generate_Index
	la $a0, computer_msg			# Load computer_msg into $a0
	li $v0, SysPrintString			# Load SysPrintString into $v0
	syscall							# Print
	move $a0, $s6					# Move $s6 into $a0
	li $v0, SysPrintInt				# Load SysPrintInt code into $a0
	syscall							# Print
	la $a0, newline					# Load newline into $a0
	li $v0, SysPrintString			# Load SysPrintString into $v0
	syscall							# Print
	addi $t2, $s4, 1				# $t2 = $s4 + 1
	sw $t2, 0($t5) 					# Write $t2 into $t5
	add $t6, $s1, $t4 				# $t6 = $s1 + $t4
	li $t1, 2				# Load 2 into $t1
	sw $t1, 0($t6) 			# Write $t1 into $t6
	move $a0, $s0 			# Load $s0 into $a0
	move $a1, $s1 			# Load $s1 into $a1
	move $a2, $s2 			# Load $s2 into $a2
	jal DrawBoard 			# Draw the game board onto the bitmap display
	addi $s4, $s4, 1 		# $s4 = $s4 + 1
	move $a0, $s6 			# Move $s6 into $a0
	jal ComputerSound		# Call ComputerSound
	beq $s3, $s5, End_InteractionLoop	# If $s3 = $s5, jump to End_InteractionLoop
	j InteractionLoop					# Jump to InteractionLoop
End_InteractionLoop:					# End of main interaction loop
	move $a0, $s2			# Load $s2 into $a0
	move $a1, $s1			# Load $s1 into $a1
	jal Find_Winner			# Call Find_Winner
	move $t0, $v0			# Move $v0 into $t0
	li $t1, 1				# Load 1 into $t1
	beq $t0, $t1, Win 		# If $t0 = $t1, jump to Win
Lose:						# Player lost
	la $a0, lose_msg			# Load lose_msg into $a0
	li $v0, SysPrintString		# Load SysPrintString into $v0
	syscall						# Print
	jal LoseSound				# Call LoseSound
	j End_Win					# Jump to End_Win
Win: 							# Player won
	la $a0, win_msg				# Load win_msg into $a0
	li $v0, SysPrintString		# Load SysPrintString into $v0
	syscall						# Print
	jal WinSound 				# Call WinSound
End_Win:						# End of win block
li $v0, SysExit 				# Load SysExit code
syscall 						# Exit
PlayerSound: 					# $a0 holds the index played in, play player move sound
	li $v0, SysMidiOutSync		# Load SysMidiOutSync code into $v0
	addi $a0, $a0, 60			# $a0 = $a0 + 60
    li $a1, 1500				# Duration
    li $a2, 11					# Instrument
    li $a3, 100					# Volume
    syscall						# Play midi sound
    jr $ra						# Return
ComputerSound: 					# $a0 holds the index played in, play computer move sound
	li $v0, SysMidiOutSync		# Load SysMidiOutSync code into $v0
    addi $a0, $a0, 60			# $a0 = $a0 + 60
    li $a1, 1500				# Duration
    li $a2, 11					# Instrument
    li $a3, 100					# Volume
    syscall						# Play midi sound 
    jr $ra						# Return
WinSound:						# Play win sound
	li $v0, SysMidiOutSync		# Load SysMidiOutSync code into $v0
    li $a0, 80					# Load 80 into $a0
    li $a1, 1000				# Duration
    li $a2, 11					# Instrument
    li $a3, 100					# Volume
    syscall						# Play midi sound	
    li $v0, SysMidiOutSync		# Load SysMidiOutSync code into $v0
    li $a0, 82					# Load 82 into $a0
    li $a1, 1000				# Duration
    li $a2, 11					# Instrument
    li $a3, 100					# Volume
    syscall						# Play midi sound
    li $v0, SysMidiOutSync		# Load SysMidiOutSync code into $v0
    li $a0, 84					# Load 84 into $a0
    li $a1, 1500				# Duration
    li $a2, 11					# Instrument
    li $a3, 100					# Volume
    syscall						# Play midi sound
    jr $ra						# Return
LoseSound:						# Play lose sound
	li $v0, SysMidiOutSync		# Load SysMidiOutSync code into $v0
    li $a0, 80					# Load 80 into $a0
    li $a1, 1000				# Duration
    li $a2, 11					# Instrument
    li $a3, 100					# Volume
    syscall						# Play midi sound
    li $v0, SysMidiOutSync		# Load SysMidiOutSync code into $v0
    li $a0, 79					# Load 79 into $a0
    li $a1, 1000				# Duration
    li $a2, 11					# Instrument
    li $a3, 100					# Volume
    syscall						# Play midi sound
    li $v0, SysMidiOutSync		# Load SysMidiOutSync code into $v0
    li $a0, 78					# Load 78 into $a0
    li $a1, 1500				# Duration
    li $a2, 11					# Instrument
    li $a3, 100					# Volume
    syscall						# Play midi sound
    jr $ra						# Return

.include "drawfuncs.asm" # Include drawing utility functions
	
.include "findwinner.asm" # Include find winner function
	
