.data   # start of data section
    .LC0: .string "Hello world!"

.text   # start of code section
    .global main    # declare main function to be global

main:
# sp -= 16
    addi    sp, sp, -16
# store return address to sp - 4
    sw      ra, 12(sp)
# store s0 to sp - 8
    sw      s0, 8(sp)
# set s0 to stack pointer
    addi    s0, sp, 16
# puts(.LC0);
    la      a0, .LC0
    # auipc   a0, %pcrel_hi(.LC0)
    # addi    a0, a0, %pcrel_lo(.LC0)
# a7 = 4
    # puts syscall
    li      a7, 4
    ecall
# ra = mem[sp+12]
    # restore return address from sp - 4
    lw      ra, 12(sp)
# s0 = mem[sp+8]
    # restore s0 from sp - 8
    lw      s0, 8(sp)
# sp += 16
    # restore stack pointer
    addi    sp, sp, 16
# a0 = 0
    li      a0, 0
# a7 = 10
    # exit syscall
    li      a7, 10
    ecall
