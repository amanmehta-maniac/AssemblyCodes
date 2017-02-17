.data
	out: .space 100
	.text
	.globl main
main:
	li $v0,5
	syscall
	move $t0,$v0
	li $t1,0 #t1=iterater
	la $t4,out #t4=address
	li $t2,0 # last cumulative sum
	sw $t2,0($t4) 
loop:
	beq $t1,$t0,exit 
	li $v0,5 #
	syscall
	move $t3,$v0 #t3=new input
	lw $t5,($t4)
	add $t6,$t3,$t5
	li $v0,1
	move $a0,$t6
	syscall
	sw $t6,0($t4)
	addi $t4,$t4,4
	sw $t6,0($t4)
	addi $t1,$t1,1
	j loop
exit:
	li $v0,10
	syscall



