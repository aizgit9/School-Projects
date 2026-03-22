.text

DrawZero: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 8 # Move to right, skipping 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 8 # Move to right, skipping 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 4
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 8 # Move to right, skipping 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	jr $ra

DrawOne:
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 4
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 4 # Move pointer back to line beginning
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	jr $ra

DrawTwo:
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 4
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	jr $ra
	
DrawThree:
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 4
	addi $t1, $t1, 8
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	add $t1, $t1, $t3 # Move to next line
	subi $t1, $t1, 8
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	jr $ra
	
DrawFour:
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 8 # Move right 2 pixels
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 8 # Move right 2 pixels
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 4
	addi $t1, $t1, 8
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	jr $ra
	
DrawFive:
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 4
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	subi $t1, $t1, 8 # Move pointer back to line beginning

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	jr $ra
	
DrawSix:
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 4
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 8 # Move right 2 pixels
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	jr $ra
	
DrawSeven:
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	add $t1, $t1, $t3 # Move to next line

	# ROW 4
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	add $t1, $t1, $t3 # Move to next line	
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel

	
	jr $ra

DrawEight:
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 8 # Move right 2 pixels
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 4
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 8 # Move right 2 pixels
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	jr $ra
	
DrawNine:
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	
	# ROW 1
	li $t1, 0 # Offset
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 2
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 8 # Move right 2 pixels
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning
	
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 3
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	add $t1, $t1, $t3 # Move to next line
	
	# ROW 4
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	subi $t1, $t1, 8 # Move pointer back to line beginning

	add $t1, $t1, $t3 # Move to next line
	
	# ROW 5
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	addi $t1, $t1, 4 # Move right 1 pixel
	add $t2, $a0, $t1 # Add offset to base pixel address
	sw $a1, 0($t2) # Write color value into pixel
	
	jr $ra
	
ClearScreen: # $a0 holds top left corner address, $a1 holds background color 
	li $t0, SCREEN_WIDTH
	li $t1, SCREEN_HEIGHT
	mul $t2, $t0, $t1 # Outer loop end condition
	
	li $t0, 0
	ClearLoop:
		beq $t0, $t2, ExitClearLoop
		
		
		sll $t3, $t0, 2 # Multiply i by 4 for offset
		add $t4, $a0, $t3 # Add offset to base address
		
		sw $a1, 0($t4) # Write color into address
		addi $t0, $t0, 1
	j ClearLoop
	ExitClearLoop:
	jr $ra

DrawNum: #$a0 holds top left corner, $a1 holds the player, $a2 holds the number to draw
	addi $sp, $sp, -4
	sw $ra, 0($sp) # save program counter on the stack
	
	# Decide color 
		li $t0, 1
		beq $a1, $t0, P1
		j P2
		
		P1:
			li $a1, P1_COLOR
			j Skip
		P2:
			li $a1, P2_COLOR
		Skip:
		
	Switch:
		li $t0, 0
		beq $a2, $t0, Case_0
		li $t0, 1
		beq $a2, $t0, Case_1
		li $t0, 2
		beq $a2, $t0, Case_2
		li $t0, 3
		beq $a2, $t0, Case_3
		li $t0, 4
		beq $a2, $t0, Case_4
		li $t0, 5
		beq $a2, $t0, Case_5
		li $t0, 6
		beq $a2, $t0, Case_6
		li $t0, 7
		beq $a2, $t0, Case_7
		li $t0, 8
		beq $a2, $t0, Case_8
		li $t0, 9
		beq $a2, $t0, Case_9
		li $t0, 10
		beq $a2, $t0, Case_10
		
		j End_Switch
	Case_0:
		jal DrawZero
		j End_Switch
	Case_1:
		jal DrawOne
		j End_Switch
	Case_2:
		jal DrawTwo	
		j End_Switch
	Case_3:
		jal DrawThree
		j End_Switch
	Case_4:
		jal DrawFour
		j End_Switch
	Case_5:
		jal DrawFive
		j End_Switch
	Case_6:
		jal DrawSix
		j End_Switch
	Case_7:
		jal DrawSeven
		j End_Switch
	Case_8:
		jal DrawEight
		j End_Switch
	Case_9:
		jal DrawNine
		j End_Switch
	Case_10:
		jal DrawOne
		addi $a0, $a0, 16
		jal DrawZero
		j End_Switch
	End_Switch:
	lw $ra, 0($sp) # save program counter on the stack
	addi $sp, $sp, 4
	jr $ra

