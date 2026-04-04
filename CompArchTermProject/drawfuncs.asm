# CS 2340 Term Project
# Author: Asher Isgitt
# Date: 4/3/2026
# drawfuncs.asm: contains vital draw functions for the bitmap display

.text

DrawZero: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 8 		# Move to right, skipping 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 8 		# Move to right, skipping 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 8 		# Move to right, skipping 1 pixel
	add $t2, $a0, $t1		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra					# Return

DrawOne: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 4 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra					# Return

DrawTwo: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixe
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra					# Return
	
DrawThree: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginnin
	add $t1, $t1, $t3 		# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1	 	# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	addi $t1, $t1, 8		# Move right 2 pixels
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	subi $t1, $t1, 8		# Move pointer back to line beginning
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra					# Return
	
DrawFour: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 8 		# Move right 2 pixels
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2)	 		# Write color value into pixel
	addi $t1, $t1, 8 		# Move right 2 pixels
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	addi $t1, $t1, 8
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra					# Return
	
DrawFive: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2)	 		# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1	 	# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra					# Return
	
DrawSix: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3	 	# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 8 		# Move right 2 pixels
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra
	
DrawSeven: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line	
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra					# Return

DrawEight: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 8 		# Move right 2 pixels
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 8 		# Move right 2 pixels
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra					# Return
	
DrawNine: # Args: $a0 top left corner, $a1 color
	li $t3, SCREEN_WIDTH_BYTES # Load screen width constant
	# ROW 1
	li $t1, 0 				# Offset
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 2
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 8 		# Move right 2 pixels
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 3
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	add $t1, $t1, $t3 		# Move to next line
	# ROW 4
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	subi $t1, $t1, 8 		# Move pointer back to line beginning
	add $t1, $t1, $t3 		# Move to next line
	# ROW 5
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	addi $t1, $t1, 4 		# Move right 1 pixel
	add $t2, $a0, $t1 		# Add offset to base pixel address
	sw $a1, 0($t2) 			# Write color value into pixel
	jr $ra # Return
	
ClearScreen: # $a0 holds top left corner address
	li $t0, SCREEN_WIDTH # Load SCREEN_WIDTH into $t0
	li $t1, SCREEN_HEIGHT # Load SCREEN_HEIGHT into $t1
	li $t5, BACKGROUND_COLOR
	mul $t2, $t0, $t1 # Outer loop end condition
	
	li $t0, 0
	ClearLoop: # Main loop
		beq $t0, $t2, ExitClearLoop # Exit when $t0 == $t2
		
		sll $t3, $t0, 2 # Multiply i by 4 for offset
		add $t4, $a0, $t3 # Add offset to base address
		
		sw $t5, 0($t4) # Write color into address
		addi $t0, $t0, 1 # Increment $t0 by 1
	j ClearLoop # Go back to main loop label
	ExitClearLoop: # End main loop
	
	jr $ra # Return

