# CS 2340 Term Project
# Author: Asher Isgitt
# Date: 4/3/2026
# findwinner.asm: contains function that determines who won with a given game board

.data

# -1 marks the end of each row
r0:	.word 1,2, -1
r1:	.word 0,2,3,4, -1
r2:	.word 0,1,4,5, -1
r3:	.word 1,4,6,7, -1
r4:	.word 1,2,3,5,7,8, -1
r5:	.word 2,4,8,9, -1
r6:	.word 3,7,10,11, -1
r7:	.word 3,6,4,8,11,12, -1
r8:	.word 4,5,7,9,12,13 -1
r9:	.word 5,8,13,14, -1
r10:	.word 6,11,15,16, -1
r11:	.word 6,7,10,12,16,17, -1
r12:	.word 7,8,11,13,17,18, -1
r13:	.word 8,9,12,14,18,19, -1
r14:	.word 9,13,19,20, -1
r15:	.word 10,16,-1
r16:	.word 10,11,15,17, -1
r17:	.word 11,12,16,18, -1
r18:	.word 12,13,17,19, -1
r19:	.word 13,14,18,20, -1
r20:	.word 14,19, -1

# Array of pointers to each row of adjacent indices
# Input an index to the lookup table to get the adjacent indices to that index
lookup_table:	.word r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20

# Message strings used for output
score_msg:	.asciiz "Score: "
colon:		.asciiz ":"

.text
# Pass in address of num_array in $a0
# Pass in address of team_array in $a1
Find_Winner:
	addi $sp, $sp, -12 # Acquire storage
  	sw $s0, 0($sp) # save $s0 on stack
  	sw $s1, 4($sp) # save $s1 on stack
  	sw $s2, 8($sp) # save #s2 on stack
  	sw $s3, 12($sp) # save #s3 on stack
  	
  	la $s3, lookup_table
	# First step: find the black hole index
	# Loop assumes passed array contains a black hole, will cause undefined behavior otherwise
	li $t0, 0 # Loop counter i
	li $t1, -1 # -1 Represents black hole
	
	loop_1: # Begin Loop 1 
		
		sll $t2, $t0, 2 # Calculate array offset i * 4
		
		add $t3, $a0, $t2 # $t3 holds the current array index
		
		lw $t4, 0($t3) # $t4 holds the value at num_array[i]
		
		beq $t4, $t1, end_loop_1 # If num_array[i] == -1, go to the end
		addi $t0, $t0, 1 # i++
		j loop_1
	end_loop_1: # End Loop 1
	
	# $t2 now holds the black hole offset
	add $t5, $s3, $t2 #s0 now holds the address of the black hole index
	lw $s0, 0($t5) # Load the row address into $s0 (Lookup table row)
	
	
	li $s1, 0	# Player 2 total
	li $s2, 0	# Player 1 total
	
	# Iterate through the lookup table row and stop when the value == -1
	
	li $t0, 0 # Loop counter i
	li $t1, -1 # -1 Represents end of line
	loop_2:
		sll $t2, $t0, 2	# Calculate array offset i * 4
		
		add $t3, $s0, $t2 # $t3 holds the current row array address
		lw $t4, 0($t3) # $t4 holds the value at row[i]
		beq $t4, $t1, end_loop_2 # If row[i] == -1, go to the end
		# This value will be used as an array index for num array and team array
		
		sll $t2, $t4, 2	# Calculate array offset row[i] * 4
		
		# Check if team_array[i] == 1 or team_array[i] == 0
		# Increment the correct counter
		add $t3, $a1, $t2 # Add the offset to base address of team_array
		
		lw $t6, 0($t3) # Load the team label value 
		
		li $t5, 1 # Load 1 to use for comparison
		beq $t6, $t5, case_0 # Check if $t6 == 1
		j end_case_0 # Skip the case 0
		case_0: # Begin case 0
			add $t3, $a0, $t2 # Add the offset to base address of num_array
			lw $t7, 0($t3) # Load the value at $t3 into $t7
			add $s2, $s2, $t7 # Increment red total
			j end_cases
		end_case_0: # End case 0
		
		li $t5, 2 # Load 1 to use for comparison
		beq $t6, $t5, case_1 # Check if $t6 == 2
		j end_cases # Skip to the end of the cases
		case_1: # Begin case 1
			add $t3, $a0, $t2 # Add the offset to base address of num_array
			lw $t7, 0($t3) # Load the value at $t3 into $t7
			add $s1, $s1, $t7 # Increment black total
		end_cases: # End case 1

		addi $t0, $t0, 1 # i++
		j loop_2 # Repeat the loop
	end_loop_2: # End Loop 2
	
	# Print the scores
	li $v0, SysPrintString # Load print string code
	la $a0, score_msg # Load the score_msg into $a0
	syscall	# Print the score_msg
	
	li $v0, SysPrintInt # Load print int code
	move $a0, $s2 # Load $s2 into $a0
	syscall # Print
	
	li $v0, SysPrintString # Load print string code
	la $a0, colon # Load the colon into $a0
	syscall	# Print the colon
	
	li $v0, SysPrintInt # Load print int code
	move $a0, $s1 # Load $s1 into $a0
	syscall # Print
	
	li $v0, SysPrintString # Load print string code
	la $a0, newline # Load the newline into $a0
	syscall # Print

	
	slt $t0, $s2, $s1 # If Player 1 < Player 2
	li $t1, 1 # Load 1 to use for comparison
	
	beq $t0, $t1, player_1_win # go to player 1 win block if above condition is true
	j end_1_win # skip to end of player 1 win condition
	player_1_win: # Begin player 1 win
		li $v0, 1 # Load 1 into return value
		j end_proc # Jump to the end of the procedure
	end_1_win: # End player 1 win
	
	slt $t0, $s1, $s2 # If If Player 2 < Player 1
	
	beq $t0, $t1, player_2_win # go to player 2 win block if above condition is true
	j end_2_win # skip to end of player 2 win condition
	
	player_2_win: # Begin player 2 win
		li $v0, 2 # Load 2 into return value
		j end_proc # Jump to the end of the procedure
	end_2_win: # End player 2 win
	
	li $v0, 0 # Load 0 into return value if there was a tie
	
	end_proc: # End procedure label
	
	lw   $s3, 12($sp) # Restore $s3
	lw   $s2, 8($sp) # Restore $s2
	lw   $s1, 4($sp) # Restore $s1
	lw   $s0, 0($sp) # Restore $s0
	addi $sp, $sp, 12 # Restore the stack pointer to original position
	
	jr $ra # Return







