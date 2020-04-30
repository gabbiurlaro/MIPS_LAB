            .data
var:        .half 4
            .text
            .globl main
            .ent main
main:       
            lw $t0, var
            li $t1, 1
            li $t2, 16
            li $t3, 0
            li $t4, 0
loop:       beq $t3, $t2, done
            addi $t3, $t3, 1
            and $t5, $t0, $t1
            beq $t5, $0, endif
            addi $t4, $t4, 1
endif:      sll $t1, $t1, 1
            j loop
done:       move $a0, $t4
            li $v0, 1
            syscall
            li $v0, 10
            syscall
            .end main