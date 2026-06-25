.data
    .LC0: .string "Hello world!"
.text
    .global main
main:
    addi    sp, sp, -16
    sw      ra, 12(sp)
    sw      s0, 8(sp)
    addi    s0, sp, 16
    la      a0, .LC0
    li      a7, 4
    ecall
    lw      ra, 12(sp)
    lw      s0, 8(sp)
    addi    sp, sp, 16
    li      a0, 0
    li      a7, 10
    ecall
