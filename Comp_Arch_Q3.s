.data
str1: .asciiz "Enter First Number: "
str2: .asciiz "\nEnter Second Number: "
str3: .asciiz "\nThe Larger number is: "

.text
.globl main

main:

  li $v0, 4                # Input the First Number
  la $a0, str1             # Input Message
  syscall

  li $v0, 5                # Storing the First Number
  syscall

  move $t0, $v0            # Moving the First Number to another register
  li $v0, 4                # Input the Second Number
  la $a0, str2             # Input Message
  syscall

  li $v0, 5                # Storing the Second Number
  syscall

  move $t1, $v0            # Moving the Second Number to another register
  slt $s1, $t0, $t1        # check condition for less than scenario
  beq $s1, $zero, Great    # if s1=0 then t0 is greater
  move $s2, $t1
  j result

  Great: move $s2, $t0
  
  result: li $v0, 4       # The Larger Number
  la $a0, str3            # Print Message
  syscall

  li $v0, 1
  move $a0, $s2
  syscall

  li $v0, 10
  syscall

  .end
