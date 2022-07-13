.data
input: .asciiz "Enter a number: "
result1: .asciiz "\nThe Input number is even."
result2: .asciiz "\nThe Input number is odd."

.text 
.globl main 

main:

  li $v0, 4                   # Inputting the Number
  la $a0, input               # Input Message
  syscall

  li $v0, 5                   # Storing the Number
  syscall
  
  move $s0, $v0
  srl $t0, $s0, 1             # Getting Half of the Number via Right Shift
  sll $t0, $t0, 1             # Getting the Resultant double via Left Shift
  sub $s1, $s0, $t0           # Subtracting Number from its final form
  beq $s1, $zero, Even        # If 0, it would be even else odd
  
  li $v0, 4
  la $a0, result2             # Odd Result Message
  syscall
  j end

  Even: li $v0, 4
  la $a0, result1             # Even Result Message
  syscall

  end: li $v0, 10
  syscall

  .end
