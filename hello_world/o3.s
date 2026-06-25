.data
    .LC0: .string "Hello world!"
.text
    .global main
main:
    lui     a0, %hi(.LC0)
    addi    sp, sp, -16
    addi    a0, a0, %lo(.LC0)
    sw      ra, 12(sp)
    li      a7, 4
    ecall
    lw      ra, 12(sp)
    li      a0, 0
    addi    sp, sp, 16
    li      a7, 10
    ecall
