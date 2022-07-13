.data
num1: .word 23
num2: .word 72
product: .word 0
str1: .asciiz "Product of 23 and 72 = "  

.text
.globl main

main:

  lw $s1, num1                   # Storing the First Number
  lw $s2, num2                   # Storing the Second Number
  move $s0, $zero 
  li $s3, 1 
  li $t1, 0 
  jal Product                    # Jump Statement for Product Function

  sw $s0, product 
  li $v0, 4
  la $a0, str1                   # Output Message
  syscall

  li $v0, 1
  move $a0, $s0
  syscall
  j end

Product:
  beq $t1, 31, return
  and $t0, $s2, $s3
  sll $s3, $s3, 1	
  beq $t0, 0, next_bit
  add $s0, $s0, $s1
	
  next_bit:
    sll $s1, $s1, 1
    addi $t1, $t1, 1
    j Product
    
  return:
    jr $ra

end: 
  li $v0, 10
  syscall

.end