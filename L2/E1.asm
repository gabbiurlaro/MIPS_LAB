            .data
input_msg:      .asciiz "Inserisci un intero"
pari_msg:       .asciiz "Valore pari"
dispari_msg:    .asciiz "Valore dispari" 
            .text
            .globl main
            .ent main
main:   
            la $a0, input_msg
            li $v0, 4
            syscall
            li $v0, 5
            syscall
            addi $t0, $v0, 0		
            andi $t0, $t0, 1
            beq  $t0, $0, pari
            la $a0, dispari_msg
            li $v0, 4
            syscall
            j done
pari:       la $a0, pari_msg
            li $v0, 4
            syscall
done:       li $v0, 10
            syscall
            .end main