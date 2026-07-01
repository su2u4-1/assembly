fill_symbol_offset:
        lw      a6,4(a0)
        li      a4,2
        lw      a5,8(a0)
        addi    a6,a6,-1
        sgtu    a6,a6,a4
        neg     a6,a6
        and     a6,a1,a6
        beq     a5,zero,.L4
        lw      a3,0(a5)
        li      a1,3
        beq     a3,zero,.L4
.L9:
        lw      a2,0(a3)
        beq     a2,zero,.L6
        lw      a4,8(a2)
        addi    a5,a4,-5
        sltiu   a5,a5,2
        addi    a4,a4,-1
        seqz    a5,a5
        snez    a4,a4
        and     a5,a5,a4
        bne     a5,zero,.L6
        lw      a5,4(a2)
        sw      a6,16(a2)
        lw      a4,8(a5)
        beq     a4,a1,.L17
        lw      a5,16(a5)
.L8:
        add     a6,a6,a5
.L6:
        lw      a3,4(a3)
        bne     a3,zero,.L9
.L4:
        lw      a5,12(a0)
        beq     a5,zero,.L32
        lw      a5,0(a5)
        beq     a5,zero,.L33
.L28:
        lw      a0,0(a5)
        mv      a1,a6
        beq     a0,zero,.L34
        addi    sp,sp,-32
        sw      ra,28(sp)
.L26:
        sw      a6,12(sp)
        sw      a5,8(sp)
        call    fill_symbol_offset
        lw      a5,8(sp)
        lw      a6,12(sp)
        lw      a5,4(a5)
        beq     a5,zero,.L1
.L15:
        lw      a0,0(a5)
        mv      a1,a6
        bne     a0,zero,.L26
        lw      a5,4(a5)
        bne     a5,zero,.L15
.L1:
        lw      ra,28(sp)
        addi    sp,sp,32
        jr      ra
.L34:
        lw      a5,4(a5)
        bne     a5,zero,.L28
        ret
.L17:
        li      a5,4
        j       .L8
.L33:
        ret
.L32:
        ret
.LC0:
        .string ""
.LC1:
        .string "%*sname: \"%s(%zu)\"\n"
.LC2:
        .string "%*skind: \"type\"\n"
.LC3:
        .string "%*skind: \"variable\"\n"
.LC4:
        .string "%*skind: \"function\"\n"
.LC5:
        .string "%*skind: \"class\"\n"
.LC6:
        .string "%*skind: \"method\"\n"
.LC7:
        .string "%*skind: \"attribute\"\n"
.LC8:
        .string "%*skind: \"parameter\"\n"
.LC9:
        .string "%*skind: \"unknown\"\n"
.LC10:
        .string "%*stype: \"%s(%zu)\"\n"
.LC11:
        .string "%*stype: null\n"
.LC12:
        .string "%*soffset: %zu\n"
.LC13:
        .string "%*soffset: null\n"
print_symbol:
        addi    sp,sp,-32
        lw      a5,12(a0)
        lw      a4,0(a0)
        sw      s0,24(sp)
        sw      s2,16(sp)
        sw      s3,12(sp)
        mv      s2,a1
        slli    s0,a2,2
        lui     s3,%hi(.LC0)
        lui     a1,%hi(.LC1)
        sw      s1,20(sp)
        mv      a2,s0
        mv      s1,a0
        addi    a3,s3,%lo(.LC0)
        mv      a0,s2
        addi    a1,a1,%lo(.LC1)
        sw      ra,28(sp)
        call    fprintf
        lw      a5,8(s1)
        li      a4,6
        bgtu    a5,a4,.L36
        lui     a4,%hi(.L38)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L38)
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L38:
        .word   .L44
        .word   .L43
        .word   .L42
        .word   .L41
        .word   .L40
        .word   .L39
        .word   .L37
.L39:
        lui     a1,%hi(.LC7)
        addi    a1,a1,%lo(.LC7)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
.L45:
        lw      a4,4(s1)
        beq     a4,zero,.L46
.L50:
        lw      a5,12(a4)
        lw      a4,0(a4)
        lui     a1,%hi(.LC10)
        addi    a1,a1,%lo(.LC10)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
        lw      a5,8(s1)
        addi    a4,a5,-5
        addi    a5,a5,-1
        sltiu   a4,a4,2
        seqz    a5,a5
        or      a5,a4,a5
        beq     a5,zero,.L48
.L51:
        mv      a2,s0
        lw      s0,24(sp)
        lw      a4,16(s1)
        lw      ra,28(sp)
        lw      s1,20(sp)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s2
        lw      s3,12(sp)
        lw      s2,16(sp)
        lui     a1,%hi(.LC12)
        addi    a1,a1,%lo(.LC12)
        addi    sp,sp,32
        tail    fprintf
.L37:
        lui     a1,%hi(.LC8)
        addi    a1,a1,%lo(.LC8)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
        lw      a4,4(s1)
        bne     a4,zero,.L50
.L46:
        lui     a1,%hi(.LC11)
        addi    a1,a1,%lo(.LC11)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
        lw      a5,8(s1)
        addi    a4,a5,-5
        addi    a5,a5,-1
        sltiu   a4,a4,2
        seqz    a5,a5
        or      a5,a4,a5
        bne     a5,zero,.L51
.L48:
        mv      a2,s0
        lw      s0,24(sp)
        lw      ra,28(sp)
        lw      s1,20(sp)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s2
        lw      s3,12(sp)
        lw      s2,16(sp)
        lui     a1,%hi(.LC13)
        addi    a1,a1,%lo(.LC13)
        addi    sp,sp,32
        tail    fprintf
.L44:
        lui     a1,%hi(.LC2)
        addi    a1,a1,%lo(.LC2)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
        j       .L45
.L43:
        lui     a1,%hi(.LC3)
        addi    a1,a1,%lo(.LC3)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
        j       .L45
.L42:
        lui     a1,%hi(.LC4)
        addi    a1,a1,%lo(.LC4)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
        j       .L45
.L41:
        lui     a1,%hi(.LC5)
        addi    a1,a1,%lo(.LC5)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
        j       .L45
.L40:
        lui     a1,%hi(.LC6)
        addi    a1,a1,%lo(.LC6)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
        j       .L45
.L36:
        lui     a1,%hi(.LC9)
        addi    a1,a1,%lo(.LC9)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s0
        mv      a0,s2
        call    fprintf
        j       .L45
.LC14:
        .string "%*sSymbolTable (type: global): {\n"
.LC15:
        .string "%*sSymbolTable (type: function): {\n"
.LC16:
        .string "%*sSymbolTable (type: class): {\n"
.LC17:
        .string "%*sSymbolTable (type: method): {\n"
.LC18:
        .string "%*sSymbolTable (type: block): {\n"
.LC19:
        .string "%*sSymbolTable (type: unknown): {\n"
.LC20:
        .string "%*ssymbols:\n"
.LC21:
        .string "%*s{\n"
.LC22:
        .string "%*s}\n"
.LC23:
        .string "%*ssub-tables:\n"
print_symbol_table_recursive:
        lw      a5,4(a0)
        addi    sp,sp,-80
        slli    a3,a2,2
        sw      s1,68(sp)
        sw      s8,40(sp)
        sw      s10,32(sp)
        sw      ra,76(sp)
        sw      s7,44(sp)
        sw      s9,36(sp)
        li      a4,4
        sw      a3,12(sp)
        mv      s10,a0
        mv      s8,a2
        mv      s1,a1
        bgtu    a5,a4,.L53
        lui     a4,%hi(.L55)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L55)
        add     a5,a5,a4
        lw      a5,0(a5)
        lui     s7,%hi(.LC0)
        jr      a5
.L55:
        .word   .L59
        .word   .L58
        .word   .L57
        .word   .L56
        .word   .L54
.L56:
        lui     a1,%hi(.LC17)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC17)
        slli    a2,a2,2
        mv      a0,s1
        call    fprintf
.L60:
        lw      a5,8(s10)
        lui     s9,%hi(.LC22)
        beq     a5,zero,.L61
        lw      a5,0(a5)
        lui     s9,%hi(.LC22)
        beq     a5,zero,.L61
        slli    a5,s8,2
        sw      s3,60(sp)
        lui     a1,%hi(.LC20)
        addi    s3,a5,4
        mv      a2,s3
        addi    a1,a1,%lo(.LC20)
        addi    a3,s7,%lo(.LC0)
        mv      a0,s1
        sw      s0,72(sp)
        sw      s2,64(sp)
        sw      s4,56(sp)
        sw      s5,52(sp)
        sw      s11,28(sp)
        call    fprintf
        lw      a5,8(s10)
        beq     a5,zero,.L93
        lw      s0,0(a5)
        beq     s0,zero,.L93
        lui     s4,%hi(.LC21)
        addi    s4,s4,%lo(.LC21)
        addi    s2,s7,%lo(.LC0)
        addi    s5,s9,%lo(.LC22)
.L65:
        lw      s11,0(s0)
        beq     s11,zero,.L63
        mv      a3,s2
        mv      a2,s3
        mv      a1,s4
        mv      a0,s1
        call    fprintf
        addi    a2,s8,2
        mv      a1,s1
        mv      a0,s11
        call    print_symbol
        mv      a3,s2
        mv      a2,s3
        mv      a1,s5
        mv      a0,s1
        call    fprintf
        lw      s0,4(s0)
        bne     s0,zero,.L65
.L93:
        lw      s0,72(sp)
        lw      s2,64(sp)
        lw      s3,60(sp)
        lw      s4,56(sp)
        lw      s5,52(sp)
        lw      s11,28(sp)
.L61:
        lw      a5,12(s10)
        beq     a5,zero,.L66
        lw      a5,0(a5)
        beq     a5,zero,.L66
        lw      a5,12(sp)
        lui     a1,%hi(.LC23)
        addi    a1,a1,%lo(.LC23)
        addi    a2,a5,4
        addi    a3,s7,%lo(.LC0)
        mv      a0,s1
        sw      s0,72(sp)
        call    fprintf
        lw      a5,12(s10)
        beq     a5,zero,.L94
        lw      s0,0(a5)
        beq     s0,zero,.L94
.L70:
        lw      a0,0(s0)
        beq     a0,zero,.L68
        addi    a2,s8,1
        mv      a1,s1
        call    print_symbol_table_recursive
        lw      s0,4(s0)
        bne     s0,zero,.L70
.L94:
        lw      s0,72(sp)
.L66:
        lw      a2,12(sp)
        lw      ra,76(sp)
        lw      s8,40(sp)
        lw      s10,32(sp)
        addi    a3,s7,%lo(.LC0)
        addi    a1,s9,%lo(.LC22)
        lw      s7,44(sp)
        lw      s9,36(sp)
        mv      a0,s1
        lw      s1,68(sp)
        addi    sp,sp,80
        tail    fprintf
.L54:
        lui     a1,%hi(.LC18)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC18)
        slli    a2,a2,2
        mv      a0,s1
        call    fprintf
        j       .L60
.L59:
        lui     a1,%hi(.LC14)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC14)
        slli    a2,a2,2
        mv      a0,s1
        call    fprintf
        j       .L60
.L58:
        lui     a1,%hi(.LC15)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC15)
        slli    a2,a2,2
        mv      a0,s1
        call    fprintf
        j       .L60
.L57:
        lui     a1,%hi(.LC16)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC16)
        slli    a2,a2,2
        mv      a0,s1
        call    fprintf
        j       .L60
.L63:
        lw      s0,4(s0)
        bne     s0,zero,.L65
        j       .L93
.L68:
        lw      s0,4(s0)
        bne     s0,zero,.L70
        j       .L94
.L53:
        lui     s7,%hi(.LC0)
        lui     a1,%hi(.LC19)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC19)
        slli    a2,a2,2
        mv      a0,s1
        call    fprintf
        j       .L60
free_all_memory:
        addi    sp,sp,-16
        sw      s2,0(sp)
        lui     s2,%hi(string_memory)
        sw      s0,8(sp)
        lw      s0,%lo(string_memory)(s2)
        sw      ra,12(sp)
        sw      s1,4(sp)
        beq     s0,zero,.L96
.L97:
        lw      a0,8(s0)
        mv      s1,s0
        lw      s0,12(s0)
        call    free
        mv      a0,s1
        call    free
        bne     s0,zero,.L97
.L96:
        sw      zero,%lo(string_memory)(s2)
        lui     s2,%hi(struct_memory)
        lw      s0,%lo(struct_memory)(s2)
        beq     s0,zero,.L98
.L99:
        lw      a0,8(s0)
        mv      s1,s0
        lw      s0,12(s0)
        call    free
        mv      a0,s1
        call    free
        bne     s0,zero,.L99
.L98:
        lw      ra,12(sp)
        lw      s0,8(sp)
        sw      zero,%lo(struct_memory)(s2)
        lw      s1,4(sp)
        lw      s2,0(sp)
        addi    sp,sp,16
        jr      ra
.LC24:
        .string "[lib Fatal] at <create_memory_block>: Cannot allocate memory\n"
create_memory_block:
        addi    sp,sp,-32
        sw      s2,16(sp)
        mv      s2,a0
        li      a0,16
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s1,20(sp)
        sw      s3,12(sp)
        call    malloc
        beq     a0,zero,.L113
        lui     s3,%hi(malloc_allocated)
        lw      s1,%lo(malloc_allocated)(s3)
        mv      s0,a0
        sw      s2,0(a0)
        sw      zero,4(a0)
        addi    s1,s1,16
        mv      a0,s2
        sw      s1,%lo(malloc_allocated)(s3)
        call    malloc
        sw      a0,8(s0)
        beq     a0,zero,.L114
        lw      ra,28(sp)
        sw      zero,12(s0)
        mv      a0,s0
        lw      s0,24(sp)
        add     s1,s1,s2
        sw      s1,%lo(malloc_allocated)(s3)
        lw      s2,16(sp)
        lw      s1,20(sp)
        lw      s3,12(sp)
        addi    sp,sp,32
        jr      ra
.L113:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC24)
        li      a2,61
        li      a1,1
        addi    a0,a0,%lo(.LC24)
        call    fwrite
        call    free_all_memory
        call    abort
.L114:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC24)
        li      a2,61
        li      a1,1
        addi    a0,a0,%lo(.LC24)
        call    fwrite
        mv      a0,s0
        call    free
        call    free_all_memory
        call    abort
.LC25:
        .string "[lib Fatal] at <list_append>: List is NULL\n"
list_append.part.0:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC25)
        addi    sp,sp,-16
        li      a2,43
        li      a1,1
        addi    a0,a0,%lo(.LC25)
        sw      ra,12(sp)
        call    fwrite
        call    abort
.LC26:
        .string "[lib Fatal] at <alloc_memory>: Cannot allocate memory\n"
alloc_memory.constprop.0:
        addi    sp,sp,-16
        sw      s0,8(sp)
        sw      ra,12(sp)
        li      a5,1023
        mv      s0,a0
        bgtu    a0,a5,.L124
        sw      s1,4(sp)
        lui     s1,%hi(struct_memory)
        lw      a0,%lo(struct_memory)(s1)
        addi    s0,s0,3
        andi    s0,s0,-4
        beq     a0,zero,.L121
.L125:
        mv      a5,a0
        j       .L123
.L122:
        lw      a5,12(a5)
        beq     a5,zero,.L121
.L123:
        lw      a3,4(a5)
        lw      a4,0(a5)
        sub     a4,a4,a3
        bltu    a4,s0,.L122
        add     s0,a3,s0
        lw      a0,8(a5)
        lw      ra,12(sp)
        sw      s0,4(a5)
        lw      s0,8(sp)
        lw      s1,4(sp)
        add     a0,a0,a3
        addi    sp,sp,16
        jr      ra
.L121:
        lw      a0,0(a0)
        add     a0,s0,a0
        call    create_memory_block
        lw      a5,%lo(struct_memory)(s1)
        sw      a0,%lo(struct_memory)(s1)
        sw      a5,12(a0)
        li      a5,1024
        beq     s0,a5,.L131
        addi    s0,s0,3
        andi    s0,s0,-4
        j       .L125
.L131:
        lw      s1,4(sp)
.L124:
        mv      a0,s0
        call    malloc
        beq     a0,zero,.L132
        lui     a4,%hi(malloc_allocated)
        lw      a5,%lo(malloc_allocated)(a4)
        lw      ra,12(sp)
        add     a5,a5,s0
        lw      s0,8(sp)
        sw      a5,%lo(malloc_allocated)(a4)
        addi    sp,sp,16
        jr      ra
.L132:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC26)
        li      a2,54
        li      a1,1
        addi    a0,a0,%lo(.LC26)
        sw      s1,4(sp)
        call    fwrite
        call    free_all_memory
        call    abort
print_symbol_table_recursive.constprop.0:
        lw      a5,4(a0)
        addi    sp,sp,-80
        sw      s0,72(sp)
        sw      s8,40(sp)
        sw      ra,76(sp)
        sw      s5,52(sp)
        sw      s7,44(sp)
        li      a4,4
        mv      s8,a0
        mv      s0,a1
        bgtu    a5,a4,.L134
        lui     a4,%hi(.L136)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L136)
        add     a5,a5,a4
        lw      a5,0(a5)
        lui     s7,%hi(.LC0)
        jr      a5
.L136:
        .word   .L140
        .word   .L139
        .word   .L138
        .word   .L137
        .word   .L135
.L137:
        lui     a1,%hi(.LC17)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC17)
        li      a2,0
        mv      a0,s0
        call    fprintf
.L141:
        lw      a5,8(s8)
        lui     s5,%hi(.LC22)
        beq     a5,zero,.L145
        lw      a5,0(a5)
        lui     s5,%hi(.LC22)
        beq     a5,zero,.L145
        lui     a1,%hi(.LC20)
        addi    a1,a1,%lo(.LC20)
        addi    a3,s7,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        sw      s1,68(sp)
        sw      s2,64(sp)
        sw      s3,60(sp)
        sw      s4,56(sp)
        sw      s6,48(sp)
        call    fprintf
        lw      a5,8(s8)
        beq     a5,zero,.L306
        lw      s1,0(a5)
        beq     s1,zero,.L306
        lui     s4,%hi(.LC21)
        addi    s4,s4,%lo(.LC21)
        addi    s3,s7,%lo(.LC0)
        addi    s6,s5,%lo(.LC22)
.L149:
        lw      s2,0(s1)
        beq     s2,zero,.L147
        mv      a3,s3
        li      a2,4
        mv      a1,s4
        mv      a0,s0
        call    fprintf
        mv      a0,s2
        mv      a1,s0
        li      a2,2
        call    print_symbol
        mv      a3,s3
        mv      a1,s6
        mv      a0,s0
        li      a2,4
        call    fprintf
        lw      s1,4(s1)
        bne     s1,zero,.L149
.L306:
        lw      s1,68(sp)
        lw      s2,64(sp)
        lw      s3,60(sp)
        lw      s4,56(sp)
        lw      s6,48(sp)
.L145:
        lw      a5,12(s8)
        beq     a5,zero,.L144
        lw      a5,0(a5)
        beq     a5,zero,.L144
        lui     a5,%hi(.LC23)
        addi    a1,a5,%lo(.LC23)
        addi    a3,s7,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        sw      s1,68(sp)
        sw      s2,64(sp)
        sw      s3,60(sp)
        sw      s4,56(sp)
        sw      s6,48(sp)
        sw      s9,36(sp)
        sw      s10,32(sp)
        sw      s11,28(sp)
        call    fprintf
        lw      a5,12(s8)
        beq     a5,zero,.L307
        lw      a5,0(a5)
        sw      a5,12(sp)
        beq     a5,zero,.L307
        lui     s11,%hi(.L208)
        lui     s2,%hi(.LC21)
        addi    a5,s11,%lo(.L208)
        addi    s2,s2,%lo(.LC21)
        sw      a5,8(sp)
.L229:
        lw      a5,12(sp)
        lw      s8,0(a5)
        beq     s8,zero,.L151
        lw      a5,4(s8)
        li      a2,4
        bgtu    a5,a2,.L152
        lui     a4,%hi(.L154)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L154)
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L154:
        .word   .L158
        .word   .L157
        .word   .L156
        .word   .L155
        .word   .L153
.L155:
        lui     a1,%hi(.LC17)
        addi    a1,a1,%lo(.LC17)
        addi    a3,s7,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        call    fprintf
.L159:
        lw      a5,8(s8)
        beq     a5,zero,.L163
        lw      a5,0(a5)
        beq     a5,zero,.L163
        lui     a1,%hi(.LC20)
        addi    a1,a1,%lo(.LC20)
        addi    a3,s7,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
        lw      a5,8(s8)
        beq     a5,zero,.L163
        lw      s1,0(a5)
        addi    s4,s7,%lo(.LC0)
        addi    s6,s5,%lo(.LC22)
        beq     s1,zero,.L163
.L167:
        lw      s3,0(s1)
        beq     s3,zero,.L165
        mv      a3,s4
        li      a2,8
        mv      a1,s2
        mv      a0,s0
        call    fprintf
        mv      a0,s3
        mv      a1,s0
        li      a2,3
        call    print_symbol
        mv      a3,s4
        mv      a1,s6
        mv      a0,s0
        li      a2,8
        call    fprintf
        lw      s1,4(s1)
        bne     s1,zero,.L167
.L163:
        lw      a5,12(s8)
        beq     a5,zero,.L162
        lw      a5,0(a5)
        beq     a5,zero,.L162
        lui     a5,%hi(.LC23)
        addi    a1,a5,%lo(.LC23)
        addi    a3,s7,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
        lw      a5,12(s8)
        beq     a5,zero,.L162
        lw      a5,0(a5)
        li      s9,4
        sw      a5,4(sp)
        beq     a5,zero,.L162
.L228:
        lw      a5,4(sp)
        lw      s4,0(a5)
        beq     s4,zero,.L169
        lw      a5,4(s4)
        bgtu    a5,s9,.L170
        lui     a4,%hi(.L172)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L172)
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L172:
        .word   .L176
        .word   .L175
        .word   .L174
        .word   .L173
        .word   .L171
.L173:
        lui     a1,%hi(.LC17)
        addi    a1,a1,%lo(.LC17)
        addi    a3,s7,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
.L177:
        lw      a5,8(s4)
        beq     a5,zero,.L181
        lw      a5,0(a5)
        beq     a5,zero,.L181
        lui     a1,%hi(.LC20)
        addi    a1,a1,%lo(.LC20)
        addi    a3,s7,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        lw      a5,8(s4)
        beq     a5,zero,.L181
        lw      s6,0(a5)
        addi    s1,s7,%lo(.LC0)
        addi    s3,s5,%lo(.LC22)
        beq     s6,zero,.L181
.L185:
        lw      s8,0(s6)
        beq     s8,zero,.L183
        mv      a3,s1
        li      a2,12
        mv      a1,s2
        mv      a0,s0
        call    fprintf
        mv      a0,s8
        mv      a1,s0
        li      a2,4
        call    print_symbol
        mv      a3,s1
        mv      a1,s3
        mv      a0,s0
        li      a2,12
        call    fprintf
        lw      s6,4(s6)
        bne     s6,zero,.L185
.L181:
        lw      a5,12(s4)
        beq     a5,zero,.L180
        lw      a5,0(a5)
        beq     a5,zero,.L180
        lui     a5,%hi(.LC23)
        addi    a1,a5,%lo(.LC23)
        addi    a3,s7,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        lw      a5,12(s4)
        beq     a5,zero,.L180
        lw      s8,0(a5)
        beq     s8,zero,.L180
.L227:
        lw      s4,0(s8)
        beq     s4,zero,.L187
        lw      a5,4(s4)
        bgtu    a5,s9,.L188
        lui     a4,%hi(.L190)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L190)
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L190:
        .word   .L194
        .word   .L193
        .word   .L192
        .word   .L191
        .word   .L189
.L191:
        lui     a1,%hi(.LC17)
        addi    a1,a1,%lo(.LC17)
        addi    a3,s7,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
.L195:
        lw      a5,8(s4)
        beq     a5,zero,.L199
        lw      a5,0(a5)
        beq     a5,zero,.L199
        lui     a1,%hi(.LC20)
        addi    a1,a1,%lo(.LC20)
        addi    a3,s7,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        lw      a5,8(s4)
        beq     a5,zero,.L199
        lw      s6,0(a5)
        addi    s1,s7,%lo(.LC0)
        addi    s3,s5,%lo(.LC22)
        beq     s6,zero,.L199
.L203:
        lw      s10,0(s6)
        beq     s10,zero,.L201
        mv      a3,s1
        li      a2,16
        mv      a1,s2
        mv      a0,s0
        call    fprintf
        mv      a0,s10
        mv      a1,s0
        li      a2,5
        call    print_symbol
        mv      a3,s1
        mv      a1,s3
        mv      a0,s0
        li      a2,16
        call    fprintf
        lw      s6,4(s6)
        bne     s6,zero,.L203
.L199:
        lw      a5,12(s4)
        beq     a5,zero,.L198
        lw      a5,0(a5)
        beq     a5,zero,.L198
        lui     a5,%hi(.LC23)
        addi    a1,a5,%lo(.LC23)
        addi    a3,s7,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        lw      a5,12(s4)
        beq     a5,zero,.L198
        lw      s6,0(a5)
        addi    s1,s7,%lo(.LC0)
        beq     s6,zero,.L198
.L226:
        lw      s4,0(s6)
        beq     s4,zero,.L205
        lw      a5,4(s4)
        bgtu    a5,s9,.L206
        lw      a4,8(sp)
        slli    a5,a5,2
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L208:
        .word   .L212
        .word   .L211
        .word   .L210
        .word   .L209
        .word   .L207
.L209:
        lui     a1,%hi(.LC17)
        addi    a1,a1,%lo(.LC17)
        addi    a3,s7,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
.L213:
        lw      a5,8(s4)
        beq     a5,zero,.L217
        lw      a5,0(a5)
        beq     a5,zero,.L217
        lui     a1,%hi(.LC20)
        addi    a1,a1,%lo(.LC20)
        addi    a3,s7,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
        lw      a5,8(s4)
        beq     a5,zero,.L217
        lw      s11,0(a5)
        addi    s3,s5,%lo(.LC22)
        beq     s11,zero,.L217
.L221:
        lw      s10,0(s11)
        beq     s10,zero,.L219
        mv      a3,s1
        li      a2,20
        mv      a1,s2
        mv      a0,s0
        call    fprintf
        mv      a0,s10
        mv      a1,s0
        li      a2,6
        call    print_symbol
        mv      a3,s1
        mv      a1,s3
        mv      a0,s0
        li      a2,20
        call    fprintf
        lw      s11,4(s11)
        bne     s11,zero,.L221
.L217:
        lw      a5,12(s4)
        beq     a5,zero,.L216
        lw      a5,0(a5)
        beq     a5,zero,.L216
        lui     a5,%hi(.LC23)
        addi    a1,a5,%lo(.LC23)
        addi    a3,s7,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
        lw      a5,12(s4)
        beq     a5,zero,.L216
        lw      s3,0(a5)
        beq     s3,zero,.L216
.L225:
        lw      a0,0(s3)
        beq     a0,zero,.L223
        li      a2,5
        mv      a1,s0
        call    print_symbol_table_recursive
        lw      s3,4(s3)
        bne     s3,zero,.L225
.L216:
        mv      a3,s1
        li      a2,16
        addi    a1,s5,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L205:
        lw      s6,4(s6)
        bne     s6,zero,.L226
.L198:
        addi    a3,s7,%lo(.LC0)
        li      a2,12
        addi    a1,s5,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L187:
        lw      s8,4(s8)
        bne     s8,zero,.L227
.L180:
        addi    a3,s7,%lo(.LC0)
        li      a2,8
        addi    a1,s5,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L169:
        lw      a5,4(sp)
        lw      a5,4(a5)
        sw      a5,4(sp)
        bne     a5,zero,.L228
.L162:
        addi    a3,s7,%lo(.LC0)
        li      a2,4
        addi    a1,s5,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L151:
        lw      a5,12(sp)
        lw      a5,4(a5)
        sw      a5,12(sp)
        bne     a5,zero,.L229
.L307:
        lw      s1,68(sp)
        lw      s2,64(sp)
        lw      s3,60(sp)
        lw      s4,56(sp)
        lw      s6,48(sp)
        lw      s9,36(sp)
        lw      s10,32(sp)
        lw      s11,28(sp)
.L144:
        mv      a0,s0
        lw      s0,72(sp)
        lw      ra,76(sp)
        lw      s8,40(sp)
        addi    a3,s7,%lo(.LC0)
        addi    a1,s5,%lo(.LC22)
        lw      s7,44(sp)
        lw      s5,52(sp)
        li      a2,0
        addi    sp,sp,80
        tail    fprintf
.L212:
        lui     a1,%hi(.LC14)
        addi    a1,a1,%lo(.LC14)
        addi    a3,s7,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        j       .L213
.L207:
        lui     a1,%hi(.LC18)
        addi    a1,a1,%lo(.LC18)
        addi    a3,s7,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        j       .L213
.L210:
        lui     a1,%hi(.LC16)
        addi    a1,a1,%lo(.LC16)
        addi    a3,s7,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        j       .L213
.L211:
        lui     a1,%hi(.LC15)
        addi    a1,a1,%lo(.LC15)
        addi    a3,s7,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        j       .L213
.L192:
        lui     a1,%hi(.LC16)
        addi    a1,a1,%lo(.LC16)
        addi    a3,s7,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L195
.L194:
        lui     a1,%hi(.LC14)
        addi    a1,a1,%lo(.LC14)
        addi    a3,s7,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L195
.L189:
        lui     a1,%hi(.LC18)
        addi    a1,a1,%lo(.LC18)
        addi    a3,s7,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L195
.L193:
        lui     a1,%hi(.LC15)
        addi    a1,a1,%lo(.LC15)
        addi    a3,s7,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L195
.L174:
        lui     a1,%hi(.LC16)
        addi    a1,a1,%lo(.LC16)
        addi    a3,s7,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
        j       .L177
.L176:
        lui     a1,%hi(.LC14)
        addi    a1,a1,%lo(.LC14)
        addi    a3,s7,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
        j       .L177
.L171:
        lui     a1,%hi(.LC18)
        addi    a1,a1,%lo(.LC18)
        addi    a3,s7,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
        j       .L177
.L175:
        lui     a1,%hi(.LC15)
        addi    a1,a1,%lo(.LC15)
        addi    a3,s7,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
        j       .L177
.L156:
        lui     a1,%hi(.LC16)
        addi    a1,a1,%lo(.LC16)
        addi    a3,s7,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        call    fprintf
        j       .L159
.L158:
        lui     a1,%hi(.LC14)
        addi    a1,a1,%lo(.LC14)
        addi    a3,s7,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        call    fprintf
        j       .L159
.L153:
        lui     a1,%hi(.LC18)
        addi    a1,a1,%lo(.LC18)
        addi    a3,s7,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        call    fprintf
        j       .L159
.L157:
        lui     a1,%hi(.LC15)
        addi    a1,a1,%lo(.LC15)
        addi    a3,s7,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        call    fprintf
        j       .L159
.L135:
        lui     a1,%hi(.LC18)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC18)
        li      a2,0
        mv      a0,s0
        call    fprintf
        j       .L141
.L140:
        lui     a1,%hi(.LC14)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC14)
        li      a2,0
        mv      a0,s0
        call    fprintf
        j       .L141
.L139:
        lui     a1,%hi(.LC15)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC15)
        li      a2,0
        mv      a0,s0
        call    fprintf
        j       .L141
.L138:
        lui     a1,%hi(.LC16)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC16)
        li      a2,0
        mv      a0,s0
        call    fprintf
        j       .L141
.L219:
        lw      s11,4(s11)
        bne     s11,zero,.L221
        j       .L217
.L201:
        lw      s6,4(s6)
        bne     s6,zero,.L203
        j       .L199
.L223:
        lw      s3,4(s3)
        bne     s3,zero,.L225
        j       .L216
.L183:
        lw      s6,4(s6)
        bne     s6,zero,.L185
        j       .L181
.L165:
        lw      s1,4(s1)
        bne     s1,zero,.L167
        j       .L163
.L147:
        lw      s1,4(s1)
        bne     s1,zero,.L149
        j       .L306
.L206:
        lui     a1,%hi(.LC19)
        addi    a1,a1,%lo(.LC19)
        addi    a3,s7,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        j       .L213
.L188:
        lui     a1,%hi(.LC19)
        addi    a1,a1,%lo(.LC19)
        addi    a3,s7,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L195
.L170:
        lui     a1,%hi(.LC19)
        addi    a1,a1,%lo(.LC19)
        addi    a3,s7,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
        j       .L177
.L152:
        lui     a1,%hi(.LC19)
        addi    a1,a1,%lo(.LC19)
        addi    a3,s7,%lo(.LC0)
        mv      a0,s0
        call    fprintf
        j       .L159
.L134:
        lui     s7,%hi(.LC0)
        lui     a1,%hi(.LC19)
        addi    a3,s7,%lo(.LC0)
        addi    a1,a1,%lo(.LC19)
        li      a2,0
        mv      a0,s0
        call    fprintf
        j       .L141
.LC27:
        .string "(EOF, %zu, %zu, '')\n"
.LC28:
        .string "(identifier, "
.LC29:
        .string "(integer, "
.LC30:
        .string "(float, "
.LC31:
        .string "(string, "
.LC32:
        .string "(symbol, "
.LC33:
        .string "(keyword, "
.LC34:
        .string "(comment, "
.LC35:
        .string "(special, "
.LC36:
        .string "(unknown, %zu, %zu, '')\n"
.LC37:
        .string "%zu, %zu, '"
.LC38:
        .string "(null)'\n"
.LC39:
        .string "\\0"
.LC40:
        .string "\\n"
.LC41:
        .string "\\t"
.LC42:
        .string "\\r"
.LC43:
        .string "')\n"
output_one_token.constprop.0:
        lw      a5,0(a0)
        li      a4,8
        bgtu    a5,a4,.L309
        lui     a4,%hi(.L311)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L311)
        add     a5,a5,a4
        lw      a5,0(a5)
        addi    sp,sp,-48
        sw      s2,32(sp)
        sw      s3,28(sp)
        sw      ra,44(sp)
        mv      s3,a1
        mv      s2,a0
        jr      a5
.L311:
        .word   .L319
        .word   .L318
        .word   .L317
        .word   .L316
        .word   .L315
        .word   .L314
        .word   .L313
        .word   .L312
        .word   .L310
.L312:
        lw      a3,12(a0)
        lw      a2,8(a0)
        lw      ra,44(sp)
        lw      s2,32(sp)
        mv      a0,s3
        lw      s3,28(sp)
        lui     a1,%hi(.LC27)
        addi    a3,a3,1
        addi    a2,a2,1
        addi    a1,a1,%lo(.LC27)
        addi    sp,sp,48
        tail    fprintf
.L310:
        lui     a0,%hi(.LC35)
        mv      a3,a1
        addi    a0,a0,%lo(.LC35)
        li      a2,10
        li      a1,1
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
.L320:
        lw      a3,12(s2)
        lw      a2,8(s2)
        lui     a1,%hi(.LC37)
        addi    a3,a3,1
        addi    a2,a2,1
        addi    a1,a1,%lo(.LC37)
        mv      a0,s3
        call    fprintf
        lw      s0,4(s2)
        li      s1,0
        beq     s0,zero,.L331
        lui     a3,%hi(.LC42)
        lui     a4,%hi(.LC40)
        lui     a5,%hi(.LC39)
        sw      s4,24(sp)
        sw      s5,20(sp)
        sw      s6,16(sp)
        sw      s7,12(sp)
        addi    s6,a3,%lo(.LC42)
        addi    s7,a4,%lo(.LC40)
        addi    s5,a5,%lo(.LC39)
        li      s4,10
        j       .L321
.L323:
        beq     a0,s4,.L335
        li      a5,9
        beq     a0,a5,.L336
        li      a5,13
        beq     a0,a5,.L337
        mv      a1,s3
        call    fputc
.L324:
        lw      s0,4(s2)
        addi    s1,s1,1
.L321:
        mv      a0,s0
        call    strlen
        bgeu    s1,a0,.L338
        add     s0,s0,s1
        lbu     a0,0(s0)
        bne     a0,zero,.L323
        mv      a3,s3
        li      a2,2
        li      a1,1
        mv      a0,s5
        call    fwrite
        j       .L324
.L319:
        lui     a0,%hi(.LC28)
        mv      a3,a1
        li      a2,13
        li      a1,1
        addi    a0,a0,%lo(.LC28)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L320
.L318:
        lui     a0,%hi(.LC29)
        mv      a3,a1
        li      a2,10
        li      a1,1
        addi    a0,a0,%lo(.LC29)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L320
.L317:
        lui     a0,%hi(.LC30)
        mv      a3,a1
        li      a2,8
        li      a1,1
        addi    a0,a0,%lo(.LC30)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L320
.L316:
        lui     a0,%hi(.LC31)
        mv      a3,a1
        li      a2,9
        li      a1,1
        addi    a0,a0,%lo(.LC31)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L320
.L315:
        lui     a0,%hi(.LC32)
        mv      a3,a1
        li      a2,9
        li      a1,1
        addi    a0,a0,%lo(.LC32)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L320
.L314:
        lui     a0,%hi(.LC33)
        mv      a3,a1
        li      a2,10
        li      a1,1
        addi    a0,a0,%lo(.LC33)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L320
.L313:
        lui     a0,%hi(.LC34)
        mv      a3,a1
        li      a2,10
        li      a1,1
        addi    a0,a0,%lo(.LC34)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L320
.L337:
        mv      a3,s3
        li      a2,2
        li      a1,1
        mv      a0,s6
        call    fwrite
        j       .L324
.L335:
        mv      a3,s3
        li      a2,2
        li      a1,1
        mv      a0,s7
        call    fwrite
        j       .L324
.L338:
        lw      s4,24(sp)
        lw      s5,20(sp)
        lw      s6,16(sp)
        lw      s7,12(sp)
.L322:
        lw      s0,40(sp)
        lw      s1,36(sp)
        lw      ra,44(sp)
        lw      s2,32(sp)
        mv      a3,s3
        lw      s3,28(sp)
        lui     a0,%hi(.LC43)
        addi    a0,a0,%lo(.LC43)
        li      a2,3
        li      a1,1
        addi    sp,sp,48
        tail    fwrite
.L336:
        lui     a0,%hi(.LC41)
        mv      a3,s3
        li      a2,2
        li      a1,1
        addi    a0,a0,%lo(.LC41)
        call    fwrite
        j       .L324
.L331:
        lui     a0,%hi(.LC38)
        mv      a3,s3
        li      a2,8
        li      a1,1
        addi    a0,a0,%lo(.LC38)
        call    fwrite
        j       .L322
.L309:
        lw      a3,12(a0)
        lw      a2,8(a0)
        lui     a5,%hi(.LC36)
        mv      a0,a1
        addi    a3,a3,1
        addi    a2,a2,1
        addi    a1,a5,%lo(.LC36)
        tail    fprintf
alloc_memory.constprop.1:
        addi    sp,sp,-16
        sw      s0,8(sp)
        sw      ra,12(sp)
        li      a5,1023
        mv      s0,a0
        bgtu    a0,a5,.L340
        sw      s1,4(sp)
        lui     s1,%hi(string_memory)
        lw      a0,%lo(string_memory)(s1)
        beq     a0,zero,.L342
.L341:
        mv      a5,a0
        j       .L346
.L345:
        lw      a5,12(a5)
        beq     a5,zero,.L342
.L346:
        lw      a3,4(a5)
        lw      a4,0(a5)
        sub     a4,a4,a3
        bltu    a4,s0,.L345
        add     s0,a3,s0
        lw      a0,8(a5)
        lw      ra,12(sp)
        sw      s0,4(a5)
        lw      s0,8(sp)
        lw      s1,4(sp)
        add     a0,a0,a3
        addi    sp,sp,16
        jr      ra
.L342:
        lw      a0,0(a0)
        add     a0,s0,a0
        call    create_memory_block
        lw      a5,%lo(string_memory)(s1)
        sw      a0,%lo(string_memory)(s1)
        sw      a5,12(a0)
        j       .L341
.L340:
        call    malloc
        beq     a0,zero,.L349
        lui     a4,%hi(malloc_allocated)
        lw      a5,%lo(malloc_allocated)(a4)
        lw      ra,12(sp)
        add     a5,a5,s0
        lw      s0,8(sp)
        sw      a5,%lo(malloc_allocated)(a4)
        addi    sp,sp,16
        jr      ra
.L349:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC26)
        li      a2,54
        li      a1,1
        addi    a0,a0,%lo(.LC26)
        sw      s1,4(sp)
        call    fwrite
        call    free_all_memory
        call    abort
create_string_check:
        addi    sp,sp,-32
        sw      s1,20(sp)
        sw      s2,16(sp)
        sw      s3,12(sp)
        li      s1,-2128830464
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s4,8(sp)
        sw      s5,4(sp)
        sw      s6,0(sp)
        mv      s2,a1
        mv      s3,a0
        addi    s1,s1,-571
        beq     a1,zero,.L351
        li      a3,16777216
        mv      a5,a0
        addi    a3,a3,403
        add     a0,a0,a1
.L352:
        lbu     a4,0(a5)
        addi    a5,a5,1
        xor     s1,a4,s1
        mul     s1,s1,a3
        bne     a0,a5,.L352
.L351:
        lui     s6,%hi(string_table)
        lw      a5,%lo(string_table)(s6)
        lw      s4,4(a5)
        remu    s4,s1,s4
        slli    s4,s4,2
        beq     a2,zero,.L353
        lw      a5,0(a5)
        add     a5,a5,s4
        lw      s0,0(a5)
        bne     s0,zero,.L356
        j       .L353
.L354:
        lw      s0,8(s0)
        beq     s0,zero,.L353
.L356:
        lw      a5,0(s0)
        bne     a5,s2,.L354
        lw      a5,4(s0)
        bne     a5,s1,.L354
        lw      s5,12(s0)
        mv      a2,s2
        mv      a1,s3
        mv      a0,s5
        call    strncmp
        bne     a0,zero,.L354
.L350:
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        lw      s2,16(sp)
        lw      s3,12(sp)
        lw      s4,8(sp)
        lw      s6,0(sp)
        mv      a0,s5
        lw      s5,4(sp)
        addi    sp,sp,32
        jr      ra
.L353:
        li      a0,16
        call    alloc_memory.constprop.0
        lw      a5,%lo(string_table)(s6)
        mv      s0,a0
        sw      s1,4(a0)
        lw      a5,0(a5)
        sw      s2,0(a0)
        addi    a0,s2,1
        add     a5,a5,s4
        lw      a5,0(a5)
        sw      a5,8(s0)
        call    alloc_memory.constprop.1
        mv      a1,s3
        mv      a2,s2
        sw      a0,12(s0)
        call    memcpy
        lw      a5,12(s0)
        lw      a4,%lo(string_table)(s6)
        lui     a1,%hi(string_count)
        add     a5,a5,s2
        sb      zero,0(a5)
        lw      a2,0(a4)
        lw      a3,8(a4)
        lw      a5,%lo(string_count)(a1)
        add     a2,a2,s4
        lw      s5,12(s0)
        addi    a3,a3,1
        sw      s0,0(a2)
        addi    a5,a5,1
        sw      a3,8(a4)
        sw      a5,%lo(string_count)(a1)
        j       .L350
create_string_check.constprop.1:
        addi    sp,sp,-48
        sw      s0,40(sp)
        sw      s3,28(sp)
        li      s0,-2128830464
        mv      s3,a1
        sw      ra,44(sp)
        sw      s1,36(sp)
        sw      s2,32(sp)
        sw      s4,24(sp)
        mv      a1,a0
        addi    s0,s0,-571
        beq     s3,zero,.L371
        li      a3,16777216
        mv      a5,a0
        addi    a3,a3,403
        add     a0,a0,s3
.L372:
        lbu     a4,0(a5)
        addi    a5,a5,1
        xor     s0,a4,s0
        mul     s0,s0,a3
        bne     a0,a5,.L372
.L371:
        lui     s4,%hi(string_table)
        lw      a5,%lo(string_table)(s4)
        li      a0,16
        sw      a1,12(sp)
        lw      s2,4(a5)
        call    alloc_memory.constprop.0
        lw      a5,%lo(string_table)(s4)
        remu    s2,s0,s2
        mv      s1,a0
        lw      a5,0(a5)
        sw      s0,4(a0)
        sw      s3,0(a0)
        addi    a0,s3,1
        slli    s2,s2,2
        add     a5,a5,s2
        lw      a5,0(a5)
        sw      a5,8(s1)
        call    alloc_memory.constprop.1
        lw      a1,12(sp)
        mv      a2,s3
        sw      a0,12(s1)
        call    memcpy
        lw      a5,12(s1)
        lw      a4,%lo(string_table)(s4)
        lui     a1,%hi(string_count)
        add     a5,a5,s3
        sb      zero,0(a5)
        lw      a2,0(a4)
        lw      a3,8(a4)
        lw      a5,%lo(string_count)(a1)
        lw      ra,44(sp)
        lw      s0,40(sp)
        add     a2,a2,s2
        sw      s1,0(a2)
        addi    a3,a3,1
        addi    a5,a5,1
        lw      a0,12(s1)
        sw      a5,%lo(string_count)(a1)
        sw      a3,8(a4)
        lw      s1,36(sp)
        lw      s2,32(sp)
        lw      s3,28(sp)
        lw      s4,24(sp)
        addi    sp,sp,48
        jr      ra
print_symbol.constprop.0:
        addi    sp,sp,-16
        lw      a5,12(a0)
        lw      a4,0(a0)
        sw      s1,4(sp)
        sw      s2,0(sp)
        mv      s1,a1
        lui     s2,%hi(.LC0)
        lui     a1,%hi(.LC1)
        sw      s0,8(sp)
        addi    a3,s2,%lo(.LC0)
        mv      s0,a0
        addi    a1,a1,%lo(.LC1)
        mv      a0,s1
        li      a2,16
        sw      ra,12(sp)
        call    fprintf
        lw      a5,8(s0)
        li      a4,6
        bgtu    a5,a4,.L377
        lui     a4,%hi(.L379)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L379)
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L379:
        .word   .L385
        .word   .L384
        .word   .L383
        .word   .L382
        .word   .L381
        .word   .L380
        .word   .L378
.L380:
        lui     a1,%hi(.LC7)
        addi    a1,a1,%lo(.LC7)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
.L386:
        lw      a4,4(s0)
        beq     a4,zero,.L387
.L391:
        lw      a5,12(a4)
        lw      a4,0(a4)
        lui     a1,%hi(.LC10)
        addi    a1,a1,%lo(.LC10)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
        lw      a5,8(s0)
        addi    a4,a5,-5
        addi    a5,a5,-1
        sltiu   a4,a4,2
        seqz    a5,a5
        or      a5,a4,a5
        beq     a5,zero,.L389
.L392:
        lw      a4,16(s0)
        lw      s0,8(sp)
        lw      ra,12(sp)
        addi    a3,s2,%lo(.LC0)
        mv      a0,s1
        lw      s2,0(sp)
        lw      s1,4(sp)
        lui     a1,%hi(.LC12)
        addi    a1,a1,%lo(.LC12)
        li      a2,16
        addi    sp,sp,16
        tail    fprintf
.L378:
        lui     a1,%hi(.LC8)
        addi    a1,a1,%lo(.LC8)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
        lw      a4,4(s0)
        bne     a4,zero,.L391
.L387:
        lui     a1,%hi(.LC11)
        addi    a1,a1,%lo(.LC11)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
        lw      a5,8(s0)
        addi    a4,a5,-5
        addi    a5,a5,-1
        sltiu   a4,a4,2
        seqz    a5,a5
        or      a5,a4,a5
        bne     a5,zero,.L392
.L389:
        lw      s0,8(sp)
        lw      ra,12(sp)
        addi    a3,s2,%lo(.LC0)
        mv      a0,s1
        lw      s2,0(sp)
        lw      s1,4(sp)
        lui     a1,%hi(.LC13)
        addi    a1,a1,%lo(.LC13)
        li      a2,16
        addi    sp,sp,16
        tail    fprintf
.L385:
        lui     a1,%hi(.LC2)
        addi    a1,a1,%lo(.LC2)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
        j       .L386
.L384:
        lui     a1,%hi(.LC3)
        addi    a1,a1,%lo(.LC3)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
        j       .L386
.L383:
        lui     a1,%hi(.LC4)
        addi    a1,a1,%lo(.LC4)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
        j       .L386
.L382:
        lui     a1,%hi(.LC5)
        addi    a1,a1,%lo(.LC5)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
        j       .L386
.L381:
        lui     a1,%hi(.LC6)
        addi    a1,a1,%lo(.LC6)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
        j       .L386
.L377:
        lui     a1,%hi(.LC9)
        addi    a1,a1,%lo(.LC9)
        addi    a3,s2,%lo(.LC0)
        li      a2,16
        mv      a0,s1
        call    fprintf
        j       .L386
.LC44:
        .string "[analyzer Error] at %s: First parameter of method must be 'self'\n"
.LC45:
        .string "[analyzer Error] at %s: Binary operations method must have exactly two parameters\n"
.LC46:
        .string "[analyzer Error] at %s: Second parameter of binary operations special method must not be NULL\n"
method_other_type.isra.0:
        lw      a5,8(a0)
        addi    sp,sp,-32
        sw      ra,28(sp)
        beq     a5,zero,.L395
        lw      a5,0(a5)
        beq     a5,zero,.L395
        lui     a4,%hi(KEYWORD_SELF)
        lw      a1,%lo(KEYWORD_SELF)(a4)
        li      a6,0
        li      a4,0
        li      a2,1
.L400:
        lw      a3,0(a5)
        beq     a3,zero,.L396
        bne     a4,zero,.L397
        lw      a3,0(a3)
        bne     a3,a1,.L413
.L398:
        addi    a4,a4,1
.L396:
        lw      a5,4(a5)
        bne     a5,zero,.L400
        li      a5,2
        bne     a4,a5,.L395
        beq     a6,zero,.L414
        lw      a6,4(a6)
        lw      ra,28(sp)
        mv      a0,a6
        addi    sp,sp,32
        jr      ra
.L413:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC44)
        addi    a1,a1,%lo(.LC44)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
.L404:
        li      a6,0
.L393:
        lw      ra,28(sp)
        mv      a0,a6
        addi    sp,sp,32
        jr      ra
.L397:
        bne     a4,a2,.L398
        mv      a6,a3
        j       .L398
.L395:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC45)
        addi    a1,a1,%lo(.LC45)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L404
.L414:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC46)
        addi    a1,a1,%lo(.LC46)
        sw      a6,12(sp)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        lw      a6,12(sp)
        sb      a4,%lo(has_error)(a5)
        j       .L393
.LC47:
        .string "[symbol_table Error] at <create_symbol> Symbol '%s' already exists in the current scope\n"
.LC48:
        .string "[symbol_table Warning] at <create_symbol> Symbol '%s' already exists in an outer scope, but with a different type or kind. Creating a new symbol in the current scope.\n"
create_symbol.constprop.0:
        addi    sp,sp,-32
        sw      s0,24(sp)
        sw      s1,20(sp)
        sw      s2,16(sp)
        sw      ra,28(sp)
        mv      s0,a2
        mv      s1,a0
        mv      s2,a1
        beq     a2,zero,.L416
        li      a0,2
        li      a1,0
.L423:
        mv      a2,s0
.L422:
        lw      a5,8(a2)
        lw      a4,0(a5)
        beq     a4,zero,.L417
        beq     a1,zero,.L421
.L418:
        lw      a5,0(a4)
        lw      a3,0(a5)
        beq     s1,a3,.L420
        lw      a4,4(a4)
        bne     a4,zero,.L418
.L417:
        lw      a2,0(a2)
        bne     a2,zero,.L422
        li      a1,1
        beq     a0,a1,.L416
        mv      a0,a1
        j       .L423
.L451:
        lw      a3,8(a5)
        beq     a3,zero,.L420
        lw      a4,4(a4)
        beq     a4,zero,.L417
.L421:
        lw      a5,0(a4)
        lw      a3,0(a5)
        beq     s1,a3,.L451
        lw      a4,4(a4)
        bne     a4,zero,.L421
        j       .L417
.L420:
        lw      a4,8(a5)
        beq     a4,zero,.L452
.L432:
        lw      a5,20(a5)
        lui     a4,%hi(stderr)
        lw      a0,%lo(stderr)(a4)
        beq     s0,a5,.L453
        lui     a1,%hi(.LC48)
        addi    a1,a1,%lo(.LC48)
        mv      a2,s1
        call    fprintf
.L416:
        li      a0,24
        call    alloc_memory.constprop.0
        lui     a4,%hi(symbol_count.0)
        lw      a3,%lo(symbol_count.0)(a4)
        sw      s1,0(a0)
        sw      zero,4(a0)
        addi    a2,a3,1
        sw      zero,8(a0)
        sw      s2,16(a0)
        sw      s0,20(a0)
        sw      a3,12(a0)
        sw      a2,%lo(symbol_count.0)(a4)
        mv      a5,a0
        beq     s0,zero,.L415
        lw      s0,8(s0)
        beq     s0,zero,.L454
        sw      a0,12(sp)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,12(sp)
        lw      a4,4(s0)
        sw      zero,4(a0)
        sw      a5,0(a0)
        beq     a4,zero,.L455
        sw      a0,4(a4)
        sw      a0,4(s0)
.L415:
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        lw      s2,16(sp)
        mv      a0,a5
        addi    sp,sp,32
        jr      ra
.L452:
        lw      a4,4(a5)
        bne     a4,zero,.L432
        j       .L415
.L455:
        sw      a0,0(s0)
        sw      a0,4(s0)
        j       .L415
.L453:
        lui     a1,%hi(.LC47)
        mv      a2,s1
        addi    a1,a1,%lo(.LC47)
        call    fprintf
        li      a5,0
        j       .L415
.L454:
        call    list_append.part.0
create_symbol.constprop.1:
        addi    sp,sp,-32
        sw      s0,24(sp)
        sw      s1,20(sp)
        sw      s2,16(sp)
        sw      ra,28(sp)
        mv      s2,a2
        mv      s1,a0
        mv      s0,a1
        beq     a2,zero,.L489
        beq     a1,zero,.L458
.L464:
        lw      a5,8(a2)
        lw      a4,0(a5)
        bne     a4,zero,.L461
        j       .L459
.L462:
        lw      a4,4(a4)
        beq     a4,zero,.L459
.L461:
        lw      a5,0(a4)
        lw      a3,0(a5)
        bne     s1,a3,.L462
        lw      a1,8(a5)
        li      a3,6
        bne     a1,a3,.L462
        lw      a3,4(a5)
        bne     s0,a3,.L462
.L463:
        lw      a3,8(a5)
        li      a4,6
        beq     a3,a4,.L521
.L481:
        lw      a5,20(a5)
        lui     a4,%hi(stderr)
        lw      a0,%lo(stderr)(a4)
        beq     s2,a5,.L522
        lui     a1,%hi(.LC48)
        addi    a1,a1,%lo(.LC48)
        mv      a2,s1
        call    fprintf
.L479:
        li      a0,24
        call    alloc_memory.constprop.0
        lui     a4,%hi(symbol_count.0)
        lw      a3,%lo(symbol_count.0)(a4)
        mv      a5,a0
        li      a0,6
        addi    a1,a3,1
        sw      s1,0(a5)
        sw      s0,4(a5)
        sw      zero,16(a5)
        sw      s2,20(a5)
        sw      a0,8(a5)
        sw      a3,12(a5)
        sw      a1,%lo(symbol_count.0)(a4)
        beq     s2,zero,.L456
        lw      s0,8(s2)
        beq     s0,zero,.L523
        li      a0,8
        sw      a5,12(sp)
        call    alloc_memory.constprop.0
        lw      a5,12(sp)
        lw      a3,4(s0)
        sw      zero,4(a0)
        sw      a5,0(a0)
        beq     a3,zero,.L524
        sw      a0,4(a3)
.L487:
        sw      a0,4(s0)
.L456:
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        lw      s2,16(sp)
        mv      a0,a5
        addi    sp,sp,32
        jr      ra
.L521:
        lw      a4,4(a5)
        bne     s0,a4,.L481
        j       .L456
.L524:
        sw      a0,0(s0)
        j       .L487
.L522:
        lui     a1,%hi(.LC47)
        mv      a2,s1
        addi    a1,a1,%lo(.LC47)
        call    fprintf
        li      a5,0
        j       .L456
.L465:
        lw      a2,0(a2)
        beq     a2,zero,.L489
.L458:
        lw      a5,8(a2)
        lw      a4,0(a5)
        bne     a4,zero,.L467
        j       .L465
.L466:
        lw      a4,4(a4)
        beq     a4,zero,.L465
.L467:
        lw      a5,0(a4)
        lw      a3,0(a5)
        bne     s1,a3,.L466
        lw      a1,8(a5)
        li      a3,6
        bne     a1,a3,.L466
        j       .L463
.L459:
        lw      a2,0(a2)
        bne     a2,zero,.L464
.L489:
        li      a1,0
        seqz    a0,s0
.L480:
        addi    a5,a1,-1
        seqz    a5,a5
        and     a5,a5,a0
        bne     a5,zero,.L479
        addi    a1,a1,1
        li      a5,3
        beq     a1,a5,.L479
        beq     s2,zero,.L480
        li      a5,2
        mv      a2,s2
        beq     a1,a5,.L477
.L473:
        lw      a5,8(a2)
        lw      a4,0(a5)
        beq     a4,zero,.L468
.L470:
        lw      a5,0(a4)
        lw      a3,0(a5)
        beq     s1,a3,.L469
.L471:
        lw      a4,4(a4)
        bne     a4,zero,.L470
.L468:
        lw      a2,0(a2)
        bne     a2,zero,.L473
        li      a1,1
        j       .L480
.L475:
        lw      a2,0(a2)
        beq     a2,zero,.L480
.L477:
        lw      a5,8(a2)
        lw      a4,0(a5)
        bne     a4,zero,.L476
        j       .L475
.L525:
        lw      a4,4(a4)
        beq     a4,zero,.L475
.L476:
        lw      a5,0(a4)
        lw      a3,0(a5)
        bne     s1,a3,.L525
        j       .L463
.L469:
        beq     s0,zero,.L463
.L472:
        lw      a3,4(a5)
        beq     s0,a3,.L463
        lw      a4,4(a4)
        beq     a4,zero,.L468
        lw      a5,0(a4)
        lw      a3,0(a5)
        bne     s1,a3,.L471
        j       .L472
.L523:
        call    list_append.part.0
.LC49:
        .string "%*sbase: {\n"
.LC50:
        .string "%*svar: {\n"
.LC51:
        .string "%*scall: {\n"
.LC52:
        .string "%*sarg[%d]: {\n"
.LC53:
        .string "%*sprimary: {\n"
.LC54:
        .string "%*sattribute: {\n"
.LC55:
        .string "%*sindex: {\n"
.LC56:
        .string "%*serror: \"Unknown variable access type\"\n"
print_variable_access:
        lw      a5,0(a0)
        addi    sp,sp,-80
        slli    a4,a2,2
        sw      s0,72(sp)
        sw      s1,68(sp)
        sw      s6,48(sp)
        sw      s10,32(sp)
        sw      ra,76(sp)
        sw      a4,12(sp)
        mv      s1,a0
        mv      s6,a2
        mv      s0,a1
        lui     s10,%hi(.LC0)
        beq     a5,zero,.L527
        lui     a1,%hi(.LC49)
        mv      a2,a4
        addi    a3,s10,%lo(.LC0)
        addi    a1,a1,%lo(.LC49)
        mv      a0,s0
        sw      s2,64(sp)
        mv      s2,a4
        call    fprintf
        lw      a0,0(s1)
        addi    a2,s6,1
        mv      a1,s0
        call    print_variable_access
        lui     a5,%hi(.LC22)
        mv      a2,s2
        addi    a3,s10,%lo(.LC0)
        mv      a0,s0
        addi    a1,a5,%lo(.LC22)
        call    fprintf
        lw      s2,64(sp)
.L527:
        lw      a5,12(s1)
        li      a4,2
        beq     a5,a4,.L528
        bgtu    a5,a4,.L529
        beq     a5,zero,.L556
        lui     a1,%hi(.LC51)
        addi    a1,a1,%lo(.LC51)
        addi    a3,s10,%lo(.LC0)
        slli    a2,s6,2
        mv      a0,s0
        sw      s2,64(sp)
        sw      s3,60(sp)
        sw      s4,56(sp)
        sw      s5,52(sp)
        sw      s7,44(sp)
        sw      s9,36(sp)
        sw      s11,28(sp)
        call    fprintf
        lw      a5,4(s1)
        beq     a5,zero,.L553
        lw      s9,0(a5)
        beq     s9,zero,.L553
        addi    s1,s6,1
        lui     a5,%hi(.LC22)
        slli    s1,s1,2
        sw      a5,8(sp)
        addi    a5,s1,4
        lui     a4,%hi(.LC53)
        sw      a5,0(sp)
        lui     a5,%hi(.LC22)
        lui     s4,%hi(.LC52)
        addi    s5,a5,%lo(.LC22)
        addi    a5,a4,%lo(.LC53)
        addi    s4,s4,%lo(.LC52)
        sw      a5,4(sp)
        li      a4,0
        addi    s2,s10,%lo(.LC0)
        li      s7,21
        j       .L539
.L537:
        call    print_expression.part.0
.L538:
        mv      a3,s2
        mv      a2,s1
        mv      a1,s5
        mv      a0,s0
        call    fprintf
        mv      a4,s3
.L536:
        lw      s9,4(s9)
        beq     s9,zero,.L535
.L539:
        lw      s11,0(s9)
        mv      a3,s2
        mv      a2,s1
        mv      a1,s4
        mv      a0,s0
        addi    s3,a4,1
        beq     s11,zero,.L536
        call    fprintf
        lw      a4,8(s11)
        addi    a2,s6,2
        mv      a1,s0
        mv      a0,s11
        bne     a4,s7,.L537
        lw      a2,0(sp)
        lw      a1,4(sp)
        mv      a3,s2
        mv      a0,s0
        call    fprintf
        lw      a0,0(s11)
        addi    a2,s6,3
        mv      a1,s0
        call    print_primary
        lw      a2,0(sp)
        mv      a3,s2
        mv      a1,s5
        mv      a0,s0
        call    fprintf
        j       .L538
.L529:
        li      a4,3
        bne     a5,a4,.L557
        lui     a1,%hi(.LC55)
        slli    a2,s6,2
        addi    a1,a1,%lo(.LC55)
        addi    a3,s10,%lo(.LC0)
        mv      a0,s0
        call    fprintf
        lw      s1,4(s1)
        li      a5,21
        addi    a2,s6,1
        lw      a4,8(s1)
        beq     a4,a5,.L558
        mv      a0,s1
        mv      a1,s0
        call    print_expression.part.0
        lui     a5,%hi(.LC22)
        sw      a5,8(sp)
.L542:
        lw      a5,8(sp)
        mv      a0,s0
        lw      s0,72(sp)
        lw      a2,12(sp)
        lw      ra,76(sp)
        lw      s1,68(sp)
        lw      s6,48(sp)
        addi    a3,s10,%lo(.LC0)
        lw      s10,32(sp)
        addi    a1,a5,%lo(.LC22)
        addi    sp,sp,80
        tail    fprintf
.L556:
        lui     a1,%hi(.LC50)
        addi    a1,a1,%lo(.LC50)
.L555:
        addi    a3,s10,%lo(.LC0)
        slli    a2,s6,2
        mv      a0,s0
        call    fprintf
        lw      a0,4(s1)
        addi    a2,s6,1
        mv      a1,s0
        call    print_symbol
        mv      a0,s0
        lw      s0,72(sp)
        lw      ra,76(sp)
        lw      s1,68(sp)
        addi    a3,s10,%lo(.LC0)
        slli    a2,s6,2
        lw      s10,32(sp)
        lw      s6,48(sp)
        lui     a1,%hi(.LC22)
        addi    a1,a1,%lo(.LC22)
        addi    sp,sp,80
        tail    fprintf
.L557:
        mv      a0,s0
        lw      s0,72(sp)
        lw      a2,12(sp)
        lw      ra,76(sp)
        lw      s1,68(sp)
        lw      s6,48(sp)
        addi    a3,s10,%lo(.LC0)
        lw      s10,32(sp)
        lui     a1,%hi(.LC56)
        addi    a1,a1,%lo(.LC56)
        addi    sp,sp,80
        tail    fprintf
.L528:
        lui     a1,%hi(.LC54)
        addi    a1,a1,%lo(.LC54)
        j       .L555
.L553:
        lui     a5,%hi(.LC22)
        sw      a5,8(sp)
.L535:
        lw      a5,8(sp)
        mv      a0,s0
        lw      s0,72(sp)
        lw      a2,12(sp)
        lw      s2,64(sp)
        lw      s3,60(sp)
        lw      s4,56(sp)
        lw      s5,52(sp)
        lw      s7,44(sp)
        lw      s9,36(sp)
        lw      s11,28(sp)
        lw      ra,76(sp)
        lw      s1,68(sp)
        lw      s6,48(sp)
        addi    a3,s10,%lo(.LC0)
        lw      s10,32(sp)
        addi    a1,a5,%lo(.LC22)
        addi    sp,sp,80
        tail    fprintf
.L558:
        sw      s2,64(sp)
        lui     a1,%hi(.LC53)
        slli    s2,a2,2
        mv      a2,s2
        addi    a3,s10,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        mv      a0,s0
        call    fprintf
        lw      a0,0(s1)
        addi    a2,s6,2
        mv      a1,s0
        call    print_primary
        lui     a5,%hi(.LC22)
        mv      a2,s2
        addi    a3,s10,%lo(.LC0)
        mv      a0,s0
        addi    a1,a5,%lo(.LC22)
        sw      a5,8(sp)
        call    fprintf
        lw      s2,64(sp)
        j       .L542
.LC57:
        .string "%*sint literal: %s\n"
.LC58:
        .string "%*sfloat literal: %s\n"
.LC59:
        .string "%*sstring literal: \"%s\"\n"
.LC60:
        .string "%*sbool literal: %s\n"
.LC61:
        .string "%*snot: {\n"
.LC62:
        .string "%*sneg: {\n"
.LC63:
        .string "%*sexp: {\n"
.LC64:
        .string "%*serror: \"Unknown primary type\"\n"
print_primary:
        lw      a5,8(a0)
        li      a4,7
        bgtu    a5,a4,.L560
        lui     a3,%hi(.L562)
        slli    a5,a5,2
        addi    a3,a3,%lo(.L562)
        add     a5,a5,a3
        lw      a5,0(a5)
        addi    sp,sp,-32
        sw      ra,28(sp)
        mv      a6,a1
        jr      a5
.L562:
        .word   .L569
        .word   .L568
        .word   .L567
        .word   .L566
        .word   .L565
        .word   .L564
        .word   .L563
        .word   .L561
.L563:
        slli    a5,a2,2
        lui     t1,%hi(.LC0)
        lui     a1,%hi(.LC61)
        sw      a2,8(sp)
        sw      a0,12(sp)
        mv      a2,a5
        sw      a5,4(sp)
        addi    a3,t1,%lo(.LC0)
        addi    a1,a1,%lo(.LC61)
.L575:
        mv      a0,a6
        sw      a6,0(sp)
        call    fprintf
        lw      a4,12(sp)
        lw      a7,8(sp)
        lw      a1,0(sp)
        lw      a0,0(a4)
        addi    a2,a7,1
        call    print_primary
        lw      a2,4(sp)
        lw      a0,0(sp)
        lw      ra,28(sp)
        lui     a1,%hi(.LC22)
        lui     t1,%hi(.LC0)
        addi    a3,t1,%lo(.LC0)
        addi    a1,a1,%lo(.LC22)
        addi    sp,sp,32
        tail    fprintf
.L561:
        lw      ra,28(sp)
        lw      a0,0(a0)
        addi    sp,sp,32
        tail    print_variable_access
.L569:
        lw      a4,0(a0)
        lw      ra,28(sp)
        lui     a3,%hi(.LC0)
        lui     a1,%hi(.LC57)
        slli    a2,a2,2
        mv      a0,a6
        addi    a3,a3,%lo(.LC0)
        addi    a1,a1,%lo(.LC57)
        addi    sp,sp,32
        tail    fprintf
.L568:
        lw      a4,0(a0)
        lw      ra,28(sp)
        lui     a3,%hi(.LC0)
        lui     a1,%hi(.LC58)
        slli    a2,a2,2
        mv      a0,a6
        addi    a3,a3,%lo(.LC0)
        addi    a1,a1,%lo(.LC58)
        addi    sp,sp,32
        tail    fprintf
.L567:
        lw      a4,0(a0)
        lw      ra,28(sp)
        lui     a3,%hi(.LC0)
        lui     a1,%hi(.LC59)
        slli    a2,a2,2
        mv      a0,a6
        addi    a3,a3,%lo(.LC0)
        addi    a1,a1,%lo(.LC59)
        addi    sp,sp,32
        tail    fprintf
.L566:
        lw      a4,0(a0)
        lw      ra,28(sp)
        lui     a3,%hi(.LC0)
        lui     a1,%hi(.LC60)
        slli    a2,a2,2
        mv      a0,a6
        addi    a3,a3,%lo(.LC0)
        addi    a1,a1,%lo(.LC60)
        addi    sp,sp,32
        tail    fprintf
.L565:
        lui     a5,%hi(.LC0)
        sw      s1,20(sp)
        lui     a1,%hi(.LC63)
        slli    s1,a2,2
        addi    a3,a5,%lo(.LC0)
        sw      a0,8(sp)
        sw      a2,4(sp)
        addi    a1,a1,%lo(.LC63)
        mv      a2,s1
        mv      a0,a6
        sw      a6,0(sp)
        call    fprintf
        lw      a4,8(sp)
        lw      a7,4(sp)
        lw      a5,0(a4)
        li      a4,21
        addi    a2,a7,1
        lw      a3,8(a5)
        beq     a3,a4,.L576
        lw      a1,0(sp)
        mv      a0,a5
        call    print_expression.part.0
        lw      a6,0(sp)
        lui     a5,%hi(.LC22)
.L571:
        lw      ra,28(sp)
        mv      a2,s1
        lw      s1,20(sp)
        lui     a4,%hi(.LC0)
        addi    a3,a4,%lo(.LC0)
        addi    a1,a5,%lo(.LC22)
        mv      a0,a6
        addi    sp,sp,32
        tail    fprintf
.L564:
        slli    a5,a2,2
        lui     t1,%hi(.LC0)
        lui     a1,%hi(.LC62)
        sw      a2,8(sp)
        sw      a0,12(sp)
        mv      a2,a5
        sw      a5,4(sp)
        addi    a3,t1,%lo(.LC0)
        addi    a1,a1,%lo(.LC62)
        j       .L575
.L560:
        lui     a3,%hi(.LC0)
        lui     a5,%hi(.LC64)
        mv      a0,a1
        slli    a2,a2,2
        addi    a3,a3,%lo(.LC0)
        addi    a1,a5,%lo(.LC64)
        tail    fprintf
.L576:
        lw      a0,0(sp)
        slli    a4,a2,2
        sw      s0,24(sp)
        lui     a1,%hi(.LC53)
        lui     s0,%hi(.LC0)
        mv      a2,a4
        addi    a3,s0,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        sw      a4,4(sp)
        sw      a7,12(sp)
        sw      a5,8(sp)
        call    fprintf
        lw      a5,8(sp)
        lw      a7,12(sp)
        lw      a1,0(sp)
        lw      a0,0(a5)
        addi    a2,a7,2
        call    print_primary
        lw      a6,0(sp)
        lw      a2,4(sp)
        lui     a5,%hi(.LC22)
        addi    a3,s0,%lo(.LC0)
        mv      a0,a6
        addi    a1,a5,%lo(.LC22)
        sw      a6,4(sp)
        sw      a5,0(sp)
        call    fprintf
        lw      a5,0(sp)
        lw      a6,4(sp)
        lw      s0,24(sp)
        j       .L571
.LC65:
        .string "(unknown operator)"
.LC66:
        .string "%*sleft: {\n"
.LC67:
        .string "%*soperator: \"%s\"\n"
.LC68:
        .string "%*sright: {\n"
print_expression.part.0:
        addi    sp,sp,-48
        sw      s0,40(sp)
        sw      s1,36(sp)
        mv      s0,a1
        lui     s1,%hi(.LC0)
        lui     a1,%hi(.LC66)
        sw      s4,24(sp)
        sw      s6,16(sp)
        mv      s4,a0
        mv      s6,a2
        mv      a0,s0
        slli    a2,a2,2
        addi    a3,s1,%lo(.LC0)
        addi    a1,a1,%lo(.LC66)
        sw      s3,28(sp)
        sw      s5,20(sp)
        sw      ra,44(sp)
        call    fprintf
        lw      s5,0(s4)
        li      a5,21
        addi    s3,s6,1
        lw      a4,8(s5)
        beq     a4,a5,.L585
        mv      a0,s5
        mv      a2,s3
        mv      a1,s0
        call    print_expression.part.0
        lui     s5,%hi(.LC22)
.L579:
        addi    a3,s1,%lo(.LC0)
        slli    a2,s6,2
        addi    a1,s5,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        lw      a5,8(s4)
        li      a4,21
        bgtu    a5,a4,.L583
        lui     a4,%hi(.LANCHOR0)
        addi    a4,a4,%lo(.LANCHOR0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a4,0(a5)
.L580:
        lui     a1,%hi(.LC67)
        addi    a1,a1,%lo(.LC67)
        addi    a3,s1,%lo(.LC0)
        slli    a2,s6,2
        mv      a0,s0
        call    fprintf
        lui     a1,%hi(.LC68)
        addi    a3,s1,%lo(.LC0)
        slli    a2,s6,2
        mv      a0,s0
        addi    a1,a1,%lo(.LC68)
        call    fprintf
        lw      s4,4(s4)
        li      a5,21
        lw      a4,8(s4)
        beq     a4,a5,.L586
        mv      a2,s3
        mv      a0,s4
        mv      a1,s0
        call    print_expression.part.0
.L582:
        mv      a0,s0
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s3,28(sp)
        lw      s4,24(sp)
        addi    a3,s1,%lo(.LC0)
        slli    a2,s6,2
        lw      s1,36(sp)
        lw      s6,16(sp)
        addi    a1,s5,%lo(.LC22)
        lw      s5,20(sp)
        addi    sp,sp,48
        tail    fprintf
.L583:
        lui     a4,%hi(.LC65)
        addi    a4,a4,%lo(.LC65)
        j       .L580
.L585:
        slli    a5,s3,2
        lui     a1,%hi(.LC53)
        mv      a2,a5
        addi    a3,s1,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        mv      a0,s0
        sw      a5,12(sp)
        call    fprintf
        lw      a0,0(s5)
        addi    a2,s6,2
        mv      a1,s0
        call    print_primary
        lw      a2,12(sp)
        lui     s5,%hi(.LC22)
        addi    a3,s1,%lo(.LC0)
        mv      a0,s0
        addi    a1,s5,%lo(.LC22)
        call    fprintf
        j       .L579
.L586:
        lui     a1,%hi(.LC53)
        addi    a3,s1,%lo(.LC0)
        slli    a2,s3,2
        addi    a1,a1,%lo(.LC53)
        mv      a0,s0
        call    fprintf
        lw      a0,0(s4)
        addi    a2,s6,2
        mv      a1,s0
        call    print_primary
        slli    a2,s3,2
        addi    a3,s1,%lo(.LC0)
        addi    a1,s5,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        j       .L582
.LC69:
        .string "%*svariable: {\n"
.LC70:
        .string "%*sname: {\n"
.LC71:
        .string "%*sinitializer: {\n"
.LC72:
        .string "%*sinitializer: null\n"
print_variable:
        addi    sp,sp,-48
        sw      s0,40(sp)
        sw      s1,36(sp)
        mv      s0,a1
        lui     s1,%hi(.LC0)
        sw      s3,28(sp)
        lui     a1,%hi(.LC69)
        slli    s3,a2,2
        sw      s5,20(sp)
        sw      s7,12(sp)
        mv      s5,a0
        mv      s7,a2
        addi    a3,s1,%lo(.LC0)
        mv      a2,s3
        addi    a1,a1,%lo(.LC69)
        mv      a0,s0
        sw      ra,44(sp)
        sw      s4,24(sp)
        sw      s6,16(sp)
        call    fprintf
        lui     a1,%hi(.LC70)
        addi    a3,s1,%lo(.LC0)
        addi    a2,s3,4
        addi    a1,a1,%lo(.LC70)
        mv      a0,s0
        call    fprintf
        lw      a0,0(s5)
        addi    s6,s7,2
        mv      a2,s6
        mv      a1,s0
        call    print_symbol
        lui     s4,%hi(.LC22)
        addi    a3,s1,%lo(.LC0)
        addi    a2,s3,4
        mv      a0,s0
        addi    a1,s4,%lo(.LC22)
        call    fprintf
        lw      a5,4(s5)
        beq     a5,zero,.L588
        lui     a1,%hi(.LC71)
        addi    a1,a1,%lo(.LC71)
        addi    a3,s1,%lo(.LC0)
        addi    a2,s3,4
        mv      a0,s0
        call    fprintf
        lw      s5,4(s5)
        li      a5,21
        lw      a4,8(s5)
        beq     a4,a5,.L593
        mv      a2,s6
        mv      a0,s5
        mv      a1,s0
        call    print_expression.part.0
.L590:
        addi    a2,s3,4
        addi    a3,s1,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L591:
        mv      a0,s0
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s5,20(sp)
        lw      s6,16(sp)
        lw      s7,12(sp)
        addi    a3,s1,%lo(.LC0)
        mv      a2,s3
        lw      s1,36(sp)
        lw      s3,28(sp)
        addi    a1,s4,%lo(.LC22)
        lw      s4,24(sp)
        addi    sp,sp,48
        tail    fprintf
.L593:
        lui     a1,%hi(.LC53)
        addi    a3,s1,%lo(.LC0)
        slli    a2,s6,2
        addi    a1,a1,%lo(.LC53)
        mv      a0,s0
        call    fprintf
        lw      a0,0(s5)
        addi    a2,s7,3
        mv      a1,s0
        call    print_primary
        slli    a2,s6,2
        addi    a3,s1,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        j       .L590
.L588:
        lui     a1,%hi(.LC72)
        addi    a2,s3,4
        addi    a1,a1,%lo(.LC72)
        addi    a3,s1,%lo(.LC0)
        mv      a0,s0
        call    fprintf
        j       .L591
find_method:
        li      a5,20
        bgtu    a1,a5,.L718
        lui     a4,%hi(.L597)
        addi    a4,a4,%lo(.L597)
        slli    a5,a1,2
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L597:
        .word   .L611
        .word   .L610
        .word   .L609
        .word   .L608
        .word   .L607
        .word   .L718
        .word   .L606
        .word   .L605
        .word   .L604
        .word   .L603
        .word   .L602
        .word   .L601
        .word   .L718
        .word   .L718
        .word   .L718
        .word   .L718
        .word   .L718
        .word   .L600
        .word   .L599
        .word   .L598
        .word   .L596
.L718:
        li      a5,0
.L594:
        mv      a0,a5
        ret
.L596:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_NOT)
        lw      a3,%lo(SPECIAL_NOT)(a5)
        li      a6,0
        li      a7,2
.L697:
        mv      a1,a0
.L696:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L692
        beq     a6,zero,.L695
.L693:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L693
.L692:
        lw      a1,0(a1)
        bne     a1,zero,.L696
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L697
.L611:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_ADD)
        lw      a3,%lo(SPECIAL_ADD)(a5)
        li      a7,2
        li      a6,0
.L618:
        mv      a1,a0
.L617:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L613
        beq     a6,zero,.L616
.L614:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L614
.L613:
        lw      a1,0(a1)
        bne     a1,zero,.L617
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L618
.L610:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_SUB)
        lw      a3,%lo(SPECIAL_SUB)(a5)
        li      t1,2
        li      a7,0
.L624:
        mv      a6,a0
.L623:
        lw      a5,8(a6)
        lw      a4,0(a5)
        beq     a4,zero,.L619
        beq     a7,zero,.L622
.L620:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L620
.L619:
        lw      a6,0(a6)
        bne     a6,zero,.L623
        li      a7,1
        beq     t1,a7,.L718
        mv      t1,a1
        j       .L624
.L609:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_MUL)
        lw      a3,%lo(SPECIAL_MUL)(a5)
        li      a7,0
.L630:
        mv      a6,a0
.L629:
        lw      a5,8(a6)
        lw      a4,0(a5)
        beq     a4,zero,.L625
        beq     a7,zero,.L628
.L626:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L626
.L625:
        lw      a6,0(a6)
        bne     a6,zero,.L629
        li      a7,1
        beq     a1,a7,.L718
        mv      a1,a7
        j       .L630
.L608:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_DIV)
        lw      a3,%lo(SPECIAL_DIV)(a5)
        li      a7,2
        li      a6,0
.L636:
        mv      a1,a0
.L635:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L631
        beq     a6,zero,.L634
.L632:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L632
.L631:
        lw      a1,0(a1)
        bne     a1,zero,.L635
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L636
.L607:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_MOD)
        lw      a3,%lo(SPECIAL_MOD)(a5)
        li      a7,2
        li      a6,0
.L642:
        mv      a1,a0
.L641:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L637
        beq     a6,zero,.L640
.L638:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L638
.L637:
        lw      a1,0(a1)
        bne     a1,zero,.L641
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L642
.L606:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_EQ)
        lw      a3,%lo(SPECIAL_EQ)(a5)
        li      a7,2
        li      a6,0
.L648:
        mv      a1,a0
.L647:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L643
        beq     a6,zero,.L646
.L644:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L644
.L643:
        lw      a1,0(a1)
        bne     a1,zero,.L647
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L648
.L605:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_NE)
        lw      a3,%lo(SPECIAL_NE)(a5)
        li      a7,2
        li      a6,0
.L654:
        mv      a1,a0
.L653:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L649
        beq     a6,zero,.L652
.L650:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L650
.L649:
        lw      a1,0(a1)
        bne     a1,zero,.L653
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L654
.L604:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_LT)
        lw      a3,%lo(SPECIAL_LT)(a5)
        li      a7,2
        li      a6,0
.L660:
        mv      a1,a0
.L659:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L655
        beq     a6,zero,.L658
.L656:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L656
.L655:
        lw      a1,0(a1)
        bne     a1,zero,.L659
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L660
.L603:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_GT)
        lw      a3,%lo(SPECIAL_GT)(a5)
        li      a7,2
        li      a6,0
.L673:
        mv      a1,a0
.L672:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L668
        beq     a6,zero,.L671
.L669:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L669
.L668:
        lw      a1,0(a1)
        bne     a1,zero,.L672
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L673
.L602:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_LE)
        lw      a3,%lo(SPECIAL_LE)(a5)
        li      a7,2
        li      a6,0
.L679:
        mv      a1,a0
.L678:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L674
        beq     a6,zero,.L677
.L675:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L675
.L674:
        lw      a1,0(a1)
        bne     a1,zero,.L678
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L679
.L601:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_GE)
        lw      a3,%lo(SPECIAL_GE)(a5)
        li      a7,2
        li      a6,0
.L666:
        mv      a1,a0
.L665:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L661
        beq     a6,zero,.L664
.L662:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L662
.L661:
        lw      a1,0(a1)
        bne     a1,zero,.L665
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L666
.L600:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_AND)
        lw      a3,%lo(SPECIAL_AND)(a5)
        li      a7,2
        li      a6,0
.L685:
        mv      a1,a0
.L684:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L680
        beq     a6,zero,.L683
.L681:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L681
.L680:
        lw      a1,0(a1)
        bne     a1,zero,.L684
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L685
.L599:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_OR)
        lw      a3,%lo(SPECIAL_OR)(a5)
        li      a7,2
        li      a6,0
.L691:
        mv      a1,a0
.L690:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L686
        beq     a6,zero,.L689
.L687:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L687
.L686:
        lw      a1,0(a1)
        bne     a1,zero,.L690
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L691
.L598:
        beq     a0,zero,.L718
        lui     a5,%hi(SPECIAL_NEG)
        lw      a3,%lo(SPECIAL_NEG)(a5)
        li      a7,2
        li      a6,0
.L703:
        mv      a1,a0
.L702:
        lw      a5,8(a1)
        lw      a4,0(a5)
        beq     a4,zero,.L698
        beq     a6,zero,.L701
.L699:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L594
        lw      a4,4(a4)
        bne     a4,zero,.L699
.L698:
        lw      a1,0(a1)
        bne     a1,zero,.L702
        li      a6,1
        beq     a7,a6,.L718
        mv      a7,a6
        j       .L703
.L701:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L867
.L700:
        lw      a4,4(a4)
        bne     a4,zero,.L701
        j       .L698
.L689:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L868
.L688:
        lw      a4,4(a4)
        bne     a4,zero,.L689
        j       .L686
.L695:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L869
.L694:
        lw      a4,4(a4)
        bne     a4,zero,.L695
        j       .L692
.L683:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L870
.L682:
        lw      a4,4(a4)
        bne     a4,zero,.L683
        j       .L680
.L664:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L871
.L663:
        lw      a4,4(a4)
        bne     a4,zero,.L664
        j       .L661
.L671:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L872
.L670:
        lw      a4,4(a4)
        bne     a4,zero,.L671
        j       .L668
.L677:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L873
.L676:
        lw      a4,4(a4)
        bne     a4,zero,.L677
        j       .L674
.L658:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L874
.L657:
        lw      a4,4(a4)
        bne     a4,zero,.L658
        j       .L655
.L652:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L875
.L651:
        lw      a4,4(a4)
        bne     a4,zero,.L652
        j       .L649
.L628:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L876
.L627:
        lw      a4,4(a4)
        bne     a4,zero,.L628
        j       .L625
.L640:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L877
.L639:
        lw      a4,4(a4)
        bne     a4,zero,.L640
        j       .L637
.L616:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L878
.L615:
        lw      a4,4(a4)
        bne     a4,zero,.L616
        j       .L613
.L646:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L879
.L645:
        lw      a4,4(a4)
        bne     a4,zero,.L646
        j       .L643
.L622:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L880
.L621:
        lw      a4,4(a4)
        bne     a4,zero,.L622
        j       .L619
.L634:
        lw      a5,0(a4)
        lw      a2,0(a5)
        beq     a3,a2,.L881
.L633:
        lw      a4,4(a4)
        bne     a4,zero,.L634
        j       .L631
.L880:
        lw      t3,8(a5)
        li      a2,4
        bne     t3,a2,.L621
        j       .L594
.L878:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L615
        j       .L594
.L876:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L627
        j       .L594
.L877:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L639
        j       .L594
.L875:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L651
        j       .L594
.L879:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L645
        j       .L594
.L874:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L657
        j       .L594
.L881:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L633
        j       .L594
.L867:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L700
        j       .L594
.L868:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L688
        j       .L594
.L869:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L694
        j       .L594
.L871:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L663
        j       .L594
.L870:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L682
        j       .L594
.L872:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L670
        j       .L594
.L873:
        lw      t1,8(a5)
        li      a2,4
        bne     t1,a2,.L676
        j       .L594
.LC73:
        .string "[output Warning] at <print_statement>: Cannot exist declare list in statement. This should have been split into multiple declare statements in the parsing stage.\n"
.LC74:
        .string "%*sbreak: null\n"
.LC75:
        .string "%*scontinue: null\n"
.LC76:
        .string "%*sreturn: null\n"
.LC77:
        .string "%*sreturn: {\n"
.LC78:
        .string "%*sexpression: {\n"
.LC79:
        .string "%*serror: \"Unknown statement type\"\n"
print_statement:
        lw      a5,4(a0)
        li      a4,8
        bgtu    a5,a4,.L883
        lui     a4,%hi(.L885)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L885)
        add     a5,a5,a4
        lw      a5,0(a5)
        addi    sp,sp,-48
        sw      s0,40(sp)
        sw      s1,36(sp)
        sw      s2,32(sp)
        sw      ra,44(sp)
        mv      s2,a2
        mv      s1,a1
        mv      s0,a0
        jr      a5
.L885:
        .word   .L893
        .word   .L892
        .word   .L891
        .word   .L890
        .word   .L889
        .word   .L888
        .word   .L887
        .word   .L886
        .word   .L884
.L886:
        lw      a5,0(a0)
        sw      s4,24(sp)
        slli    s4,a2,2
        beq     a5,zero,.L912
        lui     a5,%hi(.LC0)
        lui     a1,%hi(.LC77)
        addi    a3,a5,%lo(.LC0)
        mv      a2,s4
        addi    a1,a1,%lo(.LC77)
        mv      a0,s1
        sw      s3,28(sp)
        mv      s3,a5
        call    fprintf
        lw      s0,0(s0)
        li      a5,21
        addi    a2,s2,1
        lw      a4,8(s0)
        beq     a4,a5,.L913
        mv      a0,s0
        mv      a1,s1
        call    print_expression.part.0
        lui     s0,%hi(.LC22)
.L901:
        addi    a3,s3,%lo(.LC0)
        mv      a2,s4
        lw      s3,28(sp)
        lw      s4,24(sp)
        addi    a1,s0,%lo(.LC22)
        mv      a0,s1
        j       .L911
.L884:
        lui     a5,%hi(.LC0)
        lui     a1,%hi(.LC78)
        slli    a2,a2,2
        addi    a3,a5,%lo(.LC0)
        addi    a1,a1,%lo(.LC78)
        mv      a0,s1
        sw      s3,28(sp)
        mv      s3,a5
        call    fprintf
        lw      s0,0(s0)
        li      a5,21
        addi    a2,s2,1
        lw      a4,8(s0)
        beq     a4,a5,.L914
        mv      a0,s0
        mv      a1,s1
        call    print_expression.part.0
        lui     s0,%hi(.LC22)
.L903:
        addi    a3,s3,%lo(.LC0)
        lw      s3,28(sp)
        slli    a2,s2,2
        addi    a1,s0,%lo(.LC22)
        mv      a0,s1
.L911:
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s1,36(sp)
        lw      s2,32(sp)
        addi    sp,sp,48
        tail    fprintf
.L893:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC73)
        addi    a0,a0,%lo(.LC73)
        li      a2,162
        li      a1,1
        call    fwrite
        lw      a5,0(s0)
        beq     a5,zero,.L882
        lw      s0,0(a5)
        beq     s0,zero,.L882
.L898:
        lw      a0,0(s0)
        beq     a0,zero,.L896
        mv      a2,s2
        mv      a1,s1
        call    print_variable
        lw      s0,4(s0)
        bne     s0,zero,.L898
.L882:
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        lw      s2,32(sp)
        addi    sp,sp,48
        jr      ra
.L890:
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s1,36(sp)
        lw      s2,32(sp)
        lw      a0,0(a0)
        addi    sp,sp,48
        tail    print_for
.L889:
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s1,36(sp)
        lw      s2,32(sp)
        lw      a0,0(a0)
        addi    sp,sp,48
        tail    print_while
.L888:
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s2,32(sp)
        mv      a0,s1
        lw      s1,36(sp)
        lui     a3,%hi(.LC0)
        lui     a1,%hi(.LC74)
        slli    a2,a2,2
        addi    a3,a3,%lo(.LC0)
        addi    a1,a1,%lo(.LC74)
        addi    sp,sp,48
        tail    fprintf
.L887:
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s2,32(sp)
        mv      a0,s1
        lw      s1,36(sp)
        lui     a3,%hi(.LC0)
        lui     a1,%hi(.LC75)
        slli    a2,a2,2
        addi    a3,a3,%lo(.LC0)
        addi    a1,a1,%lo(.LC75)
        addi    sp,sp,48
        tail    fprintf
.L892:
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s1,36(sp)
        lw      s2,32(sp)
        lw      a0,0(a0)
        addi    sp,sp,48
        tail    print_variable
.L891:
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s1,36(sp)
        lw      s2,32(sp)
        lw      a0,0(a0)
        addi    sp,sp,48
        tail    print_if
.L896:
        lw      s0,4(s0)
        bne     s0,zero,.L898
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        lw      s2,32(sp)
        addi    sp,sp,48
        jr      ra
.L883:
        lui     a3,%hi(.LC0)
        lui     a5,%hi(.LC79)
        mv      a0,a1
        slli    a2,a2,2
        addi    a3,a3,%lo(.LC0)
        addi    a1,a5,%lo(.LC79)
        tail    fprintf
.L913:
        slli    a5,a2,2
        lui     a1,%hi(.LC53)
        mv      a2,a5
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        mv      a0,s1
        sw      a5,12(sp)
        call    fprintf
        lw      a0,0(s0)
        addi    a2,s2,2
        mv      a1,s1
        call    print_primary
        lw      a2,12(sp)
        lui     s0,%hi(.LC22)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s1
        addi    a1,s0,%lo(.LC22)
        call    fprintf
        j       .L901
.L914:
        slli    a5,a2,2
        lui     a1,%hi(.LC53)
        mv      a2,a5
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        mv      a0,s1
        sw      a5,12(sp)
        call    fprintf
        lw      a0,0(s0)
        addi    a2,s2,2
        mv      a1,s1
        call    print_primary
        lw      a2,12(sp)
        lui     s0,%hi(.LC22)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s1
        addi    a1,s0,%lo(.LC22)
        call    fprintf
        j       .L903
.L912:
        lui     a3,%hi(.LC0)
        lui     a1,%hi(.LC76)
        mv      a2,s4
        mv      a0,s1
        lw      s4,24(sp)
        addi    a3,a3,%lo(.LC0)
        addi    a1,a1,%lo(.LC76)
        j       .L911
.LC80:
        .string "%*sif: {\n"
.LC81:
        .string "%*scondition: {\n"
.LC82:
        .string "%*sbody: {\n"
.LC83:
        .string "%*selif_list: {\n"
.LC84:
        .string "%*selse_body: {\n"
print_if:
        addi    sp,sp,-96
        slli    a5,a2,2
        sw      s0,88(sp)
        sw      s8,56(sp)
        mv      s0,a1
        lui     s8,%hi(.LC0)
        lui     a1,%hi(.LC80)
        sw      s2,80(sp)
        sw      a2,8(sp)
        mv      s2,a0
        mv      a2,a5
        sw      a0,24(sp)
        addi    a3,s8,%lo(.LC0)
        addi    a1,a1,%lo(.LC80)
        mv      a0,s0
        sw      a5,28(sp)
        sw      ra,92(sp)
        sw      s1,84(sp)
        sw      s3,76(sp)
        mv      s1,a5
        sw      s4,72(sp)
        sw      s6,64(sp)
        sw      s7,60(sp)
        sw      s9,52(sp)
        sw      s10,48(sp)
        sw      s11,44(sp)
        call    fprintf
        addi    a4,s1,4
        lui     s1,%hi(.LC81)
        mv      a2,a4
        addi    a3,s8,%lo(.LC0)
        mv      a0,s0
        addi    a1,s1,%lo(.LC81)
        sw      a4,20(sp)
        call    fprintf
        lw      a4,8(sp)
        lw      s4,0(s2)
        li      a5,21
        addi    s3,a4,2
        lw      a4,8(s4)
        beq     a4,a5,.L958
        mv      a0,s4
        mv      a2,s3
        mv      a1,s0
        call    print_expression.part.0
        lui     s10,%hi(.LC22)
.L917:
        lw      s2,20(sp)
        addi    a3,s8,%lo(.LC0)
        addi    a1,s10,%lo(.LC22)
        mv      a2,s2
        mv      a0,s0
        call    fprintf
        lui     a5,%hi(.LC82)
        addi    a1,a5,%lo(.LC82)
        addi    a3,s8,%lo(.LC0)
        mv      a2,s2
        mv      a0,s0
        call    fprintf
        lw      a5,24(sp)
        lw      a5,4(a5)
        beq     a5,zero,.L919
        lw      s2,0(a5)
        beq     s2,zero,.L919
.L922:
        lw      a0,0(s2)
        mv      a2,s3
        mv      a1,s0
        beq     a0,zero,.L920
        call    print_statement
        lw      s2,4(s2)
        bne     s2,zero,.L922
.L919:
        lw      s2,20(sp)
        addi    a3,s8,%lo(.LC0)
        addi    a1,s10,%lo(.LC22)
        mv      a2,s2
        mv      a0,s0
        call    fprintf
        lui     a1,%hi(.LC83)
        addi    a3,s8,%lo(.LC0)
        mv      a2,s2
        mv      a0,s0
        addi    a1,a1,%lo(.LC83)
        call    fprintf
        lw      a5,24(sp)
        lw      a5,8(a5)
        beq     a5,zero,.L924
        lw      s2,0(a5)
        slli    s7,s3,2
        beq     s2,zero,.L924
        lui     a5,%hi(.LC21)
        addi    a5,a5,%lo(.LC21)
        sw      a5,0(sp)
        lw      a5,8(sp)
        addi    a4,s1,%lo(.LC81)
        sw      a4,4(sp)
        addi    s4,s8,%lo(.LC0)
        addi    s1,a5,4
        li      s9,21
        addi    s6,s10,%lo(.LC22)
        j       .L933
.L925:
        lw      s2,4(s2)
        beq     s2,zero,.L924
.L933:
        lw      s11,0(s2)
        beq     s11,zero,.L925
        lw      a1,0(sp)
        mv      a3,s4
        mv      a2,s7
        mv      a0,s0
        call    fprintf
        lw      a1,4(sp)
        mv      a3,s4
        addi    a2,s7,4
        mv      a0,s0
        call    fprintf
        lw      a4,0(s11)
        lw      a3,8(a4)
        beq     a3,s9,.L959
        mv      a0,a4
        mv      a2,s1
        mv      a1,s0
        call    print_expression.part.0
.L927:
        mv      a3,s4
        addi    a2,s7,4
        mv      a1,s6
        mv      a0,s0
        call    fprintf
        lui     a5,%hi(.LC82)
        addi    a1,a5,%lo(.LC82)
        mv      a3,s4
        addi    a2,s7,4
        mv      a0,s0
        call    fprintf
        lw      a5,4(s11)
        beq     a5,zero,.L929
        lw      s11,0(a5)
        beq     s11,zero,.L929
.L932:
        lw      a0,0(s11)
        mv      a2,s1
        mv      a1,s0
        beq     a0,zero,.L930
        call    print_statement
        lw      s11,4(s11)
        bne     s11,zero,.L932
.L929:
        mv      a3,s4
        addi    a2,s7,4
        mv      a1,s6
        mv      a0,s0
        call    fprintf
        mv      a3,s4
        mv      a2,s7
        mv      a1,s6
        mv      a0,s0
        call    fprintf
        lw      s2,4(s2)
        bne     s2,zero,.L933
.L924:
        lw      s1,20(sp)
        addi    a3,s8,%lo(.LC0)
        addi    a1,s10,%lo(.LC22)
        mv      a2,s1
        mv      a0,s0
        call    fprintf
        lui     a1,%hi(.LC84)
        addi    a3,s8,%lo(.LC0)
        mv      a2,s1
        mv      a0,s0
        addi    a1,a1,%lo(.LC84)
        call    fprintf
        lw      a5,24(sp)
        lw      a5,12(a5)
        beq     a5,zero,.L936
        lw      s1,0(a5)
        beq     s1,zero,.L936
.L939:
        lw      a0,0(s1)
        mv      a2,s3
        mv      a1,s0
        beq     a0,zero,.L937
        call    print_statement
        lw      s1,4(s1)
        bne     s1,zero,.L939
.L936:
        lw      a2,20(sp)
        addi    a3,s8,%lo(.LC0)
        addi    a1,s10,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        mv      a0,s0
        lw      s0,88(sp)
        lw      a2,28(sp)
        lw      ra,92(sp)
        lw      s1,84(sp)
        lw      s2,80(sp)
        lw      s3,76(sp)
        lw      s4,72(sp)
        lw      s6,64(sp)
        lw      s7,60(sp)
        lw      s9,52(sp)
        lw      s11,44(sp)
        addi    a3,s8,%lo(.LC0)
        addi    a1,s10,%lo(.LC22)
        lw      s8,56(sp)
        lw      s10,48(sp)
        addi    sp,sp,96
        tail    fprintf
.L930:
        lw      s11,4(s11)
        bne     s11,zero,.L932
        j       .L929
.L920:
        lw      s2,4(s2)
        bne     s2,zero,.L922
        j       .L919
.L959:
        slli    a6,s1,2
        lui     a1,%hi(.LC53)
        mv      a2,a6
        addi    a3,s8,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        mv      a0,s0
        sw      a4,16(sp)
        sw      a6,12(sp)
        call    fprintf
        lw      a4,16(sp)
        lw      a5,8(sp)
        mv      a1,s0
        lw      a0,0(a4)
        addi    a2,a5,5
        call    print_primary
        lw      a2,12(sp)
        addi    a3,s8,%lo(.LC0)
        addi    a1,s10,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        j       .L927
.L937:
        lw      s1,4(s1)
        bne     s1,zero,.L939
        j       .L936
.L958:
        lui     a1,%hi(.LC53)
        addi    a3,s8,%lo(.LC0)
        slli    a2,s3,2
        addi    a1,a1,%lo(.LC53)
        mv      a0,s0
        call    fprintf
        lw      a5,8(sp)
        lw      a0,0(s4)
        mv      a1,s0
        addi    a2,a5,3
        call    print_primary
        lui     s10,%hi(.LC22)
        slli    a2,s3,2
        addi    a3,s8,%lo(.LC0)
        mv      a0,s0
        addi    a1,s10,%lo(.LC22)
        call    fprintf
        j       .L917
.LC85:
        .string "%*sfor: {\n"
.LC86:
        .string "%*sinit: {\n"
.LC87:
        .string "%*sinit: null\n"
.LC88:
        .string "%*scondition: null\n"
.LC89:
        .string "%*sincrement: {\n"
.LC90:
        .string "%*sincrement: null\n"
print_for:
        addi    sp,sp,-48
        sw      s2,32(sp)
        sw      s3,28(sp)
        sw      s6,16(sp)
        mv      s2,a1
        slli    s6,a2,2
        lui     s3,%hi(.LC0)
        lui     a1,%hi(.LC85)
        sw      s0,40(sp)
        sw      s1,36(sp)
        mv      s0,a0
        mv      s1,a2
        mv      a0,s2
        mv      a2,s6
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC85)
        sw      ra,44(sp)
        sw      s5,20(sp)
        call    fprintf
        lw      a5,0(s0)
        beq     a5,zero,.L961
        lui     a1,%hi(.LC86)
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC86)
        addi    a2,s6,4
        mv      a0,s2
        call    fprintf
        lw      a0,0(s0)
        addi    a2,s1,2
        mv      a1,s2
        call    print_variable
        lui     s5,%hi(.LC22)
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        mv      a0,s2
        addi    a1,s5,%lo(.LC22)
        call    fprintf
.L962:
        lw      a5,4(s0)
        beq     a5,zero,.L963
        lui     a1,%hi(.LC81)
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        addi    a1,a1,%lo(.LC81)
        mv      a0,s2
        call    fprintf
        lw      a5,4(s0)
        li      a4,21
        addi    a2,s1,2
        lw      a3,8(a5)
        beq     a3,a4,.L981
        mv      a0,a5
        mv      a1,s2
        call    print_expression.part.0
.L965:
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        addi    a1,s5,%lo(.LC22)
        mv      a0,s2
        call    fprintf
.L966:
        lw      a5,8(s0)
        beq     a5,zero,.L967
        lui     a1,%hi(.LC89)
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        addi    a1,a1,%lo(.LC89)
        mv      a0,s2
        call    fprintf
        lw      a5,8(s0)
        li      a4,21
        addi    a2,s1,2
        lw      a3,8(a5)
        beq     a3,a4,.L982
        mv      a0,a5
        mv      a1,s2
        call    print_expression.part.0
.L969:
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        addi    a1,s5,%lo(.LC22)
        mv      a0,s2
        call    fprintf
.L970:
        lui     a1,%hi(.LC82)
        addi    a1,a1,%lo(.LC82)
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        mv      a0,s2
        call    fprintf
        lw      a5,12(s0)
        beq     a5,zero,.L972
        lw      s0,0(a5)
        addi    s1,s1,2
        beq     s0,zero,.L972
.L975:
        lw      a0,0(s0)
        mv      a2,s1
        mv      a1,s2
        beq     a0,zero,.L973
        call    print_statement
        lw      s0,4(s0)
        bne     s0,zero,.L975
.L972:
        addi    a2,s6,4
        addi    a3,s3,%lo(.LC0)
        addi    a1,s5,%lo(.LC22)
        mv      a0,s2
        call    fprintf
        lw      s0,40(sp)
        lw      ra,44(sp)
        lw      s1,36(sp)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s6
        lw      s3,28(sp)
        lw      s6,16(sp)
        addi    a1,s5,%lo(.LC22)
        mv      a0,s2
        lw      s5,20(sp)
        lw      s2,32(sp)
        addi    sp,sp,48
        tail    fprintf
.L981:
        slli    a4,a2,2
        lui     a1,%hi(.LC53)
        mv      a2,a4
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        mv      a0,s2
        sw      a5,12(sp)
        sw      a4,8(sp)
        call    fprintf
        lw      a5,12(sp)
        addi    a2,s1,3
        mv      a1,s2
        lw      a0,0(a5)
        call    print_primary
        lw      a2,8(sp)
        addi    a3,s3,%lo(.LC0)
        addi    a1,s5,%lo(.LC22)
        mv      a0,s2
        call    fprintf
        j       .L965
.L973:
        lw      s0,4(s0)
        bne     s0,zero,.L975
        j       .L972
.L967:
        lui     a1,%hi(.LC90)
        addi    a1,a1,%lo(.LC90)
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        mv      a0,s2
        call    fprintf
        j       .L970
.L963:
        lui     a1,%hi(.LC88)
        addi    a1,a1,%lo(.LC88)
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        mv      a0,s2
        call    fprintf
        j       .L966
.L961:
        lui     a1,%hi(.LC87)
        addi    a1,a1,%lo(.LC87)
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        mv      a0,s2
        call    fprintf
        lui     s5,%hi(.LC22)
        j       .L962
.L982:
        slli    a4,a2,2
        lui     a1,%hi(.LC53)
        mv      a2,a4
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        mv      a0,s2
        sw      a5,12(sp)
        sw      a4,8(sp)
        call    fprintf
        lw      a5,12(sp)
        addi    a2,s1,3
        mv      a1,s2
        lw      a0,0(a5)
        call    print_primary
        lw      a2,8(sp)
        addi    a3,s3,%lo(.LC0)
        addi    a1,s5,%lo(.LC22)
        mv      a0,s2
        call    fprintf
        j       .L969
.LC91:
        .string "%*swhile: {\n"
print_while:
        addi    sp,sp,-64
        sw      s1,52(sp)
        sw      s3,44(sp)
        mv      s1,a1
        sw      s6,32(sp)
        lui     s3,%hi(.LC0)
        slli    s6,a2,2
        lui     a1,%hi(.LC91)
        sw      s0,56(sp)
        sw      s7,28(sp)
        mv      s0,a2
        mv      s7,a0
        mv      a2,s6
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC91)
        mv      a0,s1
        sw      ra,60(sp)
        sw      s2,48(sp)
        sw      s4,40(sp)
        call    fprintf
        lui     a1,%hi(.LC81)
        addi    a2,s6,4
        addi    a3,s3,%lo(.LC0)
        mv      a0,s1
        addi    a1,a1,%lo(.LC81)
        call    fprintf
        lw      s4,0(s7)
        li      a5,21
        addi    s2,s0,2
        lw      a4,8(s4)
        beq     a4,a5,.L996
        mv      a0,s4
        mv      a2,s2
        mv      a1,s1
        call    print_expression.part.0
        lui     s4,%hi(.LC22)
.L985:
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        addi    a1,s4,%lo(.LC22)
        mv      a0,s1
        call    fprintf
        lui     a1,%hi(.LC82)
        addi    a3,s3,%lo(.LC0)
        addi    a2,s6,4
        mv      a0,s1
        addi    a1,a1,%lo(.LC82)
        call    fprintf
        lw      a5,4(s7)
        beq     a5,zero,.L989
        lw      s0,0(a5)
        beq     s0,zero,.L989
.L990:
        lw      a0,0(s0)
        mv      a2,s2
        mv      a1,s1
        beq     a0,zero,.L987
        call    print_statement
        lw      s0,4(s0)
        bne     s0,zero,.L990
.L989:
        addi    a2,s6,4
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s1
        call    fprintf
        lw      s0,56(sp)
        lw      ra,60(sp)
        lw      s2,48(sp)
        lw      s7,28(sp)
        addi    a3,s3,%lo(.LC0)
        mv      a2,s6
        lw      s3,44(sp)
        lw      s6,32(sp)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s1
        lw      s4,40(sp)
        lw      s1,52(sp)
        addi    sp,sp,64
        tail    fprintf
.L987:
        lw      s0,4(s0)
        bne     s0,zero,.L990
        j       .L989
.L996:
        slli    a5,s2,2
        lui     a1,%hi(.LC53)
        mv      a2,a5
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        mv      a0,s1
        sw      a5,12(sp)
        call    fprintf
        lw      a0,0(s4)
        addi    a2,s0,3
        mv      a1,s1
        call    print_primary
        lw      a2,12(sp)
        lui     s4,%hi(.LC22)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s1
        addi    a1,s4,%lo(.LC22)
        call    fprintf
        j       .L985
.LC92:
        .string "Unterminated comment"
.LC93:
        .string "[lexer Error] at %s:%zu:%zu: %s\n"
.LC94:
        .string "Unexpected character"
.LC95:
        .string "Invalid special method"
.LC96:
        .string "Unterminated string literal"
get_token:
        lw      t3,20(a0)
        lw      a1,12(a0)
        addi    sp,sp,-32
        lui     a3,%hi(.L1001)
        lw      t6,8(a0)
        mv      a6,a0
        sw      ra,28(sp)
        add     a0,t3,a1
        addi    a3,a3,%lo(.L1001)
        li      a2,32
.L998:
        addi    a4,a1,1
        sw      a4,12(a6)
        lbu     t5,0(a0)
        addi    t1,t6,1
        sw      t1,8(a6)
        bgtu    t5,a2,.L1000
        slli    a5,t5,2
        add     a5,a5,a3
        lw      a5,0(a5)
        jr      a5
.L1001:
        .word   .L1003
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1078
        .word   .L1002
        .word   .L1000
        .word   .L1000
        .word   .L1078
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1000
        .word   .L1078
.L1000:
        li      a5,57
        add     a2,t3,a4
        bgtu    t5,a5,.L1005
        li      a5,47
        bgtu    t5,a5,.L1127
        li      a3,34
        bne     t5,a3,.L1128
        addi    a5,a1,2
        sw      a5,12(a6)
        lbu     a2,0(a2)
        addi    a3,t6,2
        sw      a3,8(a6)
        addi    a3,a2,-34
        snez    a3,a3
        snez    a0,a2
        and     a3,a3,a0
        sub     a1,t6,a1
        li      a7,10
        beq     a3,zero,.L1028
.L1027:
        beq     a2,a7,.L1129
        addi    a5,a5,1
        add     a3,t3,a5
        sw      a5,12(a6)
        lbu     a2,-1(a3)
        add     a3,a1,a5
        sw      a3,8(a6)
        addi    a3,a2,-34
        snez    a3,a3
        snez    a0,a2
        and     a3,a3,a0
        bne     a3,zero,.L1027
.L1028:
        li      a3,34
        beq     a2,a3,.L1076
        lw      a2,0(a6)
        lw      a3,4(a6)
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lw      a2,0(a2)
        lui     a5,%hi(.LC96)
        lui     a1,%hi(.LC93)
        addi    a5,a5,%lo(.LC96)
        addi    a3,a3,1
        addi    a1,a1,%lo(.LC93)
        sw      t6,8(sp)
        sw      a6,4(sp)
        sw      a4,0(sp)
        call    fprintf
        lw      a6,4(sp)
        lw      a4,0(sp)
        lw      t6,8(sp)
        lw      a5,12(a6)
.L1076:
        sub     a5,a5,a4
        li      a2,1
        beq     a5,a2,.L1130
        lw      a0,20(a6)
        addi    a1,a5,-1
        sw      s0,24(sp)
        add     a0,a0,a4
        sw      t6,4(sp)
        sw      a6,0(sp)
        call    create_string_check
        lw      a6,0(sp)
        mv      s0,a0
        li      a0,16
        lw      a4,4(a6)
        sw      a4,0(sp)
        call    alloc_memory.constprop.0
        li      a5,3
.L1125:
        lw      a4,0(sp)
        lw      t6,4(sp)
        lw      ra,28(sp)
        sw      s0,4(a0)
        lw      s0,24(sp)
        sw      a4,8(a0)
        sw      t6,12(a0)
        sw      a5,0(a0)
        addi    sp,sp,32
        jr      ra
.L1002:
        lw      a5,4(a6)
        sw      zero,8(a6)
        li      t6,0
        addi    a5,a5,1
        sw      a5,4(a6)
.L999:
        addi    a0,a0,1
        mv      a1,a4
        j       .L998
.L1003:
        lw      a4,4(a6)
        li      a0,16
        sw      t1,4(sp)
        sw      a4,0(sp)
        call    alloc_memory.constprop.0
        lw      a4,0(sp)
        lw      t1,4(sp)
        li      a5,7
        sw      zero,4(a0)
        sw      a4,8(a0)
        sw      t1,12(a0)
        sw      a5,0(a0)
.L997:
        lw      ra,28(sp)
        addi    sp,sp,32
        jr      ra
.L1078:
        mv      t6,t1
        j       .L999
.L1005:
        li      a5,95
        beq     t5,a5,.L1081
        bgtu    t5,a5,.L1010
        addi    a5,t5,-65
        andi    a5,a5,0xff
        li      a3,25
        bgtu    a5,a3,.L1011
.L1081:
        sw      s0,24(sp)
.L1123:
        mv      t4,t1
        li      t0,25
        j       .L1013
.L1014:
        mv      t4,a7
        mv      a4,a2
.L1013:
        addi    a2,a4,1
        add     a5,t3,a2
        sw      a2,12(a6)
        lbu     a3,-1(a5)
        addi    a7,t4,1
        sw      a7,8(a6)
        andi    a5,a3,-33
        addi    a5,a5,-65
        andi    a5,a5,0xff
        bleu    a5,t0,.L1014
        addi    a5,a3,-48
        addi    a3,a3,-95
        sltiu   a5,a5,10
        seqz    a3,a3
        or      a5,a5,a3
        bne     a5,zero,.L1014
        sw      a4,12(a6)
        sw      t4,8(a6)
        sub     a1,a4,a1
        li      a2,1
        sw      t6,8(sp)
        sw      t5,4(sp)
        sw      a6,0(sp)
        sw      t1,12(sp)
        call    create_string_check
        lw      a6,0(sp)
        lw      t6,8(sp)
        lw      t5,4(sp)
        lw      a4,4(a6)
        sw      a0,4(sp)
        li      a5,36
        sw      t6,0(sp)
        mv      s0,a4
        li      a0,16
        bne     t5,a5,.L1015
        sw      a6,8(sp)
        call    alloc_memory.constprop.0
        lui     t4,%hi(.LANCHOR1)
        li      a5,8
        addi    t4,t4,%lo(.LANCHOR1)
        sw      a5,0(a0)
        lw      t1,12(sp)
        lw      a6,8(sp)
        lw      a7,4(sp)
        lw      t6,0(sp)
        mv      a5,t4
        addi    t3,t4,80
        j       .L1017
.L1132:
        addi    a5,a5,4
        beq     t3,a5,.L1131
.L1017:
        lw      a4,0(a5)
        bne     a7,a4,.L1132
        sw      s0,8(a0)
        sw      a7,4(a0)
        lw      s0,24(sp)
        sw      t6,12(a0)
        j       .L997
.L1128:
        sw      s0,24(sp)
        li      a3,36
        beq     t5,a3,.L1123
        lbu     t4,0(a2)
        addi    a0,t5,-47
        seqz    a0,a0
        addi    a3,t4,-47
        seqz    a3,a3
        and     a3,a0,a3
        beq     a3,zero,.L1036
        addi    a0,a1,2
.L1037:
        mv      a1,a4
        addi    a4,a4,1
        add     a5,t3,a4
        sw      a4,12(a6)
        lbu     a3,-1(a5)
        mv      a2,t1
        addi    t1,t1,1
        addi    a5,a3,-10
        snez    a5,a5
        snez    a3,a3
        and     a5,a5,a3
        sw      t1,8(a6)
        bne     a5,zero,.L1037
        sw      a1,12(a6)
        sw      a2,8(a6)
        sub     a1,a1,a0
        li      a2,1
        add     a0,t3,a0
        sw      t6,4(sp)
        sw      a6,0(sp)
        call    create_string_check
        lw      a6,0(sp)
        mv      s0,a0
        li      a0,16
        lw      a4,4(a6)
        sw      a4,0(sp)
        call    alloc_memory.constprop.0
        li      a5,6
        j       .L1125
.L1127:
        sw      s0,24(sp)
        li      t5,9
.L1006:
        mv      a7,a4
        addi    a4,a4,1
        sw      a4,12(a6)
        add     a2,t3,a4
        lbu     a3,-1(a2)
        mv      t4,t1
        addi    t1,t1,1
        addi    a5,a3,-48
        andi    a5,a5,0xff
        sw      t1,8(a6)
        bleu    a5,t5,.L1006
        li      a5,46
        beq     a3,a5,.L1133
.L1023:
        li      a4,1
.L1025:
        sw      a7,12(a6)
        sw      t4,8(a6)
        sub     a1,a7,a1
        li      a2,1
        sw      t6,8(sp)
        sw      a4,4(sp)
        sw      a6,0(sp)
        call    create_string_check
        lw      a6,0(sp)
        mv      s0,a0
        li      a0,16
        lw      a5,4(a6)
        sw      a5,0(sp)
        call    alloc_memory.constprop.0
        lw      a4,4(sp)
        lw      a5,0(sp)
        lw      t6,8(sp)
        lw      ra,28(sp)
        sw      s0,4(a0)
        lw      s0,24(sp)
        sw      a4,0(a0)
        sw      a5,8(a0)
        sw      t6,12(a0)
        addi    sp,sp,32
        jr      ra
.L1015:
        call    alloc_memory.constprop.0
        lui     a3,%hi(.LANCHOR1)
        addi    a3,a3,%lo(.LANCHOR1)
        addi    a5,a3,80
        lw      a7,4(sp)
        lw      t6,0(sp)
        addi    a3,a3,176
        j       .L1022
.L1135:
        addi    a5,a5,4
        beq     a3,a5,.L1134
.L1022:
        lw      a4,0(a5)
        bne     a7,a4,.L1135
        li      a5,5
.L1021:
        sw      s0,8(a0)
        sw      a5,0(a0)
        lw      s0,24(sp)
        sw      a7,4(a0)
        sw      t6,12(a0)
        j       .L997
.L1010:
        addi    a5,t5,-97
        andi    a5,a5,0xff
        li      a3,25
        bleu    a5,a3,.L1081
        sw      s1,20(sp)
        lw      a5,4(a6)
        lbu     t4,0(a2)
        li      a0,0
        mv      s1,a5
        addi    a5,t4,-61
        seqz    a5,a5
.L1012:
        addi    a4,t5,-60
        seqz    a4,a4
        and     a4,a5,a4
        bne     a4,zero,.L1136
        addi    a4,t5,-62
        seqz    a4,a4
        and     a4,a5,a4
        bne     a4,zero,.L1137
        addi    a4,t5,-43
        seqz    a4,a4
        and     a4,a5,a4
        bne     a4,zero,.L1138
        addi    a4,t5,-45
        seqz    a4,a4
        and     a4,a5,a4
        bne     a4,zero,.L1139
        addi    a4,t5,-42
        seqz    a4,a4
        and     a4,a5,a4
        bne     a4,zero,.L1140
        and     a0,a5,a0
        bne     a0,zero,.L1141
        addi    a4,t5,-37
        seqz    a4,a4
        and     a5,a5,a4
        bne     a5,zero,.L1142
        addi    a5,t5,-38
        addi    a4,t4,-38
        seqz    a5,a5
        seqz    a4,a4
        and     a5,a5,a4
        bne     a5,zero,.L1143
        addi    a4,t4,-124
        addi    a5,t5,-124
        seqz    a4,a4
        seqz    a5,a5
        and     a5,a5,a4
        bne     a5,zero,.L1144
        addi    a5,t5,-33
        andi    a5,a5,0xff
        li      a4,92
        bgtu    a5,a4,.L1054
        lui     a4,%hi(.L1056)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L1056)
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L1056:
        .word   .L1073
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1072
        .word   .L1054
        .word   .L1054
        .word   .L1071
        .word   .L1070
        .word   .L1069
        .word   .L1068
        .word   .L1067
        .word   .L1066
        .word   .L1065
        .word   .L1064
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1063
        .word   .L1062
        .word   .L1061
        .word   .L1060
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1059
        .word   .L1054
        .word   .L1058
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1054
        .word   .L1057
        .word   .L1054
        .word   .L1055
.L1129:
        lw      a2,0(a6)
        lw      a3,4(a6)
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lw      a2,0(a2)
        lui     a5,%hi(.LC96)
        lui     a1,%hi(.LC93)
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC96)
        addi    a1,a1,%lo(.LC93)
        sw      t6,8(sp)
        sw      a6,4(sp)
        sw      a4,0(sp)
        call    fprintf
        lw      a6,4(sp)
        lw      a4,0(sp)
        lw      t6,8(sp)
        lw      a3,4(a6)
        lw      a5,12(a6)
        sw      zero,8(a6)
        addi    a3,a3,1
        sw      a3,4(a6)
        j       .L1076
.L1133:
        lbu     a5,0(a2)
        addi    a5,a5,-48
        andi    a5,a5,0xff
        bgtu    a5,t5,.L1023
        addi    a3,a7,2
        sw      a3,12(a6)
        lbu     a5,0(a2)
        addi    a2,t4,2
        sw      a2,8(a6)
        addi    a5,a5,-48
        andi    a5,a5,0xff
        bgtu    a5,t5,.L1084
        li      a4,9
.L1026:
        mv      a7,a3
        addi    a3,a3,1
        sw      a3,12(a6)
        add     a5,t3,a3
        lbu     a5,-1(a5)
        mv      t4,a2
        addi    a2,a2,1
        addi    a5,a5,-48
        andi    a5,a5,0xff
        sw      a2,8(a6)
        bleu    a5,a4,.L1026
        li      a4,2
        j       .L1025
.L1011:
        sw      s1,20(sp)
        lw      a5,4(a6)
        lbu     t4,0(a2)
        li      a0,0
        mv      s1,a5
.L1038:
        addi    a5,t4,-61
        addi    a4,t5,-61
        seqz    a5,a5
        seqz    a4,a4
        and     a4,a5,a4
        bne     a4,zero,.L1145
        addi    a4,t5,-33
        seqz    a4,a4
        and     a4,a5,a4
        beq     a4,zero,.L1012
        addi    a5,t6,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_NE)
        lw      a4,%lo(SYMBOL_NE)(a5)
        addi    a1,a1,2
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
.L1126:
        sw      a4,0(sp)
        call    alloc_memory.constprop.0
        lw      a4,0(sp)
        lw      t6,4(sp)
        li      a5,4
        sw      s1,8(a0)
        sw      a4,4(a0)
        lw      s1,20(sp)
        sw      t6,12(a0)
        sw      a5,0(a0)
        j       .L997
.L1036:
        lw      a3,4(a6)
        addi    a7,t4,-42
        seqz    a7,a7
        sw      s1,20(sp)
        and     a7,a0,a7
        mv      s1,a3
        beq     a7,zero,.L1122
        mv      a0,a2
        lw      a7,8(a6)
        addi    t5,a1,2
        li      a2,42
        li      t1,10
        j       .L1039
.L1040:
        addi    a0,a0,1
        beq     a2,zero,.L1041
.L1039:
        addi    a5,a5,-42
        addi    a2,a2,-47
        or      a5,a5,a2
        beq     a5,zero,.L1146
.L1042:
        mv      t4,a4
        addi    a4,a4,1
        sw      a4,12(a6)
        lbu     a5,0(a0)
        addi    a7,a7,1
        sw      a7,8(a6)
        lbu     a2,1(a0)
        bne     a5,t1,.L1040
        addi    a3,a3,1
        sw      a3,4(a6)
        sw      zero,8(a6)
        addi    a0,a0,1
        beq     a2,zero,.L1041
        li      a7,0
        j       .L1042
.L1054:
        lw      a5,0(a6)
        lui     a4,%hi(stderr)
        lw      a0,%lo(stderr)(a4)
        lw      a2,0(a5)
        lui     a1,%hi(.LC93)
        lui     a5,%hi(.LC94)
        addi    a3,s1,1
        addi    a5,a5,%lo(.LC94)
        mv      a4,t1
        addi    a1,a1,%lo(.LC93)
        call    fprintf
        li      a0,16
        call    alloc_memory.constprop.0
        li      a5,7
        lw      s1,20(sp)
        sw      zero,4(a0)
        sw      zero,8(a0)
        sw      zero,12(a0)
        sw      a5,0(a0)
        j       .L997
.L1130:
        lui     a7,%hi(string_table)
        lw      a4,%lo(string_table)(a7)
        li      a2,84697088
        addi    a2,a2,-737
        lw      a1,4(a4)
        lw      a4,0(a4)
        remu    a1,a2,a1
        slli    a1,a1,2
        add     a4,a4,a1
        lw      a4,0(a4)
        bne     a4,zero,.L1035
        j       .L1032
.L1033:
        lw      a4,8(a4)
        beq     a4,zero,.L1032
.L1035:
        lw      a3,0(a4)
        bne     a3,a5,.L1033
        lw      a3,4(a4)
        bne     a3,a2,.L1033
        lw      a3,12(a4)
        lbu     a0,0(a3)
        bne     a0,zero,.L1033
.L1034:
        lw      a4,4(a6)
        li      a0,16
        sw      t6,8(sp)
        sw      a3,4(sp)
        sw      a4,0(sp)
        call    alloc_memory.constprop.0
        lw      a3,4(sp)
        lw      a4,0(sp)
        lw      t6,8(sp)
        li      a5,3
        sw      a3,4(a0)
        sw      a4,8(a0)
        sw      t6,12(a0)
        sw      a5,0(a0)
        j       .L997
.L1032:
        li      a0,16
        sw      a6,12(sp)
        sw      t6,8(sp)
        sw      a1,0(sp)
        call    alloc_memory.constprop.0
        lui     a7,%hi(string_table)
        lw      a3,%lo(string_table)(a7)
        lw      a1,0(sp)
        li      a4,84697088
        lw      a3,0(a3)
        li      a2,1
        addi    a4,a4,-737
        add     a3,a3,a1
        lw      a3,0(a3)
        mv      a5,a0
        sw      a2,0(a0)
        sw      a4,4(a0)
        sw      a3,8(a5)
        li      a0,2
        sw      a1,4(sp)
        sw      a5,0(sp)
        call    alloc_memory.constprop.1
        lw      a5,0(sp)
        lui     a7,%hi(string_table)
        lw      a2,%lo(string_table)(a7)
        sw      a0,12(a5)
        sb      zero,0(a0)
        lw      a4,12(a5)
        lui     a7,%hi(string_count)
        lw      a1,4(sp)
        sb      zero,1(a4)
        lw      a3,0(a2)
        lw      a0,8(a2)
        lw      a4,%lo(string_count)(a7)
        add     a1,a3,a1
        lw      a3,12(a5)
        sw      a5,0(a1)
        addi    a1,a0,1
        addi    a5,a4,1
        lw      a6,12(sp)
        lw      t6,8(sp)
        sw      a1,8(a2)
        sw      a5,%lo(string_count)(a7)
        j       .L1034
.L1041:
        bne     a5,zero,.L1075
        lw      a5,8(a6)
        sw      t4,12(a6)
        addi    a5,a5,-1
        sw      a5,8(a6)
.L1075:
        lw      a5,0(a6)
        lui     a4,%hi(stderr)
        lw      a0,%lo(stderr)(a4)
        lw      a2,0(a5)
        lui     a7,%hi(.LC93)
        lui     a5,%hi(.LC92)
        addi    a4,a1,3
        addi    a5,a5,%lo(.LC92)
        addi    a1,a7,%lo(.LC93)
        addi    a3,a3,1
        sw      t6,8(sp)
        sw      t5,4(sp)
        sw      a6,0(sp)
        call    fprintf
        lw      a6,0(sp)
        lw      t5,4(sp)
        li      a2,1
        lw      a1,12(a6)
        lw      a0,20(a6)
        sub     a1,a1,t5
        add     a0,a0,t5
        call    create_string_check
        mv      s0,a0
        li      a0,16
        call    alloc_memory.constprop.0
        lw      t6,8(sp)
        li      a5,6
        sw      s0,4(a0)
        sw      s1,8(a0)
        lw      s0,24(sp)
        lw      s1,20(sp)
        sw      t6,12(a0)
        sw      a5,0(a0)
        j       .L997
.L1134:
        li      a5,0
        j       .L1021
.L1146:
        sub     a1,a4,t5
        addi    a7,a7,1
        addi    a4,a4,1
        sw      a7,8(a6)
        add     a0,t3,t5
        addi    a1,a1,-1
        sw      a4,12(a6)
        li      a2,1
        sw      t6,0(sp)
        call    create_string_check
        mv      s0,a0
        li      a0,16
        call    alloc_memory.constprop.0
        lw      t6,0(sp)
        li      a5,6
        sw      s0,4(a0)
        sw      s1,8(a0)
        lw      s0,24(sp)
        lw      s1,20(sp)
        sw      t6,12(a0)
        sw      a5,0(a0)
        j       .L997
.L1131:
        lw      a4,0(a6)
        lw      a3,4(a6)
        lui     a5,%hi(stderr)
        lw      a2,0(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC93)
        lui     a5,%hi(.LC95)
        mv      a4,t1
        addi    a5,a5,%lo(.LC95)
        addi    a3,a3,1
        addi    a1,a1,%lo(.LC93)
        sw      a7,8(sp)
        sw      t6,4(sp)
        sw      a6,0(sp)
        call    fprintf
        lw      a6,0(sp)
        li      a0,16
        lw      a4,4(a6)
        sw      a4,0(sp)
        call    alloc_memory.constprop.0
        lui     a5,%hi(.LANCHOR1+80)
        addi    t3,a5,%lo(.LANCHOR1+80)
        lui     a5,%hi(.LANCHOR1)
        addi    t4,a5,%lo(.LANCHOR1)
        lw      a4,0(sp)
        lw      t6,4(sp)
        lw      a7,8(sp)
        addi    t4,t4,176
        j       .L1020
.L1148:
        addi    t3,t3,4
        beq     t3,t4,.L1147
.L1020:
        lw      a5,0(t3)
        bne     a7,a5,.L1148
        li      a5,5
.L1019:
        lw      s0,24(sp)
        sw      a5,0(a0)
        sw      a7,4(a0)
        sw      a4,8(a0)
        sw      t6,12(a0)
        j       .L997
.L1145:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_EQ)
        lw      a4,%lo(SYMBOL_EQ)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1136:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_LE)
        lw      a4,%lo(SYMBOL_LE)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1147:
        li      a5,0
        j       .L1019
.L1137:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_GE)
        lw      a4,%lo(SYMBOL_GE)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1138:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_ADD_ASSIGN)
        lw      a4,%lo(SYMBOL_ADD_ASSIGN)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1139:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_SUB_ASSIGN)
        lw      a4,%lo(SYMBOL_SUB_ASSIGN)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1084:
        mv      a7,a4
        mv      t4,t1
        li      a4,2
        j       .L1025
.L1140:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_MUL_ASSIGN)
        lw      a4,%lo(SYMBOL_MUL_ASSIGN)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1141:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_DIV_ASSIGN)
        lw      a4,%lo(SYMBOL_DIV_ASSIGN)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1142:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_MOD_ASSIGN)
        lw      a4,%lo(SYMBOL_MOD_ASSIGN)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1122:
        lw      s0,24(sp)
        j       .L1038
.L1143:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_AND)
        lw      a4,%lo(SYMBOL_AND)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1144:
        addi    a5,t6,2
        addi    a1,a1,2
        sw      a5,8(a6)
        lui     a5,%hi(SYMBOL_OR)
        lw      a4,%lo(SYMBOL_OR)(a5)
        sw      t6,4(sp)
        sw      a1,12(a6)
        li      a0,16
        j       .L1126
.L1072:
        lui     a5,%hi(SYMBOL_MOD)
        lw      a4,%lo(SYMBOL_MOD)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1073:
        lui     a5,%hi(SYMBOL_NOT)
        lw      a4,%lo(SYMBOL_NOT)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1060:
        lui     a5,%hi(SYMBOL_GT)
        lw      a4,%lo(SYMBOL_GT)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1061:
        lui     a5,%hi(SYMBOL_ASSIGN)
        lw      a4,%lo(SYMBOL_ASSIGN)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1062:
        lui     a5,%hi(SYMBOL_LT)
        lw      a4,%lo(SYMBOL_LT)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1063:
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a4,%lo(SYMBOL_SEMICOLON)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1064:
        lui     a5,%hi(SYMBOL_DIV)
        lw      a4,%lo(SYMBOL_DIV)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1065:
        lui     a5,%hi(SYMBOL_DOT)
        lw      a4,%lo(SYMBOL_DOT)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1066:
        lui     a5,%hi(SYMBOL_SUB)
        lw      a4,%lo(SYMBOL_SUB)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1067:
        lui     a5,%hi(SYMBOL_COMMA)
        lw      a4,%lo(SYMBOL_COMMA)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1055:
        lui     a5,%hi(SYMBOL_R_BRACE)
        lw      a4,%lo(SYMBOL_R_BRACE)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1057:
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a4,%lo(SYMBOL_L_BRACE)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1058:
        lui     a5,%hi(SYMBOL_R_BRACKET)
        lw      a4,%lo(SYMBOL_R_BRACKET)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1059:
        lui     a5,%hi(SYMBOL_L_BRACKET)
        lw      a4,%lo(SYMBOL_L_BRACKET)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1068:
        lui     a5,%hi(SYMBOL_ADD)
        lw      a4,%lo(SYMBOL_ADD)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1069:
        lui     a5,%hi(SYMBOL_MUL)
        lw      a4,%lo(SYMBOL_MUL)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1070:
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a4,%lo(SYMBOL_R_PAREN)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.L1071:
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a4,%lo(SYMBOL_L_PAREN)(a5)
        sw      t6,4(sp)
        li      a0,16
        j       .L1126
.LC97:
        .string "Expected type"
.LC98:
        .string "[parser Error] at %s:%zu:%zu: %s, "
.LC99:
        .string "Unknown built-in type"
.LC100:
        .string "Expected type in container type"
.LC101:
        .string "Expected '>' after container type"
parse_type:
        addi    sp,sp,-32
        sw      s0,24(sp)
        lw      s0,0(a0)
        sw      s3,12(sp)
        sw      s1,20(sp)
        lw      s3,24(s0)
        sw      s4,8(sp)
        sw      ra,28(sp)
        sw      s2,16(sp)
        mv      s1,a0
        mv      s4,a1
        beq     s3,zero,.L1233
        lw      a5,0(s3)
.L1153:
        bne     a5,zero,.L1234
        beq     s4,zero,.L1190
        lw      a4,4(s3)
        li      a1,0
        li      a0,2
.L1172:
        mv      a2,s4
.L1171:
        lw      a5,8(a2)
        lw      a5,0(a5)
        beq     a5,zero,.L1167
        beq     a1,zero,.L1170
.L1168:
        lw      s2,0(a5)
        lw      a3,0(s2)
        beq     a4,a3,.L1160
        lw      a5,4(a5)
        bne     a5,zero,.L1168
.L1167:
        lw      a2,0(a2)
        bne     a2,zero,.L1171
        li      a1,1
        beq     a0,a1,.L1190
        mv      a0,a1
        j       .L1172
.L1234:
        li      a4,5
        bne     a5,a4,.L1155
        lui     a5,%hi(KEYWORD_INT)
        lw      a4,%lo(KEYWORD_INT)(a5)
        lw      a5,4(s3)
        beq     a5,a4,.L1156
        lui     a4,%hi(KEYWORD_FLOAT)
        lw      a4,%lo(KEYWORD_FLOAT)(a4)
        beq     a5,a4,.L1157
        lui     a4,%hi(KEYWORD_STRING)
        lw      a3,%lo(KEYWORD_STRING)(a4)
        beq     a5,a3,.L1158
        lui     a3,%hi(KEYWORD_BOOL)
        lw      a3,%lo(KEYWORD_BOOL)(a3)
        beq     a5,a3,.L1158
        lui     a3,%hi(KEYWORD_VOID)
        lw      a3,%lo(KEYWORD_VOID)(a3)
        beq     a5,a3,.L1158
        lui     a3,%hi(KEYWORD_POINTER)
        lw      a3,%lo(KEYWORD_POINTER)(a3)
        beq     a5,a3,.L1158
        lui     a3,%hi(KEYWORD_CONST)
        lw      a3,%lo(KEYWORD_CONST)(a3)
        bne     a5,a3,.L1155
.L1158:
        lw      a4,%lo(KEYWORD_STRING)(a4)
        beq     a5,a4,.L1235
        lui     a4,%hi(KEYWORD_BOOL)
        lw      a4,%lo(KEYWORD_BOOL)(a4)
        beq     a5,a4,.L1236
        lui     a4,%hi(KEYWORD_VOID)
        lw      a4,%lo(KEYWORD_VOID)(a4)
        beq     a5,a4,.L1237
        lui     a4,%hi(KEYWORD_POINTER)
        lw      a4,%lo(KEYWORD_POINTER)(a4)
        beq     a5,a4,.L1238
        lui     a4,%hi(KEYWORD_CONST)
        lw      a4,%lo(KEYWORD_CONST)(a4)
        bne     a5,a4,.L1165
        lui     a5,%hi(symbol_const)
        lw      s2,%lo(symbol_const)(a5)
.L1160:
        lw      s0,0(s1)
        lw      a0,28(s0)
        beq     a0,zero,.L1239
        lw      a5,0(a0)
.L1176:
        li      a4,4
        beq     a5,a4,.L1240
.L1149:
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        lw      s3,12(sp)
        lw      s4,8(sp)
        mv      a0,s2
        lw      s2,16(sp)
        addi    sp,sp,32
        jr      ra
.L1241:
        lw      a3,8(s2)
        beq     a3,a6,.L1160
        lw      a5,4(a5)
        beq     a5,zero,.L1167
.L1170:
        lw      s2,0(a5)
        li      a6,3
        lw      a3,0(s2)
        beq     a3,a4,.L1241
        lw      a5,4(a5)
        bne     a5,zero,.L1170
        j       .L1167
.L1240:
        lui     a5,%hi(SYMBOL_LT)
        lw      a4,4(a0)
        lw      a5,%lo(SYMBOL_LT)(a5)
        bne     a4,a5,.L1149
        lw      s0,0(s1)
        li      s3,6
        lw      a5,28(s0)
        beq     a5,zero,.L1178
        sw      a5,24(s0)
        mv      s3,s0
.L1179:
        sw      zero,28(s0)
        lw      s0,28(s3)
        beq     s0,zero,.L1181
        lw      a5,0(s0)
        sw      s0,24(s3)
.L1182:
        sw      zero,28(s3)
        beq     a5,zero,.L1184
        li      a4,5
        bne     a5,a4,.L1185
        lui     a5,%hi(KEYWORD_INT)
        lw      a4,%lo(KEYWORD_INT)(a5)
        lw      a5,4(s0)
        beq     a5,a4,.L1184
        lui     a4,%hi(KEYWORD_FLOAT)
        lw      a4,%lo(KEYWORD_FLOAT)(a4)
        beq     a5,a4,.L1184
        lui     a4,%hi(KEYWORD_STRING)
        lw      a4,%lo(KEYWORD_STRING)(a4)
        beq     a5,a4,.L1184
        lui     a4,%hi(KEYWORD_BOOL)
        lw      a4,%lo(KEYWORD_BOOL)(a4)
        beq     a5,a4,.L1184
        lui     a4,%hi(KEYWORD_VOID)
        lw      a4,%lo(KEYWORD_VOID)(a4)
        beq     a5,a4,.L1184
        lui     a4,%hi(KEYWORD_POINTER)
        lw      a4,%lo(KEYWORD_POINTER)(a4)
        beq     a5,a4,.L1184
        lui     a4,%hi(KEYWORD_CONST)
        lw      a4,%lo(KEYWORD_CONST)(a4)
        bne     a5,a4,.L1185
.L1184:
        mv      a1,s4
        mv      a0,s1
        call    parse_type
        beq     a0,zero,.L1192
        lw      s3,0(s1)
        sw      a0,4(s2)
        lw      s0,28(s3)
        beq     s0,zero,.L1186
        lw      a5,0(s0)
        sw      s0,24(s3)
.L1187:
        sw      zero,28(s3)
        li      a4,4
        bne     a5,a4,.L1189
        lui     a5,%hi(SYMBOL_GT)
        lw      a5,%lo(SYMBOL_GT)(a5)
        lw      a4,4(s0)
        beq     a4,a5,.L1149
.L1189:
        lw      a5,8(s1)
        lw      a4,12(s0)
        lw      a3,8(s0)
        lui     s1,%hi(stderr)
        lw      a0,%lo(stderr)(s1)
        lw      a2,0(a5)
        lui     a5,%hi(.LC101)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC101)
.L1231:
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s1)
        mv      a0,s0
        call    output_one_token.constprop.0
.L1192:
        li      s2,0
        j       .L1149
.L1233:
        li      s2,6
        j       .L1152
.L1242:
        bne     a5,s2,.L1153
.L1152:
        mv      a0,s0
        call    get_token
        lbu     a4,32(s0)
        sw      a0,24(s0)
        lw      a5,0(a0)
        mv      s3,a0
        bne     a4,zero,.L1242
        j       .L1153
.L1239:
        li      s3,6
        j       .L1175
.L1243:
        bne     a5,s3,.L1176
.L1175:
        mv      a0,s0
        call    get_token
        lbu     a4,32(s0)
        sw      a0,28(s0)
        lw      a5,0(a0)
        bne     a4,zero,.L1243
        j       .L1176
.L1155:
        lw      a5,8(s1)
        lw      a4,12(s3)
        lw      a3,8(s3)
        lui     s0,%hi(stderr)
        lw      a0,%lo(stderr)(s0)
        lw      a2,0(a5)
        lui     a5,%hi(.LC97)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC97)
.L1230:
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s0)
        mv      a0,s3
        li      s2,0
        call    output_one_token.constprop.0
        j       .L1149
.L1235:
        lui     a5,%hi(symbol_string)
        lw      s2,%lo(symbol_string)(a5)
        j       .L1160
.L1244:
        lw      a5,0(a0)
        bne     a5,s3,.L1180
.L1178:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,24(s0)
        bne     a5,zero,.L1244
.L1180:
        lw      s3,0(s1)
        j       .L1179
.L1156:
        lui     a5,%hi(symbol_int)
        lw      s2,%lo(symbol_int)(a5)
        j       .L1160
.L1157:
        lui     a5,%hi(symbol_float)
        lw      s2,%lo(symbol_float)(a5)
        j       .L1160
.L1245:
        li      a4,6
        bne     a5,a4,.L1182
.L1181:
        mv      a0,s3
        call    get_token
        lbu     a4,32(s3)
        sw      a0,24(s3)
        lw      a5,0(a0)
        mv      s0,a0
        bne     a4,zero,.L1245
        j       .L1182
.L1246:
        li      a4,6
        bne     a5,a4,.L1187
.L1186:
        mv      a0,s3
        call    get_token
        lbu     a4,32(s3)
        sw      a0,24(s3)
        lw      a5,0(a0)
        mv      s0,a0
        bne     a4,zero,.L1246
        j       .L1187
.L1165:
        lw      a5,8(s1)
        lw      a4,12(s3)
        lw      a3,8(s3)
        lw      a2,0(a5)
        lui     s0,%hi(stderr)
        lui     a5,%hi(.LC99)
        lw      a0,%lo(stderr)(s0)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC99)
        j       .L1230
.L1190:
        li      s2,0
        j       .L1160
.L1236:
        lui     a5,%hi(symbol_bool)
        lw      s2,%lo(symbol_bool)(a5)
        j       .L1160
.L1237:
        lui     a5,%hi(symbol_void)
        lw      s2,%lo(symbol_void)(a5)
        j       .L1160
.L1238:
        lui     a5,%hi(symbol_pointer)
        lw      s2,%lo(symbol_pointer)(a5)
        j       .L1160
.L1185:
        lw      a5,8(s1)
        lw      a4,12(s0)
        lw      a3,8(s0)
        lw      a2,0(a5)
        lui     s1,%hi(stderr)
        lui     a5,%hi(.LC100)
        lw      a0,%lo(stderr)(s1)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC100)
        j       .L1231
.LC102:
        .string "Expected expression after '!'"
.LC103:
        .string "Expected expression after '-'"
.LC104:
        .string "Expected expression after '('"
.LC105:
        .string "Expected ')' after expression"
.LC106:
        .string "Expected identifier or 'self' in variable access"
.LC107:
        .string "Undefined variable"
.LC108:
        .string "Expected identifier after '.'"
.LC109:
        .string "Cannot access attribute of non-class type"
.LC110:
        .string "Undefined attribute"
.LC111:
        .string "Expected expression in index access"
.LC112:
        .string "Expected ']' after index expression"
.LC113:
        .string "Expected expression in function call"
.LC114:
        .string "Expected ',' or ')' in function call"
.LC115:
        .string "Expected variable access"
.LC116:
        .string "Unexpected token in expression"
parse_primary:
        addi    sp,sp,-64
        sw      s3,44(sp)
        mv      s3,a0
        li      a0,12
        sw      s0,56(sp)
        sw      s1,52(sp)
        sw      s2,48(sp)
        sw      s10,16(sp)
        sw      ra,60(sp)
        mv      s10,a1
        call    alloc_memory.constprop.0
        lw      s1,0(s3)
        sw      zero,4(a0)
        mv      s2,a0
        lw      s0,24(s1)
        beq     s0,zero,.L1481
        lw      a5,0(s0)
.L1251:
        li      a4,1
        beq     a5,a4,.L1482
        li      a3,2
        beq     a5,a3,.L1483
        li      a4,3
        beq     a5,a4,.L1484
        li      a4,5
        beq     a5,a4,.L1485
        li      a4,4
        beq     a5,a4,.L1260
        beq     a5,zero,.L1261
.L1262:
        lw      a5,8(s3)
        lw      a4,12(s0)
        lw      a3,8(s0)
        lui     s1,%hi(stderr)
        lw      a0,%lo(stderr)(s1)
        lw      a2,0(a5)
        lui     a5,%hi(.LC116)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC116)
.L1479:
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s1)
        mv      a0,s0
        li      s2,0
        call    output_one_token.constprop.0
        j       .L1247
.L1483:
        lw      a5,4(s0)
        sw      a4,8(s2)
        sw      a5,0(s2)
.L1247:
        lw      ra,60(sp)
        lw      s0,56(sp)
        lw      s1,52(sp)
        lw      s3,44(sp)
        lw      s10,16(sp)
        mv      a0,s2
        lw      s2,48(sp)
        addi    sp,sp,64
        jr      ra
.L1482:
        lw      a5,4(s0)
        sw      zero,8(s2)
        sw      a5,0(s2)
        j       .L1247
.L1481:
        sw      s4,40(sp)
        li      s4,6
        j       .L1250
.L1486:
        bne     a5,s4,.L1470
.L1250:
        mv      a0,s1
        call    get_token
        lbu     a4,32(s1)
        sw      a0,24(s1)
        lw      a5,0(a0)
        mv      s0,a0
        bne     a4,zero,.L1486
.L1470:
        lw      s4,40(sp)
        j       .L1251
.L1485:
        lui     a5,%hi(KEYWORD_TRUE)
        lw      a4,%lo(KEYWORD_TRUE)(a5)
        lw      a5,4(s0)
        beq     a4,a5,.L1258
        lui     a4,%hi(KEYWORD_FALSE)
        lw      a4,%lo(KEYWORD_FALSE)(a4)
        beq     a4,a5,.L1258
        lui     a4,%hi(KEYWORD_SELF)
        lw      a4,%lo(KEYWORD_SELF)(a4)
        bne     a4,a5,.L1262
.L1261:
        li      a0,16
        sw      s4,40(sp)
        sw      s8,24(sp)
        sw      s5,36(sp)
        call    alloc_memory.constprop.0
        lw      s4,0(s3)
        sw      zero,8(a0)
        mv      s8,a0
        lw      s1,24(s4)
        sw      zero,0(a0)
        beq     s1,zero,.L1487
        lw      a5,0(s1)
.L1282:
        beq     a5,zero,.L1283
        li      a4,5
        bne     a5,a4,.L1284
        lui     a5,%hi(KEYWORD_SELF)
        lw      a2,%lo(KEYWORD_SELF)(a5)
        lw      a5,4(s1)
        bne     a5,a2,.L1284
.L1285:
        beq     s10,zero,.L1287
        mv      a1,s10
.L1291:
        lw      a5,8(a1)
        lw      a5,0(a5)
        beq     a5,zero,.L1288
.L1290:
        lw      a4,0(a5)
        lw      a3,0(a4)
        beq     a3,a2,.L1289
        lw      a5,4(a5)
        bne     a5,zero,.L1290
.L1288:
        lw      a1,0(a1)
        bne     a1,zero,.L1291
.L1287:
        lw      a5,8(s3)
        lw      a4,12(s1)
        lw      a3,8(s1)
        lw      a2,0(a5)
        lui     s4,%hi(stderr)
        lui     a5,%hi(.LC107)
        lw      a0,%lo(stderr)(s4)
        sw      zero,4(s8)
        lui     s5,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC107)
        j       .L1478
.L1484:
        lw      a5,4(s0)
        sw      a3,8(s2)
        sw      a5,0(s2)
        j       .L1247
.L1289:
        lw      s1,0(s3)
        sw      s9,20(sp)
        sw      a4,4(s8)
        lw      s9,28(s1)
        sw      zero,12(s8)
        li      s4,6
        beq     s9,zero,.L1293
        lw      a4,0(s9)
        li      a5,4
        bne     a4,a5,.L1488
.L1294:
        sw      s6,32(sp)
        sw      s7,28(sp)
        lui     s5,%hi(SYMBOL_DOT)
        lui     s6,%hi(SYMBOL_L_BRACKET)
        lui     s7,%hi(SYMBOL_L_PAREN)
        li      s4,6
        j       .L1297
.L1345:
        lw      a5,0(s9)
.L1348:
        li      a4,4
        bne     a5,a4,.L1475
        mv      s8,s1
.L1297:
        lw      a5,4(s9)
        lw      a4,%lo(SYMBOL_DOT)(s5)
        beq     a5,a4,.L1349
        lw      a4,%lo(SYMBOL_L_BRACKET)(s6)
        beq     a5,a4,.L1349
        lw      a4,%lo(SYMBOL_L_PAREN)(s7)
        bne     a5,a4,.L1489
.L1349:
        li      a0,16
        call    alloc_memory.constprop.0
        lw      a5,4(s9)
        lw      a4,%lo(SYMBOL_DOT)(s5)
        sw      zero,8(a0)
        sw      s8,0(a0)
        mv      s1,a0
        beq     a5,a4,.L1490
        lw      a4,%lo(SYMBOL_L_BRACKET)(s6)
        beq     a5,a4,.L1491
        lw      a4,%lo(SYMBOL_L_PAREN)(s7)
        beq     a5,a4,.L1492
.L1313:
        lw      s8,0(s3)
        lw      s9,28(s8)
        bne     s9,zero,.L1345
        mv      a0,s8
        call    get_token
        lbu     a4,32(s8)
        sw      a0,28(s8)
        lw      a5,0(a0)
        mv      s9,a0
        beq     a4,zero,.L1348
.L1493:
        bne     a5,s4,.L1348
        mv      a0,s8
        call    get_token
        lbu     a4,32(s8)
        sw      a0,28(s8)
        lw      a5,0(a0)
        mv      s9,a0
        bne     a4,zero,.L1493
        j       .L1348
.L1494:
        bne     a5,s4,.L1292
.L1293:
        mv      a0,s1
        call    get_token
        lbu     a4,32(s1)
        sw      a0,28(s1)
        lw      a5,0(a0)
        mv      s9,a0
        bne     a4,zero,.L1494
.L1292:
        li      a4,4
        beq     a5,a4,.L1294
        mv      s1,s8
.L1296:
        sw      s1,0(s2)
        beq     s1,zero,.L1495
.L1295:
        li      a5,7
        lw      s4,40(sp)
        lw      s5,36(sp)
        lw      s8,24(sp)
        lw      s9,20(sp)
        sw      a5,8(s2)
        j       .L1247
.L1490:
        lw      s9,0(s3)
        li      a5,2
        sw      a5,12(a0)
        lw      a5,28(s9)
        li      s8,6
        beq     a5,zero,.L1299
        sw      a5,24(s9)
        mv      s8,s9
.L1300:
        sw      zero,28(s9)
        lw      s9,28(s8)
        beq     s9,zero,.L1302
        lw      a4,0(s9)
        sw      s9,24(s8)
.L1303:
        sw      zero,28(s8)
        bne     a4,zero,.L1496
        lw      a5,0(s1)
        lw      a5,4(a5)
        lw      a5,4(a5)
        beq     a5,zero,.L1306
        lw      a4,8(a5)
        li      a3,3
        bne     a4,a3,.L1306
        lw      a5,16(a5)
        lw      a2,8(a5)
        beq     a2,zero,.L1308
        lw      a1,4(s9)
.L1312:
        lw      a5,8(a2)
        lw      a5,0(a5)
        beq     a5,zero,.L1309
.L1311:
        lw      a4,0(a5)
        lw      a3,0(a4)
        beq     a1,a3,.L1310
        lw      a5,4(a5)
        bne     a5,zero,.L1311
.L1309:
        lw      a2,0(a2)
        bne     a2,zero,.L1312
.L1308:
        lw      a5,8(s3)
        lw      a4,12(s9)
        lw      a3,8(s9)
        lui     s4,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s4)
        lui     a5,%hi(.LC110)
        lui     s5,%hi(.LC98)
        addi    a1,s5,%lo(.LC98)
        sw      zero,4(s1)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC110)
        call    fprintf
        lw      a1,%lo(stderr)(s4)
        mv      a0,s9
.L1476:
        call    output_one_token.constprop.0
        lw      s6,32(sp)
        lw      s7,28(sp)
        lw      s9,20(sp)
        sw      zero,0(s2)
        j       .L1286
.L1497:
        lw      a5,0(a0)
        bne     a5,s8,.L1301
.L1299:
        mv      a0,s9
        call    get_token
        lbu     a5,32(s9)
        sw      a0,24(s9)
        bne     a5,zero,.L1497
.L1301:
        lw      s8,0(s3)
        j       .L1300
.L1498:
        li      a5,6
        bne     a4,a5,.L1303
.L1302:
        mv      a0,s8
        call    get_token
        lbu     a3,32(s8)
        sw      a0,24(s8)
        lw      a4,0(a0)
        mv      s9,a0
        bne     a3,zero,.L1498
        j       .L1303
.L1310:
        sw      a4,4(s1)
        j       .L1313
.L1491:
        lw      a5,0(s3)
        li      a4,3
        sw      a4,12(a0)
        lw      a4,28(a5)
        li      s8,6
        beq     a4,zero,.L1315
        sw      a4,24(a5)
        mv      s8,a5
.L1316:
        sw      zero,28(a5)
        lw      a5,28(s8)
        beq     a5,zero,.L1318
        sw      a5,24(s8)
.L1319:
        sw      zero,28(s8)
        mv      a2,s10
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        sw      a0,4(s1)
        beq     a0,zero,.L1499
        lw      s8,0(s3)
        lw      s9,28(s8)
        beq     s9,zero,.L1321
        lw      a4,0(s9)
        sw      s9,24(s8)
.L1322:
        sw      zero,28(s8)
        li      a5,4
        bne     a4,a5,.L1324
        lui     a5,%hi(SYMBOL_R_BRACKET)
        lw      a5,%lo(SYMBOL_R_BRACKET)(a5)
        lw      a4,4(s9)
        beq     a4,a5,.L1313
.L1324:
        lw      a5,8(s3)
        lw      a4,12(s9)
        lw      a3,8(s9)
        lui     s4,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s4)
        lui     a5,%hi(.LC112)
        lui     s5,%hi(.LC98)
        addi    a1,s5,%lo(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC112)
        call    fprintf
        lw      a1,%lo(stderr)(s4)
        mv      a0,s9
        j       .L1476
.L1500:
        lw      a4,0(a0)
        bne     a4,s8,.L1317
.L1315:
        mv      a0,a5
        sw      a5,12(sp)
        call    get_token
        lw      a5,12(sp)
        lbu     a4,32(a5)
        sw      a0,24(a5)
        bne     a4,zero,.L1500
.L1317:
        lw      s8,0(s3)
        j       .L1316
.L1501:
        lw      a5,0(a0)
        li      a4,6
        bne     a5,a4,.L1319
.L1318:
        mv      a0,s8
        call    get_token
        lbu     a5,32(s8)
        sw      a0,24(s8)
        bne     a5,zero,.L1501
        j       .L1319
.L1502:
        li      a5,6
        bne     a4,a5,.L1322
.L1321:
        mv      a0,s8
        call    get_token
        lbu     a3,32(s8)
        sw      a0,24(s8)
        lw      a4,0(a0)
        mv      s9,a0
        bne     a3,zero,.L1502
        j       .L1322
.L1260:
        lui     a5,%hi(SYMBOL_NOT)
        lw      a4,%lo(SYMBOL_NOT)(a5)
        lw      a5,4(s0)
        beq     a5,a4,.L1503
        lui     a4,%hi(SYMBOL_SUB)
        lw      a4,%lo(SYMBOL_SUB)(a4)
        beq     a5,a4,.L1504
        lui     a4,%hi(SYMBOL_L_PAREN)
        lw      a4,%lo(SYMBOL_L_PAREN)(a4)
        bne     a5,a4,.L1262
        lw      s1,0(s3)
        lw      a5,28(s1)
        beq     a5,zero,.L1505
        sw      a5,24(s1)
.L1272:
        sw      zero,28(s1)
        mv      a2,s10
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        sw      a0,0(s2)
        beq     a0,zero,.L1506
        lw      s1,0(s3)
        lw      s0,28(s1)
        beq     s0,zero,.L1507
        lw      a5,0(s0)
        sw      s0,24(s1)
.L1275:
        sw      zero,28(s1)
        li      a4,4
        bne     a5,a4,.L1277
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        lw      a4,4(s0)
        beq     a4,a5,.L1247
.L1277:
        lw      a5,8(s3)
        lw      a4,12(s0)
        lw      a3,8(s0)
        lw      a2,0(a5)
        lui     s1,%hi(stderr)
        lui     a5,%hi(.LC105)
        lw      a0,%lo(stderr)(s1)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC105)
        j       .L1479
.L1284:
        lw      a5,8(s3)
        lw      a4,12(s1)
        lw      a3,8(s1)
        lui     s4,%hi(stderr)
        lw      a0,%lo(stderr)(s4)
        lw      a2,0(a5)
        lui     a5,%hi(.LC106)
        lui     s5,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC106)
.L1478:
        addi    a1,s5,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s4)
        mv      a0,s1
        call    output_one_token.constprop.0
        sw      zero,0(s2)
.L1286:
        lw      a5,8(s3)
        lw      a4,12(s0)
        lw      a3,8(s0)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s4)
        lui     a5,%hi(.LC115)
        addi    a1,s5,%lo(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC115)
        call    fprintf
        lw      a1,%lo(stderr)(s4)
        mv      a0,s0
        li      s2,0
        call    output_one_token.constprop.0
        lw      s4,40(sp)
        lw      s5,36(sp)
        lw      s8,24(sp)
        j       .L1247
.L1258:
        li      a4,3
        sw      a5,0(s2)
        sw      a4,8(s2)
        j       .L1247
.L1492:
        li      a5,1
        sw      a5,12(a0)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s9,0(s3)
        sw      zero,0(a0)
        sw      zero,4(a0)
        lw      a5,28(s9)
        sw      a0,4(s1)
        li      s8,6
        beq     a5,zero,.L1325
        sw      a5,24(s9)
        mv      a4,s9
.L1326:
        sw      zero,28(s9)
        lw      s8,28(a4)
        li      s9,6
        beq     s8,zero,.L1328
        lw      a5,0(s8)
        sw      s8,24(a4)
.L1329:
        sw      zero,28(a4)
.L1331:
        li      a4,4
        beq     a5,a4,.L1508
.L1344:
        mv      a2,s10
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        mv      s9,a0
        beq     a0,zero,.L1509
        lw      s8,4(s1)
        beq     s8,zero,.L1510
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s8)
        sw      s9,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L1511
        sw      a0,4(a5)
.L1335:
        lw      s9,0(s3)
        sw      a0,4(s8)
        lw      s8,28(s9)
        beq     s8,zero,.L1336
        lw      a5,0(s8)
        sw      s8,24(s9)
.L1337:
        sw      zero,28(s9)
        li      a4,4
        beq     a5,a4,.L1512
.L1339:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lui     s4,%hi(stderr)
        lw      a0,%lo(stderr)(s4)
        lw      a2,0(a5)
        lui     a5,%hi(.LC114)
        lui     s5,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC114)
.L1477:
        addi    a1,s5,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s4)
        mv      a0,s8
        j       .L1476
.L1513:
        lw      a5,0(a0)
        bne     a5,s8,.L1327
.L1325:
        mv      a0,s9
        call    get_token
        lbu     a5,32(s9)
        sw      a0,24(s9)
        bne     a5,zero,.L1513
.L1327:
        lw      a4,0(s3)
        j       .L1326
.L1514:
        bne     a5,s9,.L1329
.L1328:
        mv      a0,a4
        sw      a4,12(sp)
        call    get_token
        lw      a4,12(sp)
        lw      a5,0(a0)
        mv      s8,a0
        lbu     a3,32(a4)
        sw      a0,24(a4)
        bne     a3,zero,.L1514
        j       .L1329
.L1515:
        li      a4,6
        bne     a5,a4,.L1337
.L1336:
        mv      a0,s9
        call    get_token
        lbu     a4,32(s9)
        sw      a0,24(s9)
        lw      a5,0(a0)
        mv      s8,a0
        bne     a4,zero,.L1515
        j       .L1337
.L1508:
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a4,4(s8)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        bne     a4,a5,.L1344
        j       .L1313
.L1512:
        lui     a4,%hi(SYMBOL_COMMA)
        lw      a5,4(s8)
        lw      a4,%lo(SYMBOL_COMMA)(a4)
        beq     a5,a4,.L1340
        lui     a4,%hi(SYMBOL_R_PAREN)
        lw      a4,%lo(SYMBOL_R_PAREN)(a4)
        beq     a5,a4,.L1313
        j       .L1339
.L1511:
        sw      a0,0(s8)
        j       .L1335
.L1283:
        lw      a2,4(s1)
        j       .L1285
.L1487:
        li      s5,6
        j       .L1281
.L1516:
        bne     a5,s5,.L1282
.L1281:
        mv      a0,s4
        call    get_token
        lbu     a4,32(s4)
        sw      a0,24(s4)
        lw      a5,0(a0)
        mv      s1,a0
        bne     a4,zero,.L1516
        j       .L1282
.L1340:
        lw      s9,0(s3)
        lw      s8,28(s9)
        beq     s8,zero,.L1341
        lw      a5,0(s8)
        sw      s8,24(s9)
.L1342:
        sw      zero,28(s9)
        j       .L1331
.L1517:
        li      a4,6
        bne     a5,a4,.L1342
.L1341:
        mv      a0,s9
        call    get_token
        lbu     a4,32(s9)
        sw      a0,24(s9)
        lw      a5,0(a0)
        mv      s8,a0
        bne     a4,zero,.L1517
        sw      zero,28(s9)
        j       .L1331
.L1475:
        lw      s6,32(sp)
        lw      s7,28(sp)
        j       .L1296
.L1503:
        lw      s1,0(s3)
        lw      a5,28(s1)
        beq     a5,zero,.L1518
        sw      a5,24(s1)
.L1265:
        sw      zero,28(s1)
        mv      a1,s10
        mv      a0,s3
        call    parse_primary
        sw      a0,0(s2)
        beq     a0,zero,.L1519
        li      a5,6
        sw      a5,8(s2)
        j       .L1247
.L1509:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s4,%hi(stderr)
        lui     a5,%hi(.LC113)
        lw      a0,%lo(stderr)(s4)
        lui     s5,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC113)
        j       .L1477
.L1504:
        lw      s1,0(s3)
        lw      a5,28(s1)
        beq     a5,zero,.L1520
        sw      a5,24(s1)
.L1269:
        sw      zero,28(s1)
        mv      a1,s10
        mv      a0,s3
        call    parse_primary
        sw      a0,0(s2)
        beq     a0,zero,.L1521
        li      a5,5
        sw      a5,8(s2)
        j       .L1247
.L1489:
        lw      s6,32(sp)
        lw      s7,28(sp)
        mv      s1,s8
        j       .L1296
.L1306:
        lw      a5,8(s3)
        lw      a4,12(s9)
        lw      a3,8(s9)
        lui     s4,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s4)
        lui     a5,%hi(.LC109)
        lui     s5,%hi(.LC98)
        addi    a1,s5,%lo(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC109)
        call    fprintf
        lw      a1,%lo(stderr)(s4)
        mv      a0,s9
        j       .L1476
.L1518:
        sw      s4,40(sp)
        li      s4,6
        j       .L1264
.L1522:
        lw      a5,0(a0)
        bne     a5,s4,.L1471
.L1264:
        mv      a0,s1
        call    get_token
        lbu     a5,32(s1)
        sw      a0,24(s1)
        bne     a5,zero,.L1522
.L1471:
        lw      s4,40(sp)
        j       .L1265
.L1520:
        sw      s4,40(sp)
        li      s4,6
        j       .L1268
.L1523:
        lw      a5,0(a0)
        bne     a5,s4,.L1472
.L1268:
        mv      a0,s1
        call    get_token
        lbu     a5,32(s1)
        sw      a0,24(s1)
        bne     a5,zero,.L1523
.L1472:
        lw      s4,40(sp)
        j       .L1269
.L1505:
        sw      s4,40(sp)
        li      s4,6
        j       .L1271
.L1524:
        lw      a5,0(a0)
        bne     a5,s4,.L1473
.L1271:
        mv      a0,s1
        call    get_token
        lbu     a5,32(s1)
        sw      a0,24(s1)
        bne     a5,zero,.L1524
.L1473:
        lw      s4,40(sp)
        j       .L1272
.L1496:
        lw      a5,8(s3)
        lw      a4,12(s9)
        lw      a3,8(s9)
        lui     s4,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s4)
        lui     a5,%hi(.LC108)
        lui     s5,%hi(.LC98)
        addi    a1,s5,%lo(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC108)
        call    fprintf
        lw      a1,%lo(stderr)(s4)
        mv      a0,s9
        j       .L1476
.L1507:
        sw      s4,40(sp)
        li      s4,6
        j       .L1274
.L1525:
        bne     a5,s4,.L1474
.L1274:
        mv      a0,s1
        call    get_token
        lbu     a4,32(s1)
        sw      a0,24(s1)
        lw      a5,0(a0)
        mv      s0,a0
        bne     a4,zero,.L1525
.L1474:
        lw      s4,40(sp)
        j       .L1275
.L1499:
        lw      a5,8(s3)
        lw      a4,12(s9)
        lw      a3,8(s9)
        lui     s4,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s4)
        lui     a5,%hi(.LC111)
        lui     s5,%hi(.LC98)
        addi    a1,s5,%lo(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC111)
        call    fprintf
        lw      a1,%lo(stderr)(s4)
        mv      a0,s9
        j       .L1476
.L1506:
        lw      a5,8(s3)
        lw      a4,12(s0)
        lw      a3,8(s0)
        lw      a2,0(a5)
        lui     s1,%hi(stderr)
        lui     a5,%hi(.LC104)
        lw      a0,%lo(stderr)(s1)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC104)
        j       .L1479
.L1488:
        sw      s8,0(s2)
        j       .L1295
.L1519:
        lw      a5,8(s3)
        lw      a4,12(s0)
        lw      a3,8(s0)
        lw      a2,0(a5)
        lui     s1,%hi(stderr)
        lui     a5,%hi(.LC102)
        lw      a0,%lo(stderr)(s1)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC102)
        j       .L1479
.L1521:
        lw      a5,8(s3)
        lw      a4,12(s0)
        lw      a3,8(s0)
        lw      a2,0(a5)
        lui     s1,%hi(stderr)
        lui     a5,%hi(.LC103)
        lw      a0,%lo(stderr)(s1)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC103)
        j       .L1479
.L1510:
        call    list_append.part.0
.L1495:
        lw      s9,20(sp)
        lui     s4,%hi(stderr)
        lui     s5,%hi(.LC98)
        j       .L1286
.LC117:
        .string "Expected expression"
.LC118:
        .string "Expected expression after operator"
parse_expression_prec:
        addi    sp,sp,-80
        sw      s2,64(sp)
        mv      s2,a0
        li      a0,16
        sw      ra,76(sp)
        sw      s0,72(sp)
        sw      s3,60(sp)
        mv      s0,a2
        sw      a1,8(sp)
        sw      a2,12(sp)
        sw      s1,68(sp)
        call    alloc_memory.constprop.0
        mv      s3,a0
        sw      zero,12(a0)
        mv      a1,s0
        mv      a0,s2
        call    parse_primary
        sw      a0,0(s3)
        lw      s0,0(s2)
        beq     a0,zero,.L1612
        lw      a0,28(s0)
        sw      s6,48(sp)
        sw      s7,44(sp)
        li      a5,21
        sw      zero,4(s3)
        sw      a5,8(s3)
        beq     a0,zero,.L1613
        lw      s6,0(a0)
.L1541:
        li      a5,4
        lui     s7,%hi(SYMBOL_ADD)
        bne     s6,a5,.L1610
        sw      s8,40(sp)
        sw      s9,36(sp)
        sw      s4,56(sp)
        sw      s5,52(sp)
        sw      s10,32(sp)
        sw      s11,28(sp)
        lui     s8,%hi(SYMBOL_SUB)
        lui     s9,%hi(SYMBOL_MUL)
        li      s0,6
.L1542:
        lw      a5,4(a0)
        lw      a4,%lo(SYMBOL_ADD)(s7)
        beq     a5,a4,.L1558
        lw      a4,%lo(SYMBOL_SUB)(s8)
        beq     a5,a4,.L1559
        lw      a4,%lo(SYMBOL_MUL)(s9)
        beq     a5,a4,.L1560
        lui     a4,%hi(SYMBOL_DIV)
        lw      a4,%lo(SYMBOL_DIV)(a4)
        beq     a5,a4,.L1561
        lui     a4,%hi(SYMBOL_MOD)
        lw      a4,%lo(SYMBOL_MOD)(a4)
        beq     a5,a4,.L1562
        lui     a4,%hi(SYMBOL_ASSIGN)
        lw      a4,%lo(SYMBOL_ASSIGN)(a4)
        beq     a5,a4,.L1563
        lui     a4,%hi(SYMBOL_EQ)
        lw      a4,%lo(SYMBOL_EQ)(a4)
        beq     a5,a4,.L1564
        lui     a4,%hi(SYMBOL_NE)
        lw      a4,%lo(SYMBOL_NE)(a4)
        beq     a5,a4,.L1565
        lui     a4,%hi(SYMBOL_LT)
        lw      a4,%lo(SYMBOL_LT)(a4)
        beq     a5,a4,.L1566
        lui     a4,%hi(SYMBOL_GT)
        lw      a4,%lo(SYMBOL_GT)(a4)
        beq     a5,a4,.L1567
        lui     a4,%hi(SYMBOL_LE)
        lw      a4,%lo(SYMBOL_LE)(a4)
        beq     a5,a4,.L1568
        lui     a4,%hi(SYMBOL_GE)
        lw      a4,%lo(SYMBOL_GE)(a4)
        beq     a5,a4,.L1569
        lui     a4,%hi(SYMBOL_ADD_ASSIGN)
        lw      a4,%lo(SYMBOL_ADD_ASSIGN)(a4)
        beq     a5,a4,.L1570
        lui     a4,%hi(SYMBOL_SUB_ASSIGN)
        lw      a4,%lo(SYMBOL_SUB_ASSIGN)(a4)
        beq     a5,a4,.L1571
        lui     a4,%hi(SYMBOL_MUL_ASSIGN)
        lw      a4,%lo(SYMBOL_MUL_ASSIGN)(a4)
        beq     a5,a4,.L1572
        lui     a4,%hi(SYMBOL_DIV_ASSIGN)
        lw      a4,%lo(SYMBOL_DIV_ASSIGN)(a4)
        beq     a5,a4,.L1573
        lui     a4,%hi(SYMBOL_MOD_ASSIGN)
        lw      a4,%lo(SYMBOL_MOD_ASSIGN)(a4)
        beq     a5,a4,.L1574
        lui     a4,%hi(SYMBOL_AND)
        lw      a4,%lo(SYMBOL_AND)(a4)
        beq     a5,a4,.L1575
        lui     a4,%hi(SYMBOL_OR)
        lw      a4,%lo(SYMBOL_OR)(a4)
        beq     a5,a4,.L1614
.L1611:
        lw      s4,56(sp)
        lw      s5,52(sp)
        lw      s6,48(sp)
        lw      s7,44(sp)
        lw      s8,40(sp)
        lw      s9,36(sp)
        lw      s10,32(sp)
        lw      s11,28(sp)
.L1526:
        lw      ra,76(sp)
        lw      s0,72(sp)
        lw      s1,68(sp)
        lw      s2,64(sp)
        mv      a0,s3
        lw      s3,60(sp)
        addi    sp,sp,80
        jr      ra
.L1558:
        li      s4,5
        li      a5,4
        li      s5,0
.L1554:
        lw      a4,8(sp)
        bgt     a4,a5,.L1611
        lw      s1,0(s2)
        lw      a5,28(s1)
        beq     a5,zero,.L1543
        sw      a5,24(s1)
        mv      s10,s1
.L1544:
        sw      zero,28(s1)
        lw      s11,28(s10)
        beq     s11,zero,.L1546
        sw      s11,24(s10)
.L1547:
        sw      zero,28(s10)
        li      a0,16
        call    alloc_memory.constprop.0
        lw      a2,12(sp)
        mv      s1,a0
        sw      zero,12(a0)
        mv      a1,s4
        mv      a0,s2
        call    parse_expression_prec
        sw      a0,4(s1)
        beq     a0,zero,.L1615
        lw      s4,0(s2)
        sw      s3,0(s1)
        sw      s5,8(s1)
        lw      a0,28(s4)
        beq     a0,zero,.L1552
        lw      a5,0(a0)
.L1553:
        li      a4,4
        mv      s3,s1
        beq     a5,a4,.L1542
        j       .L1611
.L1616:
        lw      a5,0(a0)
        bne     a5,s0,.L1545
.L1543:
        mv      a0,s1
        call    get_token
        lbu     a5,32(s1)
        sw      a0,24(s1)
        bne     a5,zero,.L1616
.L1545:
        lw      s10,0(s2)
        j       .L1544
.L1617:
        lw      a4,0(a0)
        bne     a4,s0,.L1547
.L1546:
        mv      a0,s10
        call    get_token
        lbu     a4,32(s10)
        sw      a0,24(s10)
        mv      s11,a0
        bne     a4,zero,.L1617
        j       .L1547
.L1618:
        bne     a5,s0,.L1553
.L1552:
        mv      a0,s4
        call    get_token
        lbu     a4,32(s4)
        sw      a0,28(s4)
        lw      a5,0(a0)
        bne     a4,zero,.L1618
        j       .L1553
.L1559:
        li      s4,5
        li      a5,4
        li      s5,1
        j       .L1554
.L1560:
        li      s4,6
        li      a5,5
        li      s5,2
        j       .L1554
.L1613:
        li      s1,6
        j       .L1540
.L1619:
        bne     s6,s1,.L1541
.L1540:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,28(s0)
        lw      s6,0(a0)
        bne     a5,zero,.L1619
        j       .L1541
.L1561:
        li      s4,6
        li      a5,5
        li      s5,3
        j       .L1554
.L1562:
        mv      s5,s6
        li      s4,6
        li      a5,5
        j       .L1554
.L1563:
        li      s4,1
        mv      a5,s4
        li      s5,5
        j       .L1554
.L1615:
        lw      a5,8(s2)
        lw      a4,12(s11)
        lw      a3,8(s11)
        lui     s0,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s0)
        lui     a5,%hi(.LC118)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC118)
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s0)
        mv      a0,s11
        li      s3,0
        call    output_one_token.constprop.0
        j       .L1611
.L1614:
        li      s4,3
        li      a5,2
        li      s5,18
        j       .L1554
.L1575:
        li      s4,3
        li      a5,2
        li      s5,17
        j       .L1554
.L1564:
        li      s4,4
        li      a5,3
        li      s5,6
        j       .L1554
.L1565:
        li      s4,4
        li      a5,3
        li      s5,7
        j       .L1554
.L1566:
        li      s4,4
        li      a5,3
        li      s5,8
        j       .L1554
.L1567:
        li      s4,4
        li      a5,3
        li      s5,9
        j       .L1554
.L1568:
        li      s4,4
        li      a5,3
        li      s5,10
        j       .L1554
.L1569:
        li      s4,4
        li      a5,3
        li      s5,11
        j       .L1554
.L1570:
        li      s4,1
        mv      a5,s4
        li      s5,12
        j       .L1554
.L1571:
        li      s4,1
        mv      a5,s4
        li      s5,13
        j       .L1554
.L1612:
        lw      a5,8(s2)
        lw      a0,24(s0)
        sw      s4,56(sp)
        lui     s1,%hi(stderr)
        sw      s5,52(sp)
        lw      s4,0(a5)
        lw      s3,%lo(stderr)(s1)
        beq     a0,zero,.L1620
        lw      s5,8(a0)
        addi    s5,s5,1
.L1531:
        lw      a4,12(a0)
        lui     a5,%hi(.LC117)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        mv      a3,s5
        mv      a2,s4
        mv      a0,s3
        addi    a5,a5,%lo(.LC117)
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      s0,0(s2)
        lw      a0,24(s0)
        beq     a0,zero,.L1621
.L1534:
        lw      a1,%lo(stderr)(s1)
        li      s3,0
        call    output_one_token.constprop.0
        lw      s4,56(sp)
        lw      s5,52(sp)
        j       .L1526
.L1572:
        li      s4,1
        mv      a5,s4
        li      s5,14
        j       .L1554
.L1573:
        li      s4,1
        mv      a5,s4
        li      s5,15
        j       .L1554
.L1574:
        li      s4,1
        mv      a5,s4
        li      s5,16
        j       .L1554
.L1610:
        lw      s6,48(sp)
        lw      s7,44(sp)
        j       .L1526
.L1620:
        li      s5,6
        j       .L1530
.L1622:
        lw      a5,0(a0)
        bne     a5,s5,.L1529
.L1530:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,24(s0)
        bne     a5,zero,.L1622
.L1529:
        lw      s0,0(s2)
        lw      s5,8(a0)
        lw      a0,24(s0)
        addi    s5,s5,1
        bne     a0,zero,.L1531
        sw      s6,48(sp)
        li      s6,6
        j       .L1533
.L1623:
        lw      a5,0(a0)
        bne     a5,s6,.L1609
.L1533:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,24(s0)
        bne     a5,zero,.L1623
.L1609:
        lw      s6,48(sp)
        j       .L1531
.L1621:
        li      s2,6
        j       .L1536
.L1624:
        lw      a5,0(a0)
        bne     a5,s2,.L1534
.L1536:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,24(s0)
        bne     a5,zero,.L1624
        j       .L1534
.LC119:
        .string "[analyzer Error] at %s: Cannot perform operations on void type\n"
.LC120:
        .string "[analyzer Error] at %s: Unary operation special method must have exactly one parameter\n"
.LC121:
        .string "[analyzer Error] at %s: Invalid unary operation\n"
.LC122:
        .string "[analyzer Error] at %s: Invalid binary operation\n"
.LC123:
        .string "[analyzer Warning]: Type mismatch, left: '%s', right: '%s', op: '%u'\n"
calculate_type:
        lui     a7,%hi(symbol_void)
        lw      a6,%lo(symbol_void)(a7)
        addi    sp,sp,-32
        sw      ra,28(sp)
        mv      a5,a0
        mv      a3,a1
        beq     a6,a0,.L1753
        lw      t1,8(a0)
        mv      a4,a2
        beq     a1,zero,.L1754
        beq     a6,a1,.L1637
        addi    a2,a2,-17
        li      a1,1
        bleu    a2,a1,.L1638
        addi    a2,a4,-6
        bleu    a2,a1,.L1755
        addi    a2,a4,-8
        li      a1,3
        bgtu    a2,a1,.L1648
        lui     a2,%hi(symbol_int)
        lw      a2,%lo(symbol_int)(a2)
        lui     a1,%hi(symbol_bool)
        lw      a0,%lo(symbol_bool)(a1)
        beq     a5,a2,.L1649
        lui     a1,%hi(symbol_float)
        lw      a1,%lo(symbol_float)(a1)
        beq     a5,a1,.L1649
        beq     a5,a0,.L1649
.L1646:
        li      a2,3
        beq     t1,a2,.L1756
.L1676:
        lw      a1,8(a3)
        li      a2,3
        beq     a1,a2,.L1757
.L1683:
        lui     a6,%hi(stderr)
        lui     a2,%hi(file)
        lw      a2,%lo(file)(a2)
        lw      a0,%lo(stderr)(a6)
        lui     a1,%hi(.LC122)
        addi    a1,a1,%lo(.LC122)
        sw      a4,8(sp)
        sw      a3,4(sp)
        sw      a5,0(sp)
        call    fprintf
        lw      a5,0(sp)
        lw      a3,4(sp)
        lui     a6,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(a6)
        lw      a4,8(sp)
        lw      a3,0(a3)
        lui     a1,%hi(.LC123)
        lui     a5,%hi(has_error)
        li      a6,1
        addi    a1,a1,%lo(.LC123)
        sb      a6,%lo(has_error)(a5)
        call    fprintf
        lw      ra,28(sp)
        lui     a7,%hi(symbol_void)
        lw      a0,%lo(symbol_void)(a7)
        addi    sp,sp,32
        jr      ra
.L1754:
        li      a3,21
        beq     a2,a3,.L1701
        li      a3,3
        beq     t1,a3,.L1758
.L1630:
        lui     a3,%hi(symbol_int)
        lw      a3,%lo(symbol_int)(a3)
        beq     a3,a5,.L1634
        lui     a3,%hi(symbol_float)
        lw      a3,%lo(symbol_float)(a3)
        beq     a3,a5,.L1634
.L1635:
        li      a5,20
        beq     a4,a5,.L1638
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC121)
        addi    a1,a1,%lo(.LC121)
.L1743:
        call    fprintf
        lw      ra,28(sp)
        lui     a5,%hi(has_error)
        li      a4,1
        lui     a7,%hi(symbol_void)
        sb      a4,%lo(has_error)(a5)
        lw      a0,%lo(symbol_void)(a7)
        addi    sp,sp,32
        jr      ra
.L1638:
        lui     a5,%hi(symbol_bool)
        lw      a0,%lo(symbol_bool)(a5)
.L1625:
        lw      ra,28(sp)
        addi    sp,sp,32
        jr      ra
.L1753:
        beq     a1,zero,.L1701
.L1637:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lui     a1,%hi(.LC119)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        addi    a1,a1,%lo(.LC119)
        j       .L1743
.L1648:
        li      a2,4
        bleu    a4,a2,.L1759
        li      a1,5
        bne     a4,a1,.L1663
        beq     a0,a3,.L1658
        lui     a2,%hi(symbol_int)
        lw      a2,%lo(symbol_int)(a2)
        lui     a1,%hi(symbol_float)
        lw      a0,%lo(symbol_float)(a1)
        beq     a5,a2,.L1665
        beq     a5,a0,.L1760
        lui     a1,%hi(symbol_bool)
        lw      a1,%lo(symbol_bool)(a1)
        bne     a5,a1,.L1646
        beq     a3,a2,.L1701
        bne     a3,a0,.L1646
.L1701:
        mv      a0,a5
.L1762:
        lw      ra,28(sp)
        addi    sp,sp,32
        jr      ra
.L1663:
        addi    a1,a4,-12
        bgtu    a1,a2,.L1646
        lui     a2,%hi(symbol_int)
        lw      a0,%lo(symbol_int)(a2)
        beq     a5,a0,.L1761
        lui     a2,%hi(symbol_float)
        lw      a2,%lo(symbol_float)(a2)
        beq     a5,a2,.L1672
        lui     a1,%hi(symbol_bool)
        lw      a1,%lo(symbol_bool)(a1)
        bne     a5,a1,.L1646
        beq     a5,a3,.L1658
        beq     a3,a0,.L1701
        bne     a3,a2,.L1646
.L1764:
        mv      a0,a5
        j       .L1762
.L1755:
        lui     a2,%hi(symbol_bool)
        lw      a0,%lo(symbol_bool)(a2)
        beq     a5,a3,.L1625
        lui     a2,%hi(symbol_int)
        lw      a2,%lo(symbol_int)(a2)
        lui     a1,%hi(symbol_float)
        lw      a1,%lo(symbol_float)(a1)
        beq     a5,a2,.L1641
        beq     a5,a1,.L1747
        bne     a5,a0,.L1646
        beq     a3,a2,.L1625
        bne     a3,a1,.L1646
        j       .L1625
.L1759:
        lui     a2,%hi(symbol_int)
        lw      a0,%lo(symbol_int)(a2)
        beq     a5,a0,.L1763
        lui     a2,%hi(symbol_float)
        lw      a2,%lo(symbol_float)(a2)
        beq     a5,a2,.L1655
        lui     a1,%hi(symbol_bool)
        lw      a6,%lo(symbol_bool)(a1)
        bne     a5,a6,.L1646
        beq     a3,a0,.L1656
        beq     a3,a2,.L1657
.L1698:
        lw      a6,%lo(symbol_bool)(a1)
        bne     a3,a6,.L1646
        beq     a5,a3,.L1658
        bne     a5,a2,.L1662
        beq     a3,a0,.L1661
.L1660:
        beq     a3,a2,.L1661
        lw      a1,%lo(symbol_bool)(a1)
        beq     a3,a1,.L1695
.L1662:
        li      a0,0
        j       .L1625
.L1649:
        beq     a3,a2,.L1625
        lui     a2,%hi(symbol_float)
        lw      a2,%lo(symbol_float)(a2)
.L1747:
        beq     a3,a2,.L1625
        bne     a3,a0,.L1646
        j       .L1625
.L1634:
        li      a3,19
        bne     a4,a3,.L1635
        mv      a0,a5
        j       .L1762
.L1758:
        lw      a3,16(a0)
        sw      a0,4(sp)
        mv      a1,a2
        lw      a0,8(a3)
        sw      a2,0(sp)
        call    find_method
        lw      a4,0(sp)
        lw      a5,4(sp)
        beq     a0,zero,.L1630
        lw      a5,16(a0)
        lw      a5,8(a5)
        beq     a5,zero,.L1631
        lw      a4,0(a5)
        beq     a4,zero,.L1631
        lw      a5,4(a5)
        beq     a4,a5,.L1632
.L1631:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lui     a1,%hi(.LC120)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        addi    a1,a1,%lo(.LC120)
        j       .L1743
.L1672:
        beq     a5,a3,.L1658
        beq     a3,a0,.L1701
.L1692:
        lui     a2,%hi(symbol_bool)
        lw      a2,%lo(symbol_bool)(a2)
        bne     a3,a2,.L1646
        j       .L1764
.L1665:
        bne     a3,a0,.L1692
        mv      a0,a5
        j       .L1762
.L1763:
        beq     a3,a5,.L1625
        lui     a2,%hi(symbol_float)
        lw      a2,%lo(symbol_float)(a2)
        beq     a3,a2,.L1661
        lui     a1,%hi(symbol_bool)
        lw      a1,%lo(symbol_bool)(a1)
        bne     a3,a1,.L1646
        mv      a1,a3
.L1695:
        beq     a5,a2,.L1701
        sub     a5,a5,a0
        sub     a4,a0,a1
        seqz    a5,a5
        seqz    a4,a4
        or      a5,a5,a4
        bne     a5,zero,.L1625
        mv      a0,a1
        j       .L1625
.L1656:
        bne     a5,a6,.L1662
        beq     a0,a2,.L1661
        bne     a5,a2,.L1625
.L1661:
        mv      a0,a2
        j       .L1625
.L1757:
        lw      a2,16(a3)
        mv      a1,a4
        sw      a5,8(sp)
        lw      a0,8(a2)
        sw      a3,4(sp)
        sw      a4,0(sp)
        call    find_method
        lw      a4,0(sp)
        lw      a3,4(sp)
        lw      a5,8(sp)
        mv      a2,a0
        beq     a0,zero,.L1683
        lw      a0,16(a0)
        sw      a4,8(sp)
        sw      a5,0(sp)
        sw      a2,12(sp)
        call    method_other_type.isra.0
        lw      a5,0(sp)
        lw      a3,4(sp)
        lw      a4,8(sp)
        beq     a0,zero,.L1683
        lw      a2,12(sp)
        beq     a0,a5,.L1684
        lui     a1,%hi(symbol_int)
        lw      a1,%lo(symbol_int)(a1)
        lui     a6,%hi(symbol_float)
        lw      a6,%lo(symbol_float)(a6)
        beq     a0,a1,.L1685
        beq     a0,a6,.L1765
        lui     t1,%hi(symbol_bool)
        lw      t1,%lo(symbol_bool)(t1)
        bne     a0,t1,.L1683
        bne     a5,a1,.L1766
.L1684:
        lw      a0,4(a2)
        j       .L1625
.L1766:
        bne     a5,a6,.L1683
        lw      a0,4(a2)
        j       .L1625
.L1641:
        beq     a3,a1,.L1625
        bne     a3,a0,.L1646
        j       .L1625
.L1756:
        lw      a2,16(a5)
        mv      a1,a4
        sw      a3,8(sp)
        lw      a0,8(a2)
        sw      a5,4(sp)
        sw      a4,0(sp)
        call    find_method
        lw      a4,0(sp)
        lw      a5,4(sp)
        lw      a3,8(sp)
        mv      a2,a0
        beq     a0,zero,.L1676
        lw      a0,16(a0)
        sw      a4,8(sp)
        sw      a3,4(sp)
        sw      a5,0(sp)
        sw      a2,12(sp)
        call    method_other_type.isra.0
        lw      a5,0(sp)
        lw      a3,4(sp)
        lw      a4,8(sp)
        beq     a0,zero,.L1676
        lw      a2,12(sp)
        beq     a0,a3,.L1684
        lui     a1,%hi(symbol_int)
        lw      a1,%lo(symbol_int)(a1)
        lui     a6,%hi(symbol_float)
        lw      a6,%lo(symbol_float)(a6)
        beq     a0,a1,.L1678
        beq     a0,a6,.L1767
        lui     t1,%hi(symbol_bool)
        lw      t1,%lo(symbol_bool)(t1)
        bne     a0,t1,.L1676
        beq     a3,a1,.L1684
        bne     a3,a6,.L1676
        lw      a0,4(a2)
        j       .L1625
.L1655:
        beq     a3,a0,.L1661
        beq     a3,a2,.L1661
        lui     a1,%hi(symbol_bool)
        j       .L1698
.L1761:
        beq     a3,a0,.L1625
        lui     a2,%hi(symbol_float)
        lw      a2,%lo(symbol_float)(a2)
        bne     a3,a2,.L1692
        mv      a0,a5
        j       .L1762
.L1658:
        mv      a0,a3
        j       .L1625
.L1760:
        beq     a3,a2,.L1625
        j       .L1692
.L1632:
        lw      a4,0(a4)
        lui     a5,%hi(KEYWORD_SELF)
        lw      a5,%lo(KEYWORD_SELF)(a5)
        lw      a4,0(a4)
        beq     a4,a5,.L1633
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lui     a1,%hi(.LC44)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        addi    a1,a1,%lo(.LC44)
        j       .L1743
.L1657:
        beq     a5,a6,.L1660
        li      a0,0
        j       .L1625
.L1633:
        lw      a0,4(a0)
        j       .L1625
.L1685:
        beq     a5,a6,.L1684
.L1690:
        lui     a1,%hi(symbol_bool)
        lw      a1,%lo(symbol_bool)(a1)
        bne     a5,a1,.L1683
        lw      a0,4(a2)
        j       .L1625
.L1765:
        bne     a5,a1,.L1690
        lw      a0,4(a2)
        j       .L1625
.L1678:
        beq     a3,a6,.L1684
.L1691:
        lui     a1,%hi(symbol_bool)
        lw      a1,%lo(symbol_bool)(a1)
        bne     a3,a1,.L1676
        lw      a0,4(a2)
        j       .L1625
.L1767:
        bne     a3,a1,.L1691
        lw      a0,4(a2)
        j       .L1625
.LC124:
        .string "method"
.LC125:
        .string "function"
.LC126:
        .string "arr"
.LC127:
        .string "list"
.LC128:
        .string "[analyzer Error] at %s: Container types must be const, pointer, arr or list\n"
.LC129:
        .string "[analyzer Error] at %s: Base of call has no type\n"
.LC130:
        .string "[analyzer Error] at %s: Expression type must not be NULL\n"
.LC131:
        .string "[analyzer Error] at %s: Base of call must be a function, method or class\n"
.LC132:
        .string "[analyzer Error] at %s: Argument type must match callee parameter type\n"
.LC133:
        .string "    Type mismatch in %s call '%s', expected '%s', got '%s'\n"
.LC134:
        .string "[analyzer Error] at %s: Argument count must match callee parameter count\n"
.LC135:
        .string "    Argument count mismatch in %s call '%s', expected %zu, got %zu\n"
.LC136:
        .string "[analyzer Error] at %s: Base of attribute access has no type\n"
.LC137:
        .string "[analyzer Error] at %s: Base of attribute access must be a class\n"
.LC138:
        .string "[analyzer Error] at %s: Base of index access has no type\n"
.LC139:
        .string "[analyzer Error] at %s: Index must be of type int\n"
.LC140:
        .string "[analyzer Error] at %s: Index access base must be a container type\n"
.LC141:
        .string "[analyzer Error] at %s: Variable access type could not be determined\n"
.LC142:
        .string "[analyzer Error] at %s: Class call must define '$init' special method\n"
analyze_variable_access:
        addi    sp,sp,-80
        sw      s3,60(sp)
        mv      s3,a0
        lw      a0,0(a0)
        sw      ra,76(sp)
        sw      s0,72(sp)
        beq     a0,zero,.L1769
        call    analyze_variable_access
.L1769:
        lw      a5,12(s3)
        li      a4,2
        beq     a5,a4,.L1770
        bgtu    a5,a4,.L1771
        beq     a5,zero,.L1952
        sw      s4,56(sp)
        lw      s4,0(s3)
        lw      a5,8(s4)
        beq     a5,zero,.L1953
        lw      a5,4(s3)
        sw      s1,68(sp)
        sw      s2,64(sp)
        sw      s5,52(sp)
        sw      s6,48(sp)
        sw      s7,44(sp)
        beq     a5,zero,.L1785
        lw      s1,0(a5)
        li      s2,0
        li      s5,21
        lui     s6,%hi(symbol_void)
        beq     s1,zero,.L1785
.L1790:
        lw      s0,0(s1)
        beq     s0,zero,.L1786
        lw      a5,8(s0)
        lw      a0,0(s0)
        beq     a5,s5,.L1954
        call    analyze_expression
        lw      a0,4(s0)
        call    analyze_expression
        lw      a4,4(s0)
        lw      a5,0(s0)
        lw      a2,8(s0)
        lw      a1,12(a4)
        lw      a0,12(a5)
        call    calculate_type
.L1788:
        sw      a0,12(s0)
        beq     a0,zero,.L1955
.L1789:
        addi    s2,s2,1
.L1786:
        lw      s1,4(s1)
        bne     s1,zero,.L1790
        lw      s4,0(s3)
.L1791:
        lw      s5,12(s4)
        bne     s5,zero,.L1792
        lw      a4,8(s4)
        li      a3,1
        lw      a5,8(a4)
        addi    a2,a5,-2
        bleu    a2,a3,.L1956
.L1793:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC131)
        addi    a1,a1,%lo(.LC131)
.L1949:
        call    fprintf
        lw      s0,8(s3)
        lw      s1,68(sp)
        lw      s2,64(sp)
        lw      s4,56(sp)
        lw      s5,52(sp)
        lw      s6,48(sp)
        lw      s7,44(sp)
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
.L1775:
        beq     s0,zero,.L1957
.L1768:
        lw      ra,76(sp)
        lw      s0,72(sp)
        lw      s3,60(sp)
        addi    sp,sp,80
        jr      ra
.L1771:
        li      a4,3
        bne     a5,a4,.L1958
        lw      a5,0(s3)
        lw      a5,8(a5)
        beq     a5,zero,.L1959
        lw      a0,4(s3)
        call    analyze_expression
        lw      a5,4(s3)
        lui     a4,%hi(symbol_int)
        lw      a3,%lo(symbol_int)(a4)
        lw      a4,12(a5)
        seqz    a5,a3
        seqz    a2,a4
        or      a5,a5,a2
        bne     a5,zero,.L1853
        beq     a4,a3,.L1945
        lui     a5,%hi(symbol_float)
        lw      a5,%lo(symbol_float)(a5)
        beq     a4,a5,.L1855
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        beq     a4,a5,.L1945
.L1855:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC139)
        addi    a1,a1,%lo(.LC139)
.L1948:
        call    fprintf
        lw      s0,8(s3)
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        bne     s0,zero,.L1768
.L1957:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC141)
        addi    a1,a1,%lo(.LC141)
        call    fprintf
        lui     a5,%hi(symbol_void)
        lw      a3,%lo(symbol_void)(a5)
        lw      ra,76(sp)
        lw      s0,72(sp)
        lui     a5,%hi(has_error)
        li      a4,1
        sw      a3,8(s3)
        sb      a4,%lo(has_error)(a5)
        lw      s3,60(sp)
        addi    sp,sp,80
        jr      ra
.L1955:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC130)
        addi    a1,a1,%lo(.LC130)
        call    fprintf
        lui     a5,%hi(symbol_void)
        lw      a3,%lo(symbol_void)(a5)
        li      a4,1
        lui     a5,%hi(has_error)
        sw      a3,12(s0)
        sb      a4,%lo(has_error)(a5)
        j       .L1789
.L1952:
        sw      s5,52(sp)
        lw      s5,4(s3)
        lw      a4,4(s5)
        beq     a4,zero,.L1778
        sw      s1,68(sp)
        lw      s1,4(a4)
        beq     s1,zero,.L1940
        lui     a3,%hi(KEYWORD_CONST)
        lui     a5,%hi(KEYWORD_POINTER)
        sw      s4,56(sp)
        sw      s7,44(sp)
        lw      s4,%lo(KEYWORD_CONST)(a3)
        lw      s7,%lo(KEYWORD_POINTER)(a5)
        sw      s2,64(sp)
        sw      s6,48(sp)
        lui     s2,%hi(.LC126)
        lui     s6,%hi(.LC127)
        addi    s2,s2,%lo(.LC126)
        addi    s6,s6,%lo(.LC127)
.L1777:
        lw      s0,0(a4)
        mv      a1,s2
        mv      a0,s0
        beq     s0,s4,.L1779
        beq     s0,s7,.L1779
        call    strcmp
        mv      a5,a0
        mv      a1,s6
        mv      a0,s0
        beq     a5,zero,.L1779
        call    strcmp
        beq     a0,zero,.L1779
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        lw      s5,4(s3)
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
.L1941:
        lw      s1,68(sp)
        lw      s2,64(sp)
        lw      s4,56(sp)
        lw      s6,48(sp)
        lw      s7,44(sp)
.L1778:
        lw      a3,8(s5)
        addi    a5,a3,-5
        addi    a4,a3,-1
        sltiu   a5,a5,2
        seqz    a4,a4
        or      a5,a5,a4
        beq     a5,zero,.L1780
        lw      s0,4(s5)
        lw      s5,52(sp)
        sw      s0,8(s3)
        j       .L1775
.L1853:
        bne     a3,zero,.L1855
.L1945:
        lw      a4,0(s3)
        sw      s1,68(sp)
        lui     a5,%hi(KEYWORD_CONST)
        lw      s1,8(a4)
        lw      a5,%lo(KEYWORD_CONST)(a5)
        lw      s0,0(s1)
        beq     s0,a5,.L1856
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a5,%lo(KEYWORD_POINTER)(a5)
        beq     s0,a5,.L1856
        lui     a1,%hi(.LC126)
        addi    a1,a1,%lo(.LC126)
        mv      a0,s0
        call    strcmp
        beq     a0,zero,.L1856
        lui     a1,%hi(.LC127)
        mv      a0,s0
        addi    a1,a1,%lo(.LC127)
        call    strcmp
        beq     a0,zero,.L1856
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC140)
        addi    a1,a1,%lo(.LC140)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        lw      s0,8(s3)
        lw      s1,68(sp)
        sb      a4,%lo(has_error)(a5)
        j       .L1775
.L1856:
        lw      s0,4(s1)
        lw      s1,68(sp)
        sw      s0,8(s3)
        j       .L1775
.L1954:
        call    analyze_primary
        lw      a5,0(s0)
        lw      a0,%lo(symbol_void)(s6)
        lw      a5,4(a5)
        beq     a5,a0,.L1788
        sw      a5,12(s0)
        j       .L1789
.L1779:
        lw      a5,4(s1)
        mv      a4,s1
        beq     a5,zero,.L1941
        mv      s1,a5
        j       .L1777
.L1958:
        lw      s0,8(s3)
        j       .L1775
.L1770:
        lw      a5,0(s3)
        sw      s7,44(sp)
        lw      s7,8(a5)
        beq     s7,zero,.L1960
        lw      a5,4(s3)
        lw      a4,4(a5)
        beq     a4,zero,.L1847
        sw      s1,68(sp)
        lw      s1,4(a4)
        beq     s1,zero,.L1942
        lui     a3,%hi(KEYWORD_CONST)
        lui     a5,%hi(KEYWORD_POINTER)
        sw      s4,56(sp)
        sw      s5,52(sp)
        lw      s4,%lo(KEYWORD_CONST)(a3)
        lw      s5,%lo(KEYWORD_POINTER)(a5)
        sw      s2,64(sp)
        sw      s6,48(sp)
        lui     s2,%hi(.LC126)
        lui     s6,%hi(.LC127)
        addi    s2,s2,%lo(.LC126)
        addi    s6,s6,%lo(.LC127)
.L1846:
        lw      s0,0(a4)
        mv      a1,s2
        mv      a0,s0
        beq     s0,s4,.L1848
        beq     s0,s5,.L1848
        call    strcmp
        mv      a5,a0
        mv      a1,s6
        mv      a0,s0
        beq     a5,zero,.L1848
        call    strcmp
        beq     a0,zero,.L1848
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        lw      a3,0(s3)
        lui     a5,%hi(has_error)
        li      a4,1
        lw      s7,8(a3)
        sb      a4,%lo(has_error)(a5)
.L1943:
        lw      s1,68(sp)
        lw      s2,64(sp)
        lw      s4,56(sp)
        lw      s5,52(sp)
        lw      s6,48(sp)
.L1847:
        lw      a4,8(s7)
        li      a5,3
        bne     a4,a5,.L1961
        lw      a4,4(s3)
        li      a3,4
        lw      a5,8(a4)
        beq     a5,a3,.L1962
        li      a3,5
        beq     a5,a3,.L1851
        lw      s0,8(s3)
        lw      s7,44(sp)
        j       .L1775
.L1848:
        lw      a5,4(s1)
        mv      a4,s1
        beq     a5,zero,.L1943
        mv      s1,a5
        j       .L1846
.L1785:
        li      s2,0
        j       .L1791
.L1792:
        li      a5,2
        bne     s5,a5,.L1793
        lw      a5,8(s4)
        li      a4,4
        lw      a3,8(a5)
        bne     a3,a4,.L1793
        lw      s0,16(a5)
        sw      s8,40(sp)
        sw      s9,36(sp)
        sw      s10,32(sp)
        sw      s11,28(sp)
.L1858:
        lw      a5,8(s0)
        beq     a5,zero,.L1963
        lw      a5,0(a5)
        li      s1,1
        beq     a5,zero,.L1964
.L1817:
        li      s5,0
.L1810:
        lw      a4,0(a5)
        lw      a5,4(a5)
        snez    a4,a4
        add     s5,s5,a4
        bne     a5,zero,.L1810
        mv      s7,s5
        bleu    s5,s2,.L1811
        mv      s7,s2
.L1811:
        mv      a0,s5
        bgeu    s5,s2,.L1812
        mv      a0,s2
.L1812:
        li      a1,4
        call    calloc
        mv      s6,a0
        bne     s1,zero,.L1965
        lw      a5,8(s0)
        beq     a5,zero,.L1815
.L1818:
        lw      a5,0(a5)
        li      a1,0
        beq     a5,zero,.L1815
.L1824:
        li      a2,0
.L1823:
        lw      a3,0(a5)
        slli    a4,a2,2
        add     a4,s6,a4
        beq     a3,zero,.L1820
        lw      a3,4(a3)
        lw      a5,4(a5)
        addi    a2,a2,1
        sw      a3,0(a4)
        bne     a5,zero,.L1823
        beq     a1,zero,.L1815
.L1825:
        addi    s5,s5,-1
.L1816:
        lw      a5,0(s0)
        li      a3,1
        sw      a3,12(sp)
        mv      s11,a5
.L1826:
        lw      a5,4(s3)
        beq     a5,zero,.L1828
        lw      s0,0(a5)
        beq     s0,zero,.L1828
        lw      a5,12(sp)
        beq     a5,zero,.L1829
        lui     a5,%hi(.LC124)
        addi    s10,a5,%lo(.LC124)
.L1830:
        lui     a5,%hi(.LC132)
        lui     s1,%hi(.LC133)
        addi    s8,a5,%lo(.LC132)
        addi    s9,s1,%lo(.LC133)
        j       .L1839
.L1831:
        lw      s0,4(s0)
        beq     s0,zero,.L1828
.L1839:
        lw      s1,0(s0)
        sltu    a4,a3,s7
        seqz    a4,a4
        seqz    a5,s1
        or      a5,a5,a4
        bne     a5,zero,.L1831
        slli    a5,a3,2
        add     a5,s6,a5
        lw      t1,0(a5)
        lw      a5,12(s1)
        addi    a6,a3,1
        seqz    a4,t1
        seqz    a3,a5
        or      a4,a4,a3
        bne     a4,zero,.L1832
        beq     t1,a5,.L1837
        lui     a4,%hi(symbol_int)
        lw      a4,%lo(symbol_int)(a4)
        lui     a3,%hi(symbol_float)
        lw      a3,%lo(symbol_float)(a3)
        beq     a5,a4,.L1834
        beq     a5,a3,.L1966
        lui     a2,%hi(symbol_bool)
        lw      a2,%lo(symbol_bool)(a2)
        beq     a5,a2,.L1967
.L1832:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        mv      a1,s8
        sw      t1,8(sp)
        sw      a6,4(sp)
        call    fprintf
        lw      a3,12(s1)
        lw      t1,8(sp)
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lw      a4,0(t1)
        lw      a5,0(a3)
        lw      a3,0(s11)
        lui     a6,%hi(has_error)
        li      a7,1
        mv      a2,s10
        mv      a1,s9
        sb      a7,%lo(has_error)(a6)
        call    fprintf
        lw      a6,4(sp)
.L1837:
        mv      a3,a6
.L1969:
        lw      s0,4(s0)
        bne     s0,zero,.L1839
.L1828:
        beq     s5,s2,.L1841
        lui     a5,%hi(file)
        lui     s0,%hi(stderr)
        lw      a2,%lo(file)(a5)
        lw      a0,%lo(stderr)(s0)
        lui     a1,%hi(.LC134)
        addi    a1,a1,%lo(.LC134)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lw      a5,12(sp)
        lw      a0,%lo(stderr)(s0)
        beq     a5,zero,.L1864
        lui     a2,%hi(.LC124)
        addi    a2,a2,%lo(.LC124)
.L1842:
        lw      a3,0(s11)
        lui     a1,%hi(.LC135)
        mv      a5,s2
        mv      a4,s5
        addi    a1,a1,%lo(.LC135)
        call    fprintf
.L1841:
        lw      a5,8(s4)
        li      a4,3
        lw      a3,8(a5)
        beq     a3,a4,.L1968
        lw      s0,4(a5)
        mv      a0,s6
        sw      s0,8(s3)
        call    free
        lw      s1,68(sp)
        lw      s2,64(sp)
        lw      s4,56(sp)
        lw      s5,52(sp)
        lw      s6,48(sp)
        lw      s7,44(sp)
        lw      s8,40(sp)
        lw      s9,36(sp)
        lw      s10,32(sp)
        lw      s11,28(sp)
        j       .L1775
.L1780:
        addi    a3,a3,-2
        li      a5,2
        bgtu    a3,a5,.L1781
        sw      s5,8(s3)
        lw      s5,52(sp)
        j       .L1768
.L1961:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC137)
        addi    a1,a1,%lo(.LC137)
.L1947:
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        lw      s0,8(s3)
        lw      s7,44(sp)
        sb      a4,%lo(has_error)(a5)
        j       .L1775
.L1971:
        li      a1,4
        mv      a0,s2
        call    calloc
        mv      s6,a0
        li      s7,0
.L1815:
        lw      a5,0(s0)
        li      a3,0
        sw      zero,12(sp)
        mv      s11,a5
        j       .L1826
.L1959:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lui     a1,%hi(.LC138)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        addi    a1,a1,%lo(.LC138)
        j       .L1948
.L1781:
        lw      s0,8(s3)
        lw      s5,52(sp)
        j       .L1775
.L1964:
        li      a1,4
        mv      a0,s2
        call    calloc
        lw      a5,8(s0)
        mv      s6,a0
        li      s7,0
        li      s5,0
.L1819:
        lw      a5,0(a5)
        beq     a5,zero,.L1825
        li      a1,1
        j       .L1824
.L1820:
        lw      a5,4(a5)
        bne     a5,zero,.L1823
        bne     a1,zero,.L1825
        j       .L1815
.L1967:
        beq     t1,a4,.L1837
.L1834:
        beq     t1,a3,.L1837
.L1857:
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        bne     t1,a5,.L1832
        mv      a3,a6
        j       .L1969
.L1829:
        lui     a5,%hi(.LC125)
        addi    s10,a5,%lo(.LC125)
        j       .L1830
.L1966:
        bne     t1,a4,.L1857
        mv      a3,a6
        j       .L1969
.L1962:
        lw      s7,44(sp)
        sw      a4,8(s3)
        j       .L1768
.L1965:
        lw      a5,8(s0)
        bne     a5,zero,.L1819
        j       .L1825
.L1956:
        li      a3,3
        beq     a5,a3,.L1970
        lw      s0,16(a4)
        sw      s8,40(sp)
        sw      s9,36(sp)
        lw      a5,8(s0)
        sw      s10,32(sp)
        sw      s11,28(sp)
        beq     a5,zero,.L1971
        lw      a5,0(a5)
        li      s1,0
        bne     a5,zero,.L1817
        li      a1,4
        mv      a0,s2
        call    calloc
        lw      a5,8(s0)
        mv      s6,a0
        li      s7,0
        j       .L1818
.L1968:
        lw      s0,72(sp)
        lw      s1,68(sp)
        lw      s2,64(sp)
        lw      s4,56(sp)
        lw      s5,52(sp)
        lw      s7,44(sp)
        lw      s8,40(sp)
        lw      s9,36(sp)
        lw      s10,32(sp)
        lw      s11,28(sp)
        lw      ra,76(sp)
        sw      a5,8(s3)
        mv      a0,s6
        lw      s3,60(sp)
        lw      s6,48(sp)
        addi    sp,sp,80
        tail    free
.L1851:
        lw      s0,4(a4)
        lw      s7,44(sp)
        sw      s0,8(s3)
        j       .L1775
.L1864:
        lui     a2,%hi(.LC125)
        addi    a2,a2,%lo(.LC125)
        j       .L1842
.L1960:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lui     a1,%hi(.LC136)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        addi    a1,a1,%lo(.LC136)
        j       .L1947
.L1953:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC129)
        addi    a1,a1,%lo(.LC129)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        lw      s0,8(s3)
        lw      s4,56(sp)
        sb      a4,%lo(has_error)(a5)
        j       .L1775
.L1970:
        lw      a5,16(a4)
        lw      a6,8(a5)
        beq     a6,zero,.L1797
        lui     a5,%hi(SPECIAL_INIT)
        lw      a0,%lo(SPECIAL_INIT)(a5)
        li      a3,0
        li      a1,2
.L1804:
        mv      a2,a6
.L1803:
        lw      a5,8(a2)
        lw      a5,0(a5)
        beq     a5,zero,.L1798
        beq     a3,zero,.L1802
.L1799:
        lw      a4,0(a5)
        lw      a7,0(a4)
        beq     a0,a7,.L1801
        lw      a5,4(a5)
        bne     a5,zero,.L1799
.L1798:
        lw      a2,0(a2)
        bne     a2,zero,.L1803
        li      a3,1
        beq     a1,a3,.L1797
        mv      a1,a3
        j       .L1804
.L1802:
        lw      a4,0(a5)
        li      a7,4
        lw      t1,0(a4)
        beq     a0,t1,.L1972
.L1800:
        lw      a5,4(a5)
        bne     a5,zero,.L1802
        j       .L1798
.L1972:
        lw      t1,8(a4)
        bne     t1,a7,.L1800
.L1801:
        lw      s0,16(a4)
        sw      s8,40(sp)
        sw      s9,36(sp)
        sw      s10,32(sp)
        sw      s11,28(sp)
        j       .L1858
.L1940:
        lw      s1,68(sp)
        j       .L1778
.L1942:
        lw      s1,68(sp)
        j       .L1847
.L1963:
        li      a1,4
        mv      a0,s2
        call    calloc
        mv      s6,a0
        li      s7,0
        li      s5,-1
        j       .L1816
.L1797:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lui     a1,%hi(.LC142)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        addi    a1,a1,%lo(.LC142)
        j       .L1949
.LC143:
        .string "[analyzer Error] at %s: Primary expression type could not be determined\n"
analyze_primary:
        lw      a5,8(a0)
        addi    sp,sp,-32
        sw      ra,28(sp)
        li      a3,7
        mv      a4,a0
        bgtu    a5,a3,.L1974
        lui     a3,%hi(.L1976)
        slli    a5,a5,2
        addi    a3,a3,%lo(.L1976)
        add     a5,a5,a3
        lw      a5,0(a5)
        jr      a5
.L1976:
        .word   .L1983
        .word   .L1982
        .word   .L1981
        .word   .L1980
        .word   .L1979
        .word   .L1978
        .word   .L1977
        .word   .L1975
.L1977:
        lw      a0,0(a0)
        sw      a4,12(sp)
        call    analyze_primary
        lw      a4,12(sp)
        li      a2,20
        lw      a5,0(a4)
.L1987:
        lw      a0,4(a5)
        li      a1,0
        call    calculate_type
        lw      a4,12(sp)
        sw      a0,4(a4)
.L1984:
        beq     a0,zero,.L1988
.L1973:
        lw      ra,28(sp)
        addi    sp,sp,32
        jr      ra
.L1975:
        lw      a0,0(a0)
        sw      a4,12(sp)
        call    analyze_variable_access
        lw      a4,12(sp)
        lw      a5,0(a4)
        lw      a0,8(a5)
        sw      a0,4(a4)
        bne     a0,zero,.L1973
.L1988:
        lui     a3,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a3)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC143)
        addi    a1,a1,%lo(.LC143)
        sw      a4,12(sp)
        call    fprintf
        lui     a5,%hi(symbol_void)
        lw      a2,%lo(symbol_void)(a5)
        lw      a4,12(sp)
        lw      ra,28(sp)
        lui     a5,%hi(has_error)
        li      a3,1
        sw      a2,4(a4)
        sb      a3,%lo(has_error)(a5)
        addi    sp,sp,32
        jr      ra
.L1981:
        lui     a5,%hi(symbol_string)
        lw      a0,%lo(symbol_string)(a5)
        sw      a0,4(a4)
        j       .L1984
.L1980:
        lui     a5,%hi(symbol_bool)
        lw      a0,%lo(symbol_bool)(a5)
        sw      a0,4(a4)
        j       .L1984
.L1979:
        lw      a0,0(a0)
        sw      a4,12(sp)
        call    analyze_expression
        lw      a4,12(sp)
        lw      a5,0(a4)
        lw      a0,12(a5)
        sw      a0,4(a4)
        j       .L1984
.L1978:
        lw      a0,0(a0)
        sw      a4,12(sp)
        call    analyze_primary
        lw      a4,12(sp)
        li      a2,19
        lw      a5,0(a4)
        j       .L1987
.L1983:
        lui     a5,%hi(symbol_int)
        lw      a0,%lo(symbol_int)(a5)
        sw      a0,4(a4)
        j       .L1984
.L1982:
        lui     a5,%hi(symbol_float)
        lw      a0,%lo(symbol_float)(a5)
        sw      a0,4(a4)
        j       .L1984
.L1974:
        lw      a0,4(a0)
        j       .L1984
analyze_expression:
        lw      a4,8(a0)
        addi    sp,sp,-16
        sw      s0,8(sp)
        sw      ra,12(sp)
        li      a5,21
        mv      s0,a0
        lw      a0,0(a0)
        beq     a4,a5,.L1994
        call    analyze_expression
        lw      a0,4(s0)
        call    analyze_expression
        lw      a4,4(s0)
        lw      a5,0(s0)
        lw      a2,8(s0)
        lw      a1,12(a4)
        lw      a0,12(a5)
        call    calculate_type
.L1991:
        sw      a0,12(s0)
        beq     a0,zero,.L1995
        lw      ra,12(sp)
        lw      s0,8(sp)
        addi    sp,sp,16
        jr      ra
.L1994:
        call    analyze_primary
        lw      a5,0(s0)
        lui     a4,%hi(symbol_void)
        lw      a0,%lo(symbol_void)(a4)
        lw      a5,4(a5)
        beq     a5,a0,.L1991
        lw      ra,12(sp)
        sw      a5,12(s0)
        lw      s0,8(sp)
        addi    sp,sp,16
        jr      ra
.L1995:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC130)
        addi    a1,a1,%lo(.LC130)
        call    fprintf
        lui     a5,%hi(symbol_void)
        lw      a3,%lo(symbol_void)(a5)
        lw      ra,12(sp)
        lui     a5,%hi(has_error)
        sw      a3,12(s0)
        lw      s0,8(sp)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        addi    sp,sp,16
        jr      ra
.LC144:
        .string "[analyzer Error] at %s: Variable initializer type must be compatible with variable type\n"
analyze_variable:
        lw      a5,0(a0)
        addi    sp,sp,-48
        sw      s0,40(sp)
        lw      s0,4(a5)
        sw      s1,36(sp)
        sw      s5,20(sp)
        lw      s1,4(s0)
        sw      ra,44(sp)
        mv      s5,a0
        beq     s1,zero,.L1997
        sw      s8,8(sp)
        sw      s9,4(sp)
        lui     s8,%hi(KEYWORD_POINTER)
        lui     s9,%hi(KEYWORD_CONST)
        sw      s6,16(sp)
        sw      s10,0(sp)
        lw      s6,%lo(KEYWORD_CONST)(s9)
        lw      s10,%lo(KEYWORD_POINTER)(s8)
        sw      s4,24(sp)
        sw      s7,12(sp)
        lui     s4,%hi(.LC126)
        lui     s7,%hi(.LC127)
        sw      s3,28(sp)
        sw      s2,32(sp)
        addi    s4,s4,%lo(.LC126)
        addi    s7,s7,%lo(.LC127)
        mv      s3,s1
        mv      a4,s0
.L1998:
        lw      s2,0(a4)
        mv      a1,s4
        mv      a0,s2
        beq     s2,s6,.L2000
        beq     s2,s10,.L2000
        call    strcmp
        mv      a5,a0
        mv      a1,s7
        mv      a0,s2
        beq     a5,zero,.L2000
        call    strcmp
        beq     a0,zero,.L2000
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        lw      a3,0(s5)
        lui     a5,%hi(has_error)
        li      a4,1
        lw      s0,4(a3)
        sb      a4,%lo(has_error)(a5)
        lw      s1,4(s0)
        beq     s1,zero,.L2040
.L1999:
        lw      s3,%lo(KEYWORD_CONST)(s9)
        lw      s6,%lo(KEYWORD_POINTER)(s8)
        lui     s2,%hi(.LC126)
        lui     s4,%hi(.LC127)
        addi    s2,s2,%lo(.LC126)
        addi    s4,s4,%lo(.LC127)
.L2001:
        lw      s0,0(s0)
        mv      a1,s2
        mv      a0,s0
        beq     s0,s3,.L2002
        beq     s0,s6,.L2002
        call    strcmp
        mv      a5,a0
        mv      a1,s4
        mv      a0,s0
        beq     a5,zero,.L2002
        call    strcmp
        beq     a0,zero,.L2002
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
.L2040:
        lw      s2,32(sp)
        lw      s3,28(sp)
        lw      s4,24(sp)
        lw      s6,16(sp)
        lw      s7,12(sp)
        lw      s8,8(sp)
        lw      s9,4(sp)
        lw      s10,0(sp)
.L1997:
        lw      a0,4(s5)
        beq     a0,zero,.L1996
        call    analyze_expression
        lw      a4,4(s5)
        lw      a5,0(s5)
        lw      a3,12(a4)
        lw      a5,4(a5)
        seqz    a4,a3
        seqz    a2,a5
        or      a4,a4,a2
        bne     a4,zero,.L2004
        beq     a5,a3,.L1996
        lui     a4,%hi(symbol_int)
        lw      a4,%lo(symbol_int)(a4)
        lui     a2,%hi(symbol_float)
        lw      a2,%lo(symbol_float)(a2)
        beq     a5,a4,.L2005
        beq     a5,a2,.L2041
        lui     a1,%hi(symbol_bool)
        lw      a1,%lo(symbol_bool)(a1)
        bne     a5,a1,.L2004
        bne     a3,a4,.L2005
.L1996:
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        lw      s5,20(sp)
        addi    sp,sp,48
        jr      ra
.L2002:
        lw      a5,4(s1)
        mv      s0,s1
        beq     a5,zero,.L2040
        mv      s1,a5
        j       .L2001
.L2000:
        lw      a5,4(s3)
        mv      a4,s3
        beq     a5,zero,.L1999
        mv      s3,a5
        j       .L1998
.L2005:
        beq     a3,a2,.L1996
.L2009:
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        beq     a3,a5,.L1996
.L2004:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC144)
        addi    a1,a1,%lo(.LC144)
        call    fprintf
        lw      ra,44(sp)
        lw      s0,40(sp)
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lw      s1,36(sp)
        lw      s5,20(sp)
        addi    sp,sp,48
        jr      ra
.L2041:
        beq     a3,a4,.L1996
        j       .L2009
.LC145:
        .string "[analyzer Error] at %s: Declare list statement must not be empty\n"
.LC146:
        .string "[analyzer Error] at %s: Break and continue statements must be inside a loop\n"
.LC147:
        .string "[analyzer Error] at %s: Return statement must be inside a function or method\n"
.LC148:
        .string "[analyzer Error] at %s: Return statement type must be compatible with function or method return type\n"
analyze_body.part.0:
        beq     a0,zero,.L2158
        addi    sp,sp,-32
        sw      s2,16(sp)
        lw      s2,0(a0)
        sw      s3,12(sp)
        sw      s4,8(sp)
        lui     s3,%hi(.L2047)
        sw      ra,28(sp)
        addi    s3,s3,%lo(.L2047)
        li      s4,8
        beq     s2,zero,.L2042
        sw      s0,24(sp)
        sw      s1,20(sp)
.L2077:
        lw      s0,0(s2)
        beq     s0,zero,.L2045
        lw      a5,4(s0)
        bgtu    a5,s4,.L2045
        slli    a5,a5,2
        add     a5,a5,s3
        lw      a5,0(a5)
        jr      a5
.L2047:
        .word   .L2054
        .word   .L2053
        .word   .L2052
        .word   .L2051
        .word   .L2050
        .word   .L2049
        .word   .L2049
        .word   .L2048
        .word   .L2046
.L2049:
        lui     a5,%hi(loop_depth)
        lw      a5,%lo(loop_depth)(a5)
        ble     a5,zero,.L2159
.L2045:
        lw      s2,4(s2)
        bne     s2,zero,.L2077
        lw      s0,24(sp)
        lw      s1,20(sp)
.L2042:
        lw      ra,28(sp)
        lw      s2,16(sp)
        lw      s3,12(sp)
        lw      s4,8(sp)
        addi    sp,sp,32
        jr      ra
.L2050:
        lw      s1,0(s0)
        lui     s0,%hi(loop_depth)
        lw      a5,%lo(loop_depth)(s0)
        lw      a0,0(s1)
        addi    a5,a5,1
        sw      a5,%lo(loop_depth)(s0)
        call    analyze_expression
        lw      a0,4(s1)
        beq     a0,zero,.L2068
.L2156:
        lw      a5,0(a0)
        beq     a5,zero,.L2068
        call    analyze_body.part.0
.L2068:
        lw      a5,%lo(loop_depth)(s0)
        addi    a5,a5,-1
        sw      a5,%lo(loop_depth)(s0)
        j       .L2045
.L2051:
        lw      s1,0(s0)
        lui     s0,%hi(loop_depth)
        lw      a5,%lo(loop_depth)(s0)
        lbu     a4,16(s1)
        lw      a0,0(s1)
        addi    a5,a5,1
        sw      a5,%lo(loop_depth)(s0)
        bne     a4,zero,.L2160
        beq     a0,zero,.L2064
        call    analyze_expression
.L2064:
        lw      a0,4(s1)
        beq     a0,zero,.L2065
        call    analyze_expression
.L2065:
        lw      a0,8(s1)
        beq     a0,zero,.L2066
        call    analyze_expression
.L2066:
        lw      a0,12(s1)
        bne     a0,zero,.L2156
        j       .L2068
.L2052:
        sw      s5,4(sp)
        lw      s5,0(s0)
        lw      a0,0(s5)
        call    analyze_expression
        lw      a0,4(s5)
        beq     a0,zero,.L2059
        lw      a5,0(a0)
        beq     a5,zero,.L2059
        call    analyze_body.part.0
.L2059:
        lw      a5,8(s5)
        beq     a5,zero,.L2060
        lw      s0,0(a5)
        beq     s0,zero,.L2060
.L2062:
        lw      s1,0(s0)
        beq     s1,zero,.L2061
        lw      a0,0(s1)
        call    analyze_expression
        lw      a0,4(s1)
        beq     a0,zero,.L2061
        lw      a5,0(a0)
        beq     a5,zero,.L2061
        call    analyze_body.part.0
.L2061:
        lw      s0,4(s0)
        bne     s0,zero,.L2062
.L2060:
        lw      a0,12(s5)
        beq     a0,zero,.L2153
        lw      a5,0(a0)
        beq     a5,zero,.L2153
        call    analyze_body.part.0
        lw      s5,4(sp)
        j       .L2045
.L2046:
        lw      a0,0(s0)
        call    analyze_expression
        j       .L2045
.L2053:
        lw      a0,0(s0)
        call    analyze_variable
        j       .L2045
.L2054:
        lw      a5,0(s0)
        beq     a5,zero,.L2055
        lw      s0,0(a5)
        beq     s0,zero,.L2055
.L2056:
        lw      a0,0(s0)
        beq     a0,zero,.L2057
.L2161:
        call    analyze_variable
        lw      s0,4(s0)
        beq     s0,zero,.L2045
        lw      a0,0(s0)
        bne     a0,zero,.L2161
.L2057:
        lw      s0,4(s0)
        bne     s0,zero,.L2056
        j       .L2045
.L2048:
        lw      a0,0(s0)
        beq     a0,zero,.L2069
        call    analyze_expression
        lui     s1,%hi(return_type)
        lw      a5,%lo(return_type)(s1)
        beq     a5,zero,.L2078
.L2070:
        lw      a4,0(s0)
        beq     a4,zero,.L2079
        lw      a2,12(a4)
        seqz    a3,a5
        seqz    a4,a2
        or      a4,a4,a3
        bne     a4,zero,.L2072
        beq     a2,a5,.L2045
        lui     a4,%hi(symbol_int)
        lw      a4,%lo(symbol_int)(a4)
        lui     a3,%hi(symbol_float)
        lw      a3,%lo(symbol_float)(a3)
        beq     a4,a5,.L2073
        beq     a5,a3,.L2162
        lui     a1,%hi(symbol_bool)
        lw      a1,%lo(symbol_bool)(a1)
        beq     a1,a5,.L2163
.L2072:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC148)
        addi    a1,a1,%lo(.LC148)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L2045
.L2153:
        lw      s5,4(sp)
        j       .L2045
.L2160:
        beq     a0,zero,.L2064
        call    analyze_variable
        j       .L2064
.L2069:
        lui     s1,%hi(return_type)
        lw      a5,%lo(return_type)(s1)
        beq     a5,zero,.L2078
.L2079:
        lui     a4,%hi(symbol_void)
        lw      a4,%lo(symbol_void)(a4)
        bne     a4,a5,.L2072
        j       .L2045
.L2055:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC145)
        addi    a1,a1,%lo(.LC145)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L2045
.L2078:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC147)
        addi    a1,a1,%lo(.LC147)
        call    fprintf
        lui     a4,%hi(has_error)
        li      a3,1
        lw      a5,%lo(return_type)(s1)
        sb      a3,%lo(has_error)(a4)
        j       .L2070
.L2163:
        beq     a2,a4,.L2045
.L2073:
        beq     a2,a3,.L2045
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        bne     a2,a5,.L2072
        j       .L2045
.L2159:
        lui     a4,%hi(file)
        lui     a5,%hi(stderr)
        lw      a2,%lo(file)(a4)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC146)
        addi    a1,a1,%lo(.LC146)
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L2045
.L2162:
        beq     a2,a4,.L2045
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        bne     a2,a5,.L2072
        j       .L2045
.L2158:
        ret
create_file:
        addi    sp,sp,-112
        sw      s11,60(sp)
        mv      s11,a0
        li      a0,4
        sw      ra,108(sp)
        call    alloc_memory.constprop.0
        sw      a0,8(sp)
        beq     s11,zero,.L2166
        lbu     a5,0(s11)
        beq     a5,zero,.L2215
        sw      s2,96(sp)
        sw      s0,104(sp)
        sw      s1,100(sp)
        sw      s3,92(sp)
        sw      s4,88(sp)
        sw      s5,84(sp)
        sw      s6,80(sp)
        sw      s7,76(sp)
        sw      s8,72(sp)
        sw      s9,68(sp)
        sw      s10,64(sp)
        li      s2,47
        bne     a5,s2,.L2167
.L2169:
        mv      a0,s11
        call    strlen
        addi    s1,a0,3
        mv      a0,s1
        call    alloc_memory.constprop.1
        mv      s0,a0
        beq     a0,zero,.L2263
        slli    a0,s1,2
        call    alloc_memory.constprop.1
        mv      s1,a0
        beq     a0,zero,.L2263
        lbu     a5,0(s11)
        addi    a3,sp,40
        li      a4,47
        sw      a3,16(sp)
        beq     a5,a4,.L2268
        sw      zero,12(sp)
        li      a4,1
        beq     a5,zero,.L2204
.L2264:
        sw      a4,20(sp)
        li      s8,0
        li      s10,0
        li      s7,0
        li      s9,0
        sw      zero,28(sp)
        sw      zero,24(sp)
.L2176:
        addi    s2,s11,1
        li      s5,92
        li      s3,1
        li      s4,47
        li      s6,46
.L2208:
        addi    a4,a5,-92
        addi    a3,a5,-47
        seqz    a3,a3
        seqz    a4,a4
        or      a4,a4,a3
        add     a1,s11,s10
        add     a3,s2,s10
        mv      a0,s10
        mv      t3,a5
        beq     a4,zero,.L2186
.L2183:
        lbu     a5,0(a3)
        mv      a1,a3
        addi    s10,s10,1
        addi    a4,a5,-47
        addi    a3,a5,-92
        seqz    a3,a3
        seqz    a4,a4
        or      a4,a4,a3
        addi    a3,a1,1
        bne     a4,zero,.L2183
        beq     a5,zero,.L2207
        mv      a0,s10
        mv      t3,a5
.L2186:
        beq     a5,s5,.L2187
        addi    s10,s10,1
        add     a5,s11,s10
        lbu     a5,0(a5)
        addi    a3,a5,-47
        snez    a3,a3
        snez    a4,a5
        and     a4,a4,a3
        bne     a4,zero,.L2186
.L2187:
        sub     a2,s10,a0
        beq     s10,a0,.L2207
        beq     a2,s3,.L2269
        addi    t3,t3,-46
        addi    a5,a2,-2
        seqz    t3,t3
        seqz    a5,a5
        and     a5,a5,t3
        bne     a5,zero,.L2270
.L2191:
        beq     s9,zero,.L2223
        add     a0,s0,s9
        lbu     a5,-1(a0)
        beq     a5,s4,.L2271
        addi    a5,s9,1
        sb      s4,0(a0)
        add     s9,a2,a5
        add     a0,s0,a5
.L2202:
        call    memcpy
        slli    a5,s7,2
        add     a5,s1,a5
        sw      s9,0(a5)
        addi    s7,s7,1
.L2200:
        add     a5,s11,s10
        lbu     a5,0(a5)
        bne     a5,zero,.L2208
.L2207:
        lw      a5,20(sp)
        addi    s8,s8,1
        beq     a5,s8,.L2179
        lw      a5,16(sp)
        addi    a5,a5,4
        sw      a5,16(sp)
.L2177:
        lw      s11,0(a5)
        li      s10,0
        lbu     a5,0(s11)
        bne     a5,zero,.L2176
.L2179:
        bne     s9,zero,.L2206
.L2204:
        li      a5,46
        sb      a5,0(s0)
.L2265:
        li      s9,1
.L2206:
        add     a5,s0,s9
        sb      zero,0(a5)
        mv      a1,s9
        mv      a0,s0
        li      a2,1
        call    create_string_check
        lw      a5,12(sp)
        mv      s11,a0
        beq     a5,zero,.L2263
        mv      a0,a5
        call    free
.L2263:
        lw      s0,104(sp)
        lw      s1,100(sp)
        lw      s2,96(sp)
        lw      s3,92(sp)
        lw      s4,88(sp)
        lw      s5,84(sp)
        lw      s6,80(sp)
        lw      s7,76(sp)
        lw      s8,72(sp)
        lw      s9,68(sp)
        lw      s10,64(sp)
.L2166:
        lw      a5,8(sp)
        lw      ra,108(sp)
        sw      s11,0(a5)
        mv      a0,a5
        lw      s11,60(sp)
        addi    sp,sp,112
        jr      ra
.L2167:
        li      a1,0
        li      a0,0
        call    getcwd
        sw      a0,12(sp)
        beq     a0,zero,.L2169
        mv      a0,s11
        sw      s11,44(sp)
        call    strlen
        mv      s1,a0
        lw      a0,12(sp)
        call    strlen
        add     s1,a0,s1
        addi    s1,s1,3
        mv      a0,s1
        call    alloc_memory.constprop.1
        mv      s0,a0
        beq     a0,zero,.L2174
        slli    a0,s1,2
        call    alloc_memory.constprop.1
        mv      s1,a0
        beq     a0,zero,.L2174
        lw      a5,12(sp)
        addi    a4,sp,40
        sw      a4,16(sp)
        lbu     a5,0(a5)
        beq     a5,s2,.L2216
        beq     a5,zero,.L2272
        lw      s11,12(sp)
        li      a4,2
        j       .L2264
.L2270:
        add     a0,s11,a0
        lbu     a5,1(a0)
        li      a4,46
        bne     a5,a4,.L2191
        lw      a4,24(sp)
        bleu    s7,a4,.L2192
        beq     s7,s3,.L2273
        slli    a4,s7,2
        add     a4,s1,a4
        lw      a2,-4(a4)
        lw      a3,-8(a4)
        addi    a2,a2,-2
        addi    a4,a3,1
        bne     a2,a4,.L2214
        add     a4,s0,a4
        lbu     a4,0(a4)
        bne     a4,a5,.L2214
        add     a5,s0,a3
        lbu     a5,2(a5)
        beq     a5,a4,.L2192
.L2214:
        mv      s9,a3
        addi    s7,s7,-1
        j       .L2200
.L2223:
        mv      s9,a2
        mv      a0,s0
        j       .L2202
.L2269:
        bne     t3,s6,.L2191
        j       .L2200
.L2271:
        add     s9,s9,a2
        j       .L2202
.L2273:
        lw      a5,0(s1)
        bne     a4,zero,.L2194
        li      a4,2
        bne     a5,a4,.L2220
        mv      a4,s0
        li      a5,0
.L2198:
        lbu     a4,0(a4)
        li      a3,46
        bne     a4,a3,.L2220
        add     a5,s0,a5
        lbu     a5,1(a5)
        bne     a5,a4,.L2220
.L2192:
        lw      a5,28(sp)
        bne     a5,zero,.L2200
        beq     s9,zero,.L2221
        add     a4,s0,s9
        lbu     a1,-1(a4)
        li      a2,47
        addi    a5,s9,1
        addi    a3,s9,2
        beq     a1,a2,.L2222
        sb      a2,0(a4)
        addi    s9,s9,3
        add     a4,s0,a5
        mv      a5,a3
        j       .L2201
.L2174:
        lw      a0,12(sp)
        call    free
        j       .L2263
.L2215:
        lw      a5,8(sp)
        lw      ra,108(sp)
        li      s11,0
        sw      s11,0(a5)
        mv      a0,a5
        lw      s11,60(sp)
        addi    sp,sp,112
        jr      ra
.L2194:
        addi    a5,a5,-2
        add     a4,s0,s9
        beq     a5,s9,.L2198
.L2220:
        li      s9,0
        addi    s7,s7,-1
        j       .L2200
.L2221:
        mv      a4,s0
        li      s9,2
        li      a5,1
.L2201:
        li      a3,46
        sb      a3,0(a4)
        add     a5,s0,a5
        slli    a4,s7,2
        sb      a3,0(a5)
        add     a5,s1,a4
        sw      s9,0(a5)
        addi    s7,s7,1
        j       .L2200
.L2268:
        li      a5,1
        sw      zero,12(sp)
        sw      a5,20(sp)
.L2175:
        li      a4,47
        sb      a4,0(s0)
        li      t1,1
        sw      t1,0(s1)
        lbu     a5,0(s11)
        bne     a5,a4,.L2180
        li      s10,0
.L2181:
        addi    s10,s10,1
        add     a5,s11,s10
        lbu     a5,0(a5)
        beq     a5,a4,.L2181
        beq     a5,zero,.L2226
        li      s7,1
        mv      s9,s7
        sw      s7,28(sp)
        sw      s7,24(sp)
        li      s8,0
        j       .L2176
.L2216:
        li      a5,2
        lw      s11,12(sp)
        sw      a5,20(sp)
        j       .L2175
.L2222:
        mv      s9,a3
        j       .L2201
.L2272:
        addi    a5,sp,44
        sw      a5,16(sp)
        li      a5,2
        sw      a5,20(sp)
        sw      zero,28(sp)
        lw      a5,16(sp)
        sw      zero,24(sp)
        li      s9,0
        li      s7,0
        li      s8,1
        j       .L2177
.L2180:
        beq     a5,zero,.L2274
        mv      s7,t1
        mv      s9,t1
        sw      t1,28(sp)
        sw      t1,24(sp)
        li      s8,0
        li      s10,0
        j       .L2176
.L2226:
        li      a5,1
        sw      a5,28(sp)
        sw      a5,24(sp)
        mv      s7,a5
        mv      s9,a5
        li      s8,0
        j       .L2207
.L2274:
        lw      a5,20(sp)
        beq     a5,t1,.L2265
        lw      a4,16(sp)
        li      a5,2
        sw      a5,20(sp)
        addi    a4,a4,4
        sw      t1,28(sp)
        sw      a4,16(sp)
        sw      t1,24(sp)
        mv      s8,t1
        mv      s9,t1
        mv      s7,t1
        mv      a5,a4
        j       .L2177
.LC149:
        .string "r"
.LC150:
        .string "[fill Error] at <read_source_code> Cannot open file: %s\n"
read_source_code:
        addi    sp,sp,-16
        sw      s1,4(sp)
        mv      s1,a0
        lw      a0,0(a0)
        lui     a5,%hi(.LC149)
        sw      s0,8(sp)
        mv      s0,a1
        addi    a1,a5,%lo(.LC149)
        sw      ra,12(sp)
        call    fopen
        beq     a0,zero,.L2282
        li      a2,2
        li      a1,0
        sw      s2,0(sp)
        mv      s2,a0
        call    fseek
        mv      a0,s2
        call    ftell
        li      a2,0
        li      a1,0
        sw      a0,0(s0)
        mv      a0,s2
        call    fseek
        lw      a0,0(s0)
        call    alloc_memory.constprop.1
        lw      a2,0(s0)
        mv      a3,s2
        li      a1,1
        mv      s1,a0
        call    fread
        lw      a5,0(s0)
        bgeu    a0,a5,.L2278
        mv      a5,a0
.L2279:
        add     a4,s1,a5
        sb      zero,0(a4)
        lw      a4,0(s0)
        addi    a5,a5,1
        bgtu    a4,a5,.L2279
.L2278:
        sw      a0,0(s0)
        mv      a0,s2
        call    fclose
        lw      s2,0(sp)
.L2275:
        lw      ra,12(sp)
        lw      s0,8(sp)
        mv      a0,s1
        lw      s1,4(sp)
        addi    sp,sp,16
        jr      ra
.L2282:
        lui     a5,%hi(stderr)
        lw      a2,0(s1)
        lw      a0,%lo(stderr)(a5)
        lui     a1,%hi(.LC150)
        addi    a1,a1,%lo(.LC150)
        call    fprintf
        li      s1,0
        j       .L2275
file_full_path:
        lw      a0,0(a0)
        ret
.LC151:
        .string "."
file_dir_path:
        addi    sp,sp,-16
        sw      s0,8(sp)
        lw      s0,0(a0)
        sw      ra,12(sp)
        mv      a0,s0
        call    strlen
        mv      a1,a0
        li      a4,47
        li      a3,92
.L2287:
        beq     a1,zero,.L2285
        addi    a1,a1,-1
        add     a5,s0,a1
        lbu     a5,0(a5)
        beq     a5,a4,.L2286
        bne     a5,a3,.L2287
.L2286:
        mv      a0,s0
        lw      s0,8(sp)
        lw      ra,12(sp)
        li      a2,1
        addi    sp,sp,16
        tail    create_string_check
.L2285:
        lw      ra,12(sp)
        lw      s0,8(sp)
        lui     a0,%hi(.LC151)
        addi    a0,a0,%lo(.LC151)
        addi    sp,sp,16
        jr      ra
get_next_token:
        addi    sp,sp,-16
        sw      s0,8(sp)
        mv      s0,a0
        lw      a0,28(a0)
        sw      ra,12(sp)
        beq     a0,zero,.L2302
        lw      ra,12(sp)
        sw      a0,24(s0)
        sw      zero,28(s0)
        lw      s0,8(sp)
        addi    sp,sp,16
        jr      ra
.L2302:
        sw      s1,4(sp)
        li      s1,6
        j       .L2291
.L2303:
        lw      a5,0(a0)
        bne     a5,s1,.L2301
.L2291:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,24(s0)
        bne     a5,zero,.L2303
.L2301:
        lw      s1,4(sp)
        lw      ra,12(sp)
        sw      zero,28(s0)
        lw      s0,8(sp)
        addi    sp,sp,16
        jr      ra
peek_next_token:
        addi    sp,sp,-16
        sw      s0,8(sp)
        mv      s0,a0
        lw      a0,28(a0)
        sw      ra,12(sp)
        beq     a0,zero,.L2314
        lw      ra,12(sp)
        lw      s0,8(sp)
        addi    sp,sp,16
        jr      ra
.L2314:
        sw      s1,4(sp)
        li      s1,6
        j       .L2307
.L2315:
        lw      a5,0(a0)
        bne     a5,s1,.L2313
.L2307:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,28(s0)
        bne     a5,zero,.L2315
.L2313:
        lw      ra,12(sp)
        lw      s0,8(sp)
        lw      s1,4(sp)
        addi    sp,sp,16
        jr      ra
get_current_token:
        addi    sp,sp,-16
        sw      s0,8(sp)
        mv      s0,a0
        lw      a0,24(a0)
        sw      ra,12(sp)
        beq     a0,zero,.L2326
        lw      ra,12(sp)
        lw      s0,8(sp)
        addi    sp,sp,16
        jr      ra
.L2326:
        sw      s1,4(sp)
        li      s1,6
        j       .L2319
.L2327:
        lw      a5,0(a0)
        bne     a5,s1,.L2325
.L2319:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,24(s0)
        bne     a5,zero,.L2327
.L2325:
        lw      ra,12(sp)
        lw      s0,8(sp)
        lw      s1,4(sp)
        addi    sp,sp,16
        jr      ra
create_lexer:
        addi    sp,sp,-16
        sw      s1,4(sp)
        mv      s1,a0
        li      a0,36
        sw      ra,12(sp)
        sw      s0,8(sp)
        call    alloc_memory.constprop.0
        mv      s0,a0
        sw      s1,0(a0)
        addi    a1,s0,16
        mv      a0,s1
        call    read_source_code
        sw      a0,20(s0)
        lw      ra,12(sp)
        sw      zero,4(s0)
        sw      zero,8(s0)
        sw      zero,12(s0)
        sw      zero,24(s0)
        sw      zero,28(s0)
        mv      a0,s0
        lw      s0,8(sp)
        lw      s1,4(sp)
        addi    sp,sp,16
        jr      ra
.LC152:
        .string "Token(Type: EOF,         Line: %zu, Column: %zu)\n"
.LC153:
        .string "Token(Type: identifier,  "
.LC154:
        .string "Token(Type: integer,     "
.LC155:
        .string "Token(Type: float,       "
.LC156:
        .string "Token(Type: string,      "
.LC157:
        .string "Token(Type: symbol,      "
.LC158:
        .string "Token(Type: keyword,     "
.LC159:
        .string "Token(Type: comment,     "
.LC160:
        .string "Token(Type: special,     "
.LC161:
        .string "Token(Type: unknown,     Line: %zu, Column: %zu)\n"
.LC162:
        .string "Line: %zu, Column: %zu)\tLexeme: '"
.LC163:
        .string "'\n"
output_one_token:
        addi    sp,sp,-48
        sw      s2,32(sp)
        sw      s3,28(sp)
        sw      s4,24(sp)
        sw      ra,44(sp)
        lw      a5,0(a0)
        mv      s2,a0
        mv      s4,a2
        mv      s3,a1
        li      a4,8
        beq     a2,zero,.L2331
        bgtu    a5,a4,.L2332
        lui     a4,%hi(.L2334)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L2334)
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L2334:
        .word   .L2342
        .word   .L2341
        .word   .L2340
        .word   .L2339
        .word   .L2338
        .word   .L2337
        .word   .L2336
        .word   .L2335
        .word   .L2333
.L2331:
        bgtu    a5,a4,.L2345
        lui     a4,%hi(.L2347)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L2347)
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L2347:
        .word   .L2355
        .word   .L2354
        .word   .L2353
        .word   .L2352
        .word   .L2351
        .word   .L2350
        .word   .L2349
        .word   .L2348
        .word   .L2346
.L2348:
        lw      a3,12(a0)
        lw      a2,8(a0)
        lui     a1,%hi(.LC27)
        mv      a0,s3
        addi    a3,a3,1
        addi    a2,a2,1
        addi    a1,a1,%lo(.LC27)
.L2370:
        lw      ra,44(sp)
        lw      s2,32(sp)
        lw      s3,28(sp)
        lw      s4,24(sp)
        addi    sp,sp,48
        tail    fprintf
.L2333:
        lui     a0,%hi(.LC160)
        mv      a3,a1
        addi    a0,a0,%lo(.LC160)
        li      a2,25
        li      a1,1
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
.L2343:
        lw      a3,12(s2)
        lw      a2,8(s2)
        lui     a1,%hi(.LC162)
        addi    a3,a3,1
        addi    a2,a2,1
        addi    a1,a1,%lo(.LC162)
        mv      a0,s3
        call    fprintf
        lw      s0,4(s2)
        li      s1,0
        beq     s0,zero,.L2368
.L2376:
        lui     a3,%hi(.LC42)
        lui     a4,%hi(.LC40)
        lui     a5,%hi(.LC39)
        sw      s5,20(sp)
        sw      s6,16(sp)
        sw      s7,12(sp)
        sw      s8,8(sp)
        addi    s7,a3,%lo(.LC42)
        addi    s8,a4,%lo(.LC40)
        addi    s6,a5,%lo(.LC39)
        li      s5,10
        j       .L2357
.L2359:
        beq     a0,s5,.L2372
        li      a5,9
        beq     a0,a5,.L2373
        li      a5,13
        beq     a0,a5,.L2374
        mv      a1,s3
        call    fputc
.L2360:
        lw      s0,4(s2)
        addi    s1,s1,1
.L2357:
        mv      a0,s0
        call    strlen
        bleu    a0,s1,.L2375
        add     s0,s0,s1
        lbu     a0,0(s0)
        bne     a0,zero,.L2359
        mv      a3,s3
        li      a2,2
        li      a1,1
        mv      a0,s6
        call    fwrite
        j       .L2360
.L2342:
        lui     a0,%hi(.LC153)
        mv      a3,a1
        li      a2,25
        li      a1,1
        addi    a0,a0,%lo(.LC153)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2343
.L2341:
        lui     a0,%hi(.LC154)
        mv      a3,a1
        li      a2,25
        li      a1,1
        addi    a0,a0,%lo(.LC154)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2343
.L2340:
        lui     a0,%hi(.LC155)
        mv      a3,a1
        li      a2,25
        li      a1,1
        addi    a0,a0,%lo(.LC155)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2343
.L2339:
        lui     a0,%hi(.LC156)
        mv      a3,a1
        li      a2,25
        li      a1,1
        addi    a0,a0,%lo(.LC156)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2343
.L2338:
        lui     a0,%hi(.LC157)
        mv      a3,a1
        li      a2,25
        li      a1,1
        addi    a0,a0,%lo(.LC157)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2343
.L2337:
        lui     a0,%hi(.LC158)
        mv      a3,a1
        li      a2,25
        li      a1,1
        addi    a0,a0,%lo(.LC158)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2343
.L2336:
        lui     a0,%hi(.LC159)
        mv      a3,a1
        li      a2,25
        li      a1,1
        addi    a0,a0,%lo(.LC159)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2343
.L2335:
        lw      a3,12(a0)
        lw      a2,8(a0)
        lui     a1,%hi(.LC152)
        mv      a0,s3
        addi    a3,a3,1
        addi    a2,a2,1
        addi    a1,a1,%lo(.LC152)
        j       .L2370
.L2346:
        lui     a0,%hi(.LC35)
        mv      a3,a1
        addi    a0,a0,%lo(.LC35)
        li      a2,10
        li      a1,1
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
.L2356:
        lw      a3,12(s2)
        lw      a2,8(s2)
        lui     a1,%hi(.LC37)
        addi    a3,a3,1
        addi    a2,a2,1
        addi    a1,a1,%lo(.LC37)
        mv      a0,s3
        call    fprintf
        lw      s0,4(s2)
        li      s1,0
        bne     s0,zero,.L2376
.L2368:
        lui     a0,%hi(.LC38)
        addi    a0,a0,%lo(.LC38)
        mv      a3,s3
        li      a2,8
        li      a1,1
        call    fwrite
        beq     s4,zero,.L2365
.L2377:
        lui     a0,%hi(.LC163)
        mv      a3,s3
        addi    a0,a0,%lo(.LC163)
        li      a2,2
.L2371:
        lw      s0,40(sp)
        lw      s1,36(sp)
        lw      ra,44(sp)
        lw      s2,32(sp)
        lw      s3,28(sp)
        lw      s4,24(sp)
        li      a1,1
        addi    sp,sp,48
        tail    fwrite
.L2355:
        lui     a0,%hi(.LC28)
        mv      a3,a1
        li      a2,13
        li      a1,1
        addi    a0,a0,%lo(.LC28)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2356
.L2354:
        lui     a0,%hi(.LC29)
        mv      a3,a1
        li      a2,10
        li      a1,1
        addi    a0,a0,%lo(.LC29)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2356
.L2353:
        lui     a0,%hi(.LC30)
        mv      a3,a1
        li      a2,8
        li      a1,1
        addi    a0,a0,%lo(.LC30)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2356
.L2352:
        lui     a0,%hi(.LC31)
        mv      a3,a1
        li      a2,9
        li      a1,1
        addi    a0,a0,%lo(.LC31)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2356
.L2351:
        lui     a0,%hi(.LC32)
        mv      a3,a1
        li      a2,9
        li      a1,1
        addi    a0,a0,%lo(.LC32)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2356
.L2350:
        lui     a0,%hi(.LC33)
        mv      a3,a1
        li      a2,10
        li      a1,1
        addi    a0,a0,%lo(.LC33)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2356
.L2349:
        lui     a0,%hi(.LC34)
        mv      a3,a1
        li      a2,10
        li      a1,1
        addi    a0,a0,%lo(.LC34)
        sw      s0,40(sp)
        sw      s1,36(sp)
        call    fwrite
        j       .L2356
.L2374:
        mv      a3,s3
        li      a2,2
        li      a1,1
        mv      a0,s7
        call    fwrite
        j       .L2360
.L2372:
        mv      a3,s3
        li      a2,2
        li      a1,1
        mv      a0,s8
        call    fwrite
        j       .L2360
.L2375:
        lw      s5,20(sp)
        lw      s6,16(sp)
        lw      s7,12(sp)
        lw      s8,8(sp)
        bne     s4,zero,.L2377
.L2365:
        lui     a0,%hi(.LC43)
        mv      a3,s3
        addi    a0,a0,%lo(.LC43)
        li      a2,3
        j       .L2371
.L2373:
        lui     a0,%hi(.LC41)
        mv      a3,s3
        li      a2,2
        li      a1,1
        addi    a0,a0,%lo(.LC41)
        call    fwrite
        j       .L2360
.L2332:
        lw      a3,12(a0)
        lw      a2,8(a0)
        lui     a1,%hi(.LC161)
        mv      a0,s3
        addi    a3,a3,1
        addi    a2,a2,1
        addi    a1,a1,%lo(.LC161)
        j       .L2370
.L2345:
        lw      a3,12(a0)
        lw      a2,8(a0)
        lui     a1,%hi(.LC36)
        mv      a0,s3
        addi    a3,a3,1
        addi    a2,a2,1
        addi    a1,a1,%lo(.LC36)
        j       .L2370
init:
        addi    sp,sp,-32
        sw      s0,24(sp)
        lui     s0,%hi(string_memory)
        lw      a5,%lo(string_memory)(s0)
        sw      ra,28(sp)
        sw      s1,20(sp)
        sw      s2,16(sp)
        sw      s3,12(sp)
        sw      s4,8(sp)
        beq     a5,zero,.L2389
        lui     s0,%hi(struct_memory)
        lw      a5,%lo(struct_memory)(s0)
        beq     a5,zero,.L2390
.L2380:
        lui     s0,%hi(string_table)
        lw      a5,%lo(string_table)(s0)
        beq     a5,zero,.L2391
.L2381:
        lui     s3,%hi(.LANCHOR0)
        lui     s2,%hi(.LANCHOR1)
        addi    s3,s3,%lo(.LANCHOR0)
        addi    s2,s2,%lo(.LANCHOR1)
        addi    s0,s3,88
        addi    s4,s3,184
        addi    s1,s2,80
        li      a1,6
        j       .L2383
.L2392:
        lw      a0,0(s0)
        call    strlen
        mv      a1,a0
.L2383:
        lw      a0,0(s0)
        addi    s0,s0,4
        addi    s1,s1,4
        call    create_string_check.constprop.1
        sw      a0,-4(s1)
        bne     s0,s4,.L2392
        lw      t3,80(s2)
        lw      a7,84(s2)
        lw      a0,88(s2)
        lui     a5,%hi(KEYWORD_IMPORT)
        lw      a2,92(s2)
        sw      t3,%lo(KEYWORD_IMPORT)(a5)
        lui     a5,%hi(KEYWORD_FROM)
        lw      a4,96(s2)
        sw      a7,%lo(KEYWORD_FROM)(a5)
        lui     a5,%hi(KEYWORD_FUNC)
        lw      t1,100(s2)
        sw      a0,%lo(KEYWORD_FUNC)(a5)
        lui     a5,%hi(KEYWORD_CLASS)
        lw      a1,104(s2)
        sw      a2,%lo(KEYWORD_CLASS)(a5)
        lui     a5,%hi(KEYWORD_METHOD)
        lw      t4,108(s2)
        lw      a6,112(s2)
        lw      a3,116(s2)
        sw      a4,%lo(KEYWORD_METHOD)(a5)
        lui     a5,%hi(KEYWORD_SELF)
        lw      t5,120(s2)
        lw      t3,124(s2)
        lw      a7,128(s2)
        lw      a0,132(s2)
        lw      a2,136(s2)
        lw      a4,140(s2)
        sw      t1,%lo(KEYWORD_SELF)(a5)
        lui     a5,%hi(KEYWORD_IF)
        sw      a1,%lo(KEYWORD_IF)(a5)
        lui     t1,%hi(KEYWORD_ELIF)
        lui     a1,%hi(KEYWORD_ELSE)
        lui     a5,%hi(KEYWORD_WHILE)
        sw      t4,%lo(KEYWORD_ELIF)(t1)
        sw      a6,%lo(KEYWORD_ELSE)(a1)
        sw      a3,%lo(KEYWORD_WHILE)(a5)
        lui     t4,%hi(KEYWORD_FOR)
        lui     t1,%hi(KEYWORD_TRUE)
        lui     a6,%hi(KEYWORD_FALSE)
        lui     a1,%hi(KEYWORD_RETURN)
        lui     a3,%hi(KEYWORD_BREAK)
        lui     a5,%hi(KEYWORD_CONTINUE)
        sw      t5,%lo(KEYWORD_FOR)(t4)
        sw      t3,%lo(KEYWORD_TRUE)(t1)
        sw      a0,%lo(KEYWORD_RETURN)(a1)
        sw      a2,%lo(KEYWORD_BREAK)(a3)
        sw      a4,%lo(KEYWORD_CONTINUE)(a5)
        sw      a7,%lo(KEYWORD_FALSE)(a6)
        lw      a6,144(s2)
        lw      a3,148(s2)
        lw      t5,152(s2)
        lw      t3,156(s2)
        lw      a7,160(s2)
        lw      a0,164(s2)
        lw      a2,168(s2)
        lw      a4,172(s2)
        lui     a1,%hi(KEYWORD_INT)
        lui     a5,%hi(KEYWORD_FLOAT)
        sw      a6,%lo(KEYWORD_INT)(a1)
        sw      a3,%lo(KEYWORD_FLOAT)(a5)
        lui     a1,%hi(KEYWORD_VAR)
        lui     t4,%hi(KEYWORD_STRING)
        lui     t1,%hi(KEYWORD_BOOL)
        lui     a6,%hi(KEYWORD_VOID)
        lui     a3,%hi(KEYWORD_POINTER)
        lui     a5,%hi(KEYWORD_CONST)
        sw      a0,%lo(KEYWORD_VAR)(a1)
        sw      t5,%lo(KEYWORD_STRING)(t4)
        sw      t3,%lo(KEYWORD_BOOL)(t1)
        sw      a7,%lo(KEYWORD_VOID)(a6)
        sw      a2,%lo(KEYWORD_POINTER)(a3)
        sw      a4,%lo(KEYWORD_CONST)(a5)
        addi    s0,s3,184
        addi    s1,s2,176
        addi    s4,s3,304
        li      a1,1
        j       .L2385
.L2393:
        lw      a0,0(s0)
        call    strlen
        mv      a1,a0
.L2385:
        lw      a0,0(s0)
        addi    s0,s0,4
        addi    s1,s1,4
        call    create_string_check.constprop.1
        sw      a0,-4(s1)
        bne     s0,s4,.L2393
        lw      t3,176(s2)
        lw      a7,180(s2)
        lw      a0,184(s2)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a2,188(s2)
        sw      t3,%lo(SYMBOL_L_PAREN)(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a4,192(s2)
        sw      a7,%lo(SYMBOL_R_PAREN)(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      t1,196(s2)
        sw      a0,%lo(SYMBOL_L_BRACE)(a5)
        lui     a5,%hi(SYMBOL_R_BRACE)
        lw      a1,200(s2)
        sw      a2,%lo(SYMBOL_R_BRACE)(a5)
        lui     a5,%hi(SYMBOL_COMMA)
        lw      t4,204(s2)
        lw      a6,208(s2)
        lw      a3,212(s2)
        sw      a4,%lo(SYMBOL_COMMA)(a5)
        lui     a5,%hi(SYMBOL_NOT)
        lw      t5,216(s2)
        lw      t3,220(s2)
        lw      a7,224(s2)
        lw      a2,232(s2)
        lw      a4,236(s2)
        sw      t1,%lo(SYMBOL_NOT)(a5)
        lw      a0,228(s2)
        lui     a5,%hi(SYMBOL_DOT)
        sw      a1,%lo(SYMBOL_DOT)(a5)
        lui     t1,%hi(SYMBOL_L_BRACKET)
        lui     a1,%hi(SYMBOL_R_BRACKET)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        sw      t4,%lo(SYMBOL_L_BRACKET)(t1)
        sw      a6,%lo(SYMBOL_R_BRACKET)(a1)
        sw      a3,%lo(SYMBOL_SEMICOLON)(a5)
        lui     t4,%hi(SYMBOL_UNDERLINE)
        lui     t1,%hi(SYMBOL_ADD)
        lui     a6,%hi(SYMBOL_SUB)
        lui     a1,%hi(SYMBOL_MUL)
        lui     a3,%hi(SYMBOL_DIV)
        lui     a5,%hi(SYMBOL_MOD)
        sw      t5,%lo(SYMBOL_UNDERLINE)(t4)
        sw      t3,%lo(SYMBOL_ADD)(t1)
        sw      a7,%lo(SYMBOL_SUB)(a6)
        sw      a2,%lo(SYMBOL_DIV)(a3)
        sw      a4,%lo(SYMBOL_MOD)(a5)
        sw      a0,%lo(SYMBOL_MUL)(a1)
        lw      a0,240(s2)
        lw      a2,244(s2)
        lw      a4,248(s2)
        lui     a5,%hi(SYMBOL_LT)
        lw      t1,252(s2)
        sw      a0,%lo(SYMBOL_LT)(a5)
        lui     a5,%hi(SYMBOL_GT)
        lw      a1,256(s2)
        sw      a2,%lo(SYMBOL_GT)(a5)
        lui     a5,%hi(SYMBOL_ASSIGN)
        lw      t4,260(s2)
        lw      a6,264(s2)
        lw      a3,268(s2)
        sw      a4,%lo(SYMBOL_ASSIGN)(a5)
        lui     a5,%hi(SYMBOL_EQ)
        sw      t1,%lo(SYMBOL_EQ)(a5)
        lw      t5,272(s2)
        lui     a5,%hi(SYMBOL_NE)
        lw      t3,276(s2)
        lw      a7,280(s2)
        lw      a0,284(s2)
        lw      a2,288(s2)
        lw      a4,292(s2)
        lui     t1,%hi(SYMBOL_LE)
        sw      a1,%lo(SYMBOL_NE)(a5)
        lui     a1,%hi(SYMBOL_GE)
        lui     a5,%hi(SYMBOL_ADD_ASSIGN)
        sw      t4,%lo(SYMBOL_LE)(t1)
        sw      a6,%lo(SYMBOL_GE)(a1)
        sw      a3,%lo(SYMBOL_ADD_ASSIGN)(a5)
        lui     a1,%hi(SYMBOL_MOD_ASSIGN)
        lui     t4,%hi(SYMBOL_SUB_ASSIGN)
        lui     t1,%hi(SYMBOL_MUL_ASSIGN)
        lui     a6,%hi(SYMBOL_DIV_ASSIGN)
        lui     a3,%hi(SYMBOL_AND)
        lui     a5,%hi(SYMBOL_OR)
        sw      a0,%lo(SYMBOL_MOD_ASSIGN)(a1)
        addi    s0,s3,304
        sw      t5,%lo(SYMBOL_SUB_ASSIGN)(t4)
        sw      t3,%lo(SYMBOL_MUL_ASSIGN)(t1)
        sw      a7,%lo(SYMBOL_DIV_ASSIGN)(a6)
        sw      a2,%lo(SYMBOL_AND)(a3)
        sw      a4,%lo(SYMBOL_OR)(a5)
        addi    s3,s3,384
        mv      s1,s2
        li      a1,5
        j       .L2387
.L2394:
        lw      a0,0(s0)
        call    strlen
        mv      a1,a0
.L2387:
        lw      a0,0(s0)
        addi    s0,s0,4
        addi    s1,s1,4
        call    create_string_check.constprop.1
        sw      a0,-4(s1)
        bne     s0,s3,.L2394
        lw      a7,0(s2)
        lw      a0,4(s2)
        lw      a2,8(s2)
        lui     a5,%hi(SPECIAL_INIT)
        lw      a4,12(s2)
        sw      a7,%lo(SPECIAL_INIT)(a5)
        lui     a5,%hi(SPECIAL_TO_INT)
        lw      a3,16(s2)
        sw      a0,%lo(SPECIAL_TO_INT)(a5)
        lui     a5,%hi(SPECIAL_TO_FLOAT)
        lw      a6,20(s2)
        lw      t4,24(s2)
        sw      a2,%lo(SPECIAL_TO_FLOAT)(a5)
        lui     a5,%hi(SPECIAL_TO_STRING)
        lw      t1,28(s2)
        lw      a1,32(s2)
        lw      t6,36(s2)
        sw      a4,%lo(SPECIAL_TO_STRING)(a5)
        lui     a5,%hi(SPECIAL_TO_BOOL)
        lw      t5,40(s2)
        lw      t3,44(s2)
        lw      a7,48(s2)
        lw      a0,52(s2)
        lw      a2,56(s2)
        lw      a4,60(s2)
        sw      a3,%lo(SPECIAL_TO_BOOL)(a5)
        lui     a3,%hi(SPECIAL_ADD)
        lui     a5,%hi(SPECIAL_SUB)
        sw      a6,%lo(SPECIAL_ADD)(a3)
        sw      t4,%lo(SPECIAL_SUB)(a5)
        lui     a6,%hi(SPECIAL_MUL)
        lui     a3,%hi(SPECIAL_DIV)
        lui     a5,%hi(SPECIAL_MOD)
        sw      t1,%lo(SPECIAL_MUL)(a6)
        sw      a1,%lo(SPECIAL_DIV)(a3)
        sw      t6,%lo(SPECIAL_MOD)(a5)
        lui     t4,%hi(SPECIAL_EQ)
        lui     t1,%hi(SPECIAL_NE)
        lui     a6,%hi(SPECIAL_LT)
        lui     a1,%hi(SPECIAL_GE)
        lui     a3,%hi(SPECIAL_GT)
        lui     a5,%hi(SPECIAL_LE)
        sw      a7,%lo(SPECIAL_LT)(a6)
        sw      a0,%lo(SPECIAL_GE)(a1)
        sw      a2,%lo(SPECIAL_GT)(a3)
        sw      a4,%lo(SPECIAL_LE)(a5)
        sw      t5,%lo(SPECIAL_EQ)(t4)
        sw      t3,%lo(SPECIAL_NE)(t1)
        lw      t1,64(s2)
        lw      a6,68(s2)
        lw      a2,72(s2)
        lw      a4,76(s2)
        lui     a5,%hi(SPECIAL_NEG)
        lui     a7,%hi(SPECIAL_AND)
        lui     a1,%hi(SPECIAL_OR)
        lui     a3,%hi(SPECIAL_NOT)
        li      a0,8
        sw      a4,%lo(SPECIAL_NEG)(a5)
        sw      t1,%lo(SPECIAL_AND)(a7)
        sw      a6,%lo(SPECIAL_OR)(a1)
        sw      a2,%lo(SPECIAL_NOT)(a3)
        call    alloc_memory.constprop.0
        lw      ra,28(sp)
        lw      s0,24(sp)
        sw      zero,0(a0)
        lui     a5,%hi(parsed_files)
        sw      zero,4(a0)
        sw      a0,%lo(parsed_files)(a5)
        lw      s1,20(sp)
        lw      s2,16(sp)
        lw      s3,12(sp)
        lw      s4,8(sp)
        addi    sp,sp,32
        jr      ra
.L2389:
        li      a0,1024
        call    create_memory_block
        sw      a0,%lo(string_memory)(s0)
        lui     s0,%hi(struct_memory)
        lw      a5,%lo(struct_memory)(s0)
        bne     a5,zero,.L2380
.L2390:
        li      a0,1024
        call    create_memory_block
        sw      a0,%lo(struct_memory)(s0)
        lui     s0,%hi(string_table)
        lw      a5,%lo(string_table)(s0)
        bne     a5,zero,.L2381
.L2391:
        li      a0,12
        call    alloc_memory.constprop.0
        mv      s1,a0
        li      a0,1024
        sw      zero,8(s1)
        sw      a0,4(s1)
        li      a1,4
        call    calloc
        sw      a0,0(s1)
        sw      s1,%lo(string_table)(s0)
        j       .L2381
create_string:
        li      a2,1
        tail    create_string_check
alloc_memory:
        addi    sp,sp,-32
        sw      s0,24(sp)
        sw      ra,28(sp)
        li      a5,1023
        mv      s0,a0
        bgtu    a0,a5,.L2397
        sw      s1,20(sp)
        lui     s1,%hi(string_memory)
        lw      a5,%lo(string_memory)(s1)
        beq     a1,zero,.L2399
        mv      a2,a5
        lui     a4,%hi(struct_memory)
.L2400:
        lw      a5,%lo(struct_memory)(a4)
        addi    s0,s0,3
        andi    s0,s0,-4
        beq     a5,zero,.L2403
        lw      a3,4(a5)
        lw      a4,0(a5)
        sub     a4,a4,a3
        bltu    a4,s0,.L2404
.L2430:
        add     s0,a3,s0
        lw      a0,8(a5)
        lw      ra,28(sp)
        sw      s0,4(a5)
        lw      s0,24(sp)
        lw      s1,20(sp)
        add     a0,a0,a3
        addi    sp,sp,32
        jr      ra
.L2429:
        bne     a1,zero,.L2428
.L2408:
        lw      a0,0(a2)
        sw      a1,8(sp)
        add     a0,s0,a0
        call    create_memory_block
        lw      a4,%lo(string_memory)(s1)
        li      a5,1024
        sw      a0,%lo(string_memory)(s1)
        sw      a4,12(a0)
        lw      a1,8(sp)
        beq     s0,a5,.L2427
        mv      a5,a0
.L2399:
        mv      a2,a5
        bne     a5,zero,.L2405
        j       .L2408
.L2404:
        lw      a5,12(a5)
        beq     a5,zero,.L2429
.L2405:
        lw      a3,4(a5)
        lw      a4,0(a5)
        sub     a4,a4,a3
        bltu    a4,s0,.L2404
        j       .L2430
.L2428:
        lui     a4,%hi(struct_memory)
        lw      a5,%lo(struct_memory)(a4)
.L2403:
        lw      a0,0(a5)
        sw      a1,12(sp)
        sw      a4,8(sp)
        add     a0,s0,a0
        call    create_memory_block
        lw      a4,8(sp)
        li      a5,1024
        lw      a1,12(sp)
        lw      a3,%lo(struct_memory)(a4)
        sw      a0,%lo(struct_memory)(a4)
        sw      a3,12(a0)
        beq     s0,a5,.L2427
        lw      a2,%lo(string_memory)(s1)
        j       .L2400
.L2427:
        lw      s1,20(sp)
.L2397:
        mv      a0,s0
        call    malloc
        beq     a0,zero,.L2431
        lui     a4,%hi(malloc_allocated)
        lw      a5,%lo(malloc_allocated)(a4)
        lw      ra,28(sp)
        add     a5,a5,s0
        lw      s0,24(sp)
        sw      a5,%lo(malloc_allocated)(a4)
        addi    sp,sp,32
        jr      ra
.L2431:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC26)
        li      a2,54
        li      a1,1
        addi    a0,a0,%lo(.LC26)
        sw      s1,20(sp)
        call    fwrite
        call    free_all_memory
        call    abort
.LC164:
        .string "[lib Error] at <string_splice>: Failed to format string\n"
.LC165:
        .string "[lib Fatal] at <string_splice>: Cannot allocate memory\n"
string_splice:
        addi    sp,sp,-96
        sw      s0,56(sp)
        addi    s0,sp,68
        sw      s3,44(sp)
        sw      a1,68(sp)
        mv      s3,a0
        sw      a2,72(sp)
        sw      a3,76(sp)
        mv      a2,a0
        mv      a3,s0
        li      a1,0
        li      a0,0
        sw      ra,60(sp)
        sw      a4,80(sp)
        sw      a5,84(sp)
        sw      a6,88(sp)
        sw      a7,92(sp)
        sw      s0,28(sp)
        call    vsnprintf
        ble     a0,zero,.L2437
        addi    a1,a0,1
        sw      s1,52(sp)
        mv      s1,a0
        mv      a0,a1
        sw      s2,48(sp)
        sw      a1,12(sp)
        call    malloc
        lw      a1,12(sp)
        mv      s2,a0
        beq     a0,zero,.L2438
        mv      a3,s0
        mv      a2,s3
        sw      s0,28(sp)
        call    vsnprintf
        mv      a1,s1
        mv      a0,s2
        li      a2,1
        call    create_string_check
        mv      s0,a0
        mv      a0,s2
        call    free
        lw      ra,60(sp)
        mv      a0,s0
        lw      s0,56(sp)
        lw      s1,52(sp)
        lw      s2,48(sp)
        lw      s3,44(sp)
        addi    sp,sp,96
        jr      ra
.L2437:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC164)
        addi    a0,a0,%lo(.LC164)
        li      a2,56
        li      a1,1
        call    fwrite
        li      s0,0
        lw      ra,60(sp)
        mv      a0,s0
        lw      s0,56(sp)
        lw      s3,44(sp)
        addi    sp,sp,96
        jr      ra
.L2438:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC165)
        li      a2,55
        li      a1,1
        addi    a0,a0,%lo(.LC165)
        call    fwrite
        call    free_all_memory
        call    abort
.LC166:
        .string "%s%s"
.LC167:
        .string "%.*s%s"
change_extension:
        addi    sp,sp,-32
        sw      s0,24(sp)
        lw      s0,0(a0)
        sw      a1,12(sp)
        sw      ra,28(sp)
        mv      a0,s0
        call    strlen
        lw      a1,12(sp)
        li      a2,1
        li      a6,92
.L2442:
        beq     a0,zero,.L2440
        addi    a0,a0,-1
        add     a3,s0,a0
        lbu     a4,0(a3)
        addi    a5,a4,-46
        andi    a5,a5,0xff
        bleu    a5,a2,.L2441
        bne     a4,a6,.L2442
.L2441:
        lbu     a5,0(a3)
        addi    a4,a5,-92
        addi    a5,a5,-47
        seqz    a4,a4
        seqz    a5,a5
        or      a5,a4,a5
        beq     a5,zero,.L2443
.L2440:
        mv      a2,a1
        mv      a1,s0
        lw      s0,24(sp)
        lw      ra,28(sp)
        lui     a0,%hi(.LC166)
        addi    a0,a0,%lo(.LC166)
        addi    sp,sp,32
        tail    string_splice
.L2443:
        mv      a2,s0
        lw      s0,24(sp)
        lw      ra,28(sp)
        lui     a5,%hi(.LC167)
        mv      a3,a1
        mv      a1,a0
        addi    sp,sp,32
        addi    a0,a5,%lo(.LC167)
        tail    string_splice
.LC168:
        .string "struct memory: [used/total: %zu/%zu, blocks: %zu]"
.LC169:
        .string "string memory: [used/total: %zu/%zu, blocks: %zu]"
.LC170:
        .string "platform: %d, malloc allocated: %zu, %s, %s"
get_info:
        lui     a5,%hi(struct_memory)
        lw      a5,%lo(struct_memory)(a5)
        addi    sp,sp,-32
        sw      ra,28(sp)
        li      a3,0
        li      a2,0
        li      a1,0
        beq     a5,zero,.L2450
.L2451:
        lw      a0,4(a5)
        lw      a4,0(a5)
        lw      a5,12(a5)
        addi    a3,a3,1
        add     a1,a1,a0
        add     a2,a2,a4
        bne     a5,zero,.L2451
.L2450:
        lui     a0,%hi(.LC168)
        addi    a0,a0,%lo(.LC168)
        call    string_splice
        lui     a5,%hi(string_memory)
        lw      a5,%lo(string_memory)(a5)
        mv      a4,a0
        li      a3,0
        li      a2,0
        li      a1,0
        beq     a5,zero,.L2452
.L2453:
        lw      a6,4(a5)
        lw      a0,0(a5)
        lw      a5,12(a5)
        addi    a3,a3,1
        add     a1,a1,a6
        add     a2,a2,a0
        bne     a5,zero,.L2453
.L2452:
        lui     a0,%hi(.LC169)
        addi    a0,a0,%lo(.LC169)
        sw      a4,12(sp)
        call    string_splice
        lui     a5,%hi(malloc_allocated)
        lw      a4,12(sp)
        lw      ra,28(sp)
        lw      a2,%lo(malloc_allocated)(a5)
        mv      a3,a0
        lui     a0,%hi(.LC170)
        addi    a0,a0,%lo(.LC170)
        li      a1,3
        addi    sp,sp,32
        tail    string_splice
.LC171:
        .string ".lex"
.LC172:
        .string "w"
.LC173:
        .string "\ninfo by lib:\n    %s\n"
output_tokens:
        addi    sp,sp,-32
        mv      a5,a1
        lui     a1,%hi(.LC171)
        sw      s1,20(sp)
        addi    a1,a1,%lo(.LC171)
        mv      s1,a0
        mv      a0,a5
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s2,16(sp)
        sw      s3,12(sp)
        sw      s4,8(sp)
        call    change_extension
        lui     a1,%hi(.LC172)
        addi    a1,a1,%lo(.LC172)
        call    fopen
        lw      s0,28(s1)
        mv      s3,a0
        li      s2,6
        beq     s0,zero,.L2460
        sw      s0,24(s1)
.L2461:
        sw      zero,28(s1)
        li      a2,1
        mv      a1,s3
        mv      a0,s0
        call    output_one_token
        lw      a5,0(s0)
        li      s4,7
        li      s2,6
        beq     a5,s4,.L2463
.L2481:
        lw      s0,28(s1)
        beq     s0,zero,.L2464
        sw      s0,24(s1)
.L2465:
        sw      zero,28(s1)
.L2483:
        li      a2,1
        mv      a1,s3
        mv      a0,s0
        call    output_one_token
        lw      a5,0(s0)
        bne     a5,s4,.L2481
.L2463:
        call    get_info
        lui     a1,%hi(.LC173)
        mv      a2,a0
        addi    a1,a1,%lo(.LC173)
        mv      a0,s3
        call    fprintf
        lw      s0,24(sp)
        lw      ra,28(sp)
        lw      s1,20(sp)
        lw      s2,16(sp)
        lw      s4,8(sp)
        mv      a0,s3
        lw      s3,12(sp)
        addi    sp,sp,32
        tail    fclose
.L2482:
        lw      a5,0(a0)
        bne     a5,s2,.L2465
.L2464:
        mv      a0,s1
        call    get_token
        lbu     a5,32(s1)
        sw      a0,24(s1)
        mv      s0,a0
        bne     a5,zero,.L2482
        sw      zero,28(s1)
        j       .L2483
.L2484:
        lw      a5,0(a0)
        bne     a5,s2,.L2461
.L2460:
        mv      a0,s1
        call    get_token
        lbu     a5,32(s1)
        sw      a0,24(s1)
        mv      s0,a0
        bne     a5,zero,.L2484
        j       .L2461
list_create:
        addi    sp,sp,-16
        li      a0,8
        sw      ra,12(sp)
        call    alloc_memory.constprop.0
        lw      ra,12(sp)
        sw      zero,0(a0)
        sw      zero,4(a0)
        addi    sp,sp,16
        jr      ra
list_append:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        beq     a0,zero,.L2492
        mv      s0,a0
        li      a0,8
        sw      a1,12(sp)
        call    alloc_memory.constprop.0
        lw      a1,12(sp)
        lw      a5,4(s0)
        sw      zero,4(a0)
        sw      a1,0(a0)
        beq     a5,zero,.L2493
        sw      a0,4(a5)
        lw      ra,28(sp)
        sw      a0,4(s0)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.L2493:
        lw      ra,28(sp)
        sw      a0,0(s0)
        sw      a0,4(s0)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.L2492:
        call    list_append.part.0
list_pop_front:
        mv      a5,a0
        beq     a0,zero,.L2498
        lw      a4,0(a0)
        beq     a4,zero,.L2498
        lw      a3,4(a4)
        lw      a0,0(a4)
        sw      a3,0(a5)
        beq     a3,zero,.L2499
        ret
.L2499:
        sw      zero,4(a5)
        ret
.L2498:
        li      a0,0
        ret
is_special:
        lui     a5,%hi(.LANCHOR1)
        addi    a5,a5,%lo(.LANCHOR1)
        addi    a3,a5,80
        j       .L2502
.L2506:
        beq     a5,a3,.L2505
.L2502:
        lw      a4,0(a5)
        addi    a5,a5,4
        bne     a4,a0,.L2506
        li      a0,1
        ret
.L2505:
        li      a0,0
        ret
.LC174:
        .string "%*sfunction: {\n"
.LC175:
        .string "%*sreturn_type: %s(%zu)\n"
.LC176:
        .string "%*sparameters: {\n"
.LC177:
        .string "%*sclass: {\n"
.LC178:
        .string "%*smethod: {\n"
.LC179:
        .string "%*serror: \"Unknown class member type\"\n"
.LC180:
        .string "%*simport: {\n"
.LC181:
        .string "%*spath: \"%s\"\n"
.LC182:
        .string "%*serror: \"Unknown code member type\"\n"
print_ast:
        addi    sp,sp,-96
        sw      s3,76(sp)
        sw      s7,60(sp)
        lui     s3,%hi(.LC0)
        lui     s7,%hi(.LC21)
        sw      s0,88(sp)
        sw      s1,84(sp)
        mv      s0,a1
        mv      s1,a0
        addi    a3,s3,%lo(.LC0)
        mv      a0,a1
        li      a2,0
        addi    a1,s7,%lo(.LC21)
        sw      ra,92(sp)
        sw      s2,80(sp)
        sw      s4,72(sp)
        sw      s5,68(sp)
        sw      s6,64(sp)
        sw      s8,56(sp)
        sw      s9,52(sp)
        sw      s10,48(sp)
        sw      s11,44(sp)
        call    fprintf
        lw      a5,4(s1)
        beq     a5,zero,.L2642
        lw      a5,0(a5)
        lui     s4,%hi(.LC22)
        sw      a5,20(sp)
        beq     a5,zero,.L2593
        lui     a5,%hi(.L2523)
        lui     s8,%hi(.L2567)
        addi    a5,a5,%lo(.L2523)
        addi    s8,s8,%lo(.L2567)
        sw      a5,16(sp)
.L2592:
        lw      a5,20(sp)
        lw      a5,0(a5)
        beq     a5,zero,.L2509
        lw      a4,4(a5)
        li      a3,1
        beq     a4,a3,.L2510
        li      a3,2
        beq     a4,a3,.L2511
        bne     a4,zero,.L2512
        lui     a1,%hi(.LC174)
        addi    a1,a1,%lo(.LC174)
        addi    a3,s3,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        lw      s9,0(a5)
        call    fprintf
        lui     a1,%hi(.LC70)
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC70)
        li      a2,8
        mv      a0,s0
        call    fprintf
        lw      a0,0(s9)
        mv      a1,s0
        li      a2,3
        call    print_symbol
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        li      a2,8
        mv      a0,s0
        call    fprintf
        lw      a4,4(s9)
        lui     a1,%hi(.LC175)
        addi    a3,s3,%lo(.LC0)
        lw      a5,12(a4)
        lw      a4,0(a4)
        addi    a1,a1,%lo(.LC175)
        li      a2,8
        mv      a0,s0
        call    fprintf
        lui     a1,%hi(.LC176)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s0
        addi    a1,a1,%lo(.LC176)
        li      a2,8
        call    fprintf
        lw      a5,8(s9)
        beq     a5,zero,.L2518
        lw      s1,0(a5)
        addi    s5,s4,%lo(.LC22)
        beq     s1,zero,.L2518
.L2519:
        lw      s10,0(s1)
        beq     s10,zero,.L2516
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        addi    a1,s7,%lo(.LC21)
        mv      a0,s0
        call    fprintf
        mv      a1,s0
        mv      a0,s10
        call    print_symbol.constprop.0
        addi    a3,s3,%lo(.LC0)
        mv      a1,s5
        mv      a0,s0
        li      a2,12
        call    fprintf
        lw      s1,4(s1)
        bne     s1,zero,.L2519
.L2518:
        addi    a3,s3,%lo(.LC0)
        li      a2,8
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        lui     a1,%hi(.LC82)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s0
        addi    a1,a1,%lo(.LC82)
        li      a2,8
        call    fprintf
        lw      a5,12(s9)
        beq     a5,zero,.L2515
        lw      s2,0(a5)
        li      s5,8
        beq     s2,zero,.L2515
.L2540:
        lw      s1,0(s2)
        beq     s1,zero,.L2520
        lw      a5,4(s1)
        bgtu    a5,s5,.L2521
        lw      a4,16(sp)
        slli    a5,a5,2
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L2523:
        .word   .L2531
        .word   .L2530
        .word   .L2529
        .word   .L2528
        .word   .L2527
        .word   .L2526
        .word   .L2525
        .word   .L2524
        .word   .L2522
.L2524:
        lw      a5,0(s1)
        lui     a1,%hi(.LC77)
        addi    a1,a1,%lo(.LC77)
        beq     a5,zero,.L2643
.L2635:
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        lw      s1,0(s1)
        li      a5,21
        lw      a4,8(s1)
        beq     a4,a5,.L2644
        mv      a0,s1
        li      a2,4
        mv      a1,s0
        call    print_expression.part.0
.L2538:
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L2520:
        lw      s2,4(s2)
        bne     s2,zero,.L2540
.L2515:
        addi    a3,s3,%lo(.LC0)
        li      a2,8
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L2639:
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        li      a2,4
        call    fprintf
.L2509:
        lw      a5,20(sp)
        lw      a5,4(a5)
        sw      a5,20(sp)
        bne     a5,zero,.L2592
.L2593:
        mv      a0,s0
        lw      s0,88(sp)
        lw      ra,92(sp)
        lw      s1,84(sp)
        lw      s2,80(sp)
        lw      s5,68(sp)
        lw      s6,64(sp)
        lw      s7,60(sp)
        lw      s8,56(sp)
        lw      s9,52(sp)
        lw      s10,48(sp)
        lw      s11,44(sp)
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        lw      s3,76(sp)
        lw      s4,72(sp)
        li      a2,0
        addi    sp,sp,96
        tail    fprintf
.L2526:
        lui     a1,%hi(.LC74)
        addi    a1,a1,%lo(.LC74)
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L2520
.L2527:
        lw      a0,0(s1)
        li      a2,3
        mv      a1,s0
        call    print_while
        j       .L2520
.L2528:
        lw      a0,0(s1)
        li      a2,3
        mv      a1,s0
        call    print_for
        j       .L2520
.L2529:
        lw      a0,0(s1)
        li      a2,3
        mv      a1,s0
        call    print_if
        j       .L2520
.L2530:
        lw      a0,0(s1)
        li      a2,3
        mv      a1,s0
        call    print_variable
        j       .L2520
.L2531:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC73)
        addi    a0,a0,%lo(.LC73)
        li      a2,162
        li      a1,1
        call    fwrite
        lw      a5,0(s1)
        beq     a5,zero,.L2520
        lw      s1,0(a5)
        beq     s1,zero,.L2520
.L2535:
        lw      a0,0(s1)
        beq     a0,zero,.L2533
.L2645:
        li      a2,3
        mv      a1,s0
        call    print_variable
        lw      s1,4(s1)
        beq     s1,zero,.L2520
        lw      a0,0(s1)
        bne     a0,zero,.L2645
.L2533:
        lw      s1,4(s1)
        bne     s1,zero,.L2535
        j       .L2520
.L2522:
        lui     a1,%hi(.LC78)
        addi    a1,a1,%lo(.LC78)
        j       .L2635
.L2525:
        lui     a1,%hi(.LC75)
        addi    a1,a1,%lo(.LC75)
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L2520
.L2516:
        lw      s1,4(s1)
        bne     s1,zero,.L2519
        j       .L2518
.L2521:
        lui     a1,%hi(.LC79)
        addi    a1,a1,%lo(.LC79)
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L2520
.L2644:
        lui     a1,%hi(.LC53)
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        li      a2,16
        mv      a0,s0
        call    fprintf
        lw      a0,0(s1)
        mv      a1,s0
        li      a2,5
        call    print_primary
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        li      a2,16
        call    fprintf
        j       .L2538
.L2643:
        lui     a1,%hi(.LC76)
        addi    a1,a1,%lo(.LC76)
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L2520
.L2510:
        lui     a1,%hi(.LC177)
        addi    a1,a1,%lo(.LC177)
        addi    a3,s3,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        lw      s1,0(a5)
        call    fprintf
        lui     a5,%hi(.LC70)
        addi    a1,a5,%lo(.LC70)
        addi    a3,s3,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
        lw      a0,0(s1)
        mv      a1,s0
        li      a2,3
        call    print_symbol
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        li      a2,8
        call    fprintf
        lw      a5,4(s1)
        beq     a5,zero,.L2591
        lw      s10,0(a5)
        beq     s10,zero,.L2591
        lui     a4,%hi(.LC179)
        lui     a5,%hi(.LC69)
        addi    a4,a4,%lo(.LC179)
        addi    a5,a5,%lo(.LC69)
        sw      a4,24(sp)
        sw      a5,28(sp)
        j       .L2590
.L2543:
        li      a3,1
        beq     a4,a3,.L2646
        lw      a1,24(sp)
        addi    a3,s3,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        call    fprintf
.L2542:
        lw      s10,4(s10)
        beq     s10,zero,.L2591
.L2590:
        lw      a5,0(s10)
        beq     a5,zero,.L2542
        lw      a4,4(a5)
        bne     a4,zero,.L2543
        lw      a5,0(a5)
        lui     a1,%hi(.LC178)
        addi    a1,a1,%lo(.LC178)
        addi    a3,s3,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        sw      a5,12(sp)
        call    fprintf
        lui     a5,%hi(.LC70)
        addi    a3,s3,%lo(.LC0)
        addi    a1,a5,%lo(.LC70)
        li      a2,12
        mv      a0,s0
        call    fprintf
        lw      a5,12(sp)
        mv      a1,s0
        lw      a0,0(a5)
        call    print_symbol.constprop.0
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        li      a2,12
        mv      a0,s0
        call    fprintf
        lw      a5,12(sp)
        lui     a1,%hi(.LC175)
        addi    a3,s3,%lo(.LC0)
        lw      a4,4(a5)
        addi    a1,a1,%lo(.LC175)
        li      a2,12
        lw      a5,12(a4)
        lw      a4,0(a4)
        mv      a0,s0
        call    fprintf
        lui     a1,%hi(.LC176)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s0
        addi    a1,a1,%lo(.LC176)
        li      a2,12
        call    fprintf
        lw      a5,12(sp)
        lw      a5,8(a5)
        beq     a5,zero,.L2563
        lw      s1,0(a5)
        beq     s1,zero,.L2563
        lui     s5,%hi(.LC1)
        lui     s9,%hi(.LC13)
        lui     s6,%hi(.LC12)
        addi    s5,s5,%lo(.LC1)
        addi    s9,s9,%lo(.LC13)
        addi    s6,s6,%lo(.LC12)
        addi    s2,s3,%lo(.LC0)
.L2562:
        lw      s11,0(s1)
        beq     s11,zero,.L2547
        mv      a3,s2
        li      a2,16
        addi    a1,s7,%lo(.LC21)
        mv      a0,s0
        call    fprintf
        lw      a5,12(s11)
        lw      a4,0(s11)
        mv      a3,s2
        mv      a1,s5
        mv      a0,s0
        li      a2,20
        call    fprintf
        lw      a5,8(s11)
        li      a4,6
        bgtu    a5,a4,.L2548
        lui     a4,%hi(.L2550)
        slli    a5,a5,2
        addi    a4,a4,%lo(.L2550)
        add     a5,a5,a4
        lw      a5,0(a5)
        jr      a5
.L2550:
        .word   .L2556
        .word   .L2555
        .word   .L2554
        .word   .L2553
        .word   .L2552
        .word   .L2551
        .word   .L2549
.L2551:
        lui     a1,%hi(.LC7)
        addi    a1,a1,%lo(.LC7)
        addi    a3,s3,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
.L2557:
        lw      a4,4(s11)
        beq     a4,zero,.L2558
.L2647:
        lw      a5,12(a4)
        lw      a4,0(a4)
        lui     a1,%hi(.LC10)
        addi    a1,a1,%lo(.LC10)
        mv      a3,s2
        li      a2,20
        mv      a0,s0
        call    fprintf
        lw      a5,8(s11)
        addi    a4,a5,-5
        addi    a5,a5,-1
        sltiu   a4,a4,2
        seqz    a5,a5
        or      a5,a4,a5
        beq     a5,zero,.L2560
.L2648:
        lw      a4,16(s11)
        mv      a3,s2
        li      a2,20
        mv      a1,s6
        mv      a0,s0
        call    fprintf
.L2561:
        mv      a3,s2
        li      a2,16
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L2547:
        lw      s1,4(s1)
        bne     s1,zero,.L2562
.L2563:
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        lui     a1,%hi(.LC82)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s0
        addi    a1,a1,%lo(.LC82)
        li      a2,12
        call    fprintf
        lw      a5,12(sp)
        lw      a5,12(a5)
        beq     a5,zero,.L2546
        lw      s1,0(a5)
        li      s2,8
        beq     s1,zero,.L2546
.L2584:
        lw      s5,0(s1)
        beq     s5,zero,.L2564
        lw      a5,4(s5)
        bgtu    a5,s2,.L2565
        slli    a5,a5,2
        add     a5,a5,s8
        lw      a5,0(a5)
        jr      a5
.L2567:
        .word   .L2575
        .word   .L2574
        .word   .L2573
        .word   .L2572
        .word   .L2571
        .word   .L2570
        .word   .L2569
        .word   .L2568
        .word   .L2566
.L2552:
        lui     a1,%hi(.LC6)
        addi    a1,a1,%lo(.LC6)
        addi    a3,s3,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
        lw      a4,4(s11)
        bne     a4,zero,.L2647
.L2558:
        lui     a1,%hi(.LC11)
        addi    a1,a1,%lo(.LC11)
        mv      a3,s2
        li      a2,20
        mv      a0,s0
        call    fprintf
        lw      a5,8(s11)
        addi    a4,a5,-5
        addi    a5,a5,-1
        sltiu   a4,a4,2
        seqz    a5,a5
        or      a5,a4,a5
        bne     a5,zero,.L2648
.L2560:
        mv      a3,s2
        li      a2,20
        mv      a1,s9
        mv      a0,s0
        call    fprintf
        j       .L2561
.L2549:
        lui     a1,%hi(.LC8)
        addi    a1,a1,%lo(.LC8)
        addi    a3,s3,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
        j       .L2557
.L2553:
        lui     a1,%hi(.LC5)
        addi    a1,a1,%lo(.LC5)
        addi    a3,s3,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
        j       .L2557
.L2554:
        lui     a1,%hi(.LC4)
        addi    a1,a1,%lo(.LC4)
        addi    a3,s3,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
        j       .L2557
.L2555:
        lui     a1,%hi(.LC3)
        addi    a1,a1,%lo(.LC3)
        addi    a3,s3,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
        j       .L2557
.L2556:
        lui     a1,%hi(.LC2)
        addi    a1,a1,%lo(.LC2)
        addi    a3,s3,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
        j       .L2557
.L2568:
        lw      a5,0(s5)
        lui     a1,%hi(.LC77)
        addi    a1,a1,%lo(.LC77)
        beq     a5,zero,.L2649
.L2638:
        addi    a3,s3,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        lw      s5,0(s5)
        li      a5,21
        lw      a4,8(s5)
        beq     a4,a5,.L2650
        mv      a0,s5
        li      a2,5
        mv      a1,s0
        call    print_expression.part.0
.L2582:
        addi    a3,s3,%lo(.LC0)
        li      a2,16
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L2564:
        lw      s1,4(s1)
        bne     s1,zero,.L2584
.L2546:
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        li      a2,8
        call    fprintf
        lw      s10,4(s10)
        bne     s10,zero,.L2590
.L2591:
        addi    a3,s3,%lo(.LC0)
        li      a2,4
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        j       .L2509
.L2569:
        lui     a1,%hi(.LC75)
        addi    a1,a1,%lo(.LC75)
        addi    a3,s3,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        j       .L2564
.L2570:
        lui     a1,%hi(.LC74)
        addi    a1,a1,%lo(.LC74)
        addi    a3,s3,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        j       .L2564
.L2571:
        lw      a0,0(s5)
        li      a2,4
        mv      a1,s0
        call    print_while
        j       .L2564
.L2572:
        lw      a0,0(s5)
        li      a2,4
        mv      a1,s0
        call    print_for
        j       .L2564
.L2573:
        lw      a0,0(s5)
        li      a2,4
        mv      a1,s0
        call    print_if
        j       .L2564
.L2566:
        lui     a1,%hi(.LC78)
        addi    a1,a1,%lo(.LC78)
        j       .L2638
.L2574:
        lw      a0,0(s5)
        li      a2,4
        mv      a1,s0
        call    print_variable
        j       .L2564
.L2575:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC73)
        addi    a0,a0,%lo(.LC73)
        li      a2,162
        li      a1,1
        call    fwrite
        lw      a5,0(s5)
        beq     a5,zero,.L2564
        lw      s5,0(a5)
        beq     s5,zero,.L2564
.L2579:
        lw      a0,0(s5)
        beq     a0,zero,.L2577
.L2651:
        li      a2,4
        mv      a1,s0
        call    print_variable
        lw      s5,4(s5)
        beq     s5,zero,.L2564
        lw      a0,0(s5)
        bne     a0,zero,.L2651
.L2577:
        lw      s5,4(s5)
        bne     s5,zero,.L2579
        j       .L2564
.L2548:
        lui     a1,%hi(.LC9)
        addi    a1,a1,%lo(.LC9)
        addi    a3,s3,%lo(.LC0)
        li      a2,20
        mv      a0,s0
        call    fprintf
        j       .L2557
.L2565:
        lui     a1,%hi(.LC79)
        addi    a1,a1,%lo(.LC79)
        addi    a3,s3,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        j       .L2564
.L2650:
        lui     a1,%hi(.LC53)
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        li      a2,20
        mv      a0,s0
        call    fprintf
        lw      a0,0(s5)
        mv      a1,s0
        li      a2,6
        call    print_primary
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        li      a2,20
        call    fprintf
        j       .L2582
.L2649:
        lui     a1,%hi(.LC76)
        addi    a1,a1,%lo(.LC76)
        addi    a3,s3,%lo(.LC0)
        li      a2,16
        mv      a0,s0
        call    fprintf
        j       .L2564
.L2646:
        lw      a1,28(sp)
        addi    a3,s3,%lo(.LC0)
        li      a2,8
        mv      a0,s0
        lw      s1,0(a5)
        call    fprintf
        lui     a5,%hi(.LC70)
        addi    a1,a5,%lo(.LC70)
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        lw      a0,0(s1)
        mv      a1,s0
        call    print_symbol.constprop.0
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        li      a2,12
        call    fprintf
        lw      a5,4(s1)
        beq     a5,zero,.L2586
        lui     a1,%hi(.LC71)
        addi    a1,a1,%lo(.LC71)
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        lw      s1,4(s1)
        li      a5,21
        lw      a4,8(s1)
        beq     a4,a5,.L2652
        mv      a0,s1
        li      a2,4
        mv      a1,s0
        call    print_expression.part.0
.L2588:
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
.L2589:
        addi    a3,s3,%lo(.LC0)
        li      a2,8
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        call    fprintf
        j       .L2542
.L2586:
        lui     a1,%hi(.LC72)
        addi    a1,a1,%lo(.LC72)
        addi    a3,s3,%lo(.LC0)
        li      a2,12
        mv      a0,s0
        call    fprintf
        j       .L2589
.L2652:
        lui     a1,%hi(.LC53)
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC53)
        li      a2,16
        mv      a0,s0
        call    fprintf
        lw      a0,0(s1)
        mv      a1,s0
        li      a2,5
        call    print_primary
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        li      a2,16
        call    fprintf
        j       .L2588
.L2512:
        lui     a1,%hi(.LC182)
        addi    a1,a1,%lo(.LC182)
        addi    a3,s3,%lo(.LC0)
        li      a2,4
        mv      a0,s0
        call    fprintf
        j       .L2509
.L2511:
        lui     a1,%hi(.LC180)
        addi    a3,s3,%lo(.LC0)
        addi    a1,a1,%lo(.LC180)
        li      a2,4
        mv      a0,s0
        lw      s1,0(a5)
        call    fprintf
        lui     a1,%hi(.LC70)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s0
        addi    a1,a1,%lo(.LC70)
        li      a2,8
        call    fprintf
        lw      a0,0(s1)
        mv      a1,s0
        li      a2,3
        call    print_symbol
        addi    a3,s3,%lo(.LC0)
        addi    a1,s4,%lo(.LC22)
        mv      a0,s0
        li      a2,8
        call    fprintf
        lw      a4,4(s1)
        lui     a1,%hi(.LC181)
        addi    a3,s3,%lo(.LC0)
        mv      a0,s0
        addi    a1,a1,%lo(.LC181)
        li      a2,8
        call    fprintf
        j       .L2639
.L2642:
        lui     s4,%hi(.LC22)
        j       .L2593
print_symbol_table:
        tail    print_symbol_table_recursive.constprop.0
create_parser:
        addi    sp,sp,-16
        sw      ra,12(sp)
        sw      s0,8(sp)
        sw      s1,4(sp)
        li      a5,1
        mv      s1,a0
        sb      a5,32(a0)
        li      a0,24
        call    alloc_memory.constprop.0
        mv      s0,a0
        sw      s1,0(a0)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,0(s1)
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a0,4(s0)
        lw      ra,12(sp)
        sw      a5,8(s0)
        mv      a0,s0
        lw      s0,8(sp)
        lw      s1,4(sp)
        addi    sp,sp,16
        jr      ra
.LC183:
        .string "[symbol_table Warning] at <create_symbol> Unknown symbol kind '%u' for symbol '%s'\n"
create_symbol:
        addi    sp,sp,-48
        sw      s0,40(sp)
        sw      s1,36(sp)
        sw      s2,32(sp)
        sw      s3,28(sp)
        sw      s4,24(sp)
        sw      ra,44(sp)
        mv      s2,a4
        mv      s1,a0
        mv      s3,a1
        mv      s0,a2
        mv      s4,a3
        beq     a4,zero,.L2697
        beq     a1,zero,.L2698
.L2664:
        lw      a5,8(a4)
        lw      a3,0(a5)
        bne     a3,zero,.L2661
        j       .L2659
.L2662:
        lw      a3,4(a3)
        beq     a3,zero,.L2659
.L2661:
        lw      a5,0(a3)
        lw      a2,0(a5)
        bne     s1,a2,.L2662
        lw      a2,8(a5)
        bne     s0,a2,.L2662
        lw      a2,4(a5)
        bne     s3,a2,.L2662
.L2663:
        lw      a4,8(a5)
        beq     a4,s0,.L2729
.L2681:
        lw      a5,20(a5)
        lui     a4,%hi(stderr)
        lw      a0,%lo(stderr)(a4)
        beq     a5,s2,.L2730
        lui     a1,%hi(.LC48)
        addi    a1,a1,%lo(.LC48)
        mv      a2,s1
        call    fprintf
.L2679:
        li      a0,24
        call    alloc_memory.constprop.0
        lui     a4,%hi(symbol_count.0)
        lw      a3,%lo(symbol_count.0)(a4)
        sw      s1,0(a0)
        sw      s3,4(a0)
        addi    a2,a3,1
        sw      a2,%lo(symbol_count.0)(a4)
        sw      s0,8(a0)
        sw      a3,12(a0)
        li      a4,6
        mv      a5,a0
        bgtu    s0,a4,.L2684
        lui     a4,%hi(.L2686)
        addi    a4,a4,%lo(.L2686)
        slli    s0,s0,2
        add     s0,s0,a4
        lw      a4,0(s0)
        sw      s4,16(a0)
        jr      a4
.L2686:
        .word   .L2691
        .word   .L2691
        .word   .L2691
        .word   .L2691
        .word   .L2691
        .word   .L2691
        .word   .L2691
.L2684:
        lui     a4,%hi(stderr)
        sw      a0,12(sp)
        lw      a0,%lo(stderr)(a4)
        lui     a1,%hi(.LC183)
        mv      a3,s1
        mv      a2,s0
        addi    a1,a1,%lo(.LC183)
        call    fprintf
        lw      a5,12(sp)
.L2691:
        sw      s2,20(a5)
        beq     s2,zero,.L2656
        lw      s0,8(s2)
        beq     s0,zero,.L2731
        li      a0,8
        sw      a5,12(sp)
        call    alloc_memory.constprop.0
        lw      a5,12(sp)
        lw      a4,4(s0)
        sw      zero,4(a0)
        sw      a5,0(a0)
        beq     a4,zero,.L2732
        sw      a0,4(a4)
.L2695:
        sw      a0,4(s0)
.L2656:
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        lw      s2,32(sp)
        lw      s3,28(sp)
        lw      s4,24(sp)
        mv      a0,a5
        addi    sp,sp,48
        jr      ra
.L2729:
        lw      a4,4(a5)
        bne     a4,s3,.L2681
        j       .L2656
.L2732:
        sw      a0,0(s0)
        j       .L2695
.L2730:
        lui     a1,%hi(.LC47)
        mv      a2,s1
        addi    a1,a1,%lo(.LC47)
        call    fprintf
        li      a5,0
        j       .L2656
.L2698:
        mv      a2,a4
.L2658:
        lw      a5,8(a2)
        lw      a4,0(a5)
        bne     a4,zero,.L2667
        j       .L2665
.L2666:
        lw      a4,4(a4)
        beq     a4,zero,.L2665
.L2667:
        lw      a5,0(a4)
        lw      a3,0(a5)
        bne     s1,a3,.L2666
        lw      a3,8(a5)
        bne     s0,a3,.L2666
        j       .L2663
.L2659:
        lw      a4,0(a4)
        bne     a4,zero,.L2664
.L2697:
        li      a1,0
        seqz    a0,s3
.L2680:
        addi    a5,a1,-1
        seqz    a5,a5
        and     a5,a5,a0
        bne     a5,zero,.L2679
        addi    a1,a1,1
        li      a5,3
        beq     a1,a5,.L2679
        beq     s2,zero,.L2680
        li      a5,2
        mv      a2,s2
        beq     a1,a5,.L2677
.L2673:
        lw      a5,8(a2)
        lw      a3,0(a5)
        beq     a3,zero,.L2668
.L2670:
        lw      a5,0(a3)
        lw      a4,0(a5)
        beq     a4,s1,.L2669
.L2671:
        lw      a3,4(a3)
        bne     a3,zero,.L2670
.L2668:
        lw      a2,0(a2)
        bne     a2,zero,.L2673
        li      a1,1
        j       .L2680
.L2675:
        lw      a2,0(a2)
        beq     a2,zero,.L2680
.L2677:
        lw      a5,8(a2)
        lw      a3,0(a5)
        bne     a3,zero,.L2676
        j       .L2675
.L2733:
        lw      a3,4(a3)
        beq     a3,zero,.L2675
.L2676:
        lw      a5,0(a3)
        lw      a4,0(a5)
        bne     s1,a4,.L2733
        j       .L2663
.L2669:
        beq     s3,zero,.L2663
.L2672:
        lw      a4,4(a5)
        beq     s3,a4,.L2663
        lw      a3,4(a3)
        beq     a3,zero,.L2668
        lw      a5,0(a3)
        lw      a4,0(a5)
        bne     s1,a4,.L2671
        j       .L2672
.L2665:
        lw      a2,0(a2)
        bne     a2,zero,.L2658
        j       .L2697
.L2731:
        call    list_append.part.0
.LC184:
        .string "Expected 'var' at the beginning of variable declaration"
.LC185:
        .string "Expected ',' or ';' after variable declaration"
parse_variable:
        addi    sp,sp,-64
        sw      s2,48(sp)
        mv      s2,a0
        li      a0,8
        sw      s0,56(sp)
        sw      s1,52(sp)
        sw      s4,40(sp)
        sw      s5,36(sp)
        sw      ra,60(sp)
        mv      s4,a1
        mv      s5,a2
        call    alloc_memory.constprop.0
        lw      s0,0(s2)
        sw      zero,0(a0)
        sw      zero,4(a0)
        lw      a6,24(s0)
        mv      s1,a0
        beq     a6,zero,.L2801
        lw      a5,0(a6)
.L2738:
        li      a4,5
        bne     a5,a4,.L2739
        lui     a5,%hi(KEYWORD_VAR)
        lw      a5,%lo(KEYWORD_VAR)(a5)
        lw      a4,4(a6)
        beq     a4,a5,.L2740
.L2739:
        lw      a5,8(s2)
        lw      a4,12(a6)
        lw      a3,8(a6)
        lui     s0,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s0)
        lui     a5,%hi(.LC184)
        lui     a1,%hi(.LC98)
        addi    a1,a1,%lo(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC184)
        sw      a6,12(sp)
        call    fprintf
        lw      a1,%lo(stderr)(s0)
        lw      a0,12(sp)
        call    output_one_token.constprop.0
.L2734:
        lw      ra,60(sp)
        lw      s0,56(sp)
        lw      s2,48(sp)
        lw      s4,40(sp)
        lw      s5,36(sp)
        mv      a0,s1
        lw      s1,52(sp)
        addi    sp,sp,64
        jr      ra
.L2801:
        sw      s3,44(sp)
        li      s3,6
        j       .L2737
.L2802:
        bne     a5,s3,.L2799
.L2737:
        mv      a0,s0
        call    get_token
        lbu     a4,32(s0)
        sw      a0,24(s0)
        lw      a5,0(a0)
        mv      a6,a0
        bne     a4,zero,.L2802
.L2799:
        lw      s3,44(sp)
        j       .L2738
.L2740:
        lw      s0,0(s2)
        sw      s3,44(sp)
        sw      s6,32(sp)
        lw      a5,28(s0)
        sw      s7,28(sp)
        li      s3,6
        beq     a5,zero,.L2742
        sw      a5,24(s0)
.L2743:
        sw      zero,28(s0)
        mv      a1,s4
        mv      a0,s2
        call    parse_type
        mv      s6,a0
.L2744:
        lw      s3,0(s2)
        lw      s0,28(s3)
        beq     s0,zero,.L2758
        lw      a5,0(s0)
        sw      s0,24(s3)
.L2759:
        sw      zero,28(s3)
        bne     a5,zero,.L2800
        li      a0,8
        call    alloc_memory.constprop.0
        mv      s3,a0
        mv      s7,a0
        lw      a0,4(s0)
        mv      a4,s4
        mv      a2,s5
        mv      a1,s6
        li      a3,0
        call    create_symbol
        sw      a0,0(s3)
        lw      s3,0(s2)
        lw      s0,28(s3)
        beq     s0,zero,.L2745
        lw      a5,0(s0)
        sw      s0,24(s3)
.L2746:
        sw      zero,28(s3)
        li      a4,4
        beq     a5,a4,.L2803
.L2748:
        lw      a5,8(s2)
        lw      a4,12(s0)
        lw      a3,8(s0)
        lui     s2,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s2)
        lui     a5,%hi(.LC185)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC185)
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s2)
        mv      a0,s0
        call    output_one_token.constprop.0
        lw      s3,44(sp)
        lw      s6,32(sp)
        lw      s7,28(sp)
        j       .L2734
.L2804:
        li      a4,6
        bne     a5,a4,.L2759
.L2758:
        mv      a0,s3
        call    get_token
        lbu     a4,32(s3)
        sw      a0,24(s3)
        lw      a5,0(a0)
        mv      s0,a0
        bne     a4,zero,.L2804
        j       .L2759
.L2805:
        li      a4,6
        bne     a5,a4,.L2746
.L2745:
        mv      a0,s3
        call    get_token
        lbu     a4,32(s3)
        sw      a0,24(s3)
        lw      a5,0(a0)
        mv      s0,a0
        bne     a4,zero,.L2805
        j       .L2746
.L2806:
        lw      a5,0(a0)
        bne     a5,s3,.L2743
.L2742:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,24(s0)
        bne     a5,zero,.L2806
        j       .L2743
.L2803:
        lui     a5,%hi(SYMBOL_ASSIGN)
        lw      a4,%lo(SYMBOL_ASSIGN)(a5)
        lw      a5,4(s0)
        beq     a5,a4,.L2807
.L2749:
        lui     a4,%hi(SYMBOL_COMMA)
        lw      a4,%lo(SYMBOL_COMMA)(a4)
        beq     a4,a5,.L2744
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        lw      a4,4(s0)
        bne     a4,a5,.L2748
.L2800:
        lw      s3,44(sp)
        lw      s6,32(sp)
        lw      s7,28(sp)
        j       .L2734
.L2807:
        lw      s0,0(s2)
        li      s3,6
        lw      a5,28(s0)
        beq     a5,zero,.L2750
        sw      a5,24(s0)
.L2751:
        mv      a2,s4
        li      a1,1
        sw      zero,28(s0)
        mv      a0,s2
        call    parse_expression_prec
        sw      a0,4(s7)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s1)
        sw      s7,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L2808
        sw      a0,4(a5)
.L2753:
        lw      s3,0(s2)
        sw      a0,4(s1)
        lw      s0,28(s3)
        beq     s0,zero,.L2754
        lw      a4,0(s0)
        sw      s0,24(s3)
.L2755:
        sw      zero,28(s3)
        li      a5,4
        bne     a4,a5,.L2748
        lw      a5,4(s0)
        j       .L2749
.L2809:
        lw      a5,0(a0)
        bne     a5,s3,.L2751
.L2750:
        mv      a0,s0
        call    get_token
        lbu     a5,32(s0)
        sw      a0,24(s0)
        bne     a5,zero,.L2809
        j       .L2751
.L2810:
        li      a5,6
        bne     a4,a5,.L2755
.L2754:
        mv      a0,s3
        call    get_token
        lbu     a5,32(s3)
        sw      a0,24(s3)
        lw      a4,0(a0)
        mv      s0,a0
        bne     a5,zero,.L2810
        j       .L2755
.L2808:
        sw      a0,0(s1)
        j       .L2753
create_symbol_table:
        addi    sp,sp,-16
        sw      s2,0(sp)
        mv      s2,a0
        li      a0,16
        sw      ra,12(sp)
        sw      s0,8(sp)
        sw      s1,4(sp)
        mv      s1,a1
        call    alloc_memory.constprop.0
        mv      s0,a0
        sw      s1,0(a0)
        sw      s2,4(a0)
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a0,8(s0)
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a0,12(s0)
        beq     s1,zero,.L2811
        lw      s1,12(s1)
        beq     s1,zero,.L2820
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s1)
        sw      s0,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L2821
        sw      a0,4(a5)
        sw      a0,4(s1)
.L2811:
        lw      ra,12(sp)
        mv      a0,s0
        lw      s0,8(sp)
        lw      s1,4(sp)
        lw      s2,0(sp)
        addi    sp,sp,16
        jr      ra
.L2821:
        sw      a0,0(s1)
        sw      a0,4(s1)
        j       .L2811
.L2820:
        call    list_append.part.0
.LC186:
        .string "[analyzer Error] at %s: The second parameter types of the two comparison methods must be compatible\n"
.LC187:
        .string "other"
.LC188:
        .string "[analyzer Error] at %s: Method must have at least one parameter (self)\n"
.LC189:
        .string "[analyzer Error] at %s: Failed to open import file\n"
.LC190:
        .string "[analyzer Error] at %s: Imported symbol must be a class or function\n"
analyzer:
        lw      a4,0(a0)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        lw      a4,0(a4)
        addi    sp,sp,-144
        lw      a5,12(a5)
        sw      s3,124(sp)
        lui     a3,%hi(file)
        lui     s3,%hi(has_error)
        sw      s6,112(sp)
        sw      ra,140(sp)
        sw      s0,136(sp)
        sw      s1,132(sp)
        sw      s2,128(sp)
        sw      s4,120(sp)
        sw      a4,%lo(file)(a3)
        sb      zero,%lo(has_error)(s3)
        mv      s6,a0
        beq     a5,zero,.L2824
        lw      s4,0(a5)
        li      s2,3
        beq     s4,zero,.L2824
.L2838:
        lw      a1,0(s4)
        beq     a1,zero,.L2825
        lw      a5,8(a1)
        beq     a5,zero,.L2827
        lw      a3,0(a5)
        li      s0,0
        beq     a3,zero,.L2827
.L2832:
        lw      a2,0(a3)
        beq     a2,zero,.L2829
        lw      a4,8(a2)
        addi    a5,a4,-5
        sltiu   a5,a5,2
        addi    a4,a4,-1
        seqz    a5,a5
        snez    a4,a4
        and     a5,a5,a4
        bne     a5,zero,.L2829
        lw      a5,4(a2)
        sw      s0,16(a2)
        lw      a4,8(a5)
        beq     a4,s2,.L3003
        lw      a5,16(a5)
.L2831:
        add     s0,s0,a5
.L2829:
        lw      a3,4(a3)
        bne     a3,zero,.L2832
.L2833:
        lw      a5,12(a1)
        beq     a5,zero,.L2825
        lw      s1,0(a5)
        beq     s1,zero,.L2825
.L2837:
        lw      a0,0(s1)
        beq     a0,zero,.L2835
        mv      a1,s0
        call    fill_symbol_offset
        lw      s1,4(s1)
        bne     s1,zero,.L2837
.L2825:
        lw      s4,4(s4)
        bne     s4,zero,.L2838
.L2824:
        lw      a5,4(s6)
        beq     a5,zero,.L2841
        lw      s2,0(a5)
        beq     s2,zero,.L2841
        lui     s0,%hi(.LC126)
        lui     s1,%hi(.LC127)
        sw      s5,116(sp)
        sw      s7,108(sp)
        sw      s8,104(sp)
        sw      s9,100(sp)
        sw      s10,96(sp)
        sw      s11,92(sp)
        addi    s0,s0,%lo(.LC126)
        addi    s1,s1,%lo(.LC127)
        sw      s6,40(sp)
.L2999:
        lw      a5,0(s2)
        beq     a5,zero,.L2842
        lw      s7,4(a5)
        li      s4,1
        beq     s7,s4,.L2843
        li      a4,2
        beq     s7,a4,.L2844
        bne     s7,zero,.L2842
        lw      s4,0(a5)
        lw      a5,0(s4)
        lw      a4,4(a5)
        beq     a4,zero,.L2981
        lw      s7,4(a4)
        beq     s7,zero,.L2981
        lui     a3,%hi(KEYWORD_CONST)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      s8,%lo(KEYWORD_CONST)(a3)
        lw      s9,%lo(KEYWORD_POINTER)(a5)
.L2982:
        lw      s5,0(a4)
        beq     s5,s8,.L2983
        beq     s5,s9,.L2983
        mv      a1,s0
        mv      a0,s5
        call    strcmp
        beq     a0,zero,.L2983
        mv      a0,s5
        mv      a1,s1
        call    strcmp
        beq     a0,zero,.L2983
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        li      a5,1
        sb      a5,%lo(has_error)(s3)
.L2981:
        lw      s5,4(s4)
        lw      s7,4(s5)
        beq     s7,zero,.L2986
        lui     a5,%hi(KEYWORD_POINTER)
        lw      s9,%lo(KEYWORD_POINTER)(a5)
        lui     a4,%hi(KEYWORD_CONST)
        lw      s8,%lo(KEYWORD_CONST)(a4)
        mv      a4,s5
.L2985:
        lw      s6,0(a4)
        beq     s6,s8,.L2987
        beq     s6,s9,.L2987
        mv      a1,s0
        mv      a0,s6
        call    strcmp
        beq     a0,zero,.L2987
        mv      a0,s6
        mv      a1,s1
        call    strcmp
        beq     a0,zero,.L2987
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        lw      s5,4(s4)
        li      a5,1
        sb      a5,%lo(has_error)(s3)
.L2986:
        lw      a5,8(s4)
        lui     s10,%hi(return_type)
        sw      s5,%lo(return_type)(s10)
        beq     a5,zero,.L2988
        lw      s6,0(a5)
        beq     s6,zero,.L2988
        lui     s9,%hi(.LC128)
        addi    s9,s9,%lo(.LC128)
        lui     s8,%hi(KEYWORD_CONST)
        sw      s2,8(sp)
        j       .L2992
.L3325:
        beq     s5,s11,.L2991
        mv      a1,s0
        mv      a0,s5
        call    strcmp
        beq     a0,zero,.L2991
        mv      a0,s5
        mv      a1,s1
        call    strcmp
        beq     a0,zero,.L2991
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        mv      a1,s9
        call    fprintf
        li      a5,1
        sb      a5,%lo(has_error)(s3)
.L2989:
        lw      s6,4(s6)
        beq     s6,zero,.L3324
.L2992:
        lw      a5,0(s6)
        beq     a5,zero,.L2989
        lw      a3,4(a5)
        beq     a3,zero,.L2989
        lw      s2,4(a3)
        beq     s2,zero,.L2989
        lui     a4,%hi(KEYWORD_POINTER)
        lw      s11,%lo(KEYWORD_POINTER)(a4)
        lw      s7,%lo(KEYWORD_CONST)(s8)
.L2990:
        lw      s5,0(a3)
        bne     s5,s7,.L3325
.L2991:
        lw      a4,4(s2)
        mv      a3,s2
        beq     a4,zero,.L2989
        mv      s2,a4
        j       .L2990
.L2841:
        mv      s2,s6
.L2822:
        lw      ra,140(sp)
        lw      s0,136(sp)
        lw      s1,132(sp)
        lw      s3,124(sp)
        lw      s4,120(sp)
        lw      s6,112(sp)
        mv      a0,s2
        lw      s2,128(sp)
        addi    sp,sp,144
        jr      ra
.L2835:
        lw      s1,4(s1)
        bne     s1,zero,.L2837
        lw      s4,4(s4)
        bne     s4,zero,.L2838
        j       .L2824
.L3003:
        li      a5,4
        j       .L2831
.L2827:
        li      s0,0
        j       .L2833
.L2987:
        lw      a5,4(s7)
        mv      a4,s7
        beq     a5,zero,.L2986
        mv      s7,a5
        j       .L2985
.L3336:
        lw      s2,16(sp)
.L2842:
        lw      s2,4(s2)
        bne     s2,zero,.L2999
.L3326:
        lbu     a5,%lo(has_error)(s3)
        bne     a5,zero,.L3321
        lw      s2,40(sp)
.L3321:
        lw      s5,116(sp)
        lw      s7,108(sp)
        lw      s8,104(sp)
        lw      s9,100(sp)
        lw      s10,96(sp)
        lw      s11,92(sp)
        j       .L2822
.L2983:
        lw      a5,4(s7)
        mv      a4,s7
        beq     a5,zero,.L2981
        mv      s7,a5
        j       .L2982
.L3324:
        lw      s2,8(sp)
.L2988:
        lw      a0,12(s4)
        beq     a0,zero,.L2993
        lw      a5,0(a0)
        beq     a5,zero,.L2993
        call    analyze_body.part.0
.L2993:
        lw      s2,4(s2)
        sw      zero,%lo(return_type)(s10)
        bne     s2,zero,.L2999
        j       .L3326
.L2844:
        lw      s5,0(a5)
        lui     a1,%hi(.LC149)
        addi    a1,a1,%lo(.LC149)
        lw      a0,4(s5)
        call    fopen
        beq     a0,zero,.L3327
        call    fclose
        lw      s9,0(s5)
        lw      a4,4(s9)
        beq     a4,zero,.L2997
        lw      s4,4(a4)
        beq     s4,zero,.L2997
        lui     a3,%hi(KEYWORD_CONST)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      s7,%lo(KEYWORD_CONST)(a3)
        lw      s8,%lo(KEYWORD_POINTER)(a5)
.L2996:
        lw      s6,0(a4)
        beq     s6,s7,.L2998
        beq     s6,s8,.L2998
        mv      a1,s0
        mv      a0,s6
        call    strcmp
        beq     a0,zero,.L2998
        mv      a0,s6
        mv      a1,s1
        call    strcmp
        beq     a0,zero,.L2998
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        lw      s9,0(s5)
        li      a5,1
        sb      a5,%lo(has_error)(s3)
.L2997:
        lw      a5,8(s9)
        li      s4,1
        addi    a5,a5,-2
        bleu    a5,s4,.L2842
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC190)
        addi    a1,a1,%lo(.LC190)
        call    fprintf
        lw      s2,4(s2)
        sb      s4,%lo(has_error)(s3)
        bne     s2,zero,.L2999
        j       .L3326
.L2998:
        lw      a5,4(s4)
        mv      a4,s4
        beq     a5,zero,.L2997
        mv      s4,a5
        j       .L2996
.L2843:
        lw      a5,0(a5)
        sw      a5,8(sp)
        lw      a5,0(a5)
        lw      a4,4(a5)
        beq     a4,zero,.L2846
        lw      s5,4(a4)
        beq     s5,zero,.L2846
        lui     a3,%hi(KEYWORD_CONST)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      s8,%lo(KEYWORD_CONST)(a3)
        lw      s9,%lo(KEYWORD_POINTER)(a5)
.L2847:
        lw      s4,0(a4)
        beq     s4,s8,.L2848
        beq     s4,s9,.L2848
        mv      a1,s0
        mv      a0,s4
        call    strcmp
        beq     a0,zero,.L2848
        mv      a0,s4
        mv      a1,s1
        call    strcmp
        beq     a0,zero,.L2848
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        li      a5,1
        sb      a5,%lo(has_error)(s3)
.L2846:
        lw      a5,8(sp)
        lw      s11,8(a5)
        lui     a5,%hi(SPECIAL_EQ)
        lw      a2,%lo(SPECIAL_EQ)(a5)
        beq     s11,zero,.L3005
        mv      a4,s11
.L2855:
        lw      a5,8(a4)
        lw      a5,0(a5)
        beq     a5,zero,.L2850
.L2852:
        lw      a1,0(a5)
        lw      a3,0(a1)
        beq     a2,a3,.L2851
.L2854:
        lw      a5,4(a5)
        bne     a5,zero,.L2852
.L2850:
        lw      a4,0(a4)
        bne     a4,zero,.L2855
.L3005:
        li      a5,2
        li      a0,1
.L2859:
        beq     a5,a0,.L2860
        beq     s11,zero,.L2860
        mv      a4,s11
.L2858:
        lw      a5,8(a4)
        lw      a5,0(a5)
        beq     a5,zero,.L2856
.L2857:
        lw      a1,0(a5)
        lw      a3,0(a1)
        beq     a2,a3,.L2853
        lw      a5,4(a5)
        bne     a5,zero,.L2857
.L2856:
        lw      a4,0(a4)
        bne     a4,zero,.L2858
        mv      a5,s7
        j       .L2859
.L2848:
        lw      a5,4(s5)
        mv      a4,s5
        beq     a5,zero,.L2846
        mv      s5,a5
        j       .L2847
.L3327:
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC189)
        addi    a1,a1,%lo(.LC189)
        call    fprintf
        lw      s2,4(s2)
        sb      s4,%lo(has_error)(s3)
        bne     s2,zero,.L2999
        j       .L3326
.L2851:
        lw      a0,8(a1)
        li      a3,4
        bne     a0,a3,.L2854
.L2853:
        lui     a5,%hi(SPECIAL_NE)
        lw      a0,%lo(SPECIAL_NE)(a5)
        sw      a1,56(sp)
.L3002:
        mv      a2,s11
.L2867:
        lw      a5,8(a2)
        lw      a5,0(a5)
        beq     a5,zero,.L2862
.L2864:
        lw      a4,0(a5)
        lw      a3,0(a4)
        beq     a0,a3,.L2863
.L2866:
        lw      a5,4(a5)
        bne     a5,zero,.L2864
.L2862:
        lw      a2,0(a2)
        bne     a2,zero,.L2867
        mv      a2,s11
        beq     s11,zero,.L2861
.L2871:
        lw      a5,8(a2)
        lw      a5,0(a5)
        beq     a5,zero,.L2869
.L2870:
        lw      a4,0(a5)
        lw      a3,0(a4)
        beq     a0,a3,.L2865
        lw      a5,4(a5)
        bne     a5,zero,.L2870
.L2869:
        lw      a2,0(a2)
        bne     a2,zero,.L2871
        lui     a5,%hi(SPECIAL_LT)
        lw      a6,%lo(SPECIAL_LT)(a5)
        sw      zero,60(sp)
        li      a4,0
.L3001:
        mv      a0,s11
.L2877:
        lw      a5,8(a0)
        lw      a5,0(a5)
        beq     a5,zero,.L2872
.L2874:
        lw      a2,0(a5)
        lw      a3,0(a2)
        beq     a6,a3,.L2873
.L2876:
        lw      a5,4(a5)
        bne     a5,zero,.L2874
.L2872:
        lw      a0,0(a0)
        bne     a0,zero,.L2877
        mv      a0,s11
        beq     s11,zero,.L2883
.L2881:
        lw      a5,8(a0)
        lw      a5,0(a5)
        beq     a5,zero,.L2879
.L2880:
        lw      a2,0(a5)
        lw      a3,0(a2)
        beq     a6,a3,.L2875
        lw      a5,4(a5)
        bne     a5,zero,.L2880
.L2879:
        lw      a0,0(a0)
        bne     a0,zero,.L2881
        lui     a5,%hi(SPECIAL_GE)
        lw      a7,%lo(SPECIAL_GE)(a5)
        sw      zero,64(sp)
        li      a2,0
.L2882:
        mv      a6,s11
.L2889:
        lw      a5,8(a6)
        lw      a5,0(a5)
        beq     a5,zero,.L2884
.L2886:
        lw      a0,0(a5)
        lw      a3,0(a0)
        beq     a7,a3,.L2885
.L2888:
        lw      a5,4(a5)
        bne     a5,zero,.L2886
.L2884:
        lw      a6,0(a6)
        bne     a6,zero,.L2889
        mv      a6,s11
        beq     s11,zero,.L2895
.L2893:
        lw      a5,8(a6)
        lw      a5,0(a5)
        beq     a5,zero,.L2891
.L2892:
        lw      a0,0(a5)
        lw      a3,0(a0)
        beq     a7,a3,.L2887
        lw      a5,4(a5)
        bne     a5,zero,.L2892
.L2891:
        lw      a6,0(a6)
        bne     a6,zero,.L2893
        lui     a5,%hi(SPECIAL_GT)
        lw      t1,%lo(SPECIAL_GT)(a5)
        sw      zero,68(sp)
        li      a0,0
.L2894:
        mv      a7,s11
.L2901:
        lw      a5,8(a7)
        lw      a5,0(a5)
        beq     a5,zero,.L2896
.L2898:
        lw      s8,0(a5)
        lw      a3,0(s8)
        beq     t1,a3,.L2897
.L2900:
        lw      a5,4(a5)
        bne     a5,zero,.L2898
.L2896:
        lw      a7,0(a7)
        bne     a7,zero,.L2901
        mv      a7,s11
        beq     s11,zero,.L3328
.L2905:
        lw      a5,8(a7)
        lw      a5,0(a5)
        beq     a5,zero,.L2903
.L2904:
        lw      s8,0(a5)
        lw      a3,0(s8)
        beq     t1,a3,.L2899
        lw      a5,4(a5)
        bne     a5,zero,.L2904
.L2903:
        lw      a7,0(a7)
        bne     a7,zero,.L2905
        lui     a5,%hi(SPECIAL_LE)
        lw      t1,%lo(SPECIAL_LE)(a5)
        sw      zero,72(sp)
        li      s8,0
.L2906:
        mv      a7,s11
.L2912:
        lw      a5,8(a7)
        lw      a5,0(a5)
        beq     a5,zero,.L2908
.L2910:
        lw      t3,0(a5)
        lw      a3,0(t3)
        beq     t1,a3,.L2909
.L2911:
        lw      a5,4(a5)
        bne     a5,zero,.L2910
.L2908:
        lw      a7,0(a7)
        bne     a7,zero,.L2912
        mv      a7,s11
        beq     s11,zero,.L2907
.L2916:
        lw      a5,8(a7)
        lw      a5,0(a5)
        beq     a5,zero,.L2914
.L2915:
        lw      s11,0(a5)
        lw      a3,0(s11)
        beq     t1,a3,.L2907
        lw      a5,4(a5)
        bne     a5,zero,.L2915
.L2914:
        lw      a7,0(a7)
        bne     a7,zero,.L2916
        li      s11,0
        j       .L2907
.L2863:
        lw      a6,8(a4)
        li      a3,4
        bne     a6,a3,.L2866
.L2865:
        lui     a5,%hi(SPECIAL_LT)
        lw      a6,%lo(SPECIAL_LT)(a5)
        sw      a4,60(sp)
        j       .L3001
.L2873:
        lw      a7,8(a2)
        li      a3,4
        bne     a7,a3,.L2876
.L2875:
        lui     a5,%hi(SPECIAL_GE)
        lw      a7,%lo(SPECIAL_GE)(a5)
        sw      a2,64(sp)
        j       .L2882
.L2885:
        lw      t1,8(a0)
        li      a3,4
        bne     t1,a3,.L2888
.L2887:
        lui     a5,%hi(SPECIAL_GT)
        lw      t1,%lo(SPECIAL_GT)(a5)
        sw      a0,68(sp)
        j       .L2894
.L2897:
        lw      a6,8(s8)
        li      a3,4
        bne     a6,a3,.L2900
.L2899:
        lui     a5,%hi(SPECIAL_LE)
        lw      t1,%lo(SPECIAL_LE)(a5)
        sw      s8,72(sp)
        j       .L2906
.L2909:
        lw      a6,8(t3)
        li      a3,4
        bne     a6,a3,.L2911
        mv      s11,t3
.L2907:
        lui     a7,%hi(.LC187)
        lui     a5,%hi(.LC186)
        addi    a3,a7,%lo(.LC187)
        addi    a5,a5,%lo(.LC186)
        sw      a3,24(sp)
        sw      a5,36(sp)
        snez    a3,a4
        seqz    a5,a1
        li      s5,-931295232
        sw      s11,76(sp)
        sw      s2,44(sp)
        and     a5,a5,a3
        addi    s5,s5,-523
        beq     a5,zero,.L2917
.L3331:
        lui     a5,%hi(SPECIAL_EQ)
        lw      s6,%lo(SPECIAL_EQ)(a5)
        mv      a3,a4
        addi    s7,sp,56
.L2918:
        seqz    a5,a2
        snez    a6,a0
        and     a5,a5,a6
        beq     a5,zero,.L2919
.L3332:
        lui     a5,%hi(SPECIAL_LT)
        lw      s6,%lo(SPECIAL_LT)(a5)
        mv      a3,a0
        addi    s7,sp,64
.L2920:
        seqz    a5,s8
        snez    a6,s11
        and     a5,a5,a6
        beq     a5,zero,.L2921
.L3333:
        lui     a5,%hi(SPECIAL_GT)
        lw      s6,%lo(SPECIAL_GT)(a5)
        li      s8,0
        addi    s7,sp,72
.L2922:
        beq     s6,zero,.L2931
.L3335:
        li      a0,20
        call    alloc_memory.constprop.0
        mv      s2,a0
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a0,12(s2)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a4,8(sp)
        lui     s4,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(s4)
        lw      a1,8(a4)
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a5,4(s2)
        li      a5,1
        sw      a0,8(s2)
        sb      a5,16(s2)
        li      a0,3
        call    create_symbol_table
        lw      a4,8(sp)
        lui     a5,%hi(KEYWORD_SELF)
        mv      a2,a0
        lw      a1,0(a4)
        sw      a0,16(sp)
        lw      a0,%lo(KEYWORD_SELF)(a5)
        call    create_symbol.constprop.1
        sw      a0,12(sp)
        lw      a0,16(s11)
        call    method_other_type.isra.0
        mv      a1,a0
        beq     s8,zero,.L2932
        sw      a0,20(sp)
        lw      a0,16(s8)
        call    method_other_type.isra.0
        lw      a1,20(sp)
        seqz    a5,a0
        seqz    a4,a1
        or      a5,a5,a4
        bne     a5,zero,.L2933
        beq     a1,a0,.L2932
        lui     a5,%hi(symbol_int)
        lw      a5,%lo(symbol_int)(a5)
        lui     a4,%hi(symbol_float)
        lw      a4,%lo(symbol_float)(a4)
        beq     a1,a5,.L2934
        beq     a4,a1,.L3329
        lw      a3,%lo(symbol_bool)(s4)
        beq     a1,a3,.L3330
.L2933:
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lw      a1,36(sp)
        call    fprintf
        li      a5,1
        sb      a5,%lo(has_error)(s3)
        li      a5,0
.L2940:
        sw      a5,0(s7)
        lw      a1,56(sp)
        lw      a4,60(sp)
        lw      a2,64(sp)
        seqz    a5,a1
        snez    a3,a4
        and     a5,a5,a3
        lw      a0,68(sp)
        lw      s8,72(sp)
        lw      s11,76(sp)
        bne     a5,zero,.L3331
.L2917:
        snez    a3,a1
        seqz    a5,a4
        and     a5,a5,a3
        li      s6,0
        li      a3,0
        li      s7,0
        beq     a5,zero,.L2918
        lui     a5,%hi(SPECIAL_NE)
        lw      s6,%lo(SPECIAL_NE)(a5)
        snez    a6,a0
        seqz    a5,a2
        and     a5,a5,a6
        mv      a3,a1
        addi    s7,sp,60
        bne     a5,zero,.L3332
.L2919:
        seqz    a5,a0
        snez    a6,a2
        and     a5,a5,a6
        beq     a5,zero,.L2920
        lui     a5,%hi(SPECIAL_GE)
        lw      s6,%lo(SPECIAL_GE)(a5)
        snez    a6,s11
        seqz    a5,s8
        and     a5,a5,a6
        mv      a3,a2
        addi    s7,sp,68
        bne     a5,zero,.L3333
.L2921:
        beq     s11,zero,.L3334
        bne     a0,zero,.L2929
        beq     a1,zero,.L2929
        mv      s11,a3
        beq     s8,zero,.L2922
.L2927:
        seqz    a5,a4
        snez    a4,a2
        and     a5,a5,a4
        bne     a5,zero,.L2930
.L3323:
        lui     a5,%hi(SPECIAL_GE)
        lw      s6,%lo(SPECIAL_GE)(a5)
        mv      s11,a1
        addi    s7,sp,68
        bne     s6,zero,.L3335
.L2931:
        lw      a5,8(sp)
        lw      s2,44(sp)
        lw      a5,4(a5)
        beq     a5,zero,.L2842
        lw      s11,0(a5)
        beq     s11,zero,.L2842
        sw      s2,16(sp)
        j       .L2980
.L3337:
        li      a4,1
        bne     s7,a4,.L2962
        lw      a0,0(a5)
        call    analyze_variable
.L2962:
        lw      s11,4(s11)
        beq     s11,zero,.L3336
.L2980:
        lw      a5,0(s11)
        beq     a5,zero,.L2962
        lw      s7,4(a5)
        bne     s7,zero,.L3337
        lw      a5,0(a5)
        sw      a5,12(sp)
        lw      a5,0(a5)
        lw      a4,4(a5)
        beq     a4,zero,.L2965
        lw      s4,4(a4)
        beq     s4,zero,.L2965
        lui     a3,%hi(KEYWORD_CONST)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      s5,%lo(KEYWORD_CONST)(a3)
        lw      s6,%lo(KEYWORD_POINTER)(a5)
.L2966:
        lw      s2,0(a4)
        beq     s2,s5,.L2967
        beq     s2,s6,.L2967
        mv      a1,s0
        mv      a0,s2
        call    strcmp
        beq     a0,zero,.L2967
        mv      a0,s2
        mv      a1,s1
        call    strcmp
        beq     a0,zero,.L2967
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        li      a5,1
        sb      a5,%lo(has_error)(s3)
.L2965:
        lw      a5,12(sp)
        lw      s8,4(a5)
        lw      s4,4(s8)
        beq     s4,zero,.L2970
        lui     a5,%hi(KEYWORD_POINTER)
        lw      s6,%lo(KEYWORD_POINTER)(a5)
        lui     a4,%hi(KEYWORD_CONST)
        lw      s5,%lo(KEYWORD_CONST)(a4)
        mv      a4,s8
.L2969:
        lw      s2,0(a4)
        beq     s2,s5,.L2971
        beq     s2,s6,.L2971
        mv      a1,s0
        mv      a0,s2
        call    strcmp
        beq     a0,zero,.L2971
        mv      a0,s2
        mv      a1,s1
        call    strcmp
        beq     a0,zero,.L2971
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC128)
        addi    a1,a1,%lo(.LC128)
        call    fprintf
        lw      a5,12(sp)
        lw      s8,4(a5)
        li      a5,1
        sb      a5,%lo(has_error)(s3)
.L2970:
        lw      a5,12(sp)
        lui     a4,%hi(return_type)
        sw      s8,%lo(return_type)(a4)
        lw      a5,8(a5)
        beq     a5,zero,.L2972
        lw      s2,0(a5)
        beq     s2,zero,.L2972
        lui     s9,%hi(.LC128)
        addi    a5,s9,%lo(.LC128)
        sw      a5,8(sp)
        lui     s8,%hi(KEYWORD_SELF)
.L2973:
        lw      s5,0(s2)
        beq     s5,zero,.L2974
        lw      a3,4(s5)
        beq     a3,zero,.L2975
        lw      s9,4(a3)
        beq     s9,zero,.L2975
        lui     a2,%hi(KEYWORD_CONST)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      s4,%lo(KEYWORD_CONST)(a2)
        lw      s6,%lo(KEYWORD_POINTER)(a5)
.L2976:
        lw      s10,0(a3)
        beq     s10,s4,.L2977
        beq     s10,s6,.L2977
        mv      a1,s0
        mv      a0,s10
        call    strcmp
        beq     a0,zero,.L2977
        mv      a0,s10
        mv      a1,s1
        call    strcmp
        beq     a0,zero,.L2977
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lw      a1,8(sp)
        call    fprintf
        li      a5,1
        sb      a5,%lo(has_error)(s3)
.L2975:
        bne     s7,zero,.L2978
        lw      a4,0(s5)
        lw      a5,%lo(KEYWORD_SELF)(s8)
        bne     a4,a5,.L3338
.L2978:
        addi    s7,s7,1
.L2974:
        lw      s2,4(s2)
        bne     s2,zero,.L2973
        lw      a5,12(sp)
        lw      a0,12(a5)
        beq     a0,zero,.L2979
        lw      a5,0(a0)
        beq     a5,zero,.L2979
        call    analyze_body.part.0
.L2979:
        lui     a5,%hi(return_type)
        sw      zero,%lo(return_type)(a5)
        j       .L2962
.L3329:
        beq     a0,a5,.L2939
        lw      a5,%lo(symbol_bool)(s4)
        bne     a5,a0,.L2933
.L2939:
        mv      a1,a4
.L2932:
        lui     s10,%hi(string_table)
        lw      a5,%lo(string_table)(s10)
        lw      s4,4(a5)
        lw      a5,0(a5)
        remu    s4,s5,s4
        slli    s4,s4,2
        add     a5,a5,s4
        lw      a5,0(a5)
        beq     a5,zero,.L3339
        lui     a4,%hi(.LC187)
        sw      s4,32(sp)
        sw      a4,20(sp)
        li      a2,5
        mv      s9,a1
        mv      s4,a5
        sw      s2,28(sp)
        j       .L2944
.L2942:
        lw      s4,8(s4)
        beq     s4,zero,.L3340
.L2944:
        lw      a4,0(s4)
        bne     a4,a2,.L2942
        lw      a4,4(s4)
        bne     a4,s5,.L2942
        lw      s2,12(s4)
        lw      a1,24(sp)
        mv      a0,s2
        call    strncmp
        li      a2,5
        bne     a0,zero,.L2942
        mv      a1,s9
        mv      s9,s2
        lw      s2,28(sp)
.L2943:
        lw      a2,16(sp)
        mv      a0,s9
        call    create_symbol.constprop.1
        lw      a5,8(s2)
        mv      s4,a0
        beq     a5,zero,.L2948
        li      a0,8
        sw      a5,16(sp)
        call    alloc_memory.constprop.0
        lw      a5,16(sp)
        lw      a3,12(sp)
        lw      a4,4(a5)
        sw      a3,0(a0)
        sw      zero,4(a0)
        beq     a4,zero,.L3341
        sw      a0,4(a4)
.L2947:
        lw      s10,8(s2)
        sw      a0,4(a5)
        beq     s10,zero,.L2948
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s10)
        sw      s4,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L3342
        sw      a0,4(a5)
.L2950:
        sw      a0,4(s10)
        li      a0,16
        call    alloc_memory.constprop.0
        lw      a5,12(sp)
        mv      s10,a0
        sw      zero,0(a0)
        sw      a5,4(a0)
        sw      zero,12(a0)
        sw      zero,8(a0)
        li      a0,16
        call    alloc_memory.constprop.0
        li      a5,2
        sw      a5,12(a0)
        sw      s10,0(a0)
        sw      s11,4(a0)
        sw      zero,8(a0)
        sw      a0,20(sp)
        li      a0,16
        call    alloc_memory.constprop.0
        mv      s10,a0
        sw      s4,4(a0)
        sw      zero,0(a0)
        sw      zero,12(a0)
        sw      zero,8(a0)
        li      a0,12
        call    alloc_memory.constprop.0
        li      a5,7
        sw      a5,8(a0)
        mv      s11,a0
        sw      s10,0(a0)
        sw      zero,4(a0)
        li      a0,16
        call    alloc_memory.constprop.0
        li      a3,21
        sw      a3,8(a0)
        sw      s11,0(a0)
        sw      zero,4(a0)
        sw      zero,12(a0)
        sw      a0,16(sp)
        li      a0,16
        call    alloc_memory.constprop.0
        lw      a4,20(sp)
        mv      s10,a0
        sw      a4,0(a0)
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        li      a4,1
        mv      s11,a0
        sw      a0,4(s10)
        sw      a4,12(s10)
        sw      zero,8(s10)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,16(sp)
        lw      a4,4(s11)
        sw      zero,4(a0)
        sw      a5,0(a0)
        beq     a4,zero,.L3343
        sw      a0,4(a4)
.L2952:
        sw      a0,4(s11)
        beq     s8,zero,.L3344
        li      a0,16
        call    alloc_memory.constprop.0
        lw      a4,12(sp)
        sw      zero,0(a0)
        sw      zero,12(a0)
        sw      a4,4(a0)
        sw      zero,8(a0)
        sw      a0,12(sp)
        li      a0,16
        call    alloc_memory.constprop.0
        lw      a5,12(sp)
        li      a4,2
        sw      a4,12(a0)
        sw      a5,0(a0)
        sw      s8,4(a0)
        mv      s11,a0
        sw      zero,8(a0)
        li      a0,16
        call    alloc_memory.constprop.0
        mv      s8,a0
        sw      s4,4(a0)
        sw      zero,0(a0)
        sw      zero,12(a0)
        sw      zero,8(a0)
        li      a0,12
        call    alloc_memory.constprop.0
        li      a5,7
        mv      s4,a0
        sw      s8,0(a0)
        sw      a5,8(a0)
        sw      zero,4(a0)
        li      a0,16
        call    alloc_memory.constprop.0
        li      a5,21
        sw      a5,8(a0)
        sw      s4,0(a0)
        mv      s9,a0
        sw      zero,4(a0)
        sw      zero,12(a0)
        li      a0,16
        call    alloc_memory.constprop.0
        mv      s8,a0
        sw      s11,0(a0)
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        li      a5,1
        mv      s4,a0
        sw      a0,4(s8)
        sw      a5,12(s8)
        sw      zero,8(s8)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s4)
        sw      s9,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L3345
        sw      a0,4(a5)
.L2956:
        sw      a0,4(s4)
        li      a0,12
        call    alloc_memory.constprop.0
        li      s11,7
        mv      s4,a0
        sw      s10,0(a0)
        sw      zero,4(a0)
        sw      s11,8(a0)
        li      a0,16
        call    alloc_memory.constprop.0
        li      s10,21
        sw      s4,0(a0)
        mv      s9,a0
        sw      zero,4(a0)
        sw      zero,12(a0)
        sw      s10,8(a0)
        li      a0,12
        call    alloc_memory.constprop.0
        mv      s4,a0
        sw      s8,0(a0)
        sw      s11,8(a0)
        sw      zero,4(a0)
        li      a0,16
        call    alloc_memory.constprop.0
        sw      s4,0(a0)
        mv      s8,a0
        sw      s10,8(a0)
        sw      zero,4(a0)
        sw      zero,12(a0)
        li      a0,16
        call    alloc_memory.constprop.0
        li      a5,18
        mv      s4,a0
        sw      s9,0(a0)
        sw      s8,4(a0)
        sw      zero,12(a0)
        sw      a5,8(a0)
.L2954:
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s8,12(s2)
        li      a5,7
        sw      s4,0(a0)
        sw      a5,4(a0)
        mv      s9,a0
        beq     s8,zero,.L2948
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s8)
        sw      s9,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L3346
        sw      a0,4(a5)
.L2958:
        lw      a5,8(sp)
        lw      a1,4(s2)
        sw      a0,4(s8)
        lw      a4,8(a5)
        mv      a0,s6
        mv      a3,s2
        li      a2,4
        call    create_symbol
        sw      a0,0(s2)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,8(sp)
        mv      s6,a0
        lw      s4,4(a5)
        sw      s2,0(a0)
        sw      zero,4(a0)
        beq     s4,zero,.L2948
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s4)
        sw      s6,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L3347
        sw      a0,4(a5)
.L2960:
        lw      a5,0(s2)
        sw      a0,4(s4)
        j       .L2940
.L3340:
        lw      s4,32(sp)
        lw      s2,28(sp)
        mv      a1,s9
.L2941:
        li      a0,16
        sw      a1,32(sp)
        call    alloc_memory.constprop.0
        lw      a5,%lo(string_table)(s10)
        li      a3,5
        mv      a4,a0
        lw      a5,0(a5)
        sw      s5,4(a0)
        sw      a3,0(a0)
        add     a5,a5,s4
        lw      a5,0(a5)
        li      a0,6
        sw      a4,28(sp)
        sw      a5,8(a4)
        call    alloc_memory.constprop.1
        lw      a5,20(sp)
        lw      a4,28(sp)
        lw      a2,%lo(string_table)(s10)
        addi    a5,a5,%lo(.LC187)
        lbu     a3,0(a5)
        lbu     a6,1(a5)
        sw      a0,12(a4)
        sb      a3,0(a0)
        sb      a6,1(a0)
        lbu     a3,2(a5)
        lbu     a6,3(a5)
        lbu     a5,4(a5)
        sb      a3,2(a0)
        sb      a6,3(a0)
        sb      a5,4(a0)
        lw      a0,12(a4)
        lui     a3,%hi(string_count)
        lw      a5,%lo(string_count)(a3)
        sb      zero,5(a0)
        lw      a0,0(a2)
        addi    a5,a5,1
        sw      a5,%lo(string_count)(a3)
        lw      a5,8(a2)
        add     a0,a0,s4
        lw      s9,12(a4)
        addi    a5,a5,1
        sw      a4,0(a0)
        lw      a1,32(sp)
        sw      a5,8(a2)
        j       .L2943
.L3347:
        sw      a0,0(s4)
        j       .L2960
.L3346:
        sw      a0,0(s8)
        j       .L2958
.L3344:
        li      a0,12
        call    alloc_memory.constprop.0
        li      a5,7
        mv      s4,a0
        sw      a5,8(a0)
        sw      s10,0(a0)
        sw      zero,4(a0)
        li      a0,12
        call    alloc_memory.constprop.0
        li      a5,6
        sw      s4,0(a0)
        sw      a5,8(a0)
        mv      s8,a0
        sw      zero,4(a0)
        li      a0,16
        call    alloc_memory.constprop.0
        li      a5,21
        mv      s4,a0
        sw      s8,0(a0)
        sw      zero,4(a0)
        sw      zero,12(a0)
        sw      a5,8(a0)
        j       .L2954
.L3343:
        sw      a0,0(s11)
        j       .L2952
.L3342:
        sw      a0,0(s10)
        j       .L2950
.L3341:
        sw      a0,0(a5)
        j       .L2947
.L2929:
        seqz    a4,a4
        snez    a5,a2
        and     a5,a5,a4
        mv      s11,a3
        bne     a5,zero,.L3348
        li      s8,0
        j       .L2922
.L3345:
        sw      a0,0(s4)
        j       .L2956
.L3334:
        beq     s8,zero,.L3349
        lui     a5,%hi(SPECIAL_LE)
        lw      s6,%lo(SPECIAL_LE)(a5)
        beq     a1,zero,.L2925
        beq     a2,zero,.L3350
        beq     a0,zero,.L2927
        beq     a4,zero,.L2930
        mv      s8,a2
        mv      s11,a1
        addi    s7,sp,76
        j       .L2922
.L3348:
        beq     s8,zero,.L2922
.L2930:
        lui     a5,%hi(SPECIAL_NE)
        lw      s6,%lo(SPECIAL_NE)(a5)
        mv      s11,a2
        addi    s7,sp,60
        j       .L2922
.L2934:
        beq     a4,a0,.L2939
        lw      a5,%lo(symbol_bool)(s4)
        bne     a0,a5,.L2933
        j       .L2932
.L3338:
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC44)
        addi    a1,a1,%lo(.LC44)
        call    fprintf
        li      a5,1
        sb      a5,%lo(has_error)(s3)
        j       .L2962
.L2977:
        lw      a5,4(s9)
        mv      a3,s9
        beq     a5,zero,.L2975
        mv      s9,a5
        j       .L2976
.L2971:
        lw      a5,4(s4)
        mv      a4,s4
        beq     a5,zero,.L2970
        mv      s4,a5
        j       .L2969
.L2967:
        lw      a5,4(s4)
        mv      a4,s4
        beq     a5,zero,.L2965
        mv      s4,a5
        j       .L2966
.L2972:
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a2,%lo(file)(a5)
        lui     a1,%hi(.LC188)
        addi    a1,a1,%lo(.LC188)
        call    fprintf
        li      a5,1
        sb      a5,%lo(has_error)(s3)
        j       .L2962
.L3330:
        mv      a1,a0
        beq     a0,a5,.L2932
        bne     a4,a0,.L2933
        mv      a1,a4
        j       .L2932
.L2925:
        seqz    a5,a4
        snez    a4,a2
        and     a5,a5,a4
        bne     a5,zero,.L2930
.L3322:
        mv      s11,s8
        addi    s7,sp,76
        li      s8,0
        j       .L2922
.L3339:
        lui     a5,%hi(.LC187)
        sw      a5,20(sp)
        j       .L2941
.L3350:
        bne     a0,zero,.L3322
        j       .L3323
.L3349:
        mv      s11,a3
        beq     a1,zero,.L2922
        beq     a2,zero,.L2922
        lui     a5,%hi(SPECIAL_LE)
        lw      s6,%lo(SPECIAL_LE)(a5)
        mv      s8,a2
        mv      s11,a1
        addi    s7,sp,76
        j       .L2922
.L2948:
        call    list_append.part.0
.L2860:
        sw      zero,56(sp)
        beq     s11,zero,.L3007
        lui     a5,%hi(SPECIAL_NE)
        lw      a0,%lo(SPECIAL_NE)(a5)
        li      a1,0
        j       .L3002
.L3007:
        li      a1,0
.L2861:
        sw      zero,60(sp)
        li      a4,0
.L2883:
        sw      zero,64(sp)
        li      a2,0
.L2895:
        sw      zero,68(sp)
        sw      zero,72(sp)
        li      s8,0
        li      a0,0
        li      s11,0
        j       .L2907
.L3328:
        sw      zero,72(sp)
        li      s8,0
        j       .L2907
.LC191:
        .string "Expected '(' after 'if'"
.LC192:
        .string "Expected ')' after if condition"
.LC193:
        .string "Expected '{' to start if body"
.LC194:
        .string "Expected '(' after 'elif'"
.LC195:
        .string "Expected ')' after elif condition"
.LC196:
        .string "Expected '{' to start elif body"
.LC197:
        .string "Expected '{' to start else body"
.LC198:
        .string "Expected '(' after 'for'"
.LC199:
        .string "Expected exactly one variable declaration in for loop initializer"
.LC200:
        .string "Expected expression in for loop initializer"
.LC201:
        .string "Expected expression in for loop condition"
.LC202:
        .string "Expected ';' after for loop condition"
.LC203:
        .string "Expected expression in for loop increment"
.LC204:
        .string "Expected ')' after for loop increment"
.LC205:
        .string "Expected '{' to start for loop body"
.LC206:
        .string "Expected '(' after 'while'"
.LC207:
        .string "Expected ')' after while condition"
.LC208:
        .string "Expected '{' to start while body"
.LC209:
        .string "Expected ';' after statement"
.LC210:
        .string "Unexpected token in body"
parse_body:
        addi    sp,sp,-80
        sw      s1,68(sp)
        lw      s1,0(a0)
        sw      s10,32(sp)
        sw      s0,72(sp)
        lw      s10,28(s1)
        sw      s2,64(sp)
        sw      s3,60(sp)
        sw      ra,76(sp)
        sw      s4,56(sp)
        sw      s5,52(sp)
        sw      s6,48(sp)
        sw      s7,44(sp)
        sw      s8,40(sp)
        sw      s9,36(sp)
        sw      s11,28(sp)
        sw      a1,0(sp)
        mv      s3,a0
        mv      s0,a2
        li      s2,6
        beq     s10,zero,.L3352
        lw      a5,0(s10)
        sw      s10,24(s1)
.L3353:
        sw      zero,28(s1)
        li      s5,4
        lui     s9,%hi(SYMBOL_R_BRACE)
        li      s1,6
        li      s6,5
        li      s4,1
.L3355:
        bne     a5,s5,.L3518
        lw      a4,4(s10)
        lw      a5,%lo(SYMBOL_R_BRACE)(s9)
        beq     a4,a5,.L3728
.L3518:
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s11,0(s3)
        mv      s2,a0
        lw      a0,24(s11)
        beq     a0,zero,.L3358
        lw      a5,0(a0)
.L3359:
        beq     a5,s6,.L3729
.L3360:
        li      a5,8
        sw      a5,4(s2)
.L3719:
        lw      a2,0(sp)
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        sw      a0,0(s2)
.L3495:
        lw      s11,0(s3)
        lw      s8,28(s11)
        beq     s8,zero,.L3499
        lw      a5,0(s8)
        sw      s8,24(s11)
.L3500:
        sw      zero,28(s11)
        bne     a5,s5,.L3502
.L3741:
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3502
        beq     s2,zero,.L3730
.L3422:
        lw      a5,4(s2)
        beq     a5,zero,.L3731
.L3494:
        beq     s0,zero,.L3512
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s0)
        sw      s2,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L3732
        sw      a0,4(a5)
.L3514:
        sw      a0,4(s0)
.L3493:
        lw      s2,0(s3)
        lw      s10,28(s2)
        beq     s10,zero,.L3515
        lw      a5,0(s10)
        sw      s10,24(s2)
.L3516:
        sw      zero,28(s2)
        j       .L3355
.L3733:
        bne     a5,s1,.L3359
.L3358:
        mv      a0,s11
        call    get_token
        lbu     a4,32(s11)
        sw      a0,24(s11)
        lw      a5,0(a0)
        bne     a4,zero,.L3733
        bne     a5,s6,.L3360
.L3729:
        lui     a4,%hi(KEYWORD_IF)
        lw      a5,4(a0)
        lw      a4,%lo(KEYWORD_IF)(a4)
        beq     a5,a4,.L3734
        lui     a4,%hi(KEYWORD_FOR)
        lw      a4,%lo(KEYWORD_FOR)(a4)
        beq     a5,a4,.L3735
        lui     a4,%hi(KEYWORD_WHILE)
        lw      a4,%lo(KEYWORD_WHILE)(a4)
        beq     a5,a4,.L3736
        lui     a4,%hi(KEYWORD_RETURN)
        lw      a4,%lo(KEYWORD_RETURN)(a4)
        beq     a5,a4,.L3737
        lui     a4,%hi(KEYWORD_BREAK)
        lw      a4,%lo(KEYWORD_BREAK)(a4)
        beq     a5,a4,.L3738
        lui     a4,%hi(KEYWORD_CONTINUE)
        lw      a4,%lo(KEYWORD_CONTINUE)(a4)
        beq     a5,a4,.L3739
        lui     a4,%hi(KEYWORD_VAR)
        lw      a4,%lo(KEYWORD_VAR)(a4)
        bne     a5,a4,.L3360
        lw      a1,0(sp)
        sw      zero,4(s2)
        li      a2,1
        mv      a0,s3
        call    parse_variable
        lw      a5,4(s2)
        sw      a0,0(s2)
        mv      s10,a0
        bne     a5,zero,.L3494
        j       .L3498
.L3740:
        bne     a5,s1,.L3500
.L3499:
        mv      a0,s11
        call    get_token
        lbu     a4,32(s11)
        sw      a0,24(s11)
        lw      a5,0(a0)
        mv      s8,a0
        bne     a4,zero,.L3740
        sw      zero,28(s11)
        beq     a5,s5,.L3741
.L3502:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lui     s11,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s11)
        lui     a5,%hi(.LC209)
        lui     s7,%hi(.LC98)
        addi    a1,s7,%lo(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC209)
        call    fprintf
        lw      a1,%lo(stderr)(s11)
        mv      a0,s8
        call    output_one_token.constprop.0
.L3504:
        lw      a5,8(s3)
        lw      a4,12(s10)
        lw      a3,8(s10)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s11)
        lui     a5,%hi(.LC210)
        addi    a1,s7,%lo(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC210)
        call    fprintf
        lw      a1,%lo(stderr)(s11)
        mv      a0,s10
        call    output_one_token.constprop.0
        li      a0,0
.L3713:
        lw      ra,76(sp)
        lw      s0,72(sp)
        lw      s1,68(sp)
        lw      s2,64(sp)
        lw      s3,60(sp)
        lw      s4,56(sp)
        lw      s5,52(sp)
        lw      s6,48(sp)
        lw      s7,44(sp)
        lw      s8,40(sp)
        lw      s9,36(sp)
        lw      s10,32(sp)
        lw      s11,28(sp)
        addi    sp,sp,80
        jr      ra
.L3742:
        bne     a5,s1,.L3516
.L3515:
        mv      a0,s2
        call    get_token
        lbu     a4,32(s2)
        sw      a0,24(s2)
        lw      a5,0(a0)
        mv      s10,a0
        bne     a4,zero,.L3742
        sw      zero,28(s2)
        j       .L3355
.L3731:
        lw      s10,0(s2)
        beq     s10,zero,.L3493
.L3498:
        lw      a5,0(s10)
        beq     a5,zero,.L3493
        beq     s0,zero,.L3506
.L3510:
        lw      a4,4(a5)
        lw      s11,0(a5)
        sw      a4,0(s10)
        beq     a4,zero,.L3743
.L3507:
        li      a0,8
        call    alloc_memory.constprop.0
        mv      s2,a0
        sw      s4,4(a0)
        sw      s11,0(a0)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a4,4(s0)
        sw      s2,0(a0)
        sw      zero,4(a0)
        beq     a4,zero,.L3508
        lw      a5,0(s10)
        sw      a0,4(a4)
        sw      a0,4(s0)
        beq     a5,zero,.L3493
        lw      a4,4(a5)
        lw      s11,0(a5)
        sw      a4,0(s10)
        bne     a4,zero,.L3507
.L3743:
        sw      zero,4(s10)
        j       .L3507
.L3744:
        bne     a5,s2,.L3353
.L3352:
        mv      a0,s1
        call    get_token
        lbu     a4,32(s1)
        sw      a0,24(s1)
        lw      a5,0(a0)
        mv      s10,a0
        bne     a4,zero,.L3744
        j       .L3353
.L3508:
        sw      a0,0(s0)
        lw      a5,0(s10)
        sw      a0,4(s0)
        bne     a5,zero,.L3510
        j       .L3493
.L3732:
        sw      a0,0(s0)
        j       .L3514
.L3738:
        sw      s6,4(s2)
        sw      zero,0(s2)
        j       .L3495
.L3739:
        li      a5,6
        sw      zero,0(s2)
        sw      a5,4(s2)
        j       .L3495
.L3734:
        li      a5,2
        sw      a5,4(s2)
        li      a0,16
        call    alloc_memory.constprop.0
        mv      s10,a0
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a0,4(s10)
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a0,8(s10)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s7,0(s3)
        sw      zero,0(a0)
        sw      zero,4(a0)
        lw      s8,28(s7)
        sw      a0,12(s10)
        li      s11,6
        beq     s8,zero,.L3362
        lw      a4,0(s8)
        sw      s8,24(s7)
.L3363:
        sw      zero,28(s7)
        li      a5,4
        bne     a4,a5,.L3365
.L3750:
        lui     s7,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(s7)
        lw      a4,4(s8)
        bne     a4,a5,.L3365
        lw      s8,0(s3)
        li      s11,6
        lw      a4,28(s8)
        beq     a4,zero,.L3368
        sw      a4,24(s8)
.L3369:
        lw      a2,0(sp)
        sw      zero,28(s8)
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        lw      s11,0(s3)
        sw      a0,0(s10)
        lw      s8,28(s11)
        beq     s8,zero,.L3370
        lw      a4,0(s8)
        sw      s8,24(s11)
.L3371:
        sw      zero,28(s11)
        li      a5,4
        bne     a4,a5,.L3373
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3373
        lw      s11,0(s3)
        lw      s8,28(s11)
        beq     s8,zero,.L3375
        lw      a0,0(s8)
        sw      s8,24(s11)
.L3376:
        sw      zero,28(s11)
        li      a5,4
        bne     a0,a5,.L3378
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3378
        lw      a1,0(sp)
        call    create_symbol_table
        lw      a2,4(s10)
        mv      a1,a0
        mv      a0,s3
        call    parse_body
        beq     a0,zero,.L3721
        lw      s8,0(s3)
        lw      a0,28(s8)
        beq     a0,zero,.L3745
        lw      a4,0(a0)
.L3383:
        li      a5,5
        bne     a4,a5,.L3474
        sw      a4,12(sp)
        li      s11,6
        j       .L3384
.L3748:
        sw      a4,24(s8)
        mv      a4,s8
.L3387:
        sw      zero,28(s8)
        lw      s8,28(a4)
        beq     s8,zero,.L3389
        lw      a5,0(s8)
        sw      s8,24(a4)
.L3390:
        sw      zero,28(a4)
        li      a4,4
        bne     a5,a4,.L3392
        lw      a4,4(s8)
        lw      a5,%lo(SYMBOL_L_PAREN)(s7)
        bne     a4,a5,.L3392
        lw      a2,0(sp)
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        lw      a5,4(sp)
        sw      a0,0(a5)
        lw      a5,0(s3)
        lw      s8,28(a5)
        beq     s8,zero,.L3394
        lw      a4,0(s8)
        sw      s8,24(a5)
.L3395:
        sw      zero,28(a5)
        li      a5,4
        bne     a4,a5,.L3397
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a4,4(s8)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        bne     a4,a5,.L3397
        lw      a5,0(s3)
        lw      s8,28(a5)
        beq     s8,zero,.L3399
        lw      a4,0(s8)
        sw      s8,24(a5)
.L3400:
        sw      zero,28(a5)
        li      a5,4
        bne     a4,a5,.L3402
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a4,4(s8)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        bne     a4,a5,.L3402
        lw      a1,0(sp)
        li      a0,4
        call    create_symbol_table
        lw      a5,4(sp)
        mv      a1,a0
        mv      a0,s3
        lw      a2,4(a5)
        call    parse_body
        beq     a0,zero,.L3721
        lw      s8,8(s10)
        beq     s8,zero,.L3512
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(sp)
        lw      a4,4(s8)
        sw      zero,4(a0)
        sw      a5,0(a0)
        beq     a4,zero,.L3746
        sw      a0,4(a4)
.L3408:
        sw      a0,4(s8)
        lw      s8,0(s3)
        lw      a0,28(s8)
        beq     a0,zero,.L3411
        lw      a4,0(a0)
.L3412:
        lw      a5,12(sp)
        bne     a4,a5,.L3474
.L3384:
        lui     a4,%hi(KEYWORD_ELIF)
        lw      a5,4(a0)
        lw      a4,%lo(KEYWORD_ELIF)(a4)
        bne     a5,a4,.L3747
        li      a0,16
        call    alloc_memory.constprop.0
        sw      a0,4(sp)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s8,0(s3)
        lw      a5,4(sp)
        sw      zero,0(a0)
        lw      a4,28(s8)
        sw      zero,4(a0)
        sw      a0,4(a5)
        sw      zero,8(a5)
        sw      zero,12(a5)
        bne     a4,zero,.L3748
        j       .L3386
.L3749:
        bne     a4,s11,.L3363
.L3362:
        mv      a0,s7
        call    get_token
        lbu     a3,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a3,zero,.L3749
        sw      zero,28(s7)
        li      a5,4
        beq     a4,a5,.L3750
.L3365:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lui     s11,%hi(stderr)
        lw      a0,%lo(stderr)(s11)
        lw      a2,0(a5)
        lui     a5,%hi(.LC191)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC191)
.L3718:
        addi    a1,s7,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s11)
        mv      a0,s8
        call    output_one_token.constprop.0
.L3721:
        li      s10,0
.L3474:
        sw      s10,0(s2)
        j       .L3422
.L3735:
        li      a5,3
        sw      a5,4(s2)
        li      a0,20
        call    alloc_memory.constprop.0
        mv      s10,a0
        sw      zero,0(a0)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s7,0(s3)
        sw      zero,0(a0)
        sw      zero,4(a0)
        lw      s8,28(s7)
        sw      a0,12(s10)
        li      s11,6
        beq     s8,zero,.L3424
        lw      a4,0(s8)
        sw      s8,24(s7)
.L3425:
        sw      zero,28(s7)
        li      a5,4
        bne     a4,a5,.L3427
.L3756:
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3427
        lw      s7,0(s3)
        li      s11,6
        lw      s8,28(s7)
        beq     s8,zero,.L3430
        sw      s8,24(s7)
.L3431:
        lw      a1,0(sp)
        sw      zero,28(s7)
        li      a0,4
        call    create_symbol_table
        lw      a5,0(s8)
        sw      a0,4(sp)
        li      a4,5
        beq     a5,a4,.L3751
        li      a4,4
        bne     a5,a4,.L3434
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        lw      a4,4(s8)
        beq     a4,a5,.L3442
.L3434:
        lw      a2,4(sp)
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        sw      a0,0(s10)
        beq     a0,zero,.L3752
        lw      s7,0(s3)
        sb      zero,16(s10)
        li      s11,6
        lw      s8,28(s7)
        beq     s8,zero,.L3444
.L3703:
        lw      a4,0(s8)
        sw      s8,24(s7)
.L3445:
        sw      zero,28(s7)
        li      a5,4
        beq     a4,a5,.L3753
.L3447:
        lw      a2,4(sp)
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        sw      a0,4(s10)
        beq     a0,zero,.L3754
        lw      s7,0(s3)
        li      s11,6
        lw      s8,28(s7)
        beq     s8,zero,.L3449
        lw      a4,0(s8)
        sw      s8,24(s7)
.L3450:
        sw      zero,28(s7)
        li      a5,4
        bne     a4,a5,.L3452
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        lw      a4,4(s8)
        beq     a4,a5,.L3442
.L3452:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC202)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC202)
        j       .L3718
.L3755:
        bne     a4,s11,.L3425
.L3424:
        mv      a0,s7
        call    get_token
        lbu     a3,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a3,zero,.L3755
        sw      zero,28(s7)
        li      a5,4
        beq     a4,a5,.L3756
.L3427:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC198)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC198)
        j       .L3718
.L3736:
        li      a5,4
        sw      a5,4(s2)
        li      a0,8
        call    alloc_memory.constprop.0
        mv      s10,a0
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s7,0(s3)
        sw      zero,0(a0)
        sw      zero,4(a0)
        lw      s8,28(s7)
        sw      a0,4(s10)
        li      s11,6
        beq     s8,zero,.L3469
        lw      a4,0(s8)
        sw      s8,24(s7)
.L3470:
        sw      zero,28(s7)
        li      a5,4
        bne     a4,a5,.L3472
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3472
        lw      s7,0(s3)
        li      s11,6
        lw      a4,28(s7)
        beq     a4,zero,.L3475
        sw      a4,24(s7)
.L3476:
        lw      a2,0(sp)
        sw      zero,28(s7)
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        lw      s7,0(s3)
        sw      a0,0(s10)
        li      s11,6
        lw      s8,28(s7)
        beq     s8,zero,.L3477
        lw      a4,0(s8)
        sw      s8,24(s7)
.L3478:
        sw      zero,28(s7)
        li      a5,4
        bne     a4,a5,.L3480
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3480
        lw      s7,0(s3)
        li      s11,6
        lw      s8,28(s7)
        beq     s8,zero,.L3483
        lw      a0,0(s8)
        sw      s8,24(s7)
.L3484:
        sw      zero,28(s7)
        li      a5,4
        bne     a0,a5,.L3486
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3486
        lw      a1,0(sp)
        call    create_symbol_table
        lw      a2,4(s10)
        mv      a1,a0
        j       .L3720
.L3757:
        bne     a4,s11,.L3470
.L3469:
        mv      a0,s7
        call    get_token
        lbu     a3,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a3,zero,.L3757
        j       .L3470
.L3737:
        lw      s7,0(s3)
        li      a4,7
        sw      a4,4(s2)
        lw      a0,28(s7)
        li      s11,6
        beq     a0,zero,.L3489
        lw      a4,0(a0)
        sw      a0,24(s7)
.L3490:
        sw      zero,28(s7)
        li      a5,4
        bne     a4,a5,.L3719
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a4,4(a0)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        bne     a4,a5,.L3719
        lw      a5,4(s2)
        sw      zero,0(s2)
        bne     a5,zero,.L3494
        j       .L3493
.L3758:
        bne     a4,s11,.L3490
.L3489:
        mv      a0,s7
        call    get_token
        lbu     a3,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        bne     a3,zero,.L3758
        j       .L3490
.L3759:
        lw      a4,0(a0)
        bne     a4,s11,.L3369
.L3368:
        mv      a0,s8
        call    get_token
        lbu     a4,32(s8)
        sw      a0,24(s8)
        bne     a4,zero,.L3759
        j       .L3369
.L3760:
        li      a5,6
        bne     a4,a5,.L3371
.L3370:
        mv      a0,s11
        call    get_token
        lbu     a3,32(s11)
        sw      a0,24(s11)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a3,zero,.L3760
        j       .L3371
.L3761:
        lw      a4,0(a0)
        bne     a4,s11,.L3431
.L3430:
        mv      a0,s7
        call    get_token
        lbu     a4,32(s7)
        sw      a0,24(s7)
        mv      s8,a0
        bne     a4,zero,.L3761
        j       .L3431
.L3472:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC206)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC206)
        j       .L3718
.L3762:
        lw      a4,0(a0)
        bne     a4,s11,.L3476
.L3475:
        mv      a0,s7
        call    get_token
        lbu     a4,32(s7)
        sw      a0,24(s7)
        bne     a4,zero,.L3762
        j       .L3476
.L3763:
        bne     a4,s11,.L3478
.L3477:
        mv      a0,s7
        call    get_token
        lbu     a3,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a3,zero,.L3763
        j       .L3478
.L3728:
        li      a0,1
        j       .L3713
.L3764:
        bne     a4,s11,.L3445
.L3444:
        mv      a0,s7
        call    get_token
        lbu     a3,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a3,zero,.L3764
        j       .L3445
.L3765:
        bne     a4,s11,.L3450
.L3449:
        mv      a0,s7
        call    get_token
        lbu     a3,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a3,zero,.L3765
        j       .L3450
.L3373:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC192)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC192)
        j       .L3718
.L3766:
        li      a5,6
        bne     a0,a5,.L3376
.L3375:
        mv      a0,s11
        call    get_token
        lbu     a4,32(s11)
        sw      a0,24(s11)
        mv      s8,a0
        lw      a0,0(a0)
        bne     a4,zero,.L3766
        j       .L3376
.L3480:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC207)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC207)
        j       .L3718
.L3767:
        bne     a0,s11,.L3484
.L3483:
        mv      a0,s7
        call    get_token
        lbu     a4,32(s7)
        sw      a0,24(s7)
        mv      s8,a0
        lw      a0,0(a0)
        bne     a4,zero,.L3767
        j       .L3484
.L3751:
        lui     a5,%hi(KEYWORD_VAR)
        lw      a5,%lo(KEYWORD_VAR)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3434
        mv      a1,a0
        li      a2,1
        mv      a0,s3
        call    parse_variable
        lw      a4,0(a0)
        beq     a4,zero,.L3435
        lw      a5,4(a0)
        beq     a4,a5,.L3436
.L3435:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC199)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC199)
        j       .L3718
.L3486:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC208)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC208)
        j       .L3718
.L3730:
        lui     s11,%hi(stderr)
        lui     s7,%hi(.LC98)
        j       .L3504
.L3753:
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3447
.L3442:
        lw      s7,0(s3)
        lw      s8,28(s7)
        beq     s8,zero,.L3453
        lw      a4,0(s8)
        sw      s8,24(s7)
.L3454:
        sw      zero,28(s7)
        li      a5,4
        bne     a4,a5,.L3456
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3456
.L3457:
        lw      s7,0(s3)
        lw      s8,28(s7)
        beq     s8,zero,.L3463
        lw      a0,0(s8)
        sw      s8,24(s7)
.L3464:
        sw      zero,28(s7)
        li      a5,4
        bne     a0,a5,.L3466
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        lw      a4,4(s8)
        bne     a4,a5,.L3466
        lw      a1,4(sp)
        call    create_symbol_table
        lw      a2,12(s10)
        mv      a1,a0
.L3720:
        mv      a0,s3
        call    parse_body
        snez    a5,a0
        neg     a5,a5
        and     s10,s10,a5
        sw      s10,0(s2)
        j       .L3422
.L3768:
        li      a5,6
        bne     a4,a5,.L3454
.L3453:
        mv      a0,s7
        call    get_token
        lbu     a3,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a3,zero,.L3768
        j       .L3454
.L3456:
        lw      a2,4(sp)
        li      a1,1
        mv      a0,s3
        call    parse_expression_prec
        sw      a0,8(s10)
        beq     a0,zero,.L3769
        lw      s7,0(s3)
        lw      s8,28(s7)
        beq     s8,zero,.L3459
        lw      a4,0(s8)
        sw      s8,24(s7)
.L3460:
        sw      zero,28(s7)
        li      a5,4
        bne     a4,a5,.L3462
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        lw      a4,4(s8)
        beq     a4,a5,.L3457
.L3462:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC204)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC204)
        j       .L3718
.L3770:
        li      a5,6
        bne     a4,a5,.L3460
.L3459:
        mv      a0,s7
        call    get_token
        lbu     a3,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a3,zero,.L3770
        j       .L3460
.L3378:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC193)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC193)
        j       .L3718
.L3771:
        li      a5,6
        bne     a0,a5,.L3464
.L3463:
        mv      a0,s7
        call    get_token
        lbu     a4,32(s7)
        sw      a0,24(s7)
        mv      s8,a0
        lw      a0,0(a0)
        bne     a4,zero,.L3771
        j       .L3464
.L3772:
        lw      a4,0(a0)
        bne     a4,s11,.L3388
.L3386:
        mv      a0,s8
        call    get_token
        lbu     a4,32(s8)
        sw      a0,24(s8)
        bne     a4,zero,.L3772
.L3388:
        lw      a4,0(s3)
        j       .L3387
.L3773:
        bne     a5,s11,.L3390
.L3389:
        mv      a0,a4
        sw      a4,8(sp)
        call    get_token
        lw      a4,8(sp)
        lw      a5,0(a0)
        mv      s8,a0
        lbu     a3,32(a4)
        sw      a0,24(a4)
        bne     a3,zero,.L3773
        j       .L3390
.L3774:
        bne     a4,s11,.L3395
.L3394:
        mv      a0,a5
        sw      a5,8(sp)
        call    get_token
        lw      a5,8(sp)
        lw      a4,0(a0)
        mv      s8,a0
        lbu     a3,32(a5)
        sw      a0,24(a5)
        bne     a3,zero,.L3774
        j       .L3395
.L3775:
        bne     a4,s11,.L3400
.L3399:
        mv      a0,a5
        sw      a5,8(sp)
        call    get_token
        lw      a5,8(sp)
        lw      a4,0(a0)
        mv      s8,a0
        lbu     a3,32(a5)
        sw      a0,24(a5)
        bne     a3,zero,.L3775
        j       .L3400
.L3776:
        bne     a4,s11,.L3412
.L3411:
        mv      a0,s8
        call    get_token
        lbu     a3,32(s8)
        sw      a0,28(s8)
        lw      a4,0(a0)
        bne     a3,zero,.L3776
        j       .L3412
.L3746:
        sw      a0,0(s8)
        j       .L3408
.L3466:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC205)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC205)
        j       .L3718
.L3754:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC201)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC201)
        j       .L3718
.L3752:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC200)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC200)
        j       .L3718
.L3506:
        lw      a4,4(a5)
        lw      s0,0(a5)
        sw      a4,0(s10)
        beq     a4,zero,.L3777
.L3511:
        li      a0,8
        call    alloc_memory.constprop.0
        li      a5,1
        sw      s0,0(a0)
        sw      a5,4(a0)
.L3512:
        call    list_append.part.0
.L3745:
        li      s11,6
        j       .L3382
.L3778:
        bne     a4,s11,.L3383
.L3382:
        mv      a0,s8
        call    get_token
        lbu     a3,32(s8)
        sw      a0,28(s8)
        lw      a4,0(a0)
        bne     a3,zero,.L3778
        j       .L3383
.L3392:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC194)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC194)
        j       .L3718
.L3769:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC203)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC203)
        j       .L3718
.L3436:
        lw      s7,0(s3)
        lw      a4,0(a4)
        li      a3,1
        lw      s8,28(s7)
        sb      a3,16(s10)
        sw      a4,0(s10)
        bne     s8,zero,.L3703
        li      s11,6
        j       .L3438
.L3779:
        bne     a4,s11,.L3445
.L3438:
        mv      a0,s7
        call    get_token
        lbu     a2,32(s7)
        sw      a0,24(s7)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a2,zero,.L3779
        j       .L3445
.L3402:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC196)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC196)
        j       .L3718
.L3397:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC195)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC195)
        j       .L3718
.L3777:
        sw      zero,4(s10)
        j       .L3511
.L3747:
        lui     a4,%hi(KEYWORD_ELSE)
        lw      a4,%lo(KEYWORD_ELSE)(a4)
        bne     a5,a4,.L3474
        lw      s11,0(s3)
        lw      a5,28(s11)
        mv      s8,s11
        beq     a5,zero,.L3415
        sw      a5,24(s11)
.L3416:
        sw      zero,28(s8)
        lw      s8,28(s11)
        beq     s8,zero,.L3417
        sw      s8,24(s11)
.L3418:
        lw      a0,0(s8)
        sw      zero,28(s11)
        li      a5,4
        bne     a0,a5,.L3420
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        lw      a4,4(s8)
        beq     a4,a5,.L3421
.L3420:
        lw      a5,8(s3)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lw      a2,0(a5)
        lui     s11,%hi(stderr)
        lui     a5,%hi(.LC197)
        lw      a0,%lo(stderr)(s11)
        lui     s7,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC197)
        j       .L3718
.L3780:
        lw      a4,0(a0)
        li      a5,6
        bne     a4,a5,.L3418
.L3417:
        mv      a0,s11
        call    get_token
        lbu     a4,32(s11)
        sw      a0,24(s11)
        mv      s8,a0
        bne     a4,zero,.L3780
        j       .L3418
.L3698:
        lw      a3,0(a0)
        bne     a3,a5,.L3716
.L3415:
        mv      a0,s11
        call    get_token
        lbu     a3,32(s11)
        sw      a0,24(s11)
        li      a5,6
        bne     a3,zero,.L3698
.L3716:
        lw      s11,0(s3)
        j       .L3416
.L3421:
        lw      a1,0(sp)
        call    create_symbol_table
        lw      a2,12(s10)
        mv      a1,a0
        j       .L3720
.LC211:
        .string "Expected identifier after 'import'"
.LC212:
        .string "/home/su2u4/code/TC/std/"
.LC213:
        .string "%s/%s.tc"
.LC214:
        .string "Expected 'from' after import name"
.LC215:
        .string "Expected string literal after 'from'"
.LC216:
        .string "%s/%s"
.LC217:
        .string "Expected ';' after import path"
.LC218:
        .string "Failed to import module"
.LC219:
        .string "Expected identifier after 'class'"
.LC220:
        .string "Expected '{' after class name"
.LC221:
        .string "Expected identifier or type after 'method'"
.LC222:
        .string "Expected identifier after method return type"
.LC223:
        .string "Expected '(' after method name"
.LC224:
        .string "Expected 'self' as the first parameter"
.LC225:
        .string "Expected ',' or ')' in parameter list"
.LC226:
        .string "Unexpected token in parameter list"
.LC227:
        .string "Expected identifier in parameter list"
.LC228:
        .string "Expected '{' to start method body"
.LC229:
        .string "Unexpected token in class body"
.LC230:
        .string "Expected identifier or type after 'func'"
.LC231:
        .string "Expected identifier after function return type"
.LC232:
        .string "Expected '(' after function name"
.LC233:
        .string "Expected '{' to start function body"
.LC234:
        .string "Unexpected token"
parse_code:
        addi    sp,sp,-96
        sw      s0,88(sp)
        mv      s0,a0
        li      a0,12
        sw      ra,92(sp)
        sw      s1,84(sp)
        sw      s2,80(sp)
        sw      s3,76(sp)
        sw      s11,44(sp)
        sw      s4,72(sp)
        sw      s5,68(sp)
        sw      s6,64(sp)
        sw      s7,60(sp)
        sw      s9,52(sp)
        sw      s10,48(sp)
        call    alloc_memory.constprop.0
        mv      s11,a0
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s2,0(s0)
        lw      a5,8(s0)
        sw      zero,0(a0)
        lw      s1,28(s2)
        sw      zero,4(a0)
        sw      a0,4(s11)
        sw      a5,0(s11)
        li      s3,6
        beq     s1,zero,.L3782
        sw      s1,24(s2)
.L3783:
        lui     a5,%hi(global_symbol_table)
        lw      a1,%lo(global_symbol_table)(a5)
        sw      zero,28(s2)
        li      a0,0
        call    create_symbol_table
        lui     a5,%hi(.LC98)
        addi    a5,a5,%lo(.LC98)
        lui     a4,%hi(.LC234)
        sw      a5,4(sp)
        lw      a5,0(s1)
        addi    a4,a4,%lo(.LC234)
        sw      a0,8(s11)
        sw      a4,0(sp)
        li      s10,7
        li      s9,6
        mv      s3,s11
        beq     a5,s10,.L4246
.L3970:
        li      a4,5
        beq     a5,a4,.L4247
.L3786:
        lw      a5,8(s0)
        lw      a4,12(s1)
        lw      a3,8(s1)
        lui     s2,%hi(stderr)
        lw      a2,0(a5)
        lw      a1,4(sp)
        lw      a0,%lo(stderr)(s2)
        lw      a5,0(sp)
        addi    a4,a4,1
        addi    a3,a3,1
        call    fprintf
        lw      a1,%lo(stderr)(s2)
        mv      a0,s1
        call    output_one_token.constprop.0
.L3838:
        lw      s2,0(s0)
        lw      s1,28(s2)
        beq     s1,zero,.L3967
        sw      s1,24(s2)
        sw      zero,28(s2)
.L4249:
        lw      a5,0(s1)
        bne     a5,s10,.L3970
.L4246:
        lw      ra,92(sp)
        lw      s0,88(sp)
        lw      s1,84(sp)
        lw      s2,80(sp)
        lw      s4,72(sp)
        lw      s5,68(sp)
        lw      s6,64(sp)
        lw      s7,60(sp)
        lw      s9,52(sp)
        lw      s10,48(sp)
        lw      s11,44(sp)
        mv      a0,s3
        lw      s3,76(sp)
        addi    sp,sp,96
        jr      ra
.L4248:
        lw      a5,0(a0)
        bne     a5,s9,.L4226
.L3967:
        mv      a0,s2
        call    get_token
        lbu     a5,32(s2)
        sw      a0,24(s2)
        bne     a5,zero,.L4248
.L4226:
        mv      s1,a0
        sw      zero,28(s2)
        j       .L4249
.L4250:
        lw      a5,0(a0)
        bne     a5,s3,.L4195
.L3782:
        mv      a0,s2
        call    get_token
        lbu     a5,32(s2)
        sw      a0,24(s2)
        bne     a5,zero,.L4250
.L4195:
        mv      s1,a0
        j       .L3783
.L4247:
        lui     a5,%hi(KEYWORD_IMPORT)
        lw      a4,%lo(KEYWORD_IMPORT)(a5)
        lw      a5,4(s1)
        beq     a5,a4,.L4251
        lui     a4,%hi(KEYWORD_CLASS)
        lw      a4,%lo(KEYWORD_CLASS)(a4)
        beq     a5,a4,.L4252
        lui     a4,%hi(KEYWORD_FUNC)
        lw      a4,%lo(KEYWORD_FUNC)(a4)
        bne     a5,a4,.L3786
        li      a0,16
        lw      s5,4(s3)
        lw      s4,8(s3)
        call    alloc_memory.constprop.0
        mv      s2,a0
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a0,12(s2)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s6,0(s0)
        sw      zero,0(a0)
        sw      zero,4(a0)
        lw      s1,28(s6)
        sw      a0,8(s2)
        sw      s2,16(s0)
        li      s7,6
        beq     s1,zero,.L3920
        lw      a5,0(s1)
        sw      s1,24(s6)
.L3921:
        sw      zero,28(s6)
        beq     a5,zero,.L3923
        li      a4,5
        bne     a5,a4,.L3924
        lui     a5,%hi(KEYWORD_INT)
        lw      a4,%lo(KEYWORD_INT)(a5)
        lw      a5,4(s1)
        beq     a5,a4,.L3923
        lui     a4,%hi(KEYWORD_FLOAT)
        lw      a4,%lo(KEYWORD_FLOAT)(a4)
        beq     a5,a4,.L3923
        lui     a4,%hi(KEYWORD_STRING)
        lw      a4,%lo(KEYWORD_STRING)(a4)
        beq     a5,a4,.L3923
        lui     a4,%hi(KEYWORD_BOOL)
        lw      a4,%lo(KEYWORD_BOOL)(a4)
        beq     a5,a4,.L3923
        lui     a4,%hi(KEYWORD_VOID)
        lw      a4,%lo(KEYWORD_VOID)(a4)
        beq     a5,a4,.L3923
        lui     a4,%hi(KEYWORD_POINTER)
        lw      a4,%lo(KEYWORD_POINTER)(a4)
        beq     a5,a4,.L3923
        lui     a4,%hi(KEYWORD_CONST)
        lw      a4,%lo(KEYWORD_CONST)(a4)
        bne     a5,a4,.L3924
.L3923:
        mv      a1,s4
        mv      a0,s0
        call    parse_type
        lw      s6,0(s0)
        sw      a0,4(s2)
        li      s7,6
        lw      s1,28(s6)
        beq     s1,zero,.L3926
        lw      a5,0(s1)
        sw      s1,24(s6)
.L3927:
        sw      zero,28(s6)
        bne     a5,zero,.L4253
        lw      a0,4(s1)
        lw      a1,4(s2)
        mv      a4,s4
        mv      a3,s2
        li      a2,2
        call    create_symbol
        lw      s1,0(s0)
        sw      a0,0(s2)
        li      s7,6
        lw      s6,28(s1)
        beq     s6,zero,.L3931
        lw      a5,0(s6)
        sw      s6,24(s1)
.L3932:
        sw      zero,28(s1)
        li      a4,4
        bne     a5,a4,.L3934
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        lw      a4,4(s6)
        bne     a4,a5,.L3934
        lw      s1,0(s0)
        li      s6,6
        lw      a6,28(s1)
        beq     a6,zero,.L3936
        sw      a6,24(s1)
.L3937:
        sw      zero,28(s1)
        mv      a1,s4
        li      a0,1
        sw      a6,8(sp)
        call    create_symbol_table
        lw      a6,8(sp)
        li      a4,4
        mv      s6,a0
        lw      a5,0(a6)
        beq     a5,a4,.L3939
        sw      s8,56(sp)
        lui     s7,%hi(KEYWORD_INT)
        lui     s8,%hi(KEYWORD_FLOAT)
        lui     s11,%hi(KEYWORD_STRING)
        li      s1,6
        sw      s4,12(sp)
        sw      a0,8(sp)
.L3956:
        beq     a5,zero,.L3940
        li      a4,5
        bne     a5,a4,.L4231
        lw      a5,4(a6)
        lw      a4,%lo(KEYWORD_INT)(s7)
        beq     a5,a4,.L3940
        lw      a4,%lo(KEYWORD_FLOAT)(s8)
        beq     a5,a4,.L3940
        lw      a4,%lo(KEYWORD_STRING)(s11)
        beq     a5,a4,.L3940
        lui     a4,%hi(KEYWORD_BOOL)
        lw      a4,%lo(KEYWORD_BOOL)(a4)
        beq     a5,a4,.L3940
        lui     a4,%hi(KEYWORD_VOID)
        lw      a4,%lo(KEYWORD_VOID)(a4)
        beq     a5,a4,.L3940
        lui     a4,%hi(KEYWORD_POINTER)
        lw      a4,%lo(KEYWORD_POINTER)(a4)
        beq     a5,a4,.L3940
        lui     a4,%hi(KEYWORD_CONST)
        lw      a4,%lo(KEYWORD_CONST)(a4)
        bne     a5,a4,.L4231
.L3940:
        lw      a1,12(sp)
        mv      a0,s0
        call    parse_type
        lw      s6,0(s0)
        mv      s4,a0
        lw      a0,28(s6)
        beq     a0,zero,.L3942
        lw      a4,0(a0)
        sw      a0,24(s6)
.L3943:
        sw      zero,28(s6)
        bne     a4,zero,.L4254
        lw      a0,4(a0)
        lw      a2,8(sp)
        lw      s6,8(s2)
        mv      a1,s4
        call    create_symbol.constprop.1
        mv      s4,a0
        beq     s6,zero,.L3830
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a4,4(s6)
        sw      s4,0(a0)
        sw      zero,4(a0)
        beq     a4,zero,.L4255
        sw      a0,4(a4)
.L3947:
        lw      s4,0(s0)
        sw      a0,4(s6)
        lw      a0,28(s4)
        beq     a0,zero,.L3948
        lw      a5,0(a0)
        sw      a0,24(s4)
.L3949:
        sw      zero,28(s4)
        li      a4,4
        beq     a5,a4,.L4256
.L4223:
        mv      a6,a0
.L3951:
        lw      a5,8(s0)
        lw      a4,12(a6)
        lw      a3,8(a6)
        lui     s1,%hi(stderr)
        lw      a0,%lo(stderr)(s1)
        lw      a2,0(a5)
        lui     a5,%hi(.LC225)
        sw      a6,8(sp)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC225)
.L4240:
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s1)
        lw      a0,8(sp)
        call    output_one_token.constprop.0
        lw      s8,56(sp)
.L3930:
        li      s2,0
.L3925:
        sw      zero,16(s0)
        li      a0,8
        call    alloc_memory.constprop.0
        sw      s2,0(a0)
        sw      zero,4(a0)
        mv      s1,a0
        beq     s5,zero,.L4233
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s5)
        sw      s1,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L4257
        sw      a0,4(a5)
        sw      a0,4(s5)
        j       .L3838
.L4258:
        bne     a5,s7,.L4218
.L3920:
        mv      a0,s6
        call    get_token
        lbu     a4,32(s6)
        sw      a0,24(s6)
        lw      a5,0(a0)
        bne     a4,zero,.L4258
.L4218:
        mv      s1,a0
        j       .L3921
.L4259:
        bne     a5,s7,.L4219
.L3926:
        mv      a0,s6
        call    get_token
        lbu     a4,32(s6)
        sw      a0,24(s6)
        lw      a5,0(a0)
        bne     a4,zero,.L4259
.L4219:
        mv      s1,a0
        j       .L3927
.L4260:
        bne     a5,s7,.L4220
.L3931:
        mv      a0,s1
        call    get_token
        lbu     a4,32(s1)
        sw      a0,24(s1)
        lw      a5,0(a0)
        bne     a4,zero,.L4260
.L4220:
        mv      s6,a0
        j       .L3932
.L3934:
        lw      a5,8(s0)
        lw      a4,12(s6)
        lw      a3,8(s6)
        lui     s1,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s1)
        lui     a5,%hi(.LC232)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC232)
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s1)
        mv      a0,s6
        call    output_one_token.constprop.0
        j       .L3930
.L4251:
        li      a0,8
        sw      s8,56(sp)
        lw      s6,4(s3)
        lw      s8,8(s3)
        call    alloc_memory.constprop.0
        lw      s2,0(s0)
        mv      s5,a0
        li      s4,6
        lw      s1,28(s2)
        beq     s1,zero,.L3788
        lw      a5,0(s1)
        sw      s1,24(s2)
.L3789:
        sw      zero,28(s2)
        bne     a5,zero,.L4261
        lw      s2,0(s0)
        lw      s7,4(s1)
        li      s1,6
        lw      s11,28(s2)
        beq     s11,zero,.L3793
        lw      a5,0(s11)
        sw      s11,24(s2)
        sw      zero,28(s2)
        li      a4,4
        beq     a5,a4,.L4262
.L3796:
        li      a4,5
        bne     a5,a4,.L3797
        lui     a5,%hi(KEYWORD_FROM)
        lw      a5,%lo(KEYWORD_FROM)(a5)
        lw      a4,4(s11)
        bne     a4,a5,.L3797
        lw      s1,0(s0)
        li      s2,6
        lw      s4,28(s1)
        beq     s4,zero,.L3801
        lw      a5,0(s4)
        sw      s4,24(s1)
.L3802:
        lw      a3,8(s0)
        sw      zero,28(s1)
        li      a4,3
        lw      s1,0(a3)
        bne     a5,a4,.L4263
        mv      a0,s1
        call    strlen
        mv      a1,a0
        li      a4,47
        li      a3,92
.L3807:
        beq     a1,zero,.L3972
        addi    a1,a1,-1
        add     a5,s1,a1
        lbu     a5,0(a5)
        beq     a5,a4,.L3806
        bne     a5,a3,.L3807
.L3806:
        mv      a0,s1
        li      a2,1
        call    create_string_check
        mv      a1,a0
.L3805:
        lw      a2,4(s4)
        lui     a0,%hi(.LC216)
        addi    a0,a0,%lo(.LC216)
        call    string_splice
        call    create_file
        lw      s1,0(s0)
        lw      a5,0(a0)
        li      s2,6
        lw      s11,28(s1)
        sw      a5,4(s5)
        beq     s11,zero,.L3808
        lw      a5,0(s11)
        sw      s11,24(s1)
.L3809:
        sw      zero,28(s1)
        li      a4,4
        bne     a5,a4,.L3811
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        lw      a4,4(s11)
        bne     a4,a5,.L3811
        lw      a0,4(s5)
.L3798:
        call    create_file
        lui     a5,%hi(parsed_files)
        lw      a5,%lo(parsed_files)(a5)
        mv      s2,a0
        beq     a5,zero,.L3814
        lw      s1,0(a5)
        li      s4,0
        beq     s1,zero,.L3814
        sw      s0,8(sp)
.L3816:
        lw      s0,0(s1)
        beq     s0,zero,.L3815
        lw      a4,0(s0)
        lw      a1,0(s2)
        lw      a0,0(a4)
        call    strcmp
        bne     a0,zero,.L3815
        mv      s4,s0
.L3815:
        lw      s1,4(s1)
        bne     s1,zero,.L3816
        lw      s0,8(sp)
        beq     s4,zero,.L3814
.L3818:
        lw      a3,8(s4)
        beq     a3,zero,.L3822
.L3826:
        lw      a5,8(a3)
        lw      a5,0(a5)
        beq     a5,zero,.L3823
.L3825:
        lw      s1,0(a5)
        lw      a4,0(s1)
        beq     s7,a4,.L3824
        lw      a5,4(a5)
        bne     a5,zero,.L3825
.L3823:
        lw      a3,0(a3)
        bne     a3,zero,.L3826
.L3822:
        lw      a5,8(s0)
        lw      a4,12(s11)
        lw      a3,8(s11)
        lui     s1,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s1)
        lui     a5,%hi(.LC218)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC218)
        addi    a1,a1,%lo(.LC98)
        sw      zero,0(s5)
        call    fprintf
        lw      a1,%lo(stderr)(s1)
        mv      a0,s11
        call    output_one_token.constprop.0
        mv      a4,s8
        mv      a0,s7
        li      a3,0
        li      a2,1
        li      a1,0
        call    create_symbol
        sw      a0,0(s5)
        j       .L3792
.L4264:
        bne     a5,s4,.L4196
.L3788:
        mv      a0,s2
        call    get_token
        lbu     a4,32(s2)
        sw      a0,24(s2)
        lw      a5,0(a0)
        bne     a4,zero,.L4264
.L4196:
        mv      s1,a0
        j       .L3789
.L4265:
        bne     a5,s1,.L4197
.L3793:
        mv      a0,s2
        call    get_token
        lbu     a4,32(s2)
        sw      a0,24(s2)
        lw      a5,0(a0)
        bne     a4,zero,.L4265
.L4197:
        sw      zero,28(s2)
        li      a4,4
        mv      s11,a0
        bne     a5,a4,.L3796
.L4262:
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        lw      a4,4(s11)
        beq     a4,a5,.L4266
.L3797:
        lw      a5,8(s0)
        lw      a4,12(s11)
        lw      a3,8(s11)
        lui     s1,%hi(stderr)
        lw      a0,%lo(stderr)(s1)
        lw      a2,0(a5)
        lui     a5,%hi(.LC214)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC214)
.L4234:
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s1)
        mv      a0,s11
        call    output_one_token.constprop.0
.L3800:
        li      s5,0
.L3792:
        li      a0,8
        call    alloc_memory.constprop.0
        li      a5,2
        sw      s5,0(a0)
        sw      a5,4(a0)
        mv      s1,a0
        beq     s6,zero,.L3830
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s6)
        sw      s1,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L4267
        sw      a0,4(a5)
.L3837:
        lw      s8,56(sp)
        sw      a0,4(s6)
        j       .L3838
.L4252:
        li      a0,12
        lw      s4,4(s3)
        lw      s6,8(s3)
        call    alloc_memory.constprop.0
        lw      s2,0(s0)
        sw      a0,20(s0)
        mv      s5,a0
        lw      s1,28(s2)
        li      s7,6
        beq     s1,zero,.L3840
        lw      a5,0(s1)
        sw      s1,24(s2)
.L3841:
        sw      zero,28(s2)
        bne     a5,zero,.L4268
        lw      a0,4(s1)
        mv      a4,s6
        mv      a3,s5
        li      a2,3
        li      a1,0
        call    create_symbol
        lw      s1,0(s0)
        sw      a0,0(s5)
        lw      s2,28(s1)
        beq     s2,zero,.L4269
        lw      s11,0(s2)
        sw      s2,24(s1)
.L3846:
        sw      zero,28(s1)
        li      a5,4
        bne     s11,a5,.L3848
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        lw      a4,4(s2)
        bne     a4,a5,.L3848
        mv      a1,s6
        li      a0,2
        sw      s8,56(sp)
        call    create_symbol_table
        sw      a0,16(sp)
        sw      a0,8(s5)
        li      a0,8
        call    alloc_memory.constprop.0
        lui     a4,%hi(.LC229)
        lui     a5,%hi(.LC98)
        sw      zero,0(a0)
        sw      zero,4(a0)
        addi    a4,a4,%lo(.LC229)
        addi    a5,a5,%lo(.LC98)
        sw      a0,4(s5)
        sw      a4,8(sp)
        sw      a5,12(sp)
        li      s1,6
        j       .L3850
.L3854:
        li      a5,5
        bne     a2,a5,.L3856
        lui     a5,%hi(KEYWORD_METHOD)
        lw      a4,%lo(KEYWORD_METHOD)(a5)
        lw      a5,4(s2)
        beq     a5,a4,.L4270
        lui     a4,%hi(KEYWORD_VAR)
        lw      a4,%lo(KEYWORD_VAR)(a4)
        beq     a5,a4,.L4271
.L3856:
        lw      a5,8(s0)
        lw      a4,12(s2)
        lw      a3,8(s2)
        lui     s6,%hi(stderr)
        lw      a2,0(a5)
        lw      a1,12(sp)
        lw      a0,%lo(stderr)(s6)
        lw      a5,8(sp)
        addi    a4,a4,1
        addi    a3,a3,1
        call    fprintf
        lw      a1,%lo(stderr)(s6)
        mv      a0,s2
        call    output_one_token.constprop.0
.L3850:
        lw      s6,0(s0)
        lw      s2,28(s6)
        beq     s2,zero,.L3851
        lw      a2,0(s2)
        sw      s2,24(s6)
.L3852:
        sw      zero,28(s6)
        bne     a2,s11,.L3854
        lui     a5,%hi(SYMBOL_R_BRACE)
        lw      a5,%lo(SYMBOL_R_BRACE)(a5)
        lw      a4,4(s2)
        bne     a4,a5,.L3856
        lw      s8,56(sp)
        j       .L3855
.L4272:
        bne     a5,s7,.L4201
.L3840:
        mv      a0,s2
        call    get_token
        lbu     a4,32(s2)
        sw      a0,24(s2)
        lw      a5,0(a0)
        bne     a4,zero,.L4272
.L4201:
        mv      s1,a0
        j       .L3841
.L3848:
        lw      a5,8(s0)
        lw      a4,12(s2)
        lw      a3,8(s2)
        lui     s1,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s1)
        lui     a5,%hi(.LC220)
        lui     a1,%hi(.LC98)
        addi    a1,a1,%lo(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC220)
        call    fprintf
        lw      a1,%lo(stderr)(s1)
        mv      a0,s2
        call    output_one_token.constprop.0
.L3844:
        li      s5,0
.L3855:
        sw      zero,20(s0)
        li      a0,8
        call    alloc_memory.constprop.0
        li      a5,1
        sw      s5,0(a0)
        sw      a5,4(a0)
        mv      s1,a0
        beq     s4,zero,.L4233
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s4)
        sw      s1,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L4273
        sw      a0,4(a5)
        sw      a0,4(s4)
        j       .L3838
.L4274:
        bne     a4,s1,.L3943
.L3942:
        mv      a0,s6
        call    get_token
        lbu     a3,32(s6)
        sw      a0,24(s6)
        lw      a4,0(a0)
        bne     a3,zero,.L4274
        j       .L3943
.L4275:
        bne     a5,s1,.L3949
.L3948:
        mv      a0,s4
        call    get_token
        lbu     a4,32(s4)
        sw      a0,24(s4)
        lw      a5,0(a0)
        bne     a4,zero,.L4275
        sw      zero,28(s4)
        li      a4,4
        bne     a5,a4,.L4223
.L4256:
        lui     a5,%hi(SYMBOL_COMMA)
        lw      a5,%lo(SYMBOL_COMMA)(a5)
        lw      a4,4(a0)
        beq     a4,a5,.L4276
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        lw      s6,8(sp)
        mv      a6,a0
        bne     a4,a5,.L3951
        lw      s8,56(sp)
.L3958:
        lw      s4,0(s0)
        li      s7,6
        lw      s1,28(s4)
        beq     s1,zero,.L3960
        lw      a0,0(s1)
        sw      s1,24(s4)
.L3961:
        sw      zero,28(s4)
        li      a5,4
        bne     a0,a5,.L3963
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        lw      a4,4(s1)
        bne     a4,a5,.L3963
        mv      a1,s6
        call    create_symbol_table
        lw      a2,12(s2)
        mv      a1,a0
        mv      a0,s0
        call    parse_body
        snez    a5,a0
        neg     a5,a5
        and     s2,s2,a5
        j       .L3925
.L4277:
        lw      a5,0(a0)
        bne     a5,s6,.L4221
.L3936:
        mv      a0,s1
        call    get_token
        lbu     a5,32(s1)
        sw      a0,24(s1)
        bne     a5,zero,.L4277
.L4221:
        mv      a6,a0
        j       .L3937
.L4278:
        bne     a2,s1,.L4204
.L3851:
        mv      a0,s6
        call    get_token
        lbu     a5,32(s6)
        sw      a0,24(s6)
        lw      a2,0(a0)
        bne     a5,zero,.L4278
.L4204:
        mv      s2,a0
        j       .L3852
.L4279:
        bne     a5,s2,.L4198
.L3801:
        mv      a0,s1
        call    get_token
        lbu     a4,32(s1)
        sw      a0,24(s1)
        lw      a5,0(a0)
        bne     a4,zero,.L4279
.L4198:
        mv      s4,a0
        j       .L3802
.L4280:
        bne     a5,s2,.L4199
.L3808:
        mv      a0,s1
        call    get_token
        lbu     a4,32(s1)
        sw      a0,24(s1)
        lw      a5,0(a0)
        bne     a4,zero,.L4280
.L4199:
        mv      s11,a0
        j       .L3809
.L4255:
        sw      a0,0(s6)
        j       .L3947
.L4270:
        li      a0,20
        lw      s7,4(s5)
        call    alloc_memory.constprop.0
        mv      s2,a0
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a0,12(s2)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      s6,0(s0)
        sw      zero,0(a0)
        sw      zero,4(a0)
        lw      a6,28(s6)
        sw      a0,8(s2)
        sw      s2,12(s0)
        li      s8,6
        beq     a6,zero,.L3858
        lw      a5,0(a6)
        sw      a6,24(s6)
.L3859:
        sw      zero,28(s6)
        beq     a5,zero,.L3861
        li      a4,5
        bne     a5,a4,.L3862
        lui     a5,%hi(KEYWORD_INT)
        lw      a4,%lo(KEYWORD_INT)(a5)
        lw      a5,4(a6)
        beq     a5,a4,.L3861
        lui     a4,%hi(KEYWORD_FLOAT)
        lw      a4,%lo(KEYWORD_FLOAT)(a4)
        beq     a5,a4,.L3861
        lui     a4,%hi(KEYWORD_STRING)
        lw      a4,%lo(KEYWORD_STRING)(a4)
        beq     a5,a4,.L3861
        lui     a4,%hi(KEYWORD_BOOL)
        lw      a4,%lo(KEYWORD_BOOL)(a4)
        beq     a5,a4,.L3861
        lui     a4,%hi(KEYWORD_VOID)
        lw      a4,%lo(KEYWORD_VOID)(a4)
        beq     a5,a4,.L3861
        lui     a4,%hi(KEYWORD_POINTER)
        lw      a4,%lo(KEYWORD_POINTER)(a4)
        beq     a5,a4,.L3861
        lui     a4,%hi(KEYWORD_CONST)
        lw      a4,%lo(KEYWORD_CONST)(a4)
        beq     a5,a4,.L3861
.L3862:
        lw      a5,8(s0)
        lw      a4,12(a6)
        lw      a3,8(a6)
        lw      a2,0(a5)
        lui     s2,%hi(stderr)
        lui     a5,%hi(.LC221)
        lw      a0,%lo(stderr)(s2)
        sw      a6,20(sp)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC221)
        j       .L4236
.L4281:
        bne     a5,s8,.L4205
.L3858:
        mv      a0,s6
        call    get_token
        lbu     a4,32(s6)
        sw      a0,24(s6)
        lw      a5,0(a0)
        bne     a4,zero,.L4281
.L4205:
        mv      a6,a0
        j       .L3859
.L3861:
        lw      a1,16(sp)
        mv      a0,s0
        li      s8,6
        call    parse_type
        lw      s6,0(s0)
        sw      a0,4(s2)
        lw      a6,28(s6)
        beq     a6,zero,.L3864
        lw      a5,0(a6)
        sw      a6,24(s6)
.L3865:
        sw      zero,28(s6)
        andi    a5,a5,-9
        bne     a5,zero,.L4282
        lw      a0,4(a6)
        lw      a4,16(sp)
        lw      a1,4(s2)
        mv      a3,s2
        li      a2,4
        sw      a6,20(sp)
        call    create_symbol
        lw      a6,20(sp)
        sw      a0,0(s2)
        li      a5,8
        lw      a4,0(a6)
        bne     a4,a5,.L3869
        lui     a5,%hi(.LANCHOR1)
        addi    a5,a5,%lo(.LANCHOR1)
        lw      a3,4(a6)
        addi    a2,a5,80
        j       .L3871
.L4284:
        addi    a5,a5,4
        beq     a2,a5,.L4283
.L3871:
        lw      a4,0(a5)
        bne     a3,a4,.L4284
        li      a5,1
        sb      a5,16(s2)
.L3869:
        lw      s6,0(s0)
        li      s8,6
        lw      a6,28(s6)
        beq     a6,zero,.L3873
        lw      a5,0(a6)
        sw      a6,24(s6)
.L3874:
        sw      zero,28(s6)
        bne     a5,s11,.L3876
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        lw      a4,4(a6)
        bne     a4,a5,.L3876
        lw      s8,0(s0)
        lw      s6,28(s8)
        beq     s6,zero,.L3878
        sw      s6,24(s8)
.L3879:
        lw      a1,16(sp)
        sw      zero,28(s8)
        li      a0,3
        call    create_symbol_table
        lw      a4,0(s6)
        sw      a0,20(sp)
        li      a5,5
        bne     a4,a5,.L3881
        lui     a5,%hi(KEYWORD_SELF)
        lw      a5,%lo(KEYWORD_SELF)(a5)
        lw      a0,4(s6)
        bne     a0,a5,.L3881
        lw      a5,20(s0)
        lw      a2,20(sp)
        lw      s8,8(s2)
        lw      a1,0(a5)
        call    create_symbol.constprop.1
        mv      s6,a0
        beq     s8,zero,.L3830
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s8)
        sw      s6,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L4285
        sw      a0,4(a5)
.L3884:
        lw      s6,0(s0)
        sw      a0,4(s8)
        lw      s8,28(s6)
        beq     s8,zero,.L3885
        lw      a4,0(s8)
        sw      s8,24(s6)
.L3886:
        sw      zero,28(s6)
        li      a5,4
        beq     a4,a5,.L4286
.L3888:
        lw      a5,8(s0)
        lw      a4,12(s8)
        lw      a3,8(s8)
        lui     s2,%hi(stderr)
        lw      a0,%lo(stderr)(s2)
        lw      a2,0(a5)
        lui     a5,%hi(.LC225)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC225)
.L4237:
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s2)
        mv      a0,s8
        call    output_one_token.constprop.0
.L3868:
        li      s2,0
.L3863:
        sw      zero,12(s0)
        li      a0,8
        call    alloc_memory.constprop.0
        sw      s2,0(a0)
        sw      zero,4(a0)
        mv      s6,a0
        beq     s7,zero,.L3830
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s7)
        sw      s6,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L4287
        sw      a0,4(a5)
        sw      a0,4(s7)
        j       .L3850
.L4288:
        bne     a5,s8,.L4206
.L3864:
        mv      a0,s6
        call    get_token
        lbu     a4,32(s6)
        sw      a0,24(s6)
        lw      a5,0(a0)
        bne     a4,zero,.L4288
.L4206:
        mv      a6,a0
        j       .L3865
.L4289:
        bne     a5,s8,.L4207
.L3873:
        mv      a0,s6
        call    get_token
        lbu     a4,32(s6)
        sw      a0,24(s6)
        lw      a5,0(a0)
        bne     a4,zero,.L4289
.L4207:
        mv      a6,a0
        j       .L3874
.L4290:
        lw      a5,0(a0)
        li      a4,6
        bne     a5,a4,.L4208
.L3878:
        mv      a0,s8
        call    get_token
        lbu     a5,32(s8)
        sw      a0,24(s8)
        bne     a5,zero,.L4290
.L4208:
        mv      s6,a0
        j       .L3879
.L4257:
        sw      a0,0(s5)
        sw      a0,4(s5)
        j       .L3838
.L4267:
        sw      a0,0(s6)
        j       .L3837
.L4276:
        lw      s4,0(s0)
        li      s6,6
        lw      a6,28(s4)
        beq     a6,zero,.L3953
        lw      a5,0(a6)
        sw      a6,24(s4)
.L3954:
        sw      zero,28(s4)
        li      a4,4
        bne     a5,a4,.L3956
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      s6,8(sp)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        lw      a4,4(a6)
        lw      s8,56(sp)
.L3957:
        beq     a4,a5,.L3958
.L3959:
        lw      a5,8(s0)
        lw      a4,12(a6)
        lw      a3,8(a6)
        lui     s1,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s1)
        lui     a5,%hi(.LC226)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC226)
        addi    a1,a1,%lo(.LC98)
        sw      a6,8(sp)
        call    fprintf
        lw      a1,%lo(stderr)(s1)
        lw      a0,8(sp)
        call    output_one_token.constprop.0
        j       .L3930
.L4291:
        bne     a5,s6,.L3954
.L3953:
        mv      a0,s4
        call    get_token
        lbu     a3,32(s4)
        sw      a0,24(s4)
        lw      a5,0(a0)
        mv      a6,a0
        bne     a3,zero,.L4291
        j       .L3954
.L4271:
        lw      a1,16(sp)
        mv      a0,s0
        call    parse_variable
        lw      a5,0(a0)
        mv      s6,a0
        beq     a5,zero,.L3850
        li      s7,1
        sw      s0,20(sp)
.L3917:
        lw      a4,4(a5)
        lw      s0,0(a5)
        lw      s2,4(s5)
        sw      a4,0(s6)
        beq     a4,zero,.L4292
.L3914:
        li      a0,8
        call    alloc_memory.constprop.0
        sw      s7,4(a0)
        sw      s0,0(a0)
        mv      s8,a0
        beq     s2,zero,.L3830
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s2)
        sw      s8,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L4293
        sw      a0,4(a5)
        lw      a5,0(s6)
        sw      a0,4(s2)
        bne     a5,zero,.L3917
.L4235:
        lw      s0,20(sp)
        j       .L3850
.L4293:
        sw      a0,0(s2)
        lw      a5,0(s6)
        sw      a0,4(s2)
        beq     a5,zero,.L4235
        lw      a4,4(a5)
        lw      s0,0(a5)
        lw      s2,4(s5)
        sw      a4,0(s6)
        bne     a4,zero,.L3914
.L4292:
        sw      zero,4(s6)
        j       .L3914
.L4273:
        sw      a0,0(s4)
        sw      a0,4(s4)
        j       .L3838
.L4269:
        sw      s8,56(sp)
        li      s8,6
        j       .L3845
.L4294:
        bne     s11,s8,.L4202
.L3845:
        mv      a0,s1
        call    get_token
        lbu     a5,32(s1)
        sw      a0,24(s1)
        lw      s11,0(a0)
        bne     a5,zero,.L4294
.L4202:
        lw      s8,56(sp)
        mv      s2,a0
        j       .L3846
.L4253:
        lw      a5,8(s0)
        lw      a4,12(s1)
        lw      a3,8(s1)
        lui     s2,%hi(stderr)
        lw      a0,%lo(stderr)(s2)
        lw      a2,0(a5)
        lui     a5,%hi(.LC231)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC231)
.L4239:
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s2)
        mv      a0,s1
        call    output_one_token.constprop.0
        j       .L3930
.L3876:
        lw      a5,8(s0)
        lw      a4,12(a6)
        lw      a3,8(a6)
        lui     s2,%hi(stderr)
        lw      a0,%lo(stderr)(s2)
        lw      a2,0(a5)
        lui     a5,%hi(.LC223)
        sw      a6,20(sp)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC223)
.L4236:
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s2)
        lw      a0,20(sp)
        call    output_one_token.constprop.0
        j       .L3868
.L3924:
        lw      a5,8(s0)
        lw      a4,12(s1)
        lw      a3,8(s1)
        lw      a2,0(a5)
        lui     s2,%hi(stderr)
        lui     a5,%hi(.LC230)
        lw      a0,%lo(stderr)(s2)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC230)
        j       .L4239
.L4261:
        lw      a5,8(s0)
        lw      a4,12(s1)
        lw      a3,8(s1)
        lui     s2,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s2)
        lui     a5,%hi(.LC211)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC211)
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s2)
        mv      a0,s1
        call    output_one_token.constprop.0
        j       .L3800
.L4268:
        lw      a5,8(s0)
        lw      a4,12(s1)
        lw      a3,8(s1)
        lui     s2,%hi(stderr)
        lw      a2,0(a5)
        lw      a0,%lo(stderr)(s2)
        lui     a5,%hi(.LC219)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC219)
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s2)
        mv      a0,s1
        call    output_one_token.constprop.0
        j       .L3844
.L4287:
        sw      a0,0(s7)
        sw      a0,4(s7)
        j       .L3850
.L3939:
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        lw      a4,4(a6)
        j       .L3957
.L3824:
        lw      s2,8(s8)
        sw      s1,0(s5)
        beq     s2,zero,.L3830
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s2)
        sw      s1,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L4295
        sw      a0,4(a5)
.L3828:
        lw      a5,0(s5)
        sw      a0,4(s2)
        li      a3,3
        lw      a4,8(a5)
        beq     a4,a3,.L4296
        li      a3,2
        bne     a4,a3,.L3792
        lw      s4,16(a5)
        lw      s1,4(s3)
        li      a0,8
        call    alloc_memory.constprop.0
        sw      s4,0(a0)
        sw      zero,4(a0)
        mv      s2,a0
        beq     s1,zero,.L3830
.L4243:
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s1)
        sw      s2,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L4297
        sw      a0,4(a5)
        sw      a0,4(s1)
        j       .L3792
.L3811:
        lw      a5,8(s0)
        lw      a4,12(s11)
        lw      a3,8(s11)
        lw      a2,0(a5)
        lui     s1,%hi(stderr)
        lui     a5,%hi(.LC217)
        lw      a0,%lo(stderr)(s1)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC217)
        j       .L4234
.L4298:
        li      a5,6
        bne     a4,a5,.L3886
.L3885:
        mv      a0,s6
        call    get_token
        lbu     a5,32(s6)
        sw      a0,24(s6)
        lw      a4,0(a0)
        mv      s8,a0
        bne     a5,zero,.L4298
        j       .L3886
.L4299:
        bne     a0,s7,.L3961
.L3960:
        mv      a0,s4
        call    get_token
        lbu     a5,32(s4)
        sw      a0,24(s4)
        mv      s1,a0
        lw      a0,0(a0)
        bne     a5,zero,.L4299
        j       .L3961
.L4266:
        lui     a1,%hi(.LC212)
        lui     a0,%hi(.LC213)
        addi    a1,a1,%lo(.LC212)
        mv      a2,s7
        addi    a0,a0,%lo(.LC213)
        call    string_splice
        call    create_file
        lw      a0,0(a0)
        sw      a0,4(s5)
        j       .L3798
.L4295:
        sw      a0,0(s2)
        j       .L3828
.L4254:
        lw      a5,8(s0)
        lw      a4,12(a0)
        lw      a3,8(a0)
        lw      a2,0(a5)
        lui     s1,%hi(stderr)
        lui     a5,%hi(.LC227)
        sw      a0,8(sp)
        lui     a1,%hi(.LC98)
        lw      a0,%lo(stderr)(s1)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC227)
        j       .L4240
.L4263:
        lw      a4,12(s4)
        lw      a3,8(s4)
        lui     s2,%hi(stderr)
        lw      a0,%lo(stderr)(s2)
        lui     a5,%hi(.LC215)
        lui     a1,%hi(.LC98)
        mv      a2,s1
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC215)
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s2)
        mv      a0,s4
        call    output_one_token.constprop.0
        j       .L3800
.L3972:
        lui     a1,%hi(.LC151)
        addi    a1,a1,%lo(.LC151)
        j       .L3805
.L3881:
        lw      a5,8(s0)
        lw      a4,12(s6)
        lw      a3,8(s6)
        lui     s2,%hi(stderr)
        lw      a0,%lo(stderr)(s2)
        lw      a2,0(a5)
        lui     a5,%hi(.LC224)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC224)
.L4238:
        addi    a1,a1,%lo(.LC98)
        call    fprintf
        lw      a1,%lo(stderr)(s2)
        mv      a0,s6
        call    output_one_token.constprop.0
        j       .L3868
.L4282:
        lw      a5,8(s0)
        lw      a4,12(a6)
        lw      a3,8(a6)
        lw      a2,0(a5)
        lui     s2,%hi(stderr)
        lui     a5,%hi(.LC222)
        lw      a0,%lo(stderr)(s2)
        sw      a6,20(sp)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC222)
        j       .L4236
.L3814:
        li      a0,36
        call    alloc_memory.constprop.0
        mv      s1,a0
        addi    a1,s1,16
        sw      s2,0(a0)
        mv      a0,s2
        call    read_source_code
        li      a5,1
        sb      a5,32(s1)
        sw      a0,20(s1)
        sw      zero,4(s1)
        sw      zero,8(s1)
        sw      zero,12(s1)
        sw      zero,24(s1)
        sw      zero,28(s1)
        li      a0,24
        call    alloc_memory.constprop.0
        mv      s2,a0
        sw      s1,0(a0)
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,0(s1)
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a5,8(s2)
        sw      a0,4(s2)
        mv      a0,s2
        call    parse_code
        lui     a5,%hi(parsed_files)
        lw      s1,%lo(parsed_files)(a5)
        mv      s4,a0
        beq     s1,zero,.L3830
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a5,4(s1)
        sw      s4,0(a0)
        sw      zero,4(a0)
        beq     a5,zero,.L4300
        sw      a0,4(a5)
        sw      a0,4(s1)
        j       .L3818
.L4296:
        lw      s4,16(a5)
        li      a0,8
        lw      s1,4(s3)
        call    alloc_memory.constprop.0
        li      a5,1
        sw      s4,0(a0)
        sw      a5,4(a0)
        mv      s2,a0
        bne     s1,zero,.L4243
.L3830:
        call    list_append.part.0
.L3963:
        lw      a5,8(s0)
        lw      a4,12(s1)
        lw      a3,8(s1)
        lw      a2,0(a5)
        lui     s2,%hi(stderr)
        lui     a5,%hi(.LC233)
        lw      a0,%lo(stderr)(s2)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC233)
        j       .L4239
.L4285:
        sw      a0,0(s8)
        j       .L3884
.L4286:
        lui     a5,%hi(SYMBOL_R_PAREN)
        sw      a5,28(sp)
        li      s6,6
        mv      a0,s8
        sw      s3,24(sp)
.L3889:
        lw      a4,28(sp)
        lw      a5,4(a0)
        lw      a4,%lo(SYMBOL_R_PAREN)(a4)
        beq     a5,a4,.L4301
        lui     a4,%hi(SYMBOL_COMMA)
        lw      a4,%lo(SYMBOL_COMMA)(a4)
        beq     a4,a5,.L4302
.L4216:
        lw      s3,24(sp)
        mv      s8,a0
        j       .L3888
.L4302:
        lw      s3,0(s0)
        li      s8,6
        lw      a6,28(s3)
        beq     a6,zero,.L3890
        lw      a5,0(a6)
        sw      a6,24(s3)
.L3891:
        sw      zero,28(s3)
        beq     a5,zero,.L3894
        li      a4,5
        bne     a5,a4,.L3895
        lui     a4,%hi(KEYWORD_INT)
        lw      a5,4(a6)
        lw      a4,%lo(KEYWORD_INT)(a4)
        beq     a5,a4,.L3894
        lui     a4,%hi(KEYWORD_FLOAT)
        lw      a4,%lo(KEYWORD_FLOAT)(a4)
        beq     a5,a4,.L3894
        lui     a4,%hi(KEYWORD_STRING)
        lw      a4,%lo(KEYWORD_STRING)(a4)
        beq     a5,a4,.L3894
        lui     a4,%hi(KEYWORD_BOOL)
        lw      a4,%lo(KEYWORD_BOOL)(a4)
        beq     a5,a4,.L3894
        lui     a4,%hi(KEYWORD_VOID)
        lw      a4,%lo(KEYWORD_VOID)(a4)
        beq     a5,a4,.L3894
        lui     a4,%hi(KEYWORD_POINTER)
        lw      a4,%lo(KEYWORD_POINTER)(a4)
        beq     a5,a4,.L3894
        lui     a4,%hi(KEYWORD_CONST)
        lw      a4,%lo(KEYWORD_CONST)(a4)
        bne     a5,a4,.L3895
.L3894:
        lw      a1,16(sp)
        mv      a0,s0
        call    parse_type
        lw      s8,0(s0)
        mv      a1,a0
        lw      a0,28(s8)
        beq     a0,zero,.L4212
        lw      a5,0(a0)
        sw      a0,24(s8)
.L3897:
        sw      zero,28(s8)
        bne     a5,zero,.L4303
        lw      a0,4(a0)
        lw      a2,20(sp)
        lw      s3,8(s2)
        call    create_symbol.constprop.1
        mv      s8,a0
        beq     s3,zero,.L3830
        li      a0,8
        call    alloc_memory.constprop.0
        lw      a4,4(s3)
        sw      s8,0(a0)
        sw      zero,4(a0)
        beq     a4,zero,.L4304
        sw      a0,4(a4)
.L3901:
        lw      s8,0(s0)
        sw      a0,4(s3)
        lw      a0,28(s8)
        beq     a0,zero,.L3902
        lw      a5,0(a0)
        sw      a0,24(s8)
.L3903:
        sw      zero,28(s8)
        bne     a5,s11,.L4216
        j       .L3889
.L4305:
        bne     a5,s6,.L3903
.L3902:
        mv      a0,s8
        call    get_token
        lbu     a4,32(s8)
        sw      a0,24(s8)
        lw      a5,0(a0)
        bne     a4,zero,.L4305
        j       .L3903
.L4306:
        bne     a5,s8,.L3891
.L3890:
        mv      a0,s3
        call    get_token
        lbu     a4,32(s3)
        sw      a0,24(s3)
        lw      a5,0(a0)
        mv      a6,a0
        bne     a4,zero,.L4306
        j       .L3891
.L4212:
        mv      s3,a1
        j       .L3896
.L4307:
        bne     a5,s6,.L4213
.L3896:
        mv      a0,s8
        call    get_token
        lbu     a4,32(s8)
        sw      a0,24(s8)
        lw      a5,0(a0)
        bne     a4,zero,.L4307
.L4213:
        mv      a1,s3
        j       .L3897
.L4304:
        sw      a0,0(s3)
        j       .L3901
.L4283:
        lw      a5,8(s0)
        lw      a4,12(a6)
        lw      a3,8(a6)
        lw      a2,0(a5)
        lui     s2,%hi(stderr)
        lui     a5,%hi(.LC95)
        lw      a0,%lo(stderr)(s2)
        sw      a6,20(sp)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC95)
        j       .L4236
.L4231:
        lw      s8,56(sp)
        j       .L3959
.L4303:
        lw      a5,8(s0)
        lw      a4,12(a0)
        lw      a3,8(a0)
        lw      a2,0(a5)
        lui     s2,%hi(stderr)
        lui     a5,%hi(.LC227)
        mv      s8,a0
        lw      s3,24(sp)
        lw      a0,%lo(stderr)(s2)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC227)
        j       .L4237
.L4297:
        sw      a0,0(s1)
        sw      a0,4(s1)
        j       .L3792
.L4300:
        sw      a0,0(s1)
        sw      a0,4(s1)
        j       .L3818
.L3895:
        lw      a5,8(s0)
        lw      a4,12(a6)
        lw      a3,8(a6)
        lw      a2,0(a5)
        lui     s2,%hi(stderr)
        lui     a5,%hi(.LC226)
        lw      s3,24(sp)
        lw      a0,%lo(stderr)(s2)
        sw      a6,20(sp)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC226)
        j       .L4236
.L4301:
        lw      s8,0(s0)
        lw      s3,24(sp)
        lw      s6,28(s8)
        beq     s6,zero,.L3906
        sw      s6,24(s8)
.L3907:
        lw      a0,0(s6)
        sw      zero,28(s8)
        li      a5,4
        bne     a0,a5,.L3909
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a4,4(s6)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        bne     a4,a5,.L3909
        lw      a1,20(sp)
        call    create_symbol_table
        lw      a2,12(s2)
        mv      a1,a0
        mv      a0,s0
        call    parse_body
        snez    a5,a0
        neg     a5,a5
        and     s2,s2,a5
        j       .L3863
.L4308:
        lw      a4,0(a0)
        li      a5,6
        bne     a4,a5,.L3907
.L3906:
        mv      a0,s8
        call    get_token
        lbu     a4,32(s8)
        sw      a0,24(s8)
        mv      s6,a0
        bne     a4,zero,.L4308
        j       .L3907
.L3909:
        lw      a5,8(s0)
        lw      a4,12(s6)
        lw      a3,8(s6)
        lw      a2,0(a5)
        lui     s2,%hi(stderr)
        lui     a5,%hi(.LC228)
        lw      a0,%lo(stderr)(s2)
        lui     a1,%hi(.LC98)
        addi    a4,a4,1
        addi    a3,a3,1
        addi    a5,a5,%lo(.LC228)
        j       .L4238
.L4233:
        sw      s8,56(sp)
        j       .L3830
init_symbol:
        addi    sp,sp,-16
        li      a0,16
        sw      ra,12(sp)
        sw      s0,8(sp)
        sw      s1,4(sp)
        call    alloc_memory.constprop.0
        mv      s1,a0
        sw      zero,0(a0)
        sw      zero,4(a0)
        li      a0,8
        call    alloc_memory.constprop.0
        sw      zero,0(a0)
        sw      zero,4(a0)
        sw      a0,8(s1)
        li      a0,8
        call    alloc_memory.constprop.0
        lui     a4,%hi(KEYWORD_INT)
        mv      a5,a0
        lw      a0,%lo(KEYWORD_INT)(a4)
        sw      zero,4(a5)
        sw      zero,0(a5)
        lui     s0,%hi(global_symbol_table)
        sw      a5,12(s1)
        mv      a2,s1
        li      a1,4
        sw      s1,%lo(global_symbol_table)(s0)
        call    create_symbol.constprop.0
        lui     a5,%hi(KEYWORD_FLOAT)
        mv      a4,a0
        lw      a2,%lo(global_symbol_table)(s0)
        lw      a0,%lo(KEYWORD_FLOAT)(a5)
        li      a1,4
        lui     a5,%hi(symbol_int)
        sw      a4,%lo(symbol_int)(a5)
        call    create_symbol.constprop.0
        lui     a5,%hi(KEYWORD_STRING)
        mv      a4,a0
        lw      a2,%lo(global_symbol_table)(s0)
        lw      a0,%lo(KEYWORD_STRING)(a5)
        li      a1,4
        lui     a5,%hi(symbol_float)
        sw      a4,%lo(symbol_float)(a5)
        call    create_symbol.constprop.0
        lui     a5,%hi(KEYWORD_BOOL)
        mv      a4,a0
        lw      a2,%lo(global_symbol_table)(s0)
        lw      a0,%lo(KEYWORD_BOOL)(a5)
        li      a1,1
        lui     a5,%hi(symbol_string)
        sw      a4,%lo(symbol_string)(a5)
        call    create_symbol.constprop.0
        lui     a5,%hi(KEYWORD_VOID)
        mv      a4,a0
        lw      a2,%lo(global_symbol_table)(s0)
        lw      a0,%lo(KEYWORD_VOID)(a5)
        li      a1,1
        lui     a5,%hi(symbol_bool)
        sw      a4,%lo(symbol_bool)(a5)
        call    create_symbol.constprop.0
        lui     a5,%hi(KEYWORD_POINTER)
        mv      a4,a0
        lw      a2,%lo(global_symbol_table)(s0)
        lw      a0,%lo(KEYWORD_POINTER)(a5)
        li      a1,4
        lui     a5,%hi(symbol_void)
        sw      a4,%lo(symbol_void)(a5)
        call    create_symbol.constprop.0
        lui     a5,%hi(KEYWORD_CONST)
        mv      a4,a0
        lw      a2,%lo(global_symbol_table)(s0)
        lw      a0,%lo(KEYWORD_CONST)(a5)
        li      a1,4
        lui     a5,%hi(symbol_pointer)
        sw      a4,%lo(symbol_pointer)(a5)
        call    create_symbol.constprop.0
        lw      ra,12(sp)
        lw      s0,8(sp)
        lui     a5,%hi(symbol_const)
        sw      a0,%lo(symbol_const)(a5)
        lw      s1,4(sp)
        addi    sp,sp,16
        jr      ra
.LC235:
        .string "Usage: %s <source_file> [output_file] [options]\n"
.LC236:
        .string "Options:"
.LC237:
        .string "  -o  Output compile result"
.LC238:
        .string "  -i  Output IR"
.LC239:
        .string "  -a  Output AST"
.LC240:
        .string "  -l  Output tokens"
.LC241:
        .string "  -s  Output symbol table"
.LC242:
        .string "  -h  Show this help message"
.LC243:
        .string "[Error] Unexpected argument: %s\n"
.LC244:
        .string "[Error] No source file provided\n"
.LC245:
        .string ".ast"
.LC246:
        .string "[Error] Failed to open AST output file\n"
.LC247:
        .string "\n%s\n"
.LC248:
        .string ".sym"
.LC249:
        .string "[Error] Failed to open symbol table output file\n"
main:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s2,32(sp)
        sw      s3,28(sp)
        sw      s8,8(sp)
        mv      s3,a0
        mv      s8,a1
        sw      s1,36(sp)
        call    init
        call    init_symbol
        li      a0,12
        call    alloc_memory.constprop.0
        sb      zero,0(a0)
        sb      zero,1(a0)
        sb      zero,2(a0)
        sb      zero,3(a0)
        sb      zero,4(a0)
        sb      zero,5(a0)
        sb      zero,6(a0)
        sb      zero,7(a0)
        sb      zero,8(a0)
        sb      zero,9(a0)
        sb      zero,10(a0)
        sb      zero,11(a0)
        li      s2,1
        mv      s0,a0
        ble     s3,s2,.L4312
        sw      s5,20(sp)
        sw      s6,16(sp)
        lui     s5,%hi(.LC243)
        lui     s6,%hi(.L4316)
        sw      s4,24(sp)
        sw      s7,12(sp)
        sw      s9,4(sp)
        addi    s5,s5,%lo(.LC243)
        addi    s6,s6,%lo(.L4316)
        addi    s9,s8,4
        li      s4,45
        lui     s7,%hi(stderr)
        j       .L4324
.L4313:
        lw      a5,0(s0)
        beq     a5,zero,.L4350
        lw      a5,4(s0)
        beq     a5,zero,.L4351
        lw      a0,%lo(stderr)(s7)
        mv      a2,s1
        mv      a1,s5
        call    fprintf
.L4314:
        addi    s2,s2,1
        addi    s9,s9,4
        beq     s3,s2,.L4352
.L4324:
        lw      s1,0(s9)
        lbu     a5,0(s1)
        bne     a5,s4,.L4313
        lbu     a5,1(s1)
        li      a4,18
        addi    a5,a5,-97
        andi    a5,a5,0xff
        bgtu    a5,a4,.L4314
        slli    a5,a5,2
        add     a5,a5,s6
        lw      a5,0(a5)
        jr      a5
.L4316:
        .word   .L4321
        .word   .L4314
        .word   .L4314
        .word   .L4314
        .word   .L4314
        .word   .L4314
        .word   .L4314
        .word   .L4320
        .word   .L4319
        .word   .L4314
        .word   .L4314
        .word   .L4318
        .word   .L4314
        .word   .L4314
        .word   .L4317
        .word   .L4314
        .word   .L4314
        .word   .L4314
        .word   .L4315
.L4351:
        mv      a0,s1
        call    strlen
        mv      a1,a0
        li      a2,1
        mv      a0,s1
        call    create_string_check
        call    create_file
        sw      a0,4(s0)
        addi    s2,s2,1
        addi    s9,s9,4
        bne     s3,s2,.L4324
.L4352:
        lw      s4,24(sp)
        lw      s5,20(sp)
        lw      s6,16(sp)
        lw      s7,12(sp)
        lw      s9,4(sp)
.L4312:
        lw      a5,0(s0)
        beq     a5,zero,.L4353
        lw      a4,4(s0)
        beq     a4,zero,.L4354
.L4326:
        lw      a5,8(s0)
        bne     a5,zero,.L4355
.L4330:
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        lw      s2,32(sp)
        lw      s3,28(sp)
        lw      s8,8(sp)
        li      a0,0
        addi    sp,sp,48
        jr      ra
.L4350:
        mv      a0,s1
        call    strlen
        mv      a1,a0
        li      a2,1
        mv      a0,s1
        call    create_string_check
        call    create_file
        sw      a0,0(s0)
        j       .L4314
.L4315:
        lw      a5,8(s0)
        ori     a5,a5,16
        sw      a5,8(s0)
        j       .L4314
.L4317:
        lw      a5,8(s0)
        ori     a5,a5,1
        sw      a5,8(s0)
        j       .L4314
.L4318:
        lw      a5,8(s0)
        ori     a5,a5,8
        sw      a5,8(s0)
        j       .L4314
.L4319:
        lw      a5,8(s0)
        ori     a5,a5,2
        sw      a5,8(s0)
        j       .L4314
.L4320:
        lw      a1,0(s8)
        lui     a0,%hi(.LC235)
        addi    a0,a0,%lo(.LC235)
        call    printf
        lui     a0,%hi(.LC236)
        addi    a0,a0,%lo(.LC236)
        call    puts
        lui     a0,%hi(.LC237)
        addi    a0,a0,%lo(.LC237)
        call    puts
        lui     a0,%hi(.LC238)
        addi    a0,a0,%lo(.LC238)
        call    puts
        lui     a0,%hi(.LC239)
        addi    a0,a0,%lo(.LC239)
        call    puts
        lui     a0,%hi(.LC240)
        addi    a0,a0,%lo(.LC240)
        call    puts
        lui     a0,%hi(.LC241)
        addi    a0,a0,%lo(.LC241)
        call    puts
        lui     a0,%hi(.LC242)
        addi    a0,a0,%lo(.LC242)
        call    puts
        li      a0,0
        call    exit
.L4321:
        lw      a5,8(s0)
        ori     a5,a5,4
        sw      a5,8(s0)
        j       .L4314
.L4355:
        lw      a0,0(s0)
        call    create_lexer
        lw      a5,8(s0)
        mv      s1,a0
        andi    a4,a5,8
        beq     a4,zero,.L4328
        li      a0,36
        call    alloc_memory.constprop.0
        mv      a1,s1
        li      a2,36
        call    memcpy
        lw      a1,4(s0)
        call    output_tokens
        lw      a5,8(s0)
.L4328:
        andi    a4,a5,4
        beq     a4,zero,.L4327
        mv      a0,s1
        call    create_parser
        call    parse_code
        call    analyzer
        mv      s1,a0
        beq     a0,zero,.L4349
        lui     a5,%hi(parsed_files)
        lw      a0,%lo(parsed_files)(a5)
        mv      a1,s1
        call    list_append
        lw      a0,4(s0)
        lui     a1,%hi(.LC245)
        addi    a1,a1,%lo(.LC245)
        call    change_extension
        lui     a1,%hi(.LC172)
        addi    a1,a1,%lo(.LC172)
        call    fopen
        mv      s2,a0
        beq     a0,zero,.L4356
        mv      a1,s2
        mv      a0,s1
        call    print_ast
        call    get_info
        lui     a1,%hi(.LC247)
        mv      a2,a0
        addi    a1,a1,%lo(.LC247)
        mv      a0,s2
        call    fprintf
        mv      a0,s2
        call    fclose
.L4349:
        lw      a5,8(s0)
.L4327:
        andi    a5,a5,16
        beq     a5,zero,.L4330
        lw      a0,4(s0)
        lui     a1,%hi(.LC248)
        addi    a1,a1,%lo(.LC248)
        call    change_extension
        lui     a1,%hi(.LC172)
        addi    a1,a1,%lo(.LC172)
        call    fopen
        mv      s0,a0
        beq     a0,zero,.L4357
        lui     a5,%hi(global_symbol_table)
        lw      a0,%lo(global_symbol_table)(a5)
        mv      a1,s0
        call    print_symbol_table_recursive.constprop.0
        call    get_info
        lui     a1,%hi(.LC247)
        mv      a2,a0
        addi    a1,a1,%lo(.LC247)
        mv      a0,s0
        call    fprintf
        mv      a0,s0
        call    fclose
        j       .L4330
.L4354:
        lw      a0,0(a5)
        call    create_file
        sw      a0,4(s0)
        j       .L4326
.L4356:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC246)
        addi    a0,a0,%lo(.LC246)
        li      a2,39
        li      a1,1
        sw      s4,24(sp)
        sw      s5,20(sp)
        sw      s6,16(sp)
        sw      s7,12(sp)
        sw      s9,4(sp)
        call    fwrite
        li      a0,1
        call    exit
.L4353:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC244)
        addi    a0,a0,%lo(.LC244)
        li      a2,32
        li      a1,1
        sw      s4,24(sp)
        sw      s5,20(sp)
        sw      s6,16(sp)
        sw      s7,12(sp)
        sw      s9,4(sp)
        call    fwrite
        li      a0,1
        call    exit
.L4357:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lui     a0,%hi(.LC249)
        addi    a0,a0,%lo(.LC249)
        li      a2,48
        li      a1,1
        sw      s4,24(sp)
        sw      s5,20(sp)
        sw      s6,16(sp)
        sw      s7,12(sp)
        sw      s9,4(sp)
        call    fwrite
        li      a0,1
        call    exit
search_symbol:
        beq     a0,zero,.L4359
        bne     a2,zero,.L4387
        mv      a6,a0
.L4366:
        lw      a5,8(a6)
        lw      a3,0(a5)
        beq     a3,zero,.L4361
.L4365:
        lw      a5,0(a3)
        lw      a2,0(a5)
        beq     a1,a2,.L4435
.L4362:
        lw      a3,4(a3)
        bne     a3,zero,.L4365
.L4361:
        lw      a6,0(a6)
        bne     a6,zero,.L4366
.L4433:
        beq     a4,zero,.L4389
        mv      a6,a0
        li      a7,2
        li      t1,0
        beq     a0,zero,.L4422
.L4378:
        lw      a5,8(a6)
        lw      a3,0(a5)
        beq     a3,zero,.L4374
.L4377:
        lw      a5,0(a3)
        lw      a2,0(a5)
        beq     a1,a2,.L4436
.L4375:
        lw      a3,4(a3)
        bne     a3,zero,.L4377
.L4374:
        lw      a6,0(a6)
        bne     a6,zero,.L4378
        li      a7,1
        seqz    t1,a4
.L4422:
        addi    a5,a7,-1
        seqz    a5,a5
        and     a5,a5,t1
        bne     a5,zero,.L4389
        addi    a7,a7,1
        li      a5,3
        bne     a7,a5,.L4437
.L4389:
        li      a5,0
.L4358:
        mv      a0,a5
        ret
.L4387:
        mv      t1,a0
.L4360:
        lw      a5,8(t1)
        lw      a6,0(a5)
        bne     a6,zero,.L4369
        j       .L4367
.L4372:
        lw      a6,4(a6)
        beq     a6,zero,.L4367
.L4369:
        lw      a5,0(a6)
        lw      a7,0(a5)
        bne     a1,a7,.L4372
        lw      a7,8(a5)
        bne     a3,a7,.L4372
        beq     a4,zero,.L4358
        lw      a7,4(a5)
        bne     a4,a7,.L4372
        j       .L4358
.L4435:
        beq     a4,zero,.L4358
.L4364:
        lw      a2,4(a5)
        beq     a4,a2,.L4358
        lw      a3,4(a3)
        beq     a3,zero,.L4361
        lw      a5,0(a3)
        lw      a2,0(a5)
        bne     a1,a2,.L4362
        j       .L4364
.L4437:
        beq     a0,zero,.L4422
        li      a5,2
        mv      a6,a0
        bne     a7,a5,.L4378
.L4382:
        lw      a5,8(a6)
        lw      a3,0(a5)
        bne     a3,zero,.L4381
        j       .L4380
.L4438:
        lw      a3,4(a3)
        beq     a3,zero,.L4380
.L4381:
        lw      a5,0(a3)
        lw      a2,0(a5)
        bne     a2,a1,.L4438
        mv      a0,a5
        ret
.L4436:
        beq     a4,zero,.L4358
.L4376:
        lw      a2,4(a5)
        beq     a4,a2,.L4358
        lw      a3,4(a3)
        beq     a3,zero,.L4374
        lw      a5,0(a3)
        lw      a2,0(a5)
        bne     a1,a2,.L4375
        j       .L4376
.L4380:
        lw      a6,0(a6)
        bne     a6,zero,.L4382
        j       .L4422
.L4367:
        lw      t1,0(t1)
        bne     t1,zero,.L4360
.L4359:
        beq     a2,zero,.L4433
        li      a7,0
        seqz    t1,a4
        j       .L4422
.LC250:
        .string "+"
.LC251:
        .string "-"
.LC252:
        .string "*"
.LC253:
        .string "/"
.LC254:
        .string "%"
.LC255:
        .string "="
.LC256:
        .string "=="
.LC257:
        .string "!="
.LC258:
        .string "<"
.LC259:
        .string ">"
.LC260:
        .string "<="
.LC261:
        .string ">="
.LC262:
        .string "+="
.LC263:
        .string "-="
.LC264:
        .string "*="
.LC265:
        .string "/="
.LC266:
        .string "%="
.LC267:
        .string "&&"
.LC268:
        .string "||"
.LC269:
        .string "!"
.LC270:
        .string "(none)"
        .set    .LANCHOR1,. + 0
specialList:
        .zero   80
keywordList:
        .zero   96
symbolList:
        .zero   120
        .set    .LANCHOR0,. + 0
CSWTCH.709:
        .word   .LC250
        .word   .LC251
        .word   .LC252
        .word   .LC253
        .word   .LC254
        .word   .LC255
        .word   .LC256
        .word   .LC257
        .word   .LC258
        .word   .LC259
        .word   .LC260
        .word   .LC261
        .word   .LC262
        .word   .LC263
        .word   .LC264
        .word   .LC265
        .word   .LC266
        .word   .LC267
        .word   .LC268
        .word   .LC251
        .word   .LC269
        .word   .LC270
symbol_count.0:
        .zero   4
parsed_files:
        .zero   4
symbol_const:
        .zero   4
symbol_pointer:
        .zero   4
symbol_void:
        .zero   4
symbol_bool:
        .zero   4
symbol_string:
        .zero   4
symbol_float:
        .zero   4
symbol_int:
        .zero   4
global_symbol_table:
        .zero   4
SPECIAL_NEG:
        .zero   4
SPECIAL_NOT:
        .zero   4
SPECIAL_OR:
        .zero   4
SPECIAL_AND:
        .zero   4
SPECIAL_LE:
        .zero   4
SPECIAL_GT:
        .zero   4
SPECIAL_GE:
        .zero   4
SPECIAL_LT:
        .zero   4
SPECIAL_NE:
        .zero   4
SPECIAL_EQ:
        .zero   4
SPECIAL_MOD:
        .zero   4
SPECIAL_DIV:
        .zero   4
SPECIAL_MUL:
        .zero   4
SPECIAL_SUB:
        .zero   4
SPECIAL_ADD:
        .zero   4
SPECIAL_TO_BOOL:
        .zero   4
SPECIAL_TO_STRING:
        .zero   4
SPECIAL_TO_FLOAT:
        .zero   4
SPECIAL_TO_INT:
        .zero   4
SPECIAL_INIT:
        .zero   4
SYMBOL_OR:
        .zero   4
SYMBOL_AND:
        .zero   4
SYMBOL_MOD_ASSIGN:
        .zero   4
SYMBOL_DIV_ASSIGN:
        .zero   4
SYMBOL_MUL_ASSIGN:
        .zero   4
SYMBOL_SUB_ASSIGN:
        .zero   4
SYMBOL_ADD_ASSIGN:
        .zero   4
SYMBOL_GE:
        .zero   4
SYMBOL_LE:
        .zero   4
SYMBOL_NE:
        .zero   4
SYMBOL_EQ:
        .zero   4
SYMBOL_ASSIGN:
        .zero   4
SYMBOL_GT:
        .zero   4
SYMBOL_LT:
        .zero   4
SYMBOL_MOD:
        .zero   4
SYMBOL_DIV:
        .zero   4
SYMBOL_MUL:
        .zero   4
SYMBOL_SUB:
        .zero   4
SYMBOL_ADD:
        .zero   4
SYMBOL_UNDERLINE:
        .zero   4
SYMBOL_SEMICOLON:
        .zero   4
SYMBOL_R_BRACKET:
        .zero   4
SYMBOL_L_BRACKET:
        .zero   4
SYMBOL_DOT:
        .zero   4
SYMBOL_NOT:
        .zero   4
SYMBOL_COMMA:
        .zero   4
SYMBOL_R_BRACE:
        .zero   4
SYMBOL_L_BRACE:
        .zero   4
SYMBOL_R_PAREN:
        .zero   4
SYMBOL_L_PAREN:
        .zero   4
KEYWORD_CONST:
        .zero   4
KEYWORD_POINTER:
        .zero   4
KEYWORD_VAR:
        .zero   4
KEYWORD_VOID:
        .zero   4
KEYWORD_BOOL:
        .zero   4
KEYWORD_STRING:
        .zero   4
KEYWORD_FLOAT:
        .zero   4
KEYWORD_INT:
        .zero   4
KEYWORD_CONTINUE:
        .zero   4
KEYWORD_BREAK:
        .zero   4
KEYWORD_RETURN:
        .zero   4
KEYWORD_FALSE:
        .zero   4
KEYWORD_TRUE:
        .zero   4
KEYWORD_FOR:
        .zero   4
KEYWORD_WHILE:
        .zero   4
KEYWORD_ELSE:
        .zero   4
KEYWORD_ELIF:
        .zero   4
KEYWORD_IF:
        .zero   4
KEYWORD_SELF:
        .zero   4
KEYWORD_METHOD:
        .zero   4
KEYWORD_CLASS:
        .zero   4
KEYWORD_FUNC:
        .zero   4
KEYWORD_FROM:
        .zero   4
KEYWORD_IMPORT:
        .zero   4
string_table:
        .zero   4
string_count:
        .zero   4
malloc_allocated:
        .zero   4
struct_memory:
        .zero   4
string_memory:
        .zero   4
file:
        .zero   4
return_type:
        .zero   4
loop_depth:
        .zero   4
has_error:
        .zero   1
