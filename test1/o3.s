.data
    .LC0: .string "Hello World!\n"
.text
    .global main
main:
    ble     a0, zero, .L6
    addi    sp, sp, -32
    sw      s2, 16(sp)
    lui     s2, %hi(.LC0)
    sw      s0, 24(sp)
    sw      s1, 20(sp)
    sw      s3, 12(sp)
    sw      ra, 28(sp)
    mv      s3, a1
    mv      s1, a0
    addi    s2, s2, %lo(.LC0)
    li      s0, 0
.L3:
    mv      a0, s2
    addi    s0, s0, 1
    li      a7, 4
    ecall
    bne     s1, s0, .L3
    li      a5, 1
    bne     s1, a5, .L10
.L2:
    lw      ra, 28(sp)
    lw      s0, 24(sp)
    lw      s1, 20(sp)
    lw      s2, 16(sp)
    lw      s3, 12(sp)
    li      a0, 0
    addi    sp, sp, 32
    li      a7, 10
    ecall
.L10:
    lw      a0, 4(s3)
    li      a7, 4
    ecall
    li      a0, 10
    li      a7, 11
    ecall
    j       .L2
.L6:
    li      a0, 0
    ret
