.data
    .LC0: .string "Hello World!\n"
.text
    .global main
main:
    addi    sp, sp, -48
    sw      ra, 44(sp)
    sw      s0, 40(sp)
    addi    s0, sp, 48
    sw      a0, -36(s0)
    sw      a1, -40(s0)
    sw      zero, -20(s0)
    j       .L2
.L3:
    lui     a5, %hi(.LC0)
    addi    a0, a5, %lo(.LC0)
    li      a7, 4
    ecall
    lw      a5, -20(s0)
    addi    a5, a5, 1
    sw      a5, -20(s0)
.L2:
    lw      a4, -20(s0)
    lw      a5, -36(s0)
    blt     a4, a5, .L3
    lw      a4, -36(s0)
    li      a5, 1
    ble     a4, a5, .L4
    lw      a5, -40(s0)
    addi    a5, a5, 4
    lw      a5, 0(a5)
    mv      a0, a5
    li      a7, 4
    ecall
    li      a0, 10
    li      a7, 11
    ecall
.L4:
    li      a5, 0
    mv      a0, a5
    lw      ra, 44(sp)
    lw      s0, 40(sp)
    addi    sp, sp, 48
    li      a0, 0
    li      a7, 10
    ecall