DrawNum: #$a0 holds top left corner, $a1 holds the player, $a2 holds the number to draw
	addi $sp, $sp, -4
	sw $ra, 0($sp) # save program counter on the stack
	
	# Decide color 
		li $t0, 1 # Load 1 into $t0
		beq $a1, $t0, P1 # If $a1 == $t0, go to P1
		j P2 # go to P2
		
		P1: # Player 1
			li $a1, P1_COLOR # Load P1_COLOR into $a1
			j Skip # go to skip
		P2: # Player 2
			li $a1, P2_COLOR # Load P2_COLOR into $a1
		Skip: # Pass
	
	# Switch statement chooses which number to draw based on input
	Switch:
		li $t0, 0 # Load 0 into $t0
		beq $a2, $t0, Case_0 # if $a2 == $t0, go to Case_0
		li $t0, 1 # Load 1 into $t0
		beq $a2, $t0, Case_1 # if $a2 == $t0, go to Case_1
		li $t0, 2 # Load 2 into $t0
		beq $a2, $t0, Case_2 # if $a2 == $t0, go to Case_2
		li $t0, 3 # Load 3 into $t0
		beq $a2, $t0, Case_3 # if $a2 == $t0, go to Case_3
		li $t0, 4 # Load 4 into $t0
		beq $a2, $t0, Case_4 # if $a2 == $t0, go to Case_4
		li $t0, 5 # Load 5 into $t0
		beq $a2, $t0, Case_5 # if $a2 == $t0, go to Case_5
		li $t0, 6 # Load 6 into $t0
		beq $a2, $t0, Case_6 # if $a2 == $t0, go to Case_6
		li $t0, 7 # Load 7 into $t0
		beq $a2, $t0, Case_7 # if $a2 == $t0, go to Case_7
		li $t0, 8 # Load 8 into $t0
		beq $a2, $t0, Case_8 # if $a2 == $t0, go to Case_8
		li $t0, 9 # Load 9 into $t0
		beq $a2, $t0, Case_9 # if $a2 == $t0, go to Case_9
		li $t0, 10 # Load 10 into $t0
		beq $a2, $t0, Case_10 # if $a2 == $t0, go to Case_10
		
		j End_Switch # go to End_Switch
	Case_0:
		jal DrawZero # Draw a 0
		j End_Switch # go to End_Switch
	Case_1:
		jal DrawOne # Draw a 1
		j End_Switch # go to End_Switch
	Case_2:
		jal DrawTwo	# Draw a 2
		j End_Switch # go to End_Switch
	Case_3:
		jal DrawThree # Draw a 3
		j End_Switch # go to End_Switch
	Case_4:
		jal DrawFour# Draw a 4
		j End_Switch # go to End_Switch
	Case_5:
		jal DrawFive# Draw a 5
		j End_Switch # go to End_Switch
	Case_6:
		jal DrawSix# Draw a 6
		j End_Switch # go to End_Switch
	Case_7:
		jal DrawSeven# Draw a 7
		j End_Switch # go to End_Switch
	Case_8:
		jal DrawEight# Draw an 8
		j End_Switch # go to End_Switch
	Case_9:
		jal DrawNine # Draw a 9
		j End_Switch # go to End_Switch
	Case_10:
		jal DrawOne # Draw a 1
		addi $a0, $a0, 16 # Offset the top left corner by 16
		jal DrawZero # Draw a 0
		j End_Switch # go to End_Switch
	End_Switch:
	lw $ra, 0($sp) # Restore program counter from the stack
	addi $sp, $sp, 4 # Restore the stack pointer
	jr $ra # return

DrawSquare: # $a0 holds top left corner address
	li $t0, 0
	li $t2, 9
	li $t5, SQUARE_COLOR
	move $t3, $a0
	SquareLoop:
		beq $t0, $t2, EndSquareLoop
		li $t1, 0
		move $t4, $t3
		RowLoop:
			beq $t1, $t2, EndRowLoop
			sw $t5, 0($t4) # Write color value into pixel
			addi $t4, $t4, 4 # Move forward 4 bytes
			addi $t1, $t1, 1
			j RowLoop
		EndRowLoop:
		addi $t3, $t3, SCREEN_WIDTH_BYTES # Move to next line
		addi $t0, $t0, 1
		j SquareLoop
	EndSquareLoop:
	
	jr $ra

DrawBoard: # $a0 holds top left corner address, $a1 holds the team_array address, $a2 holds the num_array address
	addi $sp, $sp, -16
	sw $ra, 0($sp) # save program counter on the stack
	sw $s0, 4($sp) # save $s0 on the stack
	sw $s1, 8($sp) # save $s1 on the stack
	sw $s2, 12($sp) # save $s2 on the stack
	
	
	move $s0, $a0 # $s0 now holds top left corner
	move $s1, $a1 # $s1 now holds team_array address
	move $s2, $a2 # $s2 now holds num_array address
	
	# SQUARES
	# ROW 1 (28, 3)
	li $t0, 28
	li $t1, 3
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	# ROW 2 (23,13), (33, 13)
	li $t0, 23
	li $t1, 13
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 33
	li $t1, 13
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	# ROW 3 (18,23), (28, 23), (38, 23)
	li $t0, 18
	li $t1, 23
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 28
	li $t1, 23
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 38
	li $t1, 23
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	# ROW 4 (13,33), (23,33), (33,33), (43,33)
	li $t0, 13
	li $t1, 33
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 23
	li $t1, 33
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 33
	li $t1, 33
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 43
	li $t1, 33
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	# ROW 5 (8,43), (18,43), (28, 43), (38, 43), (48,43)
	li $t0, 8
	li $t1, 43
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 18
	li $t1, 43
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 28
	li $t1, 43
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 38
	li $t1, 43
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 48
	li $t1, 43
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	# ROW 6 (3,53), (13,53), (23,53), (33,53), (43,53), (53,53)
	li $t0, 3
	li $t1, 53
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 13
	li $t1, 53
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 23
	li $t1, 53
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 33
	li $t1, 53
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 43
	li $t1, 53
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare
	
	li $t0, 53
	li $t1, 53
	mul $t0, $t0, 4 # Turn coordinate into bytes
	mul $t1, $t1, SCREEN_WIDTH_BYTES # Move down 5 rows
	
	add $t2, $t0, $t1 # Final offset
	add $a0, $s0, $t2

	jal DrawSquare

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


	
