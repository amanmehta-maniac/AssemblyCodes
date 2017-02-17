	.text
	.globl main
main:
	li $v0,5
	syscall
	move $t0,$v0
	jal findMax
exit:
	move $a0,$t5 
	li $v0,1 # print max to screen
	syscall
	li $v0,4 # print new line
	la $a0,str1
	syscall
	li $v0,10 #exit
	syscall
findMax:
	li $t1,1 #t1 stores loop counter
	li $t5,-10000 # t5 initially stores a large -ve value. Finally t5 stores maximum value(final ans)
loop:
	bgt $t1,$t0,exit #exit if all elements are done
	li $v0,5 #scan a new int
	syscall
	move $t2,$v0 # move scanned int into t2
#	move $a0,$t2 
#	li $v0,1
#	syscall
#	li $v0,4
#	la $a0,str1
#	syscall
	bgt $t5,$t2,skip #if max > new int, donot change max.
	move $t5,$t2 # if new value > max. update max
skip:
	addi $t1,$t1,1 #increment loop counter
	j loop #unconditional jump to loop
return:
	jr $ra # return to caller, t5 stores max value
	.data
str1:	.asciiz "\n"
