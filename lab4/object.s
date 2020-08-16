.data
_Prompt: .asciiz "Enter an integer:  "
_ret: .asciiz "\n"
.globl main0
.text
 main0:
 addi $sp, $sp, 0
 jal main
 li $v0,10
 syscall
read:
  li $v0,4
  la $a0,_Prompt
  syscall
  li $v0,5
  syscall
  jr $ra
write:
  li $v0,1
  syscall
  li $v0,4
  la $a0,_ret
  syscall
  move $v0,$0
  jr $ra

fibo:
  li $t3, 0
  sw $t3, 16($sp)
  lw $t1, 12($sp)
  lw $t2, 16($sp)
  beq $t1,$t2,label3
  j label4
label4:
  li $t3, 1
  sw $t3, 16($sp)
  lw $t1, 12($sp)
  lw $t2, 16($sp)
  beq $t1,$t2,label3
  j label2
label3:
  li $t3, 1
  sw $t3, 16($sp)
  lw $v0,16($sp)
  jr $ra
label2:
  li $t3, 1
  sw $t3, 16($sp)
  lw $t1, 12($sp)
  lw $t2, 16($sp)
  sub $t3,$t1,$t2
  sw $t3, 20($sp)
  move $t0,$sp
  addi $sp, $sp, -44
  sw $ra,0($sp)
  lw $t1, 20($t0)
  move $t3,$t1
  sw $t3,12($sp)
  jal fibo
  lw $ra,0($sp)
  addi $sp,$sp,44
  sw $v0,24($sp)
  li $t3, 2
  sw $t3, 28($sp)
  lw $t1, 12($sp)
  lw $t2, 28($sp)
  sub $t3,$t1,$t2
  sw $t3, 32($sp)
  move $t0,$sp
  addi $sp, $sp, -44
  sw $ra,0($sp)
  lw $t1, 32($t0)
  move $t3,$t1
  sw $t3,12($sp)
  jal fibo
  lw $ra,0($sp)
  addi $sp,$sp,44
  sw $v0,36($sp)
  lw $t1, 24($sp)
  lw $t2, 36($sp)
  add $t3,$t1,$t2
  sw $t3, 40($sp)
  lw $v0,40($sp)
  jr $ra
label1:

main:
  addi $sp, $sp, -48
  addi $sp, $sp, -4
  sw $ra,0($sp)
  jal read
  lw $ra,0($sp)
  addi $sp, $sp, 4
  sw $v0, 44($sp)
  lw $t1, 44($sp)
  move $t3, $t1
  sw $t3, 12($sp)
  li $t3, 0
  sw $t3, 44($sp)
  lw $t1, 44($sp)
  move $t3, $t1
  sw $t3, 20($sp)
label10:
  lw $t1, 20($sp)
  lw $t2, 12($sp)
  ble $t1,$t2,label9
  j label8
label9:
  move $t0,$sp
  addi $sp, $sp, -44
  sw $ra,0($sp)
  lw $t1, 20($t0)
  move $t3,$t1
  sw $t3,12($sp)
  jal fibo
  lw $ra,0($sp)
  addi $sp,$sp,44
  sw $v0,44($sp)
  lw $t1, 44($sp)
  move $t3, $t1
  sw $t3, 16($sp)
  li $t3, 5
  sw $t3, 44($sp)
  lw $t1, 20($sp)
  lw $t2, 44($sp)
  ble $t1,$t2,label13
  j label12
label13:
  addi $sp, $sp, -4
  sw $ra,0($sp)
  jal read
  lw $ra,0($sp)
  addi $sp, $sp, 4
  sw $v0, 44($sp)
  lw $t1, 44($sp)
  move $t3, $t1
  lw $t2, 20($sp)
  mul $t2, $t2, 4
  addi $t2, $t2, 28
  add $t2, $t2, $sp
  sw $t3, ($t2)
label12:
  lw $a0, 16($sp)
  addi $sp, $sp, -4
  sw $ra,0($sp)
  jal write
  lw $ra,0($sp)
  addi $sp, $sp, 4
  lw $t1, 20($sp)
  addi $t2, $t1, 1
  sw $t2, 20($sp)

temp17:
  j label10
label8:
  li $t3, 1
  sw $t3, 44($sp)
  lw $v0,44($sp)
  jr $ra
label5:
