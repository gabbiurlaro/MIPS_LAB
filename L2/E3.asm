            .data
var1:          .word 15
var2:          .word 23
var3:          .word 2
            .text
            .globl main
            .ent main
main:       
            lw $s0, var1
            lw $s1, var2
            lw $s2, var3
            blt $s0, $s1, if2
            move $t0, $s0
            move $s0, $s1
            move $s1, $t0
if2:        blt $s0, $s2, if3
            move $t0, $s0
            move $s0, $s2
            move $s2, $t0
if3:        blt $s1, $s2, done
            move $t0, $s1
            move $s1, $s2
            move $s2, $t0
done:       
            move $a0, $s0
            li $v0, 1
            syscall
            li $a0, 8
            li $v0, 11
            syscall
            move $a0, $s1
            li $v0, 1
            syscall
            li $a0, 8
            li $v0, 11
            syscall
            move $a0, $s2
            li $v0, 1
            syscall
            li $v0, 10
            syscall
            .end main            