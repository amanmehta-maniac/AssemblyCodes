        .text
	.globl main

main:	li $v0,5
        syscall
        move $t1,$v0      
        li $v0,5
        syscall
        move $t0,$v0      
	jal expo  
        move $a0,$t2            
        li $v0,1
        syscall
	li $v0,4
	la $a0,str
	#move $a0,str
	syscall
exit:
        li $v0,10
        syscall
expo:  	li $t2,1                   
	li $t4,0
again:  beq $t0,$t4,return     
        andi $t3,$t0,1             
        beq $t3,$t4,skip     
        mult $t2,$t1
        mflo $t2
skip:   mult $t1,$t1           
        mflo $t1                    
        srl $t0,$t0,1              
	j again  
return: jr $ra

	.data
str: .asciiz "\n"
