	.text
	.globl main
main:
	la $a0,str 
	li $a1,999
	li $v0,8 #scan a string
	syscall
	move $s1,$a0 #store string in s1

	#len starts#

calcuLen:		
	li $s3,0 #s3 will store address of what character is to be loaded.
	add $t1,$s3,$s3 #t1 stores null character, ie zero.
	add $s0,$s3,$s3 #s0 stores length of input string. initially 0
tillNull:
	add $t2,$s1,$s3 
	lb $t3,($t2)
	beq $t3,$t1,nullFound #if character is null. String end is reached. 
	addi $s0,$s0,1 #increment length
	addi $s3,$s3,1 #increment displacement.
	j tillNull
nullFound:		
	addi $s0,$s0,-1 #s0=s0-1
	li $s3,0 #s3 stores displacement. initially zero.
loop:
	add $s2,$s1,$s3 #store addr of charac to be loaded in s2.
	lb $t0,($s2)
	addi $s3,$s3,2 
	li $t4,97
	bge $t0,$t4,ToUppercase  
ToLowercase: 
	addi $t0,$t0,32 
	j skip
ToUppercase:
	addi $t0,$t0,-32	
skip:
	sb $t0,($s2) 
	bge $s3,$s0,exit
	j loop
exit:
	li $v0,4
	move $a0,$s1
	syscall
	la $a0,str2
	li $v0, 4
	syscall
	li $v0,10
	syscall

	.data
str: .space 999
str2: .asciiz "\n"
