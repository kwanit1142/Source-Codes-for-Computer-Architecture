.data 
str1: .asciiz "Enter your string: "
str2: .asciiz "\nThe given string gets converted to: "
input: .asciiz ""

.text 
.globl main 

main: 
  li $v0, 4
  la $a0, str1
  syscall

  li $v0, 8
  syscall
  move $s0, $v0

  jal atoiInMips

  li $v0, 4
  la $a0, str2
  syscall

  li $v0, 1
  move $a0, $s1
  syscall
  
  li $v0, 10
  syscall 

  .end

atoiInMips:
  move $t0, $a0
  move $s1, $zero  

  checkChar: 
    lb $t1, 0($t0)

  
    blt $t1, 48, atoiEnd
    bgt $t1, 57, atoiEnd

  
    mul $s1, $s1, 10
    add $s1, $s1, $t1
    sub $s1, $s1, 48

 
    addi $t0, $t0, 1
    j checkChar

  atoiEnd: 
    jr $ra