DrawSpaces:
	DrawSquareLoop:
	
	jr $ra

DrawBoard: #a0 holds top left corner address, $a1 holds the team_array address, $a2 holds the num_array address
	addi $sp, $sp, -16
	sw $ra, 0($sp) # save program counter on the stack
	sw $s0, 4($sp) # save $s0 on the stack
	sw $s1, 8($sp) # save $s1 on the stack
	sw $s2, 12($sp) # save $s2 on the stack
	
	
	move $s0, $a0 # $s0 now holds top left corner
	move $s1, $a1 # $s1 now holds team_array address
	move $s2, $a2 # $s2 now holds num_array address
	
	# ROW 1 (29, 5)
	li $t0, 29
	li $t1, 5
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	
	lw $a1, 0($s1)
	lw $a2, 0($s2)
	jal DrawNum
	
	# ROW 2 (24,15), (34, 15)
	li $t0, 24
	li $t1, 15
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 4($s1)
	lw $a2, 4($s2)
	jal DrawNum
	
	li $t0, 34
	li $t1, 15
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 8($s1)
	lw $a2, 8($s2)
	jal DrawNum
	
	# ROW 3 (19,25), (29, 25), (39, 25)
	li $t0, 19
	li $t1, 25
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 12($s1)
	lw $a2, 12($s2)
	jal DrawNum
	
	li $t0, 29
	li $t1, 25
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 16($s1)
	lw $a2, 16($s2)
	jal DrawNum
	
	li $t0, 39
	li $t1, 25
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 20($s1)
	lw $a2, 20($s2)
	jal DrawNum
	
	# ROW 4 (14,35), (24,35), (34,35), (44,35)
	li $t0, 14
	li $t1, 35
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 24($s1)
	lw $a2, 24($s2)
	jal DrawNum
	
	li $t0, 24
	li $t1, 35
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 28($s1)
	lw $a2, 28($s2)
	jal DrawNum
	
	li $t0, 34
	li $t1, 35
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 32($s1)
	lw $a2, 32($s2)
	jal DrawNum
	
	li $t0, 44
	li $t1, 35
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 36($s1)
	lw $a2, 36($s2)
	jal DrawNum
	
	# ROW 5 (9,45), (19,45), (29, 45), (39, 45), (49,45)
	li $t0, 9
	li $t1, 45
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 40($s1)
	lw $a2, 40($s2)
	jal DrawNum
	
	li $t0, 19
	li $t1, 45
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 44($s1)
	lw $a2, 44($s2)
	jal DrawNum
	
	li $t0, 29
	li $t1, 45
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 48($s1)
	lw $a2, 48($s2)
	jal DrawNum
	
	li $t0, 39
	li $t1, 45
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 52($s1)
	lw $a2, 52($s2)
	jal DrawNum
	
	li $t0, 49
	li $t1, 45
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 56($s1)
	lw $a2, 56($s2)
	jal DrawNum
	
	# ROW 6 (4,55), (14,55), (24,55), (34,55), (44,55), (54,55)
	li $t0, 4
	li $t1, 55
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 60($s1)
	lw $a2, 60($s2)
	jal DrawNum
	
	li $t0, 14
	li $t1, 55
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 64($s1)
	lw $a2, 64($s2)
	jal DrawNum
	
	li $t0, 24
	li $t1, 55
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 68($s1)
	lw $a2, 68($s2)
	jal DrawNum
	
	li $t0, 34
	li $t1, 55
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 72($s1)
	lw $a2, 72($s2)
	jal DrawNum
	
	li $t0, 44
	li $t1, 55
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 76($s1)
	lw $a2, 76($s2)
	jal DrawNum
	
	li $t0, 54
	li $t1, 55
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2
	lw $a1, 80($s1)
	lw $a2, 80($s2)
	jal DrawNum
	
	lw $s2, 12($sp)
	lw $s1, 8($sp)
	lw $s0, 4($sp)
	lw $ra, 0($sp) # restore program counter from the stack
	addi $sp, $sp, 8
	
	jr $ra


	
