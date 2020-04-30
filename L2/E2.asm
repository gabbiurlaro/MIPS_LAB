            .data
input_msg:  .asciiz "Inserisci un intero su byte:"
error_msg:  .asciiz "Valore non rappresentabile" 
            .text
            .globl main
            .ent main
main:   
            la $a0, input_msg
            li $v0, 4
            syscall
            li $v0, 5
            syscall
            move $s0, $v0
            la $a0, input_msg
            li $v0, 4
            syscall
            li $v0, 5
            syscall
            move $s1, $v0
            li $t0, 0xffffff00
            and $s0, $s0, $t0
            beq  $s0, $0, ok             
error:      la $a0, error_msg
            li $v0, 4
            syscall
            j done
ok:         and $s1, $s1, $t0
            bne  $s1, $0, error  
            
            nor $t0, $s1, $0
            and $t0, $s0, $t0
            xor $t1, $s0, $s1
            or $t2, $t0, $t1
            nor $s2, $t2, $0
            andi $s2, $s2, 0x000000ff
            move $a0, $s2
            li $v0, 1
            syscall
done:       li $v0, 10
            syscall
            .end main