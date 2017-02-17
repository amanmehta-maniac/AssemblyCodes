	.text
	.globl main

main:	li $v0,5
        syscall     #scanning x
        move $a0,$v0    #passing argument as x        
        li $v0,5
        syscall		#scanning n
        move $a1,$v0     #passing argument as n
	li $t6,0
        jal expo
	j exit
expo:  	beq $a1,$t6,goback
        addi $sp,$sp,-8
        sw $a1,0($sp)           
        sw $ra,4($sp)
        srl $a1,$a1,1
        li $v0,1
        jal expo              
        lw $ra,4($sp)          
        lw $a1,0($sp)
        addi $sp,$sp,8
        mult $v0,$v0            
        mflo $v0                
        andi $t4,$a1,1          
        beq $t4,0,goback        
        mult $v0,$a0            
        mflo $v0
goback: jr $ra
exit:        
	move $a0,$v0            
        li $v0,1
        syscall
        li $v0,10
        syscall
