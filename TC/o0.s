analyzer:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    file_full_path
        mv      a4,a0
        lui     a5,%hi(file)
        sw      a4,%lo(file)(a5)
        lui     a5,%hi(has_error)
        sb      zero,%lo(has_error)(a5)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        lw      a5,12(a5)
        sw      a5,-20(s0)
        j       .L2
.L8:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L3
.L6:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L4
.L5:
        li      a1,0
        lw      a0,-28(s0)
        call    fill_symbol_offset
        sw      zero,-28(s0)
.L4:
        lw      a5,-28(s0)
        bne     a5,zero,.L5
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L3:
        lw      a5,-24(s0)
        bne     a5,zero,.L6
        sw      zero,-20(s0)
.L2:
        lw      a5,-20(s0)
        beq     a5,zero,.L7
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L8
.L7:
        lw      a5,-52(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L9
        lw      a5,-52(s0)
        lw      a5,4(a5)
        lw      a5,0(a5)
        beq     a5,zero,.L9
        lw      a5,-52(s0)
        lw      a5,4(a5)
        sw      a5,-32(s0)
        j       .L10
.L18:
        lw      a5,-32(s0)
        lw      a5,0(a5)
        sw      a5,-36(s0)
        j       .L11
.L17:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-40(s0)
        j       .L12
.L16:
        lw      a5,-40(s0)
        lw      a5,4(a5)
        li      a4,2
        beq     a5,a4,.L13
        li      a4,2
        bgtu    a5,a4,.L14
        beq     a5,zero,.L15
        li      a4,1
        bne     a5,a4,.L14
        lw      a5,-40(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_class
        j       .L14
.L15:
        lw      a5,-40(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_function
        j       .L14
.L13:
        lw      a5,-40(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_import
        nop
.L14:
        sw      zero,-40(s0)
.L12:
        lw      a5,-40(s0)
        bne     a5,zero,.L16
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-36(s0)
.L11:
        lw      a5,-36(s0)
        bne     a5,zero,.L17
        sw      zero,-32(s0)
.L10:
        lw      a5,-32(s0)
        beq     a5,zero,.L9
        lw      a5,-32(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L18
.L9:
        lui     a5,%hi(has_error)
        lbu     a5,%lo(has_error)(a5)
        beq     a5,zero,.L19
        li      a5,0
        j       .L20
.L19:
        lw      a5,-52(s0)
.L20:
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        addi    sp,sp,64
        jr      ra
get_type_size:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,3
        bne     a4,a5,.L22
        li      a5,4
        j       .L23
.L22:
        lw      a5,-20(s0)
        lw      a5,16(a5)
.L23:
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
fill_symbol_offset:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        lw      a5,-56(s0)
        sw      a5,-20(s0)
        lw      a5,-52(s0)
        lw      a4,4(a5)
        li      a5,2
        beq     a4,a5,.L25
        lw      a5,-52(s0)
        lw      a4,4(a5)
        li      a5,1
        beq     a4,a5,.L25
        lw      a5,-52(s0)
        lw      a4,4(a5)
        li      a5,3
        bne     a4,a5,.L26
.L25:
        sw      zero,-20(s0)
.L26:
        lw      a5,-52(s0)
        lw      a5,8(a5)
        sw      a5,-24(s0)
        j       .L27
.L38:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L28
.L36:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        sw      a5,-32(s0)
        j       .L29
.L35:
        lw      a5,-32(s0)
        lw      a4,8(a5)
        li      a5,1
        beq     a4,a5,.L30
        lw      a5,-32(s0)
        lw      a4,8(a5)
        li      a5,6
        beq     a4,a5,.L30
        lw      a5,-32(s0)
        lw      a4,8(a5)
        li      a5,5
        bne     a4,a5,.L46
.L30:
        lw      a5,-32(s0)
        lw      a4,-20(s0)
        sw      a4,16(a5)
        lw      a5,-32(s0)
        lw      a5,4(a5)
        lw      a5,8(a5)
        lw      a5,-32(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    get_type_size
        mv      a4,a0
        lw      a5,-20(s0)
        add     a5,a5,a4
        sw      a5,-20(s0)
        j       .L31
.L46:
        nop
.L31:
        sw      zero,-32(s0)
.L29:
        lw      a5,-32(s0)
        bne     a5,zero,.L35
        lw      a5,-28(s0)
        lw      a5,4(a5)
        sw      a5,-28(s0)
.L28:
        lw      a5,-28(s0)
        bne     a5,zero,.L36
        sw      zero,-24(s0)
.L27:
        lw      a5,-24(s0)
        beq     a5,zero,.L37
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L38
.L37:
        lw      a5,-52(s0)
        lw      a5,12(a5)
        sw      a5,-36(s0)
        j       .L39
.L45:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-40(s0)
        j       .L40
.L43:
        lw      a5,-40(s0)
        lw      a5,0(a5)
        sw      a5,-44(s0)
        j       .L41
.L42:
        lw      a1,-20(s0)
        lw      a0,-44(s0)
        call    fill_symbol_offset
        sw      zero,-44(s0)
.L41:
        lw      a5,-44(s0)
        bne     a5,zero,.L42
        lw      a5,-40(s0)
        lw      a5,4(a5)
        sw      a5,-40(s0)
.L40:
        lw      a5,-40(s0)
        bne     a5,zero,.L43
        sw      zero,-36(s0)
.L39:
        lw      a5,-36(s0)
        beq     a5,zero,.L47
        lw      a5,-36(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L45
.L47:
        nop
        lw      ra,60(sp)
        lw      s0,56(sp)
        addi    sp,sp,64
        jr      ra
is_number_type:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lui     a5,%hi(symbol_int)
        lw      a5,%lo(symbol_int)(a5)
        lw      a4,-20(s0)
        beq     a4,a5,.L49
        lui     a5,%hi(symbol_float)
        lw      a5,%lo(symbol_float)(a5)
        lw      a4,-20(s0)
        beq     a4,a5,.L49
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L50
.L49:
        li      a5,1
        j       .L51
.L50:
        li      a5,0
.L51:
        andi    a5,a5,1
        andi    a5,a5,0xff
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
types_compatible:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        lw      a5,-24(s0)
        beq     a5,zero,.L54
        lw      a5,-20(s0)
        bne     a5,zero,.L55
.L54:
        li      a5,0
        j       .L56
.L55:
        lw      a4,-20(s0)
        lw      a5,-24(s0)
        bne     a4,a5,.L57
        lw      a5,-20(s0)
        j       .L56
.L57:
        lw      a0,-20(s0)
        call    is_number_type
        mv      a5,a0
        beq     a5,zero,.L58
        lw      a0,-24(s0)
        call    is_number_type
        mv      a5,a0
        beq     a5,zero,.L58
        lui     a5,%hi(symbol_float)
        lw      a5,%lo(symbol_float)(a5)
        lw      a4,-20(s0)
        beq     a4,a5,.L59
        lui     a5,%hi(symbol_float)
        lw      a5,%lo(symbol_float)(a5)
        lw      a4,-24(s0)
        bne     a4,a5,.L60
.L59:
        lui     a5,%hi(symbol_float)
        lw      a5,%lo(symbol_float)(a5)
        j       .L56
.L60:
        lui     a5,%hi(symbol_int)
        lw      a5,%lo(symbol_int)(a5)
        lw      a4,-20(s0)
        beq     a4,a5,.L61
        lui     a5,%hi(symbol_int)
        lw      a5,%lo(symbol_int)(a5)
        lw      a4,-24(s0)
        bne     a4,a5,.L62
.L61:
        lui     a5,%hi(symbol_int)
        lw      a5,%lo(symbol_int)(a5)
        j       .L56
.L62:
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        j       .L56
.L58:
        li      a5,0
.L56:
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
find_method:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        lw      a4,-24(s0)
        li      a5,21
        beq     a4,a5,.L64
        lw      a4,-24(s0)
        li      a5,21
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,20
        beq     a4,a5,.L66
        lw      a4,-24(s0)
        li      a5,20
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,19
        beq     a4,a5,.L67
        lw      a4,-24(s0)
        li      a5,19
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,18
        beq     a4,a5,.L68
        lw      a4,-24(s0)
        li      a5,18
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,17
        beq     a4,a5,.L69
        lw      a4,-24(s0)
        li      a5,17
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,16
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,12
        bgeu    a4,a5,.L64
        lw      a4,-24(s0)
        li      a5,11
        beq     a4,a5,.L70
        lw      a4,-24(s0)
        li      a5,11
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,10
        beq     a4,a5,.L71
        lw      a4,-24(s0)
        li      a5,10
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,9
        beq     a4,a5,.L72
        lw      a4,-24(s0)
        li      a5,9
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,8
        beq     a4,a5,.L73
        lw      a4,-24(s0)
        li      a5,8
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,7
        beq     a4,a5,.L74
        lw      a4,-24(s0)
        li      a5,7
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,6
        beq     a4,a5,.L75
        lw      a4,-24(s0)
        li      a5,6
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,5
        beq     a4,a5,.L64
        lw      a4,-24(s0)
        li      a5,5
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,4
        beq     a4,a5,.L76
        lw      a4,-24(s0)
        li      a5,4
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,3
        beq     a4,a5,.L77
        lw      a4,-24(s0)
        li      a5,3
        bgtu    a4,a5,.L65
        lw      a4,-24(s0)
        li      a5,2
        beq     a4,a5,.L78
        lw      a4,-24(s0)
        li      a5,2
        bgtu    a4,a5,.L65
        lw      a5,-24(s0)
        beq     a5,zero,.L79
        lw      a4,-24(s0)
        li      a5,1
        beq     a4,a5,.L80
        j       .L65
.L79:
        lui     a5,%hi(SPECIAL_ADD)
        lw      a5,%lo(SPECIAL_ADD)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L80:
        lui     a5,%hi(SPECIAL_SUB)
        lw      a5,%lo(SPECIAL_SUB)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L78:
        lui     a5,%hi(SPECIAL_MUL)
        lw      a5,%lo(SPECIAL_MUL)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L77:
        lui     a5,%hi(SPECIAL_DIV)
        lw      a5,%lo(SPECIAL_DIV)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L76:
        lui     a5,%hi(SPECIAL_MOD)
        lw      a5,%lo(SPECIAL_MOD)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L64:
        li      a5,0
        j       .L81
.L75:
        lui     a5,%hi(SPECIAL_EQ)
        lw      a5,%lo(SPECIAL_EQ)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L74:
        lui     a5,%hi(SPECIAL_NE)
        lw      a5,%lo(SPECIAL_NE)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L73:
        lui     a5,%hi(SPECIAL_LT)
        lw      a5,%lo(SPECIAL_LT)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L70:
        lui     a5,%hi(SPECIAL_GE)
        lw      a5,%lo(SPECIAL_GE)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L72:
        lui     a5,%hi(SPECIAL_GT)
        lw      a5,%lo(SPECIAL_GT)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L71:
        lui     a5,%hi(SPECIAL_LE)
        lw      a5,%lo(SPECIAL_LE)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L69:
        lui     a5,%hi(SPECIAL_AND)
        lw      a5,%lo(SPECIAL_AND)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L68:
        lui     a5,%hi(SPECIAL_OR)
        lw      a5,%lo(SPECIAL_OR)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L66:
        lui     a5,%hi(SPECIAL_NOT)
        lw      a5,%lo(SPECIAL_NOT)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L67:
        lui     a5,%hi(SPECIAL_NEG)
        lw      a5,%lo(SPECIAL_NEG)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        lw      a0,-20(s0)
        call    search_symbol
        mv      a5,a0
        j       .L81
.L65:
        li      a5,0
.L81:
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC0:
        .string "[analyzer Error] at %s: First parameter of method must be 'self'\n"
.LC1:
        .string "[analyzer Error] at %s: Binary operations method must have exactly two parameters\n"
.LC2:
        .string "[analyzer Error] at %s: Second parameter of binary operations special method must not be NULL\n"
method_other_type:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      zero,-20(s0)
        sw      zero,-24(s0)
        lw      a5,-52(s0)
        lw      a5,16(a5)
        lw      a5,8(a5)
        sw      a5,-28(s0)
        j       .L83
.L92:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        sw      a5,-32(s0)
        j       .L84
.L90:
        lw      a5,-32(s0)
        lw      a5,0(a5)
        sw      a5,-36(s0)
        j       .L85
.L89:
        lw      a5,-20(s0)
        bne     a5,zero,.L86
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lui     a5,%hi(KEYWORD_SELF)
        lw      a5,%lo(KEYWORD_SELF)(a5)
        beq     a4,a5,.L87
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC0)
        addi    a1,a5,%lo(.LC0)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        li      a5,0
        j       .L88
.L86:
        lw      a4,-20(s0)
        li      a5,1
        bne     a4,a5,.L87
        lw      a5,-36(s0)
        sw      a5,-24(s0)
.L87:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
        sw      zero,-36(s0)
.L85:
        lw      a5,-36(s0)
        bne     a5,zero,.L89
        lw      a5,-32(s0)
        lw      a5,4(a5)
        sw      a5,-32(s0)
.L84:
        lw      a5,-32(s0)
        bne     a5,zero,.L90
        sw      zero,-28(s0)
.L83:
        lw      a5,-28(s0)
        beq     a5,zero,.L91
        lw      a5,-28(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L92
.L91:
        lw      a4,-20(s0)
        li      a5,2
        beq     a4,a5,.L93
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC1)
        addi    a1,a5,%lo(.LC1)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        li      a5,0
        j       .L88
.L93:
        lw      a5,-24(s0)
        bne     a5,zero,.L94
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC2)
        addi    a1,a5,%lo(.LC2)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        li      a5,0
        j       .L88
.L94:
        lw      a5,-24(s0)
        lw      a5,4(a5)
.L88:
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        addi    sp,sp,64
        jr      ra
create_variable_access_var:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        sw      zero,0(a5)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,4(a5)
        lw      a5,-20(s0)
        sw      zero,12(a5)
        lw      a5,-20(s0)
        sw      zero,8(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
create_variable_access_attribute:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,4(a5)
        lw      a5,-20(s0)
        li      a4,2
        sw      a4,12(a5)
        lw      a5,-20(s0)
        sw      zero,8(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
create_variable_access_call:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,4(a5)
        lw      a5,-20(s0)
        li      a4,1
        sw      a4,12(a5)
        lw      a5,-20(s0)
        sw      zero,8(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a1,-40(s0)
        mv      a0,a5
        call    list_append
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
create_primary_var_access:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        li      a1,1
        li      a0,12
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        li      a4,7
        sw      a4,8(a5)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        sw      zero,4(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
create_expression_from_primary:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        li      a4,21
        sw      a4,8(a5)
        lw      a5,-20(s0)
        sw      zero,4(a5)
        lw      a5,-20(s0)
        sw      zero,12(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC3:
        .string "[analyzer Error] at %s: The second parameter types of the two comparison methods must be compatible\n"
.LC4:
        .string "other"
create_comparison_method:
        addi    sp,sp,-128
        sw      ra,124(sp)
        sw      s0,120(sp)
        addi    s0,sp,128
        sw      a0,-116(s0)
        sw      a1,-120(s0)
        sw      a2,-124(s0)
        sw      a3,-128(s0)
        li      a1,1
        li      a0,20
        call    alloc_memory
        sw      a0,-28(s0)
        call    list_create
        mv      a4,a0
        lw      a5,-28(s0)
        sw      a4,12(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-28(s0)
        sw      a4,8(a5)
        lw      a5,-28(s0)
        li      a4,1
        sb      a4,16(a5)
        lui     a5,%hi(symbol_bool)
        lw      a4,%lo(symbol_bool)(a5)
        lw      a5,-28(s0)
        sw      a4,4(a5)
        lw      a5,-116(s0)
        lw      a5,8(a5)
        mv      a1,a5
        li      a0,3
        call    create_symbol_table
        sw      a0,-32(s0)
        lui     a5,%hi(KEYWORD_SELF)
        lw      a0,%lo(KEYWORD_SELF)(a5)
        lw      a5,-116(s0)
        lw      a5,0(a5)
        lw      a4,-32(s0)
        li      a3,0
        li      a2,6
        mv      a1,a5
        call    create_symbol
        sw      a0,-36(s0)
        lw      a0,-124(s0)
        call    method_other_type
        sw      a0,-20(s0)
        lw      a5,-128(s0)
        beq     a5,zero,.L106
        lw      a0,-128(s0)
        call    method_other_type
        sw      a0,-40(s0)
        lw      a1,-40(s0)
        lw      a0,-20(s0)
        call    types_compatible
        sw      a0,-44(s0)
        lw      a5,-44(s0)
        bne     a5,zero,.L107
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC3)
        addi    a1,a5,%lo(.LC3)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        li      a5,0
        j       .L108
.L107:
        lw      a5,-44(s0)
        sw      a5,-20(s0)
.L106:
        li      a1,5
        lui     a5,%hi(.LC4)
        addi    a0,a5,%lo(.LC4)
        call    create_string
        mv      a5,a0
        lw      a4,-32(s0)
        li      a3,0
        li      a2,6
        lw      a1,-20(s0)
        mv      a0,a5
        call    create_symbol
        sw      a0,-48(s0)
        lw      a5,-28(s0)
        lw      a5,8(a5)
        lw      a1,-36(s0)
        mv      a0,a5
        call    list_append
        lw      a5,-28(s0)
        lw      a5,8(a5)
        lw      a1,-48(s0)
        mv      a0,a5
        call    list_append
        lw      a0,-36(s0)
        call    create_variable_access_var
        sw      a0,-52(s0)
        lw      a1,-124(s0)
        lw      a0,-52(s0)
        call    create_variable_access_attribute
        sw      a0,-56(s0)
        lw      a0,-48(s0)
        call    create_variable_access_var
        mv      a5,a0
        mv      a0,a5
        call    create_primary_var_access
        mv      a5,a0
        mv      a0,a5
        call    create_expression_from_primary
        sw      a0,-60(s0)
        lw      a1,-60(s0)
        lw      a0,-56(s0)
        call    create_variable_access_call
        sw      a0,-64(s0)
        sw      zero,-24(s0)
        lw      a5,-128(s0)
        bne     a5,zero,.L109
        lw      a0,-64(s0)
        call    create_primary_var_access
        sw      a0,-88(s0)
        li      a1,1
        li      a0,12
        call    alloc_memory
        sw      a0,-92(s0)
        lw      a5,-92(s0)
        li      a4,6
        sw      a4,8(a5)
        lw      a5,-92(s0)
        lw      a4,-88(s0)
        sw      a4,0(a5)
        lw      a5,-92(s0)
        sw      zero,4(a5)
        lw      a0,-92(s0)
        call    create_expression_from_primary
        sw      a0,-24(s0)
        j       .L110
.L109:
        lw      a0,-36(s0)
        call    create_variable_access_var
        mv      a5,a0
        lw      a1,-128(s0)
        mv      a0,a5
        call    create_variable_access_attribute
        sw      a0,-68(s0)
        lw      a0,-48(s0)
        call    create_variable_access_var
        mv      a5,a0
        mv      a0,a5
        call    create_primary_var_access
        mv      a5,a0
        mv      a0,a5
        call    create_expression_from_primary
        sw      a0,-72(s0)
        lw      a1,-72(s0)
        lw      a0,-68(s0)
        call    create_variable_access_call
        sw      a0,-76(s0)
        lw      a0,-64(s0)
        call    create_primary_var_access
        mv      a5,a0
        mv      a0,a5
        call    create_expression_from_primary
        sw      a0,-80(s0)
        lw      a0,-76(s0)
        call    create_primary_var_access
        mv      a5,a0
        mv      a0,a5
        call    create_expression_from_primary
        sw      a0,-84(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,-80(s0)
        sw      a4,0(a5)
        lw      a5,-24(s0)
        li      a4,18
        sw      a4,8(a5)
        lw      a5,-24(s0)
        lw      a4,-84(s0)
        sw      a4,4(a5)
        lw      a5,-24(s0)
        sw      zero,12(a5)
.L110:
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-96(s0)
        lw      a5,-96(s0)
        lw      a4,-24(s0)
        sw      a4,0(a5)
        lw      a5,-96(s0)
        li      a4,7
        sw      a4,4(a5)
        lw      a5,-28(s0)
        lw      a5,12(a5)
        lw      a1,-96(s0)
        mv      a0,a5
        call    list_append
        lw      a5,-28(s0)
        lw      a1,4(a5)
        lw      a5,-116(s0)
        lw      a5,8(a5)
        mv      a4,a5
        lw      a3,-28(s0)
        li      a2,4
        lw      a0,-120(s0)
        call    create_symbol
        mv      a4,a0
        lw      a5,-28(s0)
        sw      a4,0(a5)
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-100(s0)
        lw      a5,-100(s0)
        sw      zero,4(a5)
        lw      a5,-100(s0)
        lw      a4,-28(s0)
        sw      a4,0(a5)
        lw      a5,-116(s0)
        lw      a5,4(a5)
        lw      a1,-100(s0)
        mv      a0,a5
        call    list_append
        lw      a5,-28(s0)
        lw      a5,0(a5)
.L108:
        mv      a0,a5
        lw      ra,124(sp)
        lw      s0,120(sp)
        addi    sp,sp,128
        jr      ra
auto_fill_comparison_method:
        addi    sp,sp,-80
        sw      ra,76(sp)
        sw      s0,72(sp)
        addi    s0,sp,80
        sw      a0,-68(s0)
        lw      a5,-68(s0)
        lw      a5,8(a5)
        li      a1,6
        mv      a0,a5
        call    find_method
        mv      a5,a0
        sw      a5,-36(s0)
        lw      a5,-68(s0)
        lw      a5,8(a5)
        li      a1,7
        mv      a0,a5
        call    find_method
        mv      a5,a0
        sw      a5,-40(s0)
        lw      a5,-68(s0)
        lw      a5,8(a5)
        li      a1,8
        mv      a0,a5
        call    find_method
        mv      a5,a0
        sw      a5,-44(s0)
        lw      a5,-68(s0)
        lw      a5,8(a5)
        li      a1,11
        mv      a0,a5
        call    find_method
        mv      a5,a0
        sw      a5,-48(s0)
        lw      a5,-68(s0)
        lw      a5,8(a5)
        li      a1,9
        mv      a0,a5
        call    find_method
        mv      a5,a0
        sw      a5,-52(s0)
        lw      a5,-68(s0)
        lw      a5,8(a5)
        li      a1,10
        mv      a0,a5
        call    find_method
        mv      a5,a0
        sw      a5,-56(s0)
        lw      a5,-36(s0)
        bne     a5,zero,.L124
        lw      a5,-40(s0)
.L124:
        sw      zero,-20(s0)
        sw      zero,-24(s0)
        sw      zero,-28(s0)
        sw      zero,-32(s0)
        lw      a5,-36(s0)
        bne     a5,zero,.L113
        lw      a5,-40(s0)
        beq     a5,zero,.L113
        addi    a5,s0,-36
        sw      a5,-20(s0)
        lw      a5,-40(s0)
        sw      a5,-24(s0)
        lui     a5,%hi(SPECIAL_EQ)
        lw      a5,%lo(SPECIAL_EQ)(a5)
        sw      a5,-32(s0)
.L113:
        lw      a5,-40(s0)
        bne     a5,zero,.L114
        lw      a5,-36(s0)
        beq     a5,zero,.L114
        addi    a5,s0,-40
        sw      a5,-20(s0)
        lw      a5,-36(s0)
        sw      a5,-24(s0)
        lui     a5,%hi(SPECIAL_NE)
        lw      a5,%lo(SPECIAL_NE)(a5)
        sw      a5,-32(s0)
.L114:
        lw      a5,-44(s0)
        bne     a5,zero,.L115
        lw      a5,-48(s0)
        beq     a5,zero,.L115
        addi    a5,s0,-44
        sw      a5,-20(s0)
        lw      a5,-48(s0)
        sw      a5,-24(s0)
        lui     a5,%hi(SPECIAL_LT)
        lw      a5,%lo(SPECIAL_LT)(a5)
        sw      a5,-32(s0)
.L115:
        lw      a5,-48(s0)
        bne     a5,zero,.L116
        lw      a5,-44(s0)
        beq     a5,zero,.L116
        addi    a5,s0,-48
        sw      a5,-20(s0)
        lw      a5,-44(s0)
        sw      a5,-24(s0)
        lui     a5,%hi(SPECIAL_GE)
        lw      a5,%lo(SPECIAL_GE)(a5)
        sw      a5,-32(s0)
.L116:
        lw      a5,-52(s0)
        bne     a5,zero,.L117
        lw      a5,-56(s0)
        beq     a5,zero,.L117
        addi    a5,s0,-52
        sw      a5,-20(s0)
        lw      a5,-56(s0)
        sw      a5,-24(s0)
        lui     a5,%hi(SPECIAL_GT)
        lw      a5,%lo(SPECIAL_GT)(a5)
        sw      a5,-32(s0)
.L117:
        lw      a5,-56(s0)
        bne     a5,zero,.L118
        lw      a5,-52(s0)
        beq     a5,zero,.L118
        addi    a5,s0,-56
        sw      a5,-20(s0)
        lw      a5,-52(s0)
        sw      a5,-24(s0)
        lui     a5,%hi(SPECIAL_LE)
        lw      a5,%lo(SPECIAL_LE)(a5)
        sw      a5,-32(s0)
.L118:
        lw      a5,-56(s0)
        bne     a5,zero,.L119
        lw      a5,-36(s0)
        beq     a5,zero,.L119
        lw      a5,-44(s0)
        beq     a5,zero,.L119
        addi    a5,s0,-56
        sw      a5,-20(s0)
        lw      a5,-36(s0)
        sw      a5,-24(s0)
        lw      a5,-44(s0)
        sw      a5,-28(s0)
        lui     a5,%hi(SPECIAL_LE)
        lw      a5,%lo(SPECIAL_LE)(a5)
        sw      a5,-32(s0)
.L119:
        lw      a5,-48(s0)
        bne     a5,zero,.L120
        lw      a5,-36(s0)
        beq     a5,zero,.L120
        lw      a5,-52(s0)
        beq     a5,zero,.L120
        addi    a5,s0,-48
        sw      a5,-20(s0)
        lw      a5,-36(s0)
        sw      a5,-24(s0)
        lw      a5,-52(s0)
        sw      a5,-28(s0)
        lui     a5,%hi(SPECIAL_GE)
        lw      a5,%lo(SPECIAL_GE)(a5)
        sw      a5,-32(s0)
.L120:
        lw      a5,-40(s0)
        bne     a5,zero,.L121
        lw      a5,-44(s0)
        beq     a5,zero,.L121
        lw      a5,-52(s0)
        beq     a5,zero,.L121
        addi    a5,s0,-40
        sw      a5,-20(s0)
        lw      a5,-44(s0)
        sw      a5,-24(s0)
        lw      a5,-52(s0)
        sw      a5,-28(s0)
        lui     a5,%hi(SPECIAL_NE)
        lw      a5,%lo(SPECIAL_NE)(a5)
        sw      a5,-32(s0)
.L121:
        lw      a5,-32(s0)
        beq     a5,zero,.L126
        lw      a3,-28(s0)
        lw      a2,-24(s0)
        lw      a1,-32(s0)
        lw      a0,-68(s0)
        call    create_comparison_method
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,0(a5)
        j       .L124
.L126:
        nop
        nop
        lw      ra,76(sp)
        lw      s0,72(sp)
        addi    sp,sp,80
        jr      ra
.LC5:
        .string "[analyzer Error] at %s: Cannot perform operations on void type\n"
.LC6:
        .string "[analyzer Error] at %s: Unary operation special method must have exactly one parameter\n"
.LC7:
        .string "[analyzer Error] at %s: Invalid unary operation\n"
.LC8:
        .string "[analyzer Error] at %s: Invalid binary operation\n"
.LC9:
        .string "[analyzer Warning]: Type mismatch, left: '%s', right: '%s', op: '%u'\n"
calculate_type:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        lw      a4,-36(s0)
        bne     a4,a5,.L128
        lw      a5,-40(s0)
        bne     a5,zero,.L128
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        j       .L129
.L128:
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        lw      a4,-36(s0)
        bne     a4,a5,.L130
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC5)
        addi    a1,a5,%lo(.LC5)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        j       .L129
.L130:
        lw      a5,-36(s0)
        lw      a5,8(a5)
        lw      a5,-40(s0)
        bne     a5,zero,.L134
        lw      a4,-44(s0)
        li      a5,21
        bne     a4,a5,.L135
        lw      a5,-36(s0)
        j       .L129
.L135:
        lw      a5,-36(s0)
        lw      a4,8(a5)
        li      a5,3
        bne     a4,a5,.L136
        lw      a5,-36(s0)
        lw      a5,16(a5)
        lw      a5,8(a5)
        lw      a1,-44(s0)
        mv      a0,a5
        call    find_method
        sw      a0,-28(s0)
        lw      a5,-28(s0)
        beq     a5,zero,.L136
        lw      a5,-28(s0)
        lw      a5,16(a5)
        lw      a5,8(a5)
        beq     a5,zero,.L137
        lw      a5,-28(s0)
        lw      a5,16(a5)
        lw      a5,8(a5)
        lw      a5,0(a5)
        beq     a5,zero,.L137
        lw      a5,-28(s0)
        lw      a5,16(a5)
        lw      a5,8(a5)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        lw      a5,16(a5)
        lw      a5,8(a5)
        lw      a5,4(a5)
        beq     a4,a5,.L138
.L137:
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC6)
        addi    a1,a5,%lo(.LC6)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        j       .L129
.L138:
        lw      a5,-28(s0)
        lw      a5,16(a5)
        lw      a5,8(a5)
        lw      a5,0(a5)
        lw      a5,0(a5)
        lw      a4,0(a5)
        lui     a5,%hi(KEYWORD_SELF)
        lw      a5,%lo(KEYWORD_SELF)(a5)
        beq     a4,a5,.L139
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC0)
        addi    a1,a5,%lo(.LC0)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        j       .L129
.L139:
        lw      a5,-28(s0)
        lw      a5,4(a5)
        j       .L129
.L136:
        lui     a5,%hi(symbol_int)
        lw      a5,%lo(symbol_int)(a5)
        lw      a4,-36(s0)
        beq     a4,a5,.L140
        lui     a5,%hi(symbol_float)
        lw      a5,%lo(symbol_float)(a5)
        lw      a4,-36(s0)
        bne     a4,a5,.L141
.L140:
        lw      a4,-44(s0)
        li      a5,19
        bne     a4,a5,.L141
        lw      a5,-36(s0)
        j       .L129
.L141:
        lw      a4,-44(s0)
        li      a5,20
        bne     a4,a5,.L142
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        j       .L129
.L142:
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC7)
        addi    a1,a5,%lo(.LC7)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        j       .L129
.L134:
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        lw      a4,-40(s0)
        bne     a4,a5,.L143
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC5)
        addi    a1,a5,%lo(.LC5)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        j       .L129
.L143:
        lw      a5,-40(s0)
        lw      a5,8(a5)
        lw      a4,-44(s0)
        li      a5,17
        beq     a4,a5,.L147
        lw      a4,-44(s0)
        li      a5,18
        bne     a4,a5,.L148
.L147:
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        j       .L129
.L148:
        lw      a4,-44(s0)
        li      a5,6
        beq     a4,a5,.L149
        lw      a4,-44(s0)
        li      a5,7
        bne     a4,a5,.L150
.L149:
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    types_compatible
        mv      a5,a0
        beq     a5,zero,.L150
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        j       .L129
.L150:
        lw      a4,-44(s0)
        li      a5,8
        beq     a4,a5,.L151
        lw      a4,-44(s0)
        li      a5,9
        beq     a4,a5,.L151
        lw      a4,-44(s0)
        li      a5,10
        beq     a4,a5,.L151
        lw      a4,-44(s0)
        li      a5,11
        bne     a4,a5,.L152
.L151:
        lw      a0,-36(s0)
        call    is_number_type
        mv      a5,a0
        beq     a5,zero,.L152
        lw      a0,-40(s0)
        call    is_number_type
        mv      a5,a0
        beq     a5,zero,.L152
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        j       .L129
.L152:
        lw      a5,-44(s0)
        beq     a5,zero,.L153
        lw      a4,-44(s0)
        li      a5,1
        beq     a4,a5,.L153
        lw      a4,-44(s0)
        li      a5,2
        beq     a4,a5,.L153
        lw      a4,-44(s0)
        li      a5,3
        beq     a4,a5,.L153
        lw      a4,-44(s0)
        li      a5,4
        bne     a4,a5,.L154
.L153:
        lw      a0,-36(s0)
        call    is_number_type
        mv      a5,a0
        beq     a5,zero,.L154
        lw      a0,-40(s0)
        call    is_number_type
        mv      a5,a0
        beq     a5,zero,.L154
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    types_compatible
        mv      a5,a0
        j       .L129
.L154:
        lw      a4,-44(s0)
        li      a5,5
        bne     a4,a5,.L155
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    types_compatible
        mv      a5,a0
        beq     a5,zero,.L155
        lw      a5,-36(s0)
        j       .L129
.L155:
        lw      a4,-44(s0)
        li      a5,12
        beq     a4,a5,.L156
        lw      a4,-44(s0)
        li      a5,13
        beq     a4,a5,.L156
        lw      a4,-44(s0)
        li      a5,14
        beq     a4,a5,.L156
        lw      a4,-44(s0)
        li      a5,15
        beq     a4,a5,.L156
        lw      a4,-44(s0)
        li      a5,16
        bne     a4,a5,.L157
.L156:
        lw      a0,-36(s0)
        call    is_number_type
        mv      a5,a0
        beq     a5,zero,.L157
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    types_compatible
        mv      a5,a0
        beq     a5,zero,.L157
        lw      a5,-36(s0)
        j       .L129
.L157:
        lw      a5,-36(s0)
        lw      a4,8(a5)
        li      a5,3
        bne     a4,a5,.L158
        lw      a5,-36(s0)
        lw      a5,16(a5)
        lw      a5,8(a5)
        lw      a1,-44(s0)
        mv      a0,a5
        call    find_method
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        beq     a5,zero,.L158
        lw      a0,-20(s0)
        call    method_other_type
        mv      a5,a0
        lw      a1,-40(s0)
        mv      a0,a5
        call    types_compatible
        mv      a5,a0
        beq     a5,zero,.L158
        lw      a5,-20(s0)
        lw      a5,4(a5)
        j       .L129
.L158:
        lw      a5,-40(s0)
        lw      a4,8(a5)
        li      a5,3
        bne     a4,a5,.L159
        lw      a5,-40(s0)
        lw      a5,16(a5)
        lw      a5,8(a5)
        lw      a1,-44(s0)
        mv      a0,a5
        call    find_method
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        beq     a5,zero,.L159
        lw      a0,-24(s0)
        call    method_other_type
        mv      a5,a0
        lw      a1,-36(s0)
        mv      a0,a5
        call    types_compatible
        mv      a5,a0
        beq     a5,zero,.L159
        lw      a5,-24(s0)
        lw      a5,4(a5)
        j       .L129
.L159:
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC8)
        addi    a1,a5,%lo(.LC8)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a2,0(a5)
        lw      a5,-40(s0)
        lw      a5,0(a5)
        lw      a4,-44(s0)
        mv      a3,a5
        lui     a5,%hi(.LC9)
        addi    a1,a5,%lo(.LC9)
        call    fprintf
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
.L129:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC10:
        .string "r"
.LC11:
        .string "[analyzer Error] at %s: Failed to open import file\n"
.LC12:
        .string "[analyzer Error] at %s: Imported symbol must be a class or function\n"
analyze_import:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        lw      a4,4(a5)
        lui     a5,%hi(.LC10)
        addi    a1,a5,%lo(.LC10)
        mv      a0,a4
        call    fopen
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        bne     a5,zero,.L161
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC11)
        addi    a1,a5,%lo(.LC11)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L160
.L161:
        lw      a0,-20(s0)
        call    fclose
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_symbol
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a4,8(a5)
        li      a5,3
        beq     a4,a5,.L160
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a4,8(a5)
        li      a5,2
        beq     a4,a5,.L160
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC12)
        addi    a1,a5,%lo(.LC12)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
.L160:
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
analyze_class:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_symbol
        lw      a0,-36(s0)
        call    auto_fill_comparison_method
        lw      a5,-36(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L176
        lw      a5,-36(s0)
        lw      a5,4(a5)
        lw      a5,0(a5)
        beq     a5,zero,.L176
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-20(s0)
        j       .L167
.L175:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L168
.L174:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L169
.L173:
        lw      a5,-28(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L170
        li      a4,1
        beq     a5,a4,.L171
        j       .L172
.L170:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_method
        j       .L172
.L171:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_variable
        nop
.L172:
        sw      zero,-28(s0)
.L169:
        lw      a5,-28(s0)
        bne     a5,zero,.L173
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L168:
        lw      a5,-24(s0)
        bne     a5,zero,.L174
        sw      zero,-20(s0)
.L167:
        lw      a5,-20(s0)
        beq     a5,zero,.L176
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L175
.L176:
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
analyze_function:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_symbol
        lw      a5,-36(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_type
        lw      a5,-36(s0)
        lw      a4,4(a5)
        lui     a5,%hi(return_type)
        sw      a4,%lo(return_type)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        beq     a5,zero,.L178
        lw      a5,-36(s0)
        lw      a5,8(a5)
        lw      a5,0(a5)
        beq     a5,zero,.L178
        lw      a5,-36(s0)
        lw      a5,8(a5)
        sw      a5,-20(s0)
        j       .L179
.L184:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L180
.L183:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L181
.L182:
        lw      a0,-28(s0)
        call    analyze_symbol
        sw      zero,-28(s0)
.L181:
        lw      a5,-28(s0)
        bne     a5,zero,.L182
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L180:
        lw      a5,-24(s0)
        bne     a5,zero,.L183
        sw      zero,-20(s0)
.L179:
        lw      a5,-20(s0)
        beq     a5,zero,.L178
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L184
.L178:
        lw      a5,-36(s0)
        lw      a5,12(a5)
        mv      a0,a5
        call    analyze_body
        lui     a5,%hi(return_type)
        sw      zero,%lo(return_type)(a5)
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC13:
        .string "[analyzer Error] at %s: Method must have at least one parameter (self)\n"
analyze_method:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_symbol
        lw      a5,-36(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_type
        lw      a5,-36(s0)
        lw      a4,4(a5)
        lui     a5,%hi(return_type)
        sw      a4,%lo(return_type)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        beq     a5,zero,.L186
        lw      a5,-36(s0)
        lw      a5,8(a5)
        lw      a5,0(a5)
        bne     a5,zero,.L187
.L186:
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC13)
        addi    a1,a5,%lo(.LC13)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L185
.L187:
        sw      zero,-20(s0)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        sw      a5,-24(s0)
        j       .L189
.L196:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L190
.L194:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        sw      a5,-32(s0)
        j       .L191
.L193:
        lw      a0,-32(s0)
        call    analyze_symbol
        lw      a5,-20(s0)
        bne     a5,zero,.L192
        lw      a5,-32(s0)
        lw      a4,0(a5)
        lui     a5,%hi(KEYWORD_SELF)
        lw      a5,%lo(KEYWORD_SELF)(a5)
        beq     a4,a5,.L192
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC0)
        addi    a1,a5,%lo(.LC0)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L185
.L192:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
        sw      zero,-32(s0)
.L191:
        lw      a5,-32(s0)
        bne     a5,zero,.L193
        lw      a5,-28(s0)
        lw      a5,4(a5)
        sw      a5,-28(s0)
.L190:
        lw      a5,-28(s0)
        bne     a5,zero,.L194
        sw      zero,-24(s0)
.L189:
        lw      a5,-24(s0)
        beq     a5,zero,.L195
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L196
.L195:
        lw      a5,-36(s0)
        lw      a5,12(a5)
        mv      a0,a5
        call    analyze_body
        lui     a5,%hi(return_type)
        sw      zero,%lo(return_type)(a5)
.L185:
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC14:
        .string "[analyzer Error] at %s: Variable initializer type must be compatible with variable type\n"
analyze_variable:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_symbol
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_type
        lw      a5,-20(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L199
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_expression
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a4,4(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a5,12(a5)
        mv      a1,a5
        mv      a0,a4
        call    types_compatible
        mv      a5,a0
        bne     a5,zero,.L199
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC14)
        addi    a1,a5,%lo(.LC14)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
.L199:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC15:
        .string "arr"
.LC16:
        .string "list"
is_container_type:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lui     a5,%hi(KEYWORD_CONST)
        lw      a5,%lo(KEYWORD_CONST)(a5)
        beq     a4,a5,.L201
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a5,%lo(KEYWORD_POINTER)(a5)
        beq     a4,a5,.L201
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lui     a5,%hi(.LC15)
        addi    a1,a5,%lo(.LC15)
        mv      a0,a4
        call    strcmp
        mv      a5,a0
        beq     a5,zero,.L201
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lui     a5,%hi(.LC16)
        addi    a1,a5,%lo(.LC16)
        mv      a0,a4
        call    strcmp
        mv      a5,a0
        bne     a5,zero,.L202
.L201:
        li      a5,1
        j       .L203
.L202:
        li      a5,0
.L203:
        andi    a5,a5,1
        andi    a5,a5,0xff
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC17:
        .string "[analyzer Error] at %s: Container types must be const, pointer, arr or list\n"
analyze_type:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,8(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L205
        lw      a0,-20(s0)
        call    is_container_type
        mv      a5,a0
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L210
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC17)
        addi    a1,a5,%lo(.LC17)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L205
.L210:
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_type
.L205:
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC18:
        .string "[analyzer Error] at %s: Declare list statement must not be empty\n"
.LC19:
        .string "[analyzer Error] at %s: Break and continue statements must be inside a loop\n"
.LC20:
        .string "[analyzer Error] at %s: Return statement must be inside a function or method\n"
.LC21:
        .string "[analyzer Error] at %s: Return statement type must be compatible with function or method return type\n"
analyze_statement:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        lw      a5,4(a5)
        li      a4,8
        beq     a5,a4,.L213
        li      a4,8
        bgtu    a5,a4,.L212
        li      a4,7
        beq     a5,a4,.L215
        li      a4,7
        bgtu    a5,a4,.L212
        li      a4,6
        bgtu    a5,a4,.L212
        li      a4,5
        bgeu    a5,a4,.L216
        li      a4,4
        beq     a5,a4,.L217
        li      a4,4
        bgtu    a5,a4,.L212
        li      a4,3
        beq     a5,a4,.L218
        li      a4,3
        bgtu    a5,a4,.L212
        li      a4,2
        beq     a5,a4,.L219
        li      a4,2
        bgtu    a5,a4,.L212
        beq     a5,zero,.L220
        li      a4,1
        beq     a5,a4,.L221
        j       .L212
.L220:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L222
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a5,0(a5)
        bne     a5,zero,.L223
.L222:
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC18)
        addi    a1,a5,%lo(.LC18)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L212
.L223:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-20(s0)
        j       .L224
.L230:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L225
.L228:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L226
.L227:
        lw      a0,-28(s0)
        call    analyze_variable
        sw      zero,-28(s0)
.L226:
        lw      a5,-28(s0)
        bne     a5,zero,.L227
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L225:
        lw      a5,-24(s0)
        bne     a5,zero,.L228
        sw      zero,-20(s0)
.L224:
        lw      a5,-20(s0)
        beq     a5,zero,.L236
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L230
        j       .L236
.L221:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_variable
        j       .L212
.L219:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_if
        j       .L212
.L218:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_for
        j       .L212
.L217:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_while
        j       .L212
.L216:
        lui     a5,%hi(loop_depth)
        lw      a5,%lo(loop_depth)(a5)
        bgt     a5,zero,.L237
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC19)
        addi    a1,a5,%lo(.LC19)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L212
.L215:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L232
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_expression
.L232:
        lui     a5,%hi(return_type)
        lw      a5,%lo(return_type)(a5)
        bne     a5,zero,.L233
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC20)
        addi    a1,a5,%lo(.LC20)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
.L233:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L234
        lui     a5,%hi(return_type)
        lw      a4,%lo(return_type)(a5)
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        beq     a4,a5,.L238
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC21)
        addi    a1,a5,%lo(.LC21)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L238
.L234:
        lui     a5,%hi(return_type)
        lw      a4,%lo(return_type)(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a5,12(a5)
        mv      a1,a5
        mv      a0,a4
        call    types_compatible
        mv      a5,a0
        bne     a5,zero,.L238
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC21)
        addi    a1,a5,%lo(.LC21)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L238
.L213:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_expression
        j       .L212
.L236:
        nop
        j       .L212
.L237:
        nop
        j       .L212
.L238:
        nop
.L212:
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
analyze_body:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        beq     a5,zero,.L249
        lw      a5,-36(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L249
        lw      a5,-36(s0)
        sw      a5,-20(s0)
        j       .L243
.L248:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L244
.L247:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L245
.L246:
        lw      a0,-28(s0)
        call    analyze_statement
        sw      zero,-28(s0)
.L245:
        lw      a5,-28(s0)
        bne     a5,zero,.L246
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L244:
        lw      a5,-24(s0)
        bne     a5,zero,.L247
        sw      zero,-20(s0)
.L243:
        lw      a5,-20(s0)
        beq     a5,zero,.L239
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L248
        j       .L239
.L249:
        nop
.L239:
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC22:
        .string "[analyzer Error] at %s: Expression type must not be NULL\n"
analyze_expression:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,21
        bne     a4,a5,.L251
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_primary
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a5,4(a5)
        li      a2,21
        li      a1,0
        mv      a0,a5
        call    calculate_type
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,12(a5)
        j       .L252
.L251:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_expression
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_expression
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a4,12(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a3,12(a5)
        lw      a5,-20(s0)
        lw      a5,8(a5)
        mv      a2,a5
        mv      a1,a3
        mv      a0,a4
        call    calculate_type
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,12(a5)
.L252:
        lw      a5,-20(s0)
        lw      a5,12(a5)
        bne     a5,zero,.L254
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC22)
        addi    a1,a5,%lo(.LC22)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(symbol_void)
        lw      a4,%lo(symbol_void)(a5)
        lw      a5,-20(s0)
        sw      a4,12(a5)
.L254:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
analyze_if:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_expression
        lw      a5,-36(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_body
        lw      a5,-36(s0)
        lw      a5,8(a5)
        beq     a5,zero,.L256
        lw      a5,-36(s0)
        lw      a5,8(a5)
        lw      a5,0(a5)
        beq     a5,zero,.L256
        lw      a5,-36(s0)
        lw      a5,8(a5)
        sw      a5,-20(s0)
        j       .L257
.L262:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L258
.L261:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L259
.L260:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_expression
        lw      a5,-28(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_body
        sw      zero,-28(s0)
.L259:
        lw      a5,-28(s0)
        bne     a5,zero,.L260
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L258:
        lw      a5,-24(s0)
        bne     a5,zero,.L261
        sw      zero,-20(s0)
.L257:
        lw      a5,-20(s0)
        beq     a5,zero,.L256
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L262
.L256:
        lw      a5,-36(s0)
        lw      a5,12(a5)
        beq     a5,zero,.L264
        lw      a5,-36(s0)
        lw      a5,12(a5)
        lw      a5,0(a5)
        beq     a5,zero,.L264
        lw      a5,-36(s0)
        lw      a5,12(a5)
        mv      a0,a5
        call    analyze_body
.L264:
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
analyze_for:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lui     a5,%hi(loop_depth)
        lw      a5,%lo(loop_depth)(a5)
        addi    a4,a5,1
        lui     a5,%hi(loop_depth)
        sw      a4,%lo(loop_depth)(a5)
        lw      a5,-20(s0)
        lbu     a5,16(a5)
        beq     a5,zero,.L266
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L266
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_variable
        j       .L267
.L266:
        lw      a5,-20(s0)
        lbu     a5,16(a5)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L267
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L267
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_expression
.L267:
        lw      a5,-20(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L268
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_expression
.L268:
        lw      a5,-20(s0)
        lw      a5,8(a5)
        beq     a5,zero,.L269
        lw      a5,-20(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    analyze_expression
.L269:
        lw      a5,-20(s0)
        lw      a5,12(a5)
        mv      a0,a5
        call    analyze_body
        lui     a5,%hi(loop_depth)
        lw      a5,%lo(loop_depth)(a5)
        addi    a4,a5,-1
        lui     a5,%hi(loop_depth)
        sw      a4,%lo(loop_depth)(a5)
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
analyze_while:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lui     a5,%hi(loop_depth)
        lw      a5,%lo(loop_depth)(a5)
        addi    a4,a5,1
        lui     a5,%hi(loop_depth)
        sw      a4,%lo(loop_depth)(a5)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_expression
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_body
        lui     a5,%hi(loop_depth)
        lw      a5,%lo(loop_depth)(a5)
        addi    a4,a5,-1
        lui     a5,%hi(loop_depth)
        sw      a4,%lo(loop_depth)(a5)
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC23:
        .string "[analyzer Error] at %s: Primary expression type could not be determined\n"
analyze_primary:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,8(a5)
        li      a4,7
        beq     a5,a4,.L272
        li      a4,7
        bgtu    a5,a4,.L273
        li      a4,6
        beq     a5,a4,.L274
        li      a4,6
        bgtu    a5,a4,.L273
        li      a4,5
        beq     a5,a4,.L275
        li      a4,5
        bgtu    a5,a4,.L273
        li      a4,4
        beq     a5,a4,.L276
        li      a4,4
        bgtu    a5,a4,.L273
        li      a4,3
        beq     a5,a4,.L277
        li      a4,3
        bgtu    a5,a4,.L273
        li      a4,2
        beq     a5,a4,.L278
        li      a4,2
        bgtu    a5,a4,.L273
        beq     a5,zero,.L279
        li      a4,1
        beq     a5,a4,.L280
        j       .L273
.L279:
        lui     a5,%hi(symbol_int)
        lw      a4,%lo(symbol_int)(a5)
        lw      a5,-20(s0)
        sw      a4,4(a5)
        j       .L273
.L280:
        lui     a5,%hi(symbol_float)
        lw      a4,%lo(symbol_float)(a5)
        lw      a5,-20(s0)
        sw      a4,4(a5)
        j       .L273
.L278:
        lui     a5,%hi(symbol_string)
        lw      a4,%lo(symbol_string)(a5)
        lw      a5,-20(s0)
        sw      a4,4(a5)
        j       .L273
.L277:
        lui     a5,%hi(symbol_bool)
        lw      a4,%lo(symbol_bool)(a5)
        lw      a5,-20(s0)
        sw      a4,4(a5)
        j       .L273
.L274:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_primary
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a5,4(a5)
        li      a2,20
        li      a1,0
        mv      a0,a5
        call    calculate_type
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,4(a5)
        j       .L273
.L275:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_primary
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a5,4(a5)
        li      a2,19
        li      a1,0
        mv      a0,a5
        call    calculate_type
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,4(a5)
        j       .L273
.L276:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_expression
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a4,12(a5)
        lw      a5,-20(s0)
        sw      a4,4(a5)
        j       .L273
.L272:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_variable_access
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a4,8(a5)
        lw      a5,-20(s0)
        sw      a4,4(a5)
        nop
.L273:
        lw      a5,-20(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L282
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC23)
        addi    a1,a5,%lo(.LC23)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(symbol_void)
        lw      a4,%lo(symbol_void)(a5)
        lw      a5,-20(s0)
        sw      a4,4(a5)
.L282:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
analyze_var_access_var:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_symbol
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-20(s0)
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,1
        beq     a4,a5,.L284
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,6
        beq     a4,a5,.L284
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,5
        bne     a4,a5,.L285
.L284:
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lw      a5,-36(s0)
        sw      a4,8(a5)
        j       .L288
.L285:
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,2
        beq     a4,a5,.L287
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,4
        beq     a4,a5,.L287
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,3
        bne     a4,a5,.L288
.L287:
        lw      a5,-36(s0)
        lw      a4,-20(s0)
        sw      a4,8(a5)
.L288:
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC24:
        .string "[analyzer Error] at %s: Base of call has no type\n"
.LC25:
        .string "[analyzer Error] at %s: Base of call must be a function, method or class\n"
.LC26:
        .string "[analyzer Error] at %s: Class call must define '$init' special method\n"
.LC27:
        .string "[analyzer Error] at %s: Argument type must match callee parameter type\n"
.LC28:
        .string "method"
.LC29:
        .string "function"
.LC30:
        .string "    Type mismatch in %s call '%s', expected '%s', got '%s'\n"
.LC31:
        .string "[analyzer Error] at %s: Argument count must match callee parameter count\n"
.LC32:
        .string "    Argument count mismatch in %s call '%s', expected %zu, got %zu\n"
analyze_var_access_call:
        addi    sp,sp,-128
        sw      ra,124(sp)
        sw      s0,120(sp)
        addi    s0,sp,128
        sw      a0,-116(s0)
        lw      a5,-116(s0)
        lw      a5,0(a5)
        lw      a5,8(a5)
        bne     a5,zero,.L290
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC24)
        addi    a1,a5,%lo(.LC24)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L289
.L290:
        sw      zero,-20(s0)
        lw      a5,-116(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
        j       .L292
.L298:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L293
.L296:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        sw      a5,-32(s0)
        j       .L294
.L295:
        lw      a0,-32(s0)
        call    analyze_expression
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
        sw      zero,-32(s0)
.L294:
        lw      a5,-32(s0)
        bne     a5,zero,.L295
        lw      a5,-28(s0)
        lw      a5,4(a5)
        sw      a5,-28(s0)
.L293:
        lw      a5,-28(s0)
        bne     a5,zero,.L296
        sw      zero,-24(s0)
.L292:
        lw      a5,-24(s0)
        beq     a5,zero,.L297
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L298
.L297:
        lw      a5,-116(s0)
        lw      a5,0(a5)
        sw      a5,-88(s0)
        lw      a5,-88(s0)
        lw      a5,12(a5)
        bne     a5,zero,.L299
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a4,8(a5)
        li      a5,2
        beq     a4,a5,.L300
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a4,8(a5)
        li      a5,3
        beq     a4,a5,.L300
.L299:
        lw      a5,-88(s0)
        lw      a4,12(a5)
        li      a5,2
        bne     a4,a5,.L301
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a4,8(a5)
        li      a5,4
        beq     a4,a5,.L300
.L301:
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC25)
        addi    a1,a5,%lo(.LC25)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L289
.L300:
        li      a5,1
        sb      a5,-33(s0)
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a4,8(a5)
        li      a5,3
        bne     a4,a5,.L302
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a5,16(a5)
        lw      a0,8(a5)
        lui     a5,%hi(SPECIAL_INIT)
        lw      a5,%lo(SPECIAL_INIT)(a5)
        li      a4,0
        li      a3,4
        li      a2,1
        mv      a1,a5
        call    search_symbol
        sw      a0,-92(s0)
        lw      a5,-92(s0)
        bne     a5,zero,.L303
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC26)
        addi    a1,a5,%lo(.LC26)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L289
.L303:
        lw      a5,-92(s0)
        lw      a5,16(a5)
        sw      a5,-108(s0)
        j       .L304
.L302:
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a4,8(a5)
        li      a5,2
        bne     a4,a5,.L305
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a5,16(a5)
        sw      a5,-108(s0)
        sb      zero,-33(s0)
        j       .L304
.L305:
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a4,8(a5)
        li      a5,4
        bne     a4,a5,.L304
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a5,16(a5)
        sw      a5,-108(s0)
.L304:
        sw      zero,-40(s0)
        lbu     a5,-33(s0)
        beq     a5,zero,.L306
        lw      a5,-108(s0)
        lw      a5,8(a5)
        sw      a5,-44(s0)
        j       .L308
.L306:
        lw      a5,-108(s0)
        lw      a5,8(a5)
        sw      a5,-44(s0)
        j       .L308
.L314:
        lw      a5,-44(s0)
        lw      a5,0(a5)
        sw      a5,-48(s0)
        j       .L309
.L312:
        lw      a5,-48(s0)
        lw      a5,0(a5)
        sw      a5,-52(s0)
        j       .L310
.L311:
        lw      a5,-40(s0)
        addi    a5,a5,1
        sw      a5,-40(s0)
        sw      zero,-52(s0)
.L310:
        lw      a5,-52(s0)
        bne     a5,zero,.L311
        lw      a5,-48(s0)
        lw      a5,4(a5)
        sw      a5,-48(s0)
.L309:
        lw      a5,-48(s0)
        bne     a5,zero,.L312
        sw      zero,-44(s0)
.L308:
        lw      a5,-44(s0)
        beq     a5,zero,.L313
        lw      a5,-44(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L314
.L313:
        lw      a4,-20(s0)
        lw      a5,-40(s0)
        bgeu    a5,a4,.L315
        mv      a5,a4
.L315:
        li      a1,4
        mv      a0,a5
        call    calloc
        mv      a5,a0
        sw      a5,-96(s0)
        sw      zero,-56(s0)
        lbu     a5,-33(s0)
        beq     a5,zero,.L316
        lw      a5,-108(s0)
        lw      a5,8(a5)
        sw      a5,-60(s0)
        j       .L318
.L316:
        lw      a5,-108(s0)
        lw      a5,8(a5)
        sw      a5,-60(s0)
        j       .L318
.L324:
        lw      a5,-60(s0)
        lw      a5,0(a5)
        sw      a5,-64(s0)
        j       .L319
.L322:
        lw      a5,-64(s0)
        lw      a5,0(a5)
        sw      a5,-68(s0)
        j       .L320
.L321:
        lw      a5,-56(s0)
        addi    a4,a5,1
        sw      a4,-56(s0)
        slli    a5,a5,2
        lw      a4,-96(s0)
        add     a5,a4,a5
        lw      a4,-68(s0)
        lw      a4,4(a4)
        sw      a4,0(a5)
        sw      zero,-68(s0)
.L320:
        lw      a5,-68(s0)
        bne     a5,zero,.L321
        lw      a5,-64(s0)
        lw      a5,4(a5)
        sw      a5,-64(s0)
.L319:
        lw      a5,-64(s0)
        bne     a5,zero,.L322
        sw      zero,-60(s0)
.L318:
        lw      a5,-60(s0)
        beq     a5,zero,.L323
        lw      a5,-60(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L324
.L323:
        lbu     a5,-33(s0)
        beq     a5,zero,.L325
        lw      a5,-108(s0)
        lw      a5,0(a5)
        sw      a5,-72(s0)
        j       .L326
.L325:
        lw      a5,-108(s0)
        lw      a5,0(a5)
        sw      a5,-72(s0)
.L326:
        lw      a4,-20(s0)
        lw      a5,-40(s0)
        bleu    a5,a4,.L327
        mv      a5,a4
.L327:
        sw      a5,-100(s0)
        lbu     a5,-33(s0)
        beq     a5,zero,.L328
        lw      a5,-40(s0)
        addi    a5,a5,-1
        sw      a5,-40(s0)
.L328:
        lbu     a5,-33(s0)
        sw      a5,-56(s0)
        lw      a5,-116(s0)
        lw      a5,4(a5)
        sw      a5,-76(s0)
        j       .L329
.L340:
        lw      a5,-76(s0)
        lw      a5,0(a5)
        sw      a5,-80(s0)
        j       .L330
.L338:
        lw      a5,-80(s0)
        lw      a5,0(a5)
        sw      a5,-84(s0)
        j       .L331
.L337:
        lw      a4,-56(s0)
        lw      a5,-100(s0)
        bgeu    a4,a5,.L347
        lw      a5,-56(s0)
        addi    a4,a5,1
        sw      a4,-56(s0)
        slli    a5,a5,2
        lw      a4,-96(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        sw      a5,-104(s0)
        lw      a5,-84(s0)
        lw      a5,12(a5)
        lw      a1,-104(s0)
        mv      a0,a5
        call    types_compatible
        mv      a5,a0
        bne     a5,zero,.L334
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC27)
        addi    a1,a5,%lo(.LC27)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lbu     a5,-33(s0)
        beq     a5,zero,.L335
        lui     a5,%hi(.LC28)
        addi    a2,a5,%lo(.LC28)
        j       .L336
.L335:
        lui     a5,%hi(.LC29)
        addi    a2,a5,%lo(.LC29)
.L336:
        lw      a5,-72(s0)
        lw      a3,0(a5)
        lw      a5,-104(s0)
        lw      a4,0(a5)
        lw      a5,-84(s0)
        lw      a5,12(a5)
        lw      a5,0(a5)
        lui     a1,%hi(.LC30)
        addi    a1,a1,%lo(.LC30)
        call    fprintf
.L334:
        sw      zero,-84(s0)
.L331:
        lw      a5,-84(s0)
        bne     a5,zero,.L337
        j       .L333
.L347:
        nop
.L333:
        lw      a5,-80(s0)
        lw      a5,4(a5)
        sw      a5,-80(s0)
.L330:
        lw      a5,-80(s0)
        bne     a5,zero,.L338
        sw      zero,-76(s0)
.L329:
        lw      a5,-76(s0)
        beq     a5,zero,.L339
        lw      a5,-76(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L340
.L339:
        lw      a4,-20(s0)
        lw      a5,-40(s0)
        beq     a4,a5,.L341
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC31)
        addi    a1,a5,%lo(.LC31)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(stderr)
        lw      a0,%lo(stderr)(a5)
        lbu     a5,-33(s0)
        beq     a5,zero,.L342
        lui     a5,%hi(.LC28)
        addi    a2,a5,%lo(.LC28)
        j       .L343
.L342:
        lui     a5,%hi(.LC29)
        addi    a2,a5,%lo(.LC29)
.L343:
        lw      a5,-72(s0)
        lw      a3,0(a5)
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        lui     a1,%hi(.LC32)
        addi    a1,a1,%lo(.LC32)
        call    fprintf
.L341:
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a4,8(a5)
        li      a5,3
        bne     a4,a5,.L344
        lw      a5,-88(s0)
        lw      a4,8(a5)
        lw      a5,-116(s0)
        sw      a4,8(a5)
        j       .L345
.L344:
        lw      a5,-88(s0)
        lw      a5,8(a5)
        lw      a4,4(a5)
        lw      a5,-116(s0)
        sw      a4,8(a5)
.L345:
        lw      a0,-96(s0)
        call    free
.L289:
        lw      ra,124(sp)
        lw      s0,120(sp)
        addi    sp,sp,128
        jr      ra
.LC33:
        .string "[analyzer Error] at %s: Base of attribute access has no type\n"
.LC34:
        .string "[analyzer Error] at %s: Base of attribute access must be a class\n"
analyze_var_access_attribute:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a5,8(a5)
        bne     a5,zero,.L349
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC33)
        addi    a1,a5,%lo(.LC33)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L348
.L349:
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_symbol
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a5,8(a5)
        lw      a4,8(a5)
        li      a5,3
        beq     a4,a5,.L351
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC34)
        addi    a1,a5,%lo(.LC34)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L348
.L351:
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a4,8(a5)
        li      a5,4
        bne     a4,a5,.L352
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lw      a5,-20(s0)
        sw      a4,8(a5)
        j       .L348
.L352:
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a4,8(a5)
        li      a5,5
        bne     a4,a5,.L348
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a4,4(a5)
        lw      a5,-20(s0)
        sw      a4,8(a5)
.L348:
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC35:
        .string "[analyzer Error] at %s: Base of index access has no type\n"
.LC36:
        .string "[analyzer Error] at %s: Index must be of type int\n"
.LC37:
        .string "[analyzer Error] at %s: Index access base must be a container type\n"
analyze_var_access_index:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a5,8(a5)
        bne     a5,zero,.L354
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC35)
        addi    a1,a5,%lo(.LC35)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L353
.L354:
        lw      a5,-36(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_expression
        lw      a5,-36(s0)
        lw      a5,4(a5)
        lw      a4,12(a5)
        lui     a5,%hi(symbol_int)
        lw      a5,%lo(symbol_int)(a5)
        mv      a1,a5
        mv      a0,a4
        call    types_compatible
        mv      a4,a0
        lui     a5,%hi(symbol_int)
        lw      a5,%lo(symbol_int)(a5)
        beq     a4,a5,.L356
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC36)
        addi    a1,a5,%lo(.LC36)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L353
.L356:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a5,8(a5)
        sw      a5,-20(s0)
        lw      a0,-20(s0)
        call    is_container_type
        mv      a5,a0
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L357
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC37)
        addi    a1,a5,%lo(.LC37)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        j       .L353
.L357:
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lw      a5,-36(s0)
        sw      a4,8(a5)
.L353:
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC38:
        .string "[analyzer Error] at %s: Variable access type could not be determined\n"
analyze_variable_access:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L359
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    analyze_variable_access
.L359:
        lw      a5,-20(s0)
        lw      a5,12(a5)
        li      a4,3
        beq     a5,a4,.L360
        li      a4,3
        bgtu    a5,a4,.L361
        li      a4,2
        beq     a5,a4,.L362
        li      a4,2
        bgtu    a5,a4,.L361
        beq     a5,zero,.L363
        li      a4,1
        beq     a5,a4,.L364
        j       .L361
.L363:
        lw      a0,-20(s0)
        call    analyze_var_access_var
        j       .L361
.L364:
        lw      a0,-20(s0)
        call    analyze_var_access_call
        j       .L361
.L362:
        lw      a0,-20(s0)
        call    analyze_var_access_attribute
        j       .L361
.L360:
        lw      a0,-20(s0)
        call    analyze_var_access_index
        nop
.L361:
        lw      a5,-20(s0)
        lw      a5,8(a5)
        bne     a5,zero,.L366
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lui     a5,%hi(file)
        lw      a5,%lo(file)(a5)
        mv      a2,a5
        lui     a5,%hi(.LC38)
        addi    a1,a5,%lo(.LC38)
        mv      a0,a4
        call    fprintf
        lui     a5,%hi(has_error)
        li      a4,1
        sb      a4,%lo(has_error)(a5)
        lui     a5,%hi(symbol_void)
        lw      a4,%lo(symbol_void)(a5)
        lw      a5,-20(s0)
        sw      a4,8(a5)
.L366:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
analyze_symbol:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,8(a5)
        li      a4,6
        beq     a5,a4,.L381
        li      a4,6
        bgtu    a5,a4,.L369
        li      a4,5
        beq     a5,a4,.L382
        li      a4,5
        bgtu    a5,a4,.L369
        li      a4,4
        beq     a5,a4,.L383
        li      a4,4
        bgtu    a5,a4,.L369
        li      a4,3
        beq     a5,a4,.L372
        li      a4,3
        bgtu    a5,a4,.L369
        li      a4,2
        beq     a5,a4,.L384
        li      a4,2
        bgtu    a5,a4,.L369
        beq     a5,zero,.L374
        j       .L369
.L374:
        lw      a0,-20(s0)
        call    is_container_type
        j       .L369
.L372:
        lw      a0,-20(s0)
        call    is_container_type
        j       .L369
.L381:
        nop
        j       .L369
.L382:
        nop
        j       .L369
.L383:
        nop
        j       .L369
.L384:
        nop
.L369:
        lw      a5,-20(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L385
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    analyze_type
.L385:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
get_cwd:
        addi    sp,sp,-16
        sw      ra,12(sp)
        sw      s0,8(sp)
        addi    s0,sp,16
        li      a1,0
        li      a0,0
        call    getcwd
        mv      a5,a0
        mv      a0,a5
        lw      ra,12(sp)
        lw      s0,8(sp)
        addi    sp,sp,16
        jr      ra
normalization:
        addi    sp,sp,-112
        sw      ra,108(sp)
        sw      s0,104(sp)
        sw      s1,100(sp)
        addi    s0,sp,112
        sw      a0,-100(s0)
        lw      a5,-100(s0)
        beq     a5,zero,.L389
        lw      a5,-100(s0)
        lbu     a5,0(a5)
        bne     a5,zero,.L390
.L389:
        li      a5,0
        j       .L428
.L390:
        sw      zero,-20(s0)
        lw      a5,-100(s0)
        lbu     a5,0(a5)
        addi    a5,a5,-47
        seqz    a5,a5
        sb      a5,-53(s0)
        lbu     a5,-53(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L392
        call    get_cwd
        sw      a0,-20(s0)
.L392:
        sw      zero,-24(s0)
        lw      a5,-20(s0)
        beq     a5,zero,.L393
        lw      a5,-24(s0)
        addi    a4,a5,1
        sw      a4,-24(s0)
        addi    a4,s0,-96
        slli    a5,a5,2
        add     a5,a5,a4
        lw      a4,-20(s0)
        sw      a4,0(a5)
.L393:
        lw      a5,-24(s0)
        addi    a4,a5,1
        sw      a4,-24(s0)
        addi    a4,s0,-96
        slli    a5,a5,2
        add     a5,a5,a4
        lw      a4,-100(s0)
        sw      a4,0(a5)
        lw      a0,-100(s0)
        call    strlen
        mv      s1,a0
        lw      a5,-20(s0)
        beq     a5,zero,.L394
        lw      a0,-20(s0)
        call    strlen
        mv      a5,a0
        j       .L395
.L394:
        li      a5,0
.L395:
        add     a5,a5,s1
        addi    a5,a5,2
        sw      a5,-60(s0)
        lw      a5,-60(s0)
        addi    a5,a5,1
        li      a1,0
        mv      a0,a5
        call    alloc_memory
        sw      a0,-64(s0)
        lw      a5,-64(s0)
        bne     a5,zero,.L396
        lw      a5,-20(s0)
        beq     a5,zero,.L397
        lw      a0,-20(s0)
        call    free
.L397:
        lw      a5,-100(s0)
        j       .L428
.L396:
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a5,a5,2
        li      a1,0
        mv      a0,a5
        call    alloc_memory
        sw      a0,-68(s0)
        lw      a5,-68(s0)
        bne     a5,zero,.L398
        lw      a5,-20(s0)
        beq     a5,zero,.L399
        lw      a0,-20(s0)
        call    free
.L399:
        lw      a5,-100(s0)
        j       .L428
.L398:
        sw      zero,-28(s0)
        sw      zero,-32(s0)
        sw      zero,-36(s0)
        sb      zero,-37(s0)
        sw      zero,-44(s0)
        j       .L400
.L425:
        lw      a4,-44(s0)
        addi    a5,s0,-96
        slli    a4,a4,2
        add     a5,a4,a5
        lw      a5,0(a5)
        sw      a5,-76(s0)
        sw      zero,-48(s0)
        lw      a5,-44(s0)
        bne     a5,zero,.L404
        lw      a5,-76(s0)
        lbu     a4,0(a5)
        li      a5,47
        bne     a4,a5,.L404
        lw      a5,-28(s0)
        addi    a4,a5,1
        sw      a4,-28(s0)
        lw      a4,-64(s0)
        add     a5,a4,a5
        li      a4,47
        sb      a4,0(a5)
        li      a5,1
        sb      a5,-37(s0)
        li      a5,1
        sw      a5,-36(s0)
        lw      a5,-32(s0)
        addi    a4,a5,1
        sw      a4,-32(s0)
        slli    a5,a5,2
        lw      a4,-68(s0)
        add     a5,a4,a5
        lw      a4,-28(s0)
        sw      a4,0(a5)
        j       .L402
.L403:
        lw      a5,-48(s0)
        addi    a5,a5,1
        sw      a5,-48(s0)
.L402:
        lw      a4,-76(s0)
        lw      a5,-48(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,47
        beq     a4,a5,.L403
        j       .L404
.L406:
        lw      a5,-48(s0)
        addi    a5,a5,1
        sw      a5,-48(s0)
.L405:
        lw      a4,-76(s0)
        lw      a5,-48(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,47
        beq     a4,a5,.L406
        lw      a4,-76(s0)
        lw      a5,-48(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,92
        beq     a4,a5,.L406
        lw      a5,-48(s0)
        sw      a5,-80(s0)
        j       .L407
.L409:
        lw      a5,-48(s0)
        addi    a5,a5,1
        sw      a5,-48(s0)
.L407:
        lw      a4,-76(s0)
        lw      a5,-48(s0)
        add     a5,a4,a5
        lbu     a5,0(a5)
        beq     a5,zero,.L408
        lw      a4,-76(s0)
        lw      a5,-48(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,47
        beq     a4,a5,.L408
        lw      a4,-76(s0)
        lw      a5,-48(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,92
        bne     a4,a5,.L409
.L408:
        lw      a4,-48(s0)
        lw      a5,-80(s0)
        sub     a5,a4,a5
        sw      a5,-84(s0)
        lw      a5,-84(s0)
        beq     a5,zero,.L429
        lw      a4,-84(s0)
        li      a5,1
        bne     a4,a5,.L412
        lw      a4,-76(s0)
        lw      a5,-80(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,46
        bne     a4,a5,.L412
        j       .L404
.L412:
        lw      a4,-84(s0)
        li      a5,2
        bne     a4,a5,.L413
        lw      a4,-76(s0)
        lw      a5,-80(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,46
        bne     a4,a5,.L413
        lw      a5,-80(s0)
        addi    a5,a5,1
        lw      a4,-76(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,46
        bne     a4,a5,.L413
        lw      a4,-32(s0)
        lw      a5,-36(s0)
        bleu    a4,a5,.L414
        lw      a4,-32(s0)
        li      a5,1
        bne     a4,a5,.L415
        lw      a5,-36(s0)
        beq     a5,zero,.L416
        lw      a5,-28(s0)
        sw      a5,-52(s0)
        j       .L417
.L416:
        sw      zero,-52(s0)
        j       .L417
.L415:
        lw      a4,-32(s0)
        li      a5,1073741824
        addi    a5,a5,-2
        add     a5,a4,a5
        slli    a5,a5,2
        lw      a4,-68(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        addi    a5,a5,1
        sw      a5,-52(s0)
.L417:
        lw      a4,-32(s0)
        li      a5,1073741824
        addi    a5,a5,-1
        add     a5,a4,a5
        slli    a5,a5,2
        lw      a4,-68(s0)
        add     a5,a4,a5
        lw      a4,0(a5)
        lw      a5,-52(s0)
        sub     a5,a4,a5
        sw      a5,-88(s0)
        lw      a4,-88(s0)
        li      a5,2
        bne     a4,a5,.L418
        lw      a4,-64(s0)
        lw      a5,-52(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,46
        bne     a4,a5,.L418
        lw      a5,-52(s0)
        addi    a5,a5,1
        lw      a4,-64(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,46
        beq     a4,a5,.L414
.L418:
        lw      a4,-32(s0)
        li      a5,1
        bne     a4,a5,.L419
        sw      zero,-28(s0)
        j       .L420
.L419:
        lw      a4,-32(s0)
        li      a5,1073741824
        addi    a5,a5,-2
        add     a5,a4,a5
        slli    a5,a5,2
        lw      a4,-68(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        sw      a5,-28(s0)
.L420:
        lw      a5,-32(s0)
        addi    a5,a5,-1
        sw      a5,-32(s0)
        j       .L404
.L414:
        lbu     a5,-37(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L404
        lw      a5,-28(s0)
        beq     a5,zero,.L422
        lw      a5,-28(s0)
        addi    a5,a5,-1
        lw      a4,-64(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,47
        beq     a4,a5,.L422
        lw      a5,-28(s0)
        addi    a4,a5,1
        sw      a4,-28(s0)
        lw      a4,-64(s0)
        add     a5,a4,a5
        li      a4,47
        sb      a4,0(a5)
.L422:
        lw      a5,-28(s0)
        addi    a4,a5,1
        sw      a4,-28(s0)
        lw      a4,-64(s0)
        add     a5,a4,a5
        li      a4,46
        sb      a4,0(a5)
        lw      a5,-28(s0)
        addi    a4,a5,1
        sw      a4,-28(s0)
        lw      a4,-64(s0)
        add     a5,a4,a5
        li      a4,46
        sb      a4,0(a5)
        lw      a5,-32(s0)
        addi    a4,a5,1
        sw      a4,-32(s0)
        slli    a5,a5,2
        lw      a4,-68(s0)
        add     a5,a4,a5
        lw      a4,-28(s0)
        sw      a4,0(a5)
        j       .L404
.L413:
        lw      a5,-28(s0)
        beq     a5,zero,.L423
        lw      a5,-28(s0)
        addi    a5,a5,-1
        lw      a4,-64(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,47
        beq     a4,a5,.L423
        lw      a5,-28(s0)
        addi    a4,a5,1
        sw      a4,-28(s0)
        lw      a4,-64(s0)
        add     a5,a4,a5
        li      a4,47
        sb      a4,0(a5)
.L423:
        lw      a4,-64(s0)
        lw      a5,-28(s0)
        add     a3,a4,a5
        lw      a4,-76(s0)
        lw      a5,-80(s0)
        add     a5,a4,a5
        lw      a2,-84(s0)
        mv      a1,a5
        mv      a0,a3
        call    memcpy
        lw      a4,-28(s0)
        lw      a5,-84(s0)
        add     a5,a4,a5
        sw      a5,-28(s0)
        lw      a5,-32(s0)
        addi    a4,a5,1
        sw      a4,-32(s0)
        slli    a5,a5,2
        lw      a4,-68(s0)
        add     a5,a4,a5
        lw      a4,-28(s0)
        sw      a4,0(a5)
.L404:
        lw      a4,-76(s0)
        lw      a5,-48(s0)
        add     a5,a4,a5
        lbu     a5,0(a5)
        bne     a5,zero,.L405
        j       .L411
.L429:
        nop
.L411:
        lw      a5,-44(s0)
        addi    a5,a5,1
        sw      a5,-44(s0)
.L400:
        lw      a4,-44(s0)
        lw      a5,-24(s0)
        bltu    a4,a5,.L425
        lw      a5,-28(s0)
        bne     a5,zero,.L426
        lw      a5,-28(s0)
        addi    a4,a5,1
        sw      a4,-28(s0)
        lw      a4,-64(s0)
        add     a5,a4,a5
        li      a4,46
        sb      a4,0(a5)
.L426:
        lw      a4,-64(s0)
        lw      a5,-28(s0)
        add     a5,a4,a5
        sb      zero,0(a5)
        lw      a1,-28(s0)
        lw      a0,-64(s0)
        call    create_string
        sw      a0,-72(s0)
        lw      a5,-20(s0)
        beq     a5,zero,.L427
        lw      a0,-20(s0)
        call    free
.L427:
        lw      a5,-72(s0)
.L428:
        mv      a0,a5
        lw      ra,108(sp)
        lw      s0,104(sp)
        lw      s1,100(sp)
        addi    sp,sp,112
        jr      ra
create_file:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        li      a1,1
        li      a0,4
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a0,-36(s0)
        call    normalization
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC39:
        .string "[fill Error] at <read_source_code> Cannot open file: %s\n"
read_source_code:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lui     a5,%hi(.LC10)
        addi    a1,a5,%lo(.LC10)
        mv      a0,a4
        call    fopen
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        bne     a5,zero,.L433
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a2,a5
        lui     a5,%hi(.LC39)
        addi    a1,a5,%lo(.LC39)
        mv      a0,a4
        call    fprintf
        li      a5,0
        j       .L434
.L433:
        li      a2,2
        li      a1,0
        lw      a0,-24(s0)
        call    fseek
        lw      a0,-24(s0)
        call    ftell
        mv      a5,a0
        mv      a4,a5
        lw      a5,-40(s0)
        sw      a4,0(a5)
        li      a2,0
        li      a1,0
        lw      a0,-24(s0)
        call    fseek
        lw      a5,-40(s0)
        lw      a5,0(a5)
        li      a1,0
        mv      a0,a5
        call    alloc_memory
        sw      a0,-28(s0)
        lw      a5,-40(s0)
        lw      a5,0(a5)
        lw      a3,-24(s0)
        mv      a2,a5
        li      a1,1
        lw      a0,-28(s0)
        call    fread
        sw      a0,-32(s0)
        lw      a5,-32(s0)
        sw      a5,-20(s0)
        j       .L435
.L436:
        lw      a4,-28(s0)
        lw      a5,-20(s0)
        add     a5,a4,a5
        sb      zero,0(a5)
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L435:
        lw      a5,-40(s0)
        lw      a5,0(a5)
        lw      a4,-20(s0)
        bltu    a4,a5,.L436
        lw      a5,-40(s0)
        lw      a4,-32(s0)
        sw      a4,0(a5)
        lw      a0,-24(s0)
        call    fclose
        lw      a5,-28(s0)
.L434:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
file_full_path:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC40:
        .string "%s%s"
.LC41:
        .string "%.*s%s"
change_extension:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        lw      a0,-24(s0)
        call    strlen
        sw      a0,-28(s0)
        lw      a5,-28(s0)
        sw      a5,-20(s0)
        j       .L440
.L442:
        lw      a5,-20(s0)
        addi    a5,a5,-1
        sw      a5,-20(s0)
.L440:
        lw      a5,-20(s0)
        beq     a5,zero,.L441
        lw      a5,-20(s0)
        addi    a5,a5,-1
        lw      a4,-24(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,46
        beq     a4,a5,.L441
        lw      a5,-20(s0)
        addi    a5,a5,-1
        lw      a4,-24(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,47
        beq     a4,a5,.L441
        lw      a5,-20(s0)
        addi    a5,a5,-1
        lw      a4,-24(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,92
        bne     a4,a5,.L442
.L441:
        lw      a5,-20(s0)
        beq     a5,zero,.L443
        lw      a5,-20(s0)
        addi    a5,a5,-1
        lw      a4,-24(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,47
        beq     a4,a5,.L443
        lw      a5,-20(s0)
        addi    a5,a5,-1
        lw      a4,-24(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,92
        bne     a4,a5,.L444
.L443:
        lw      a2,-40(s0)
        lw      a1,-24(s0)
        lui     a5,%hi(.LC40)
        addi    a0,a5,%lo(.LC40)
        call    string_splice
        mv      a5,a0
        j       .L445
.L444:
        lw      a5,-20(s0)
        addi    a5,a5,-1
        lw      a3,-40(s0)
        lw      a2,-24(s0)
        mv      a1,a5
        lui     a5,%hi(.LC41)
        addi    a0,a5,%lo(.LC41)
        call    string_splice
        mv      a5,a0
.L445:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC42:
        .string "."
file_dir_path:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        lw      a0,-24(s0)
        call    strlen
        sw      a0,-20(s0)
        j       .L447
.L449:
        lw      a5,-20(s0)
        addi    a5,a5,-1
        sw      a5,-20(s0)
.L447:
        lw      a5,-20(s0)
        beq     a5,zero,.L448
        lw      a5,-20(s0)
        addi    a5,a5,-1
        lw      a4,-24(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,47
        beq     a4,a5,.L448
        lw      a5,-20(s0)
        addi    a5,a5,-1
        lw      a4,-24(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        li      a5,92
        bne     a4,a5,.L449
.L448:
        lw      a5,-20(s0)
        bne     a5,zero,.L450
        lui     a5,%hi(.LC42)
        addi    a5,a5,%lo(.LC42)
        j       .L451
.L450:
        lw      a5,-20(s0)
        addi    a5,a5,-1
        mv      a1,a5
        lw      a0,-24(s0)
        call    create_string
        mv      a5,a0
.L451:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
is_keyword:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      zero,-20(s0)
        j       .L453
.L456:
        lui     a5,%hi(keywordList)
        addi    a4,a5,%lo(keywordList)
        lw      a5,-20(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        lw      a4,-36(s0)
        bne     a4,a5,.L454
        li      a5,1
        j       .L455
.L454:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L453:
        lw      a4,-20(s0)
        li      a5,23
        bleu    a4,a5,.L456
        li      a5,0
.L455:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
create_token:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        sw      a3,-48(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        lw      a5,-36(s0)
        bne     a5,zero,.L458
        lw      a0,-40(s0)
        call    is_keyword
        mv      a5,a0
        beq     a5,zero,.L458
        lw      a5,-20(s0)
        li      a4,5
        sw      a4,0(a5)
.L458:
        lw      a4,-36(s0)
        li      a5,8
        bne     a4,a5,.L459
        lw      a0,-40(s0)
        call    is_special
        mv      a5,a0
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L459
        li      a5,0
        j       .L460
.L459:
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,4(a5)
        lw      a5,-20(s0)
        lw      a4,-44(s0)
        sw      a4,8(a5)
        lw      a5,-20(s0)
        lw      a4,-48(s0)
        sw      a4,12(a5)
        lw      a5,-20(s0)
.L460:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC43:
        .string "Invalid special method"
.LC44:
        .string "[lexer Error] at %s:%zu:%zu: %s\n"
.LC45:
        .string "Unterminated string literal"
.LC46:
        .zero   2
.LC47:
        .string "Unterminated comment"
.LC48:
        .string "Unexpected character"
get_token:
        addi    sp,sp,-112
        sw      ra,108(sp)
        sw      s0,104(sp)
        sw      s1,100(sp)
        addi    s0,sp,112
        sw      a0,-100(s0)
.L533:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lbu     a5,-17(s0)
        bne     a5,zero,.L462
        lw      a5,-100(s0)
        lw      a4,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        mv      a3,a5
        mv      a2,a4
        li      a1,0
        li      a0,7
        call    create_token
        mv      a5,a0
        j       .L463
.L462:
        lbu     a4,-17(s0)
        li      a5,32
        beq     a4,a5,.L534
        lbu     a4,-17(s0)
        li      a5,9
        beq     a4,a5,.L534
        lbu     a4,-17(s0)
        li      a5,13
        beq     a4,a5,.L534
        lbu     a4,-17(s0)
        li      a5,10
        bne     a4,a5,.L467
        lw      a5,-100(s0)
        lw      a5,4(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,4(a5)
        lw      a5,-100(s0)
        sw      zero,8(a5)
        j       .L466
.L467:
        lbu     a4,-17(s0)
        li      a5,96
        bleu    a4,a5,.L468
        lbu     a4,-17(s0)
        li      a5,122
        bleu    a4,a5,.L469
.L468:
        lbu     a4,-17(s0)
        li      a5,64
        bleu    a4,a5,.L470
        lbu     a4,-17(s0)
        li      a5,90
        bleu    a4,a5,.L469
.L470:
        lbu     a4,-17(s0)
        li      a5,95
        beq     a4,a5,.L469
        lbu     a4,-17(s0)
        li      a5,36
        bne     a4,a5,.L471
.L469:
        lbu     a5,-17(s0)
        addi    a5,a5,-36
        seqz    a5,a5
        sb      a5,-69(s0)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a5,a5,-1
        sw      a5,-76(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        sw      a5,-80(s0)
.L473:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lbu     a4,-17(s0)
        li      a5,96
        bleu    a4,a5,.L472
        lbu     a4,-17(s0)
        li      a5,122
        bleu    a4,a5,.L473
.L472:
        lbu     a4,-17(s0)
        li      a5,64
        bleu    a4,a5,.L474
        lbu     a4,-17(s0)
        li      a5,90
        bleu    a4,a5,.L473
.L474:
        lbu     a4,-17(s0)
        li      a5,47
        bleu    a4,a5,.L475
        lbu     a4,-17(s0)
        li      a5,57
        bleu    a4,a5,.L473
.L475:
        lbu     a4,-17(s0)
        li      a5,95
        beq     a4,a5,.L473
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,-1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,-1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-76(s0)
        add     a3,a4,a5
        lw      a5,-100(s0)
        lw      a4,12(a5)
        lw      a5,-76(s0)
        sub     a5,a4,a5
        mv      a1,a5
        mv      a0,a3
        call    create_string
        sw      a0,-84(s0)
        lbu     a5,-69(s0)
        beq     a5,zero,.L476
        lw      a5,-100(s0)
        lw      a5,4(a5)
        lw      a3,-80(s0)
        mv      a2,a5
        lw      a1,-84(s0)
        li      a0,8
        call    create_token
        sw      a0,-88(s0)
        lw      a5,-88(s0)
        bne     a5,zero,.L477
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-100(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-100(s0)
        lw      a5,4(a5)
        addi    a3,a5,1
        lw      a5,-80(s0)
        addi    a4,a5,1
        lui     a5,%hi(.LC43)
        addi    a5,a5,%lo(.LC43)
        lui     a1,%hi(.LC44)
        addi    a1,a1,%lo(.LC44)
        mv      a0,s1
        call    fprintf
        lw      a5,-100(s0)
        lw      a5,4(a5)
        lw      a3,-80(s0)
        mv      a2,a5
        lw      a1,-84(s0)
        li      a0,0
        call    create_token
        mv      a5,a0
        j       .L463
.L477:
        lw      a5,-88(s0)
        j       .L463
.L476:
        lw      a5,-100(s0)
        lw      a5,4(a5)
        lw      a3,-80(s0)
        mv      a2,a5
        lw      a1,-84(s0)
        li      a0,0
        call    create_token
        mv      a5,a0
        j       .L463
.L471:
        lbu     a4,-17(s0)
        li      a5,47
        bleu    a4,a5,.L478
        lbu     a4,-17(s0)
        li      a5,57
        bgtu    a4,a5,.L478
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a5,a5,-1
        sw      a5,-32(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        sw      a5,-36(s0)
        j       .L479
.L481:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
.L479:
        lbu     a4,-17(s0)
        li      a5,47
        bleu    a4,a5,.L480
        lbu     a4,-17(s0)
        li      a5,57
        bleu    a4,a5,.L481
.L480:
        li      a5,1
        sw      a5,-24(s0)
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-37(s0)
        lbu     a4,-17(s0)
        li      a5,46
        bne     a4,a5,.L482
        lbu     a4,-37(s0)
        li      a5,47
        bleu    a4,a5,.L482
        lbu     a4,-37(s0)
        li      a5,57
        bgtu    a4,a5,.L482
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        j       .L483
.L485:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
.L483:
        lbu     a4,-17(s0)
        li      a5,47
        bleu    a4,a5,.L484
        lbu     a4,-17(s0)
        li      a5,57
        bleu    a4,a5,.L485
.L484:
        li      a5,2
        sw      a5,-24(s0)
.L482:
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,-1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,-1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-32(s0)
        add     a3,a4,a5
        lw      a5,-100(s0)
        lw      a4,12(a5)
        lw      a5,-32(s0)
        sub     a5,a4,a5
        mv      a1,a5
        mv      a0,a3
        call    create_string
        mv      a4,a0
        lw      a5,-100(s0)
        lw      a5,4(a5)
        lw      a3,-36(s0)
        mv      a2,a5
        mv      a1,a4
        lw      a0,-24(s0)
        call    create_token
        mv      a5,a0
        j       .L463
.L478:
        lbu     a4,-17(s0)
        li      a5,34
        bne     a4,a5,.L486
        lw      a5,-100(s0)
        lw      a5,12(a5)
        sw      a5,-64(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        sw      a5,-68(s0)
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        j       .L487
.L489:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
.L487:
        lbu     a4,-17(s0)
        li      a5,34
        beq     a4,a5,.L488
        lbu     a5,-17(s0)
        beq     a5,zero,.L488
        lbu     a4,-17(s0)
        li      a5,10
        bne     a4,a5,.L489
.L488:
        lbu     a4,-17(s0)
        li      a5,34
        beq     a4,a5,.L490
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-100(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-100(s0)
        lw      a5,4(a5)
        addi    a3,a5,1
        lui     a5,%hi(.LC45)
        addi    a5,a5,%lo(.LC45)
        lw      a4,-64(s0)
        lui     a1,%hi(.LC44)
        addi    a1,a1,%lo(.LC44)
        mv      a0,s1
        call    fprintf
        lbu     a4,-17(s0)
        li      a5,10
        bne     a4,a5,.L490
        lw      a5,-100(s0)
        lw      a5,4(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,4(a5)
        lw      a5,-100(s0)
        sw      zero,8(a5)
.L490:
        lw      a5,-100(s0)
        lw      a4,12(a5)
        lw      a5,-64(s0)
        sub     a4,a4,a5
        li      a5,1
        bne     a4,a5,.L491
        li      a1,1
        lui     a5,%hi(.LC46)
        addi    a0,a5,%lo(.LC46)
        call    create_string
        mv      a4,a0
        lw      a5,-100(s0)
        lw      a5,4(a5)
        lw      a3,-68(s0)
        mv      a2,a5
        mv      a1,a4
        li      a0,3
        call    create_token
        mv      a5,a0
        j       .L463
.L491:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-64(s0)
        add     a3,a4,a5
        lw      a5,-100(s0)
        lw      a4,12(a5)
        lw      a5,-64(s0)
        sub     a5,a4,a5
        addi    a5,a5,-1
        mv      a1,a5
        mv      a0,a3
        call    create_string
        mv      a4,a0
        lw      a5,-100(s0)
        lw      a5,4(a5)
        lw      a3,-68(s0)
        mv      a2,a5
        mv      a1,a4
        li      a0,3
        call    create_token
        mv      a5,a0
        j       .L463
.L486:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-25(s0)
        lbu     a4,-17(s0)
        li      a5,47
        bne     a4,a5,.L492
        lbu     a4,-25(s0)
        li      a5,47
        bne     a4,a5,.L492
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a5,a5,1
        sw      a5,-44(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        sw      a5,-48(s0)
        j       .L493
.L495:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
.L493:
        lbu     a4,-17(s0)
        li      a5,10
        beq     a4,a5,.L494
        lbu     a5,-17(s0)
        bne     a5,zero,.L495
.L494:
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,-1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,-1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-44(s0)
        add     a3,a4,a5
        lw      a5,-100(s0)
        lw      a4,12(a5)
        lw      a5,-44(s0)
        sub     a5,a4,a5
        mv      a1,a5
        mv      a0,a3
        call    create_string
        mv      a4,a0
        lw      a5,-100(s0)
        lw      a5,4(a5)
        lw      a3,-48(s0)
        mv      a2,a5
        mv      a1,a4
        li      a0,6
        call    create_token
        mv      a5,a0
        j       .L463
.L492:
        lbu     a4,-17(s0)
        li      a5,47
        bne     a4,a5,.L496
        lbu     a4,-25(s0)
        li      a5,42
        bne     a4,a5,.L496
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a5,a5,1
        sw      a5,-52(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        sw      a5,-56(s0)
        lw      a5,-100(s0)
        lw      a5,4(a5)
        sw      a5,-60(s0)
        j       .L497
.L500:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-25(s0)
        lbu     a4,-17(s0)
        li      a5,10
        bne     a4,a5,.L498
        lw      a5,-100(s0)
        lw      a5,4(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,4(a5)
        lw      a5,-100(s0)
        sw      zero,8(a5)
.L498:
        lbu     a5,-25(s0)
        beq     a5,zero,.L535
.L497:
        lbu     a4,-17(s0)
        li      a5,42
        bne     a4,a5,.L500
        lbu     a4,-25(s0)
        li      a5,47
        bne     a4,a5,.L500
        j       .L499
.L535:
        nop
.L499:
        lbu     a5,-25(s0)
        bne     a5,zero,.L501
        lbu     a5,-17(s0)
        bne     a5,zero,.L502
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,-1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,-1
        lw      a5,-100(s0)
        sw      a4,8(a5)
.L502:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-100(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-100(s0)
        lw      a5,4(a5)
        addi    a3,a5,1
        lw      a5,-52(s0)
        addi    a4,a5,1
        lui     a5,%hi(.LC47)
        addi    a5,a5,%lo(.LC47)
        lui     a1,%hi(.LC44)
        addi    a1,a1,%lo(.LC44)
        mv      a0,s1
        call    fprintf
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-52(s0)
        add     a3,a4,a5
        lw      a5,-100(s0)
        lw      a4,12(a5)
        lw      a5,-52(s0)
        sub     a5,a4,a5
        mv      a1,a5
        mv      a0,a3
        call    create_string
        mv      a5,a0
        lw      a3,-56(s0)
        lw      a2,-60(s0)
        mv      a1,a5
        li      a0,6
        call    create_token
        mv      a5,a0
        j       .L463
.L501:
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a2,a5,1
        lw      a3,-100(s0)
        sw      a2,12(a3)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-17(s0)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a4,20(a5)
        lw      a5,-52(s0)
        add     a3,a4,a5
        lw      a5,-100(s0)
        lw      a4,12(a5)
        lw      a5,-52(s0)
        sub     a5,a4,a5
        addi    a5,a5,-2
        mv      a1,a5
        mv      a0,a3
        call    create_string
        mv      a5,a0
        lw      a3,-56(s0)
        lw      a2,-60(s0)
        mv      a1,a5
        li      a0,6
        call    create_token
        mv      a5,a0
        j       .L463
.L496:
        lbu     a4,-17(s0)
        li      a5,61
        bne     a4,a5,.L503
        lbu     a4,-25(s0)
        li      a5,61
        bne     a4,a5,.L503
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_EQ)
        lw      a4,%lo(SYMBOL_EQ)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L503:
        lbu     a4,-17(s0)
        li      a5,33
        bne     a4,a5,.L504
        lbu     a4,-25(s0)
        li      a5,61
        bne     a4,a5,.L504
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_NE)
        lw      a4,%lo(SYMBOL_NE)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L504:
        lbu     a4,-17(s0)
        li      a5,60
        bne     a4,a5,.L505
        lbu     a4,-25(s0)
        li      a5,61
        bne     a4,a5,.L505
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_LE)
        lw      a4,%lo(SYMBOL_LE)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L505:
        lbu     a4,-17(s0)
        li      a5,62
        bne     a4,a5,.L506
        lbu     a4,-25(s0)
        li      a5,61
        bne     a4,a5,.L506
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_GE)
        lw      a4,%lo(SYMBOL_GE)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L506:
        lbu     a4,-17(s0)
        li      a5,43
        bne     a4,a5,.L507
        lbu     a4,-25(s0)
        li      a5,61
        bne     a4,a5,.L507
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_ADD_ASSIGN)
        lw      a4,%lo(SYMBOL_ADD_ASSIGN)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L507:
        lbu     a4,-17(s0)
        li      a5,45
        bne     a4,a5,.L508
        lbu     a4,-25(s0)
        li      a5,61
        bne     a4,a5,.L508
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_SUB_ASSIGN)
        lw      a4,%lo(SYMBOL_SUB_ASSIGN)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L508:
        lbu     a4,-17(s0)
        li      a5,42
        bne     a4,a5,.L509
        lbu     a4,-25(s0)
        li      a5,61
        bne     a4,a5,.L509
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_MUL_ASSIGN)
        lw      a4,%lo(SYMBOL_MUL_ASSIGN)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L509:
        lbu     a4,-17(s0)
        li      a5,47
        bne     a4,a5,.L510
        lbu     a4,-25(s0)
        li      a5,61
        bne     a4,a5,.L510
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_DIV_ASSIGN)
        lw      a4,%lo(SYMBOL_DIV_ASSIGN)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L510:
        lbu     a4,-17(s0)
        li      a5,37
        bne     a4,a5,.L511
        lbu     a4,-25(s0)
        li      a5,61
        bne     a4,a5,.L511
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_MOD_ASSIGN)
        lw      a4,%lo(SYMBOL_MOD_ASSIGN)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L511:
        lbu     a4,-17(s0)
        li      a5,38
        bne     a4,a5,.L512
        lbu     a4,-25(s0)
        li      a5,38
        bne     a4,a5,.L512
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_AND)
        lw      a4,%lo(SYMBOL_AND)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L512:
        lbu     a4,-17(s0)
        li      a5,124
        bne     a4,a5,.L513
        lbu     a4,-25(s0)
        li      a5,124
        bne     a4,a5,.L513
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,8(a5)
        lw      a5,-100(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lw      a5,-100(s0)
        sw      a4,12(a5)
        lui     a5,%hi(SYMBOL_OR)
        lw      a4,%lo(SYMBOL_OR)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-2
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L513:
        lbu     a4,-17(s0)
        li      a5,40
        bne     a4,a5,.L514
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a4,%lo(SYMBOL_L_PAREN)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L514:
        lbu     a4,-17(s0)
        li      a5,41
        bne     a4,a5,.L515
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a4,%lo(SYMBOL_R_PAREN)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L515:
        lbu     a4,-17(s0)
        li      a5,123
        bne     a4,a5,.L516
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a4,%lo(SYMBOL_L_BRACE)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L516:
        lbu     a4,-17(s0)
        li      a5,125
        bne     a4,a5,.L517
        lui     a5,%hi(SYMBOL_R_BRACE)
        lw      a4,%lo(SYMBOL_R_BRACE)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L517:
        lbu     a4,-17(s0)
        li      a5,44
        bne     a4,a5,.L518
        lui     a5,%hi(SYMBOL_COMMA)
        lw      a4,%lo(SYMBOL_COMMA)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L518:
        lbu     a4,-17(s0)
        li      a5,33
        bne     a4,a5,.L519
        lui     a5,%hi(SYMBOL_NOT)
        lw      a4,%lo(SYMBOL_NOT)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L519:
        lbu     a4,-17(s0)
        li      a5,46
        bne     a4,a5,.L520
        lui     a5,%hi(SYMBOL_DOT)
        lw      a4,%lo(SYMBOL_DOT)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L520:
        lbu     a4,-17(s0)
        li      a5,91
        bne     a4,a5,.L521
        lui     a5,%hi(SYMBOL_L_BRACKET)
        lw      a4,%lo(SYMBOL_L_BRACKET)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L521:
        lbu     a4,-17(s0)
        li      a5,93
        bne     a4,a5,.L522
        lui     a5,%hi(SYMBOL_R_BRACKET)
        lw      a4,%lo(SYMBOL_R_BRACKET)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L522:
        lbu     a4,-17(s0)
        li      a5,59
        bne     a4,a5,.L523
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a4,%lo(SYMBOL_SEMICOLON)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L523:
        lbu     a4,-17(s0)
        li      a5,95
        bne     a4,a5,.L524
        lui     a5,%hi(SYMBOL_UNDERLINE)
        lw      a4,%lo(SYMBOL_UNDERLINE)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L524:
        lbu     a4,-17(s0)
        li      a5,43
        bne     a4,a5,.L525
        lui     a5,%hi(SYMBOL_ADD)
        lw      a4,%lo(SYMBOL_ADD)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L525:
        lbu     a4,-17(s0)
        li      a5,45
        bne     a4,a5,.L526
        lui     a5,%hi(SYMBOL_SUB)
        lw      a4,%lo(SYMBOL_SUB)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L526:
        lbu     a4,-17(s0)
        li      a5,42
        bne     a4,a5,.L527
        lui     a5,%hi(SYMBOL_MUL)
        lw      a4,%lo(SYMBOL_MUL)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L527:
        lbu     a4,-17(s0)
        li      a5,47
        bne     a4,a5,.L528
        lui     a5,%hi(SYMBOL_DIV)
        lw      a4,%lo(SYMBOL_DIV)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L528:
        lbu     a4,-17(s0)
        li      a5,37
        bne     a4,a5,.L529
        lui     a5,%hi(SYMBOL_MOD)
        lw      a4,%lo(SYMBOL_MOD)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L529:
        lbu     a4,-17(s0)
        li      a5,60
        bne     a4,a5,.L530
        lui     a5,%hi(SYMBOL_LT)
        lw      a4,%lo(SYMBOL_LT)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L530:
        lbu     a4,-17(s0)
        li      a5,62
        bne     a4,a5,.L531
        lui     a5,%hi(SYMBOL_GT)
        lw      a4,%lo(SYMBOL_GT)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L531:
        lbu     a4,-17(s0)
        li      a5,61
        bne     a4,a5,.L532
        lui     a5,%hi(SYMBOL_ASSIGN)
        lw      a4,%lo(SYMBOL_ASSIGN)(a5)
        lw      a5,-100(s0)
        lw      a2,4(a5)
        lw      a5,-100(s0)
        lw      a5,8(a5)
        addi    a5,a5,-1
        mv      a3,a5
        mv      a1,a4
        li      a0,4
        call    create_token
        mv      a5,a0
        j       .L463
.L532:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-100(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-100(s0)
        lw      a5,4(a5)
        addi    a3,a5,1
        lw      a5,-100(s0)
        lw      a4,8(a5)
        lui     a5,%hi(.LC48)
        addi    a5,a5,%lo(.LC48)
        lui     a1,%hi(.LC44)
        addi    a1,a1,%lo(.LC44)
        mv      a0,s1
        call    fprintf
        li      a3,0
        li      a2,0
        li      a1,0
        li      a0,7
        call    create_token
        mv      a5,a0
        j       .L463
.L534:
        nop
.L466:
        j       .L533
.L463:
        mv      a0,a5
        lw      ra,108(sp)
        lw      s0,104(sp)
        lw      s1,100(sp)
        addi    sp,sp,112
        jr      ra
get_next_token:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,28(a5)
        beq     a5,zero,.L537
        lw      a5,-20(s0)
        lw      a4,28(a5)
        lw      a5,-20(s0)
        sw      a4,24(a5)
        j       .L538
.L537:
        lw      a0,-20(s0)
        call    get_token
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,24(a5)
        lw      a5,-20(s0)
        lbu     a5,32(a5)
        beq     a5,zero,.L538
        lw      a5,-20(s0)
        lw      a5,24(a5)
        lw      a4,0(a5)
        li      a5,6
        beq     a4,a5,.L537
.L538:
        lw      a5,-20(s0)
        sw      zero,28(a5)
        lw      a5,-20(s0)
        lw      a5,24(a5)
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
peek_next_token:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,28(a5)
        bne     a5,zero,.L541
.L542:
        lw      a0,-20(s0)
        call    get_token
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,28(a5)
        lw      a5,-20(s0)
        lbu     a5,32(a5)
        beq     a5,zero,.L541
        lw      a5,-20(s0)
        lw      a5,28(a5)
        lw      a4,0(a5)
        li      a5,6
        beq     a4,a5,.L542
.L541:
        lw      a5,-20(s0)
        lw      a5,28(a5)
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
get_current_token:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,24(a5)
        bne     a5,zero,.L545
.L546:
        lw      a0,-20(s0)
        call    get_token
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,24(a5)
        lw      a5,-20(s0)
        lbu     a5,32(a5)
        beq     a5,zero,.L545
        lw      a5,-20(s0)
        lw      a5,24(a5)
        lw      a4,0(a5)
        li      a5,6
        beq     a4,a5,.L546
.L545:
        lw      a5,-20(s0)
        lw      a5,24(a5)
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
create_lexer:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        li      a1,1
        li      a0,36
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        addi    a5,a5,16
        mv      a1,a5
        lw      a0,-36(s0)
        call    read_source_code
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,20(a5)
        lw      a5,-20(s0)
        sw      zero,4(a5)
        lw      a5,-20(s0)
        sw      zero,8(a5)
        lw      a5,-20(s0)
        sw      zero,12(a5)
        lw      a5,-20(s0)
        sw      zero,24(a5)
        lw      a5,-20(s0)
        sw      zero,28(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC49:
        .string ".lex"
.LC50:
        .string "w"
.LC51:
        .string "\ninfo by lib:\n    %s\n"
output_tokens:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        lui     a5,%hi(.LC49)
        addi    a1,a5,%lo(.LC49)
        lw      a0,-40(s0)
        call    change_extension
        mv      a4,a0
        lui     a5,%hi(.LC50)
        addi    a1,a5,%lo(.LC50)
        mv      a0,a4
        call    fopen
        sw      a0,-24(s0)
        lw      a0,-36(s0)
        call    get_next_token
        sw      a0,-20(s0)
        j       .L551
.L554:
        li      a2,1
        lw      a1,-24(s0)
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,7
        beq     a4,a5,.L555
        lw      a0,-36(s0)
        call    get_next_token
        sw      a0,-20(s0)
.L551:
        lw      a5,-20(s0)
        bne     a5,zero,.L554
        j       .L553
.L555:
        nop
.L553:
        call    get_info
        mv      a5,a0
        mv      a2,a5
        lui     a5,%hi(.LC51)
        addi    a1,a5,%lo(.LC51)
        lw      a0,-24(s0)
        call    fprintf
        lw      a0,-24(s0)
        call    fclose
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC52:
        .string "Token(Type: EOF,         Line: %zu, Column: %zu)\n"
.LC53:
        .string "Token(Type: identifier,  "
.LC54:
        .string "Token(Type: integer,     "
.LC55:
        .string "Token(Type: float,       "
.LC56:
        .string "Token(Type: string,      "
.LC57:
        .string "Token(Type: symbol,      "
.LC58:
        .string "Token(Type: keyword,     "
.LC59:
        .string "Token(Type: comment,     "
.LC60:
        .string "Token(Type: special,     "
.LC61:
        .string "Token(Type: unknown,     Line: %zu, Column: %zu)\n"
.LC62:
        .string "Line: %zu, Column: %zu)\tLexeme: '"
.LC63:
        .string "(EOF, %zu, %zu, '')\n"
.LC64:
        .string "(identifier, "
.LC65:
        .string "(integer, "
.LC66:
        .string "(float, "
.LC67:
        .string "(string, "
.LC68:
        .string "(symbol, "
.LC69:
        .string "(keyword, "
.LC70:
        .string "(comment, "
.LC71:
        .string "(special, "
.LC72:
        .string "(unknown, %zu, %zu, '')\n"
.LC73:
        .string "%zu, %zu, '"
.LC74:
        .string "(null)'\n"
.LC75:
        .string "\\0"
.LC76:
        .string "\\n"
.LC77:
        .string "\\t"
.LC78:
        .string "\\r"
.LC79:
        .string "'\n"
.LC80:
        .string "')\n"
output_one_token:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        mv      a5,a2
        sb      a5,-41(s0)
        lbu     a5,-41(s0)
        beq     a5,zero,.L557
        lw      a5,-36(s0)
        lw      a5,0(a5)
        li      a4,8
        beq     a5,a4,.L558
        li      a4,8
        bgtu    a5,a4,.L559
        li      a4,7
        beq     a5,a4,.L560
        li      a4,7
        bgtu    a5,a4,.L559
        li      a4,6
        beq     a5,a4,.L561
        li      a4,6
        bgtu    a5,a4,.L559
        li      a4,5
        beq     a5,a4,.L562
        li      a4,5
        bgtu    a5,a4,.L559
        li      a4,4
        beq     a5,a4,.L563
        li      a4,4
        bgtu    a5,a4,.L559
        li      a4,3
        beq     a5,a4,.L564
        li      a4,3
        bgtu    a5,a4,.L559
        li      a4,2
        beq     a5,a4,.L565
        li      a4,2
        bgtu    a5,a4,.L559
        beq     a5,zero,.L566
        li      a4,1
        beq     a5,a4,.L567
        j       .L559
.L560:
        lw      a5,-36(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-36(s0)
        lw      a5,12(a5)
        addi    a5,a5,1
        mv      a3,a5
        mv      a2,a4
        lui     a5,%hi(.LC52)
        addi    a1,a5,%lo(.LC52)
        lw      a0,-40(s0)
        call    fprintf
        j       .L556
.L566:
        lw      a3,-40(s0)
        li      a2,25
        li      a1,1
        lui     a5,%hi(.LC53)
        addi    a0,a5,%lo(.LC53)
        call    fwrite
        j       .L569
.L567:
        lw      a3,-40(s0)
        li      a2,25
        li      a1,1
        lui     a5,%hi(.LC54)
        addi    a0,a5,%lo(.LC54)
        call    fwrite
        j       .L569
.L565:
        lw      a3,-40(s0)
        li      a2,25
        li      a1,1
        lui     a5,%hi(.LC55)
        addi    a0,a5,%lo(.LC55)
        call    fwrite
        j       .L569
.L564:
        lw      a3,-40(s0)
        li      a2,25
        li      a1,1
        lui     a5,%hi(.LC56)
        addi    a0,a5,%lo(.LC56)
        call    fwrite
        j       .L569
.L563:
        lw      a3,-40(s0)
        li      a2,25
        li      a1,1
        lui     a5,%hi(.LC57)
        addi    a0,a5,%lo(.LC57)
        call    fwrite
        j       .L569
.L562:
        lw      a3,-40(s0)
        li      a2,25
        li      a1,1
        lui     a5,%hi(.LC58)
        addi    a0,a5,%lo(.LC58)
        call    fwrite
        j       .L569
.L561:
        lw      a3,-40(s0)
        li      a2,25
        li      a1,1
        lui     a5,%hi(.LC59)
        addi    a0,a5,%lo(.LC59)
        call    fwrite
        j       .L569
.L558:
        lw      a3,-40(s0)
        li      a2,25
        li      a1,1
        lui     a5,%hi(.LC60)
        addi    a0,a5,%lo(.LC60)
        call    fwrite
        j       .L569
.L559:
        lw      a5,-36(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-36(s0)
        lw      a5,12(a5)
        addi    a5,a5,1
        mv      a3,a5
        mv      a2,a4
        lui     a5,%hi(.LC61)
        addi    a1,a5,%lo(.LC61)
        lw      a0,-40(s0)
        call    fprintf
        j       .L556
.L569:
        lw      a5,-36(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-36(s0)
        lw      a5,12(a5)
        addi    a5,a5,1
        mv      a3,a5
        mv      a2,a4
        lui     a5,%hi(.LC62)
        addi    a1,a5,%lo(.LC62)
        lw      a0,-40(s0)
        call    fprintf
        j       .L570
.L557:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        li      a4,8
        beq     a5,a4,.L571
        li      a4,8
        bgtu    a5,a4,.L572
        li      a4,7
        beq     a5,a4,.L573
        li      a4,7
        bgtu    a5,a4,.L572
        li      a4,6
        beq     a5,a4,.L574
        li      a4,6
        bgtu    a5,a4,.L572
        li      a4,5
        beq     a5,a4,.L575
        li      a4,5
        bgtu    a5,a4,.L572
        li      a4,4
        beq     a5,a4,.L576
        li      a4,4
        bgtu    a5,a4,.L572
        li      a4,3
        beq     a5,a4,.L577
        li      a4,3
        bgtu    a5,a4,.L572
        li      a4,2
        beq     a5,a4,.L578
        li      a4,2
        bgtu    a5,a4,.L572
        beq     a5,zero,.L579
        li      a4,1
        beq     a5,a4,.L580
        j       .L572
.L573:
        lw      a5,-36(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-36(s0)
        lw      a5,12(a5)
        addi    a5,a5,1
        mv      a3,a5
        mv      a2,a4
        lui     a5,%hi(.LC63)
        addi    a1,a5,%lo(.LC63)
        lw      a0,-40(s0)
        call    fprintf
        j       .L556
.L579:
        lw      a3,-40(s0)
        li      a2,13
        li      a1,1
        lui     a5,%hi(.LC64)
        addi    a0,a5,%lo(.LC64)
        call    fwrite
        j       .L581
.L580:
        lw      a3,-40(s0)
        li      a2,10
        li      a1,1
        lui     a5,%hi(.LC65)
        addi    a0,a5,%lo(.LC65)
        call    fwrite
        j       .L581
.L578:
        lw      a3,-40(s0)
        li      a2,8
        li      a1,1
        lui     a5,%hi(.LC66)
        addi    a0,a5,%lo(.LC66)
        call    fwrite
        j       .L581
.L577:
        lw      a3,-40(s0)
        li      a2,9
        li      a1,1
        lui     a5,%hi(.LC67)
        addi    a0,a5,%lo(.LC67)
        call    fwrite
        j       .L581
.L576:
        lw      a3,-40(s0)
        li      a2,9
        li      a1,1
        lui     a5,%hi(.LC68)
        addi    a0,a5,%lo(.LC68)
        call    fwrite
        j       .L581
.L575:
        lw      a3,-40(s0)
        li      a2,10
        li      a1,1
        lui     a5,%hi(.LC69)
        addi    a0,a5,%lo(.LC69)
        call    fwrite
        j       .L581
.L574:
        lw      a3,-40(s0)
        li      a2,10
        li      a1,1
        lui     a5,%hi(.LC70)
        addi    a0,a5,%lo(.LC70)
        call    fwrite
        j       .L581
.L571:
        lw      a3,-40(s0)
        li      a2,10
        li      a1,1
        lui     a5,%hi(.LC71)
        addi    a0,a5,%lo(.LC71)
        call    fwrite
        j       .L581
.L572:
        lw      a5,-36(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-36(s0)
        lw      a5,12(a5)
        addi    a5,a5,1
        mv      a3,a5
        mv      a2,a4
        lui     a5,%hi(.LC72)
        addi    a1,a5,%lo(.LC72)
        lw      a0,-40(s0)
        call    fprintf
        j       .L556
.L581:
        lw      a5,-36(s0)
        lw      a5,8(a5)
        addi    a4,a5,1
        lw      a5,-36(s0)
        lw      a5,12(a5)
        addi    a5,a5,1
        mv      a3,a5
        mv      a2,a4
        lui     a5,%hi(.LC73)
        addi    a1,a5,%lo(.LC73)
        lw      a0,-40(s0)
        call    fprintf
.L570:
        lw      a5,-36(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L582
        lw      a3,-40(s0)
        li      a2,8
        li      a1,1
        lui     a5,%hi(.LC74)
        addi    a0,a5,%lo(.LC74)
        call    fwrite
        j       .L583
.L582:
        sw      zero,-20(s0)
        j       .L584
.L590:
        lw      a5,-36(s0)
        lw      a4,4(a5)
        lw      a5,-20(s0)
        add     a5,a4,a5
        lbu     a5,0(a5)
        sb      a5,-21(s0)
        lbu     a5,-21(s0)
        bne     a5,zero,.L585
        lw      a3,-40(s0)
        li      a2,2
        li      a1,1
        lui     a5,%hi(.LC75)
        addi    a0,a5,%lo(.LC75)
        call    fwrite
        j       .L586
.L585:
        lbu     a4,-21(s0)
        li      a5,10
        bne     a4,a5,.L587
        lw      a3,-40(s0)
        li      a2,2
        li      a1,1
        lui     a5,%hi(.LC76)
        addi    a0,a5,%lo(.LC76)
        call    fwrite
        j       .L586
.L587:
        lbu     a4,-21(s0)
        li      a5,9
        bne     a4,a5,.L588
        lw      a3,-40(s0)
        li      a2,2
        li      a1,1
        lui     a5,%hi(.LC77)
        addi    a0,a5,%lo(.LC77)
        call    fwrite
        j       .L586
.L588:
        lbu     a4,-21(s0)
        li      a5,13
        bne     a4,a5,.L589
        lw      a3,-40(s0)
        li      a2,2
        li      a1,1
        lui     a5,%hi(.LC78)
        addi    a0,a5,%lo(.LC78)
        call    fwrite
        j       .L586
.L589:
        lbu     a5,-21(s0)
        lw      a1,-40(s0)
        mv      a0,a5
        call    fputc
.L586:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L584:
        lw      a5,-36(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    strlen
        mv      a4,a0
        lw      a5,-20(s0)
        bltu    a5,a4,.L590
.L583:
        lbu     a5,-41(s0)
        beq     a5,zero,.L591
        lw      a3,-40(s0)
        li      a2,2
        li      a1,1
        lui     a5,%hi(.LC79)
        addi    a0,a5,%lo(.LC79)
        call    fwrite
        j       .L556
.L591:
        lw      a3,-40(s0)
        li      a2,3
        li      a1,1
        lui     a5,%hi(.LC80)
        addi    a0,a5,%lo(.LC80)
        call    fwrite
.L556:
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
string_memory:
        .zero   4
struct_memory:
        .zero   4
free_all_memory:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        lui     a5,%hi(string_memory)
        lw      a5,%lo(string_memory)(a5)
        sw      a5,-20(s0)
        j       .L593
.L594:
        lw      a5,-20(s0)
        lw      a5,12(a5)
        sw      a5,-28(s0)
        lw      a5,-20(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    free
        lw      a0,-20(s0)
        call    free
        lw      a5,-28(s0)
        sw      a5,-20(s0)
.L593:
        lw      a5,-20(s0)
        bne     a5,zero,.L594
        lui     a5,%hi(string_memory)
        sw      zero,%lo(string_memory)(a5)
        lui     a5,%hi(struct_memory)
        lw      a5,%lo(struct_memory)(a5)
        sw      a5,-20(s0)
        j       .L595
.L596:
        lw      a5,-20(s0)
        lw      a5,12(a5)
        sw      a5,-24(s0)
        lw      a5,-20(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    free
        lw      a0,-20(s0)
        call    free
        lw      a5,-24(s0)
        sw      a5,-20(s0)
.L595:
        lw      a5,-20(s0)
        bne     a5,zero,.L596
        lui     a5,%hi(struct_memory)
        sw      zero,%lo(struct_memory)(a5)
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC81:
        .string "[lib Fatal] at <create_memory_block>: Cannot allocate memory\n"
create_memory_block:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        li      a0,16
        call    malloc
        mv      a5,a0
        sw      a5,-20(s0)
        lw      a5,-20(s0)
        bne     a5,zero,.L598
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,61
        li      a1,1
        lui     a5,%hi(.LC81)
        addi    a0,a5,%lo(.LC81)
        call    fwrite
        call    free_all_memory
        call    abort
.L598:
        lui     a5,%hi(malloc_allocated)
        lw      a5,%lo(malloc_allocated)(a5)
        addi    a4,a5,16
        lui     a5,%hi(malloc_allocated)
        sw      a4,%lo(malloc_allocated)(a5)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        sw      zero,4(a5)
        lw      a0,-36(s0)
        call    malloc
        mv      a5,a0
        mv      a4,a5
        lw      a5,-20(s0)
        sw      a4,8(a5)
        lw      a5,-20(s0)
        lw      a5,8(a5)
        bne     a5,zero,.L599
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,61
        li      a1,1
        lui     a5,%hi(.LC81)
        addi    a0,a5,%lo(.LC81)
        call    fwrite
        lw      a0,-20(s0)
        call    free
        call    free_all_memory
        call    abort
.L599:
        lui     a5,%hi(malloc_allocated)
        lw      a4,%lo(malloc_allocated)(a5)
        lw      a5,-36(s0)
        add     a4,a4,a5
        lui     a5,%hi(malloc_allocated)
        sw      a4,%lo(malloc_allocated)(a5)
        lw      a5,-20(s0)
        sw      zero,12(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
increase_memory:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a4,0(a5)
        lw      a5,-40(s0)
        add     a5,a4,a5
        mv      a0,a5
        call    create_memory_block
        sw      a0,-20(s0)
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lw      a5,-20(s0)
        sw      a4,12(a5)
        lw      a5,-36(s0)
        lw      a4,-20(s0)
        sw      a4,0(a5)
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
create_string_table:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        li      a1,1
        li      a0,12
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,4(a5)
        lw      a5,-20(s0)
        sw      zero,8(a5)
        li      a1,4
        lw      a0,-36(s0)
        call    calloc
        mv      a5,a0
        mv      a4,a5
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
hash:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a5,-2128830464
        addi    a5,a5,-571
        sw      a5,-20(s0)
        sw      zero,-24(s0)
        j       .L605
.L606:
        lw      a4,-36(s0)
        lw      a5,-24(s0)
        add     a5,a4,a5
        lbu     a5,0(a5)
        mv      a4,a5
        lw      a5,-20(s0)
        xor     a5,a5,a4
        sw      a5,-20(s0)
        lw      a4,-20(s0)
        li      a5,16777216
        addi    a5,a5,403
        mul     a5,a4,a5
        sw      a5,-20(s0)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
.L605:
        lw      a4,-24(s0)
        lw      a5,-40(s0)
        bltu    a4,a5,.L606
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
create_string_check:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        mv      a5,a2
        sb      a5,-41(s0)
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    hash
        sw      a0,-24(s0)
        lui     a5,%hi(string_table)
        lw      a5,%lo(string_table)(a5)
        lw      a5,4(a5)
        lw      a4,-24(s0)
        remu    a5,a4,a5
        sw      a5,-28(s0)
        lbu     a5,-41(s0)
        beq     a5,zero,.L609
        lui     a5,%hi(string_table)
        lw      a5,%lo(string_table)(a5)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        sw      a5,-20(s0)
        j       .L610
.L613:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a4,-40(s0)
        bne     a4,a5,.L611
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a4,-24(s0)
        bne     a4,a5,.L611
        lw      a5,-20(s0)
        lw      a5,12(a5)
        lw      a2,-40(s0)
        lw      a1,-36(s0)
        mv      a0,a5
        call    strncmp
        mv      a5,a0
        bne     a5,zero,.L611
        lw      a5,-20(s0)
        lw      a5,12(a5)
        j       .L612
.L611:
        lw      a5,-20(s0)
        lw      a5,8(a5)
        sw      a5,-20(s0)
.L610:
        lw      a5,-20(s0)
        bne     a5,zero,.L613
.L609:
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-32(s0)
        lw      a5,-32(s0)
        lw      a4,-40(s0)
        sw      a4,0(a5)
        lw      a5,-32(s0)
        lw      a4,-24(s0)
        sw      a4,4(a5)
        lui     a5,%hi(string_table)
        lw      a5,%lo(string_table)(a5)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a4,0(a5)
        lw      a5,-32(s0)
        sw      a4,8(a5)
        lw      a5,-40(s0)
        addi    a5,a5,1
        li      a1,0
        mv      a0,a5
        call    alloc_memory
        mv      a4,a0
        lw      a5,-32(s0)
        sw      a4,12(a5)
        lw      a5,-32(s0)
        lw      a5,12(a5)
        lw      a2,-40(s0)
        lw      a1,-36(s0)
        mv      a0,a5
        call    memcpy
        lw      a5,-32(s0)
        lw      a4,12(a5)
        lw      a5,-40(s0)
        add     a5,a4,a5
        sb      zero,0(a5)
        lui     a5,%hi(string_table)
        lw      a5,%lo(string_table)(a5)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a4,-32(s0)
        sw      a4,0(a5)
        lui     a5,%hi(string_table)
        lw      a5,%lo(string_table)(a5)
        lw      a4,8(a5)
        addi    a4,a4,1
        sw      a4,8(a5)
        lui     a5,%hi(string_count)
        lw      a5,%lo(string_count)(a5)
        addi    a4,a5,1
        lui     a5,%hi(string_count)
        sw      a4,%lo(string_count)(a5)
        lw      a5,-32(s0)
        lw      a5,12(a5)
.L612:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
init:
        addi    sp,sp,-16
        sw      ra,12(sp)
        sw      s0,8(sp)
        addi    s0,sp,16
        lui     a5,%hi(string_memory)
        lw      a5,%lo(string_memory)(a5)
        bne     a5,zero,.L615
        li      a0,1024
        call    create_memory_block
        mv      a4,a0
        lui     a5,%hi(string_memory)
        sw      a4,%lo(string_memory)(a5)
.L615:
        lui     a5,%hi(struct_memory)
        lw      a5,%lo(struct_memory)(a5)
        bne     a5,zero,.L616
        li      a0,1024
        call    create_memory_block
        mv      a4,a0
        lui     a5,%hi(struct_memory)
        sw      a4,%lo(struct_memory)(a5)
.L616:
        lui     a5,%hi(string_table)
        lw      a5,%lo(string_table)(a5)
        bne     a5,zero,.L617
        li      a0,1024
        call    create_string_table
        mv      a4,a0
        lui     a5,%hi(string_table)
        sw      a4,%lo(string_table)(a5)
.L617:
        call    init_constant
        nop
        lw      ra,12(sp)
        lw      s0,8(sp)
        addi    sp,sp,16
        jr      ra
create_string:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        li      a2,1
        lw      a1,-24(s0)
        lw      a0,-20(s0)
        call    create_string_check
        mv      a5,a0
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC82:
        .string "[lib Fatal] at <alloc_memory>: Cannot allocate memory\n"
alloc_memory:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        mv      a5,a1
        sb      a5,-37(s0)
        lw      a4,-36(s0)
        li      a5,1023
        bleu    a4,a5,.L621
        lw      a0,-36(s0)
        call    malloc
        mv      a5,a0
        sw      a5,-28(s0)
        lw      a5,-28(s0)
        bne     a5,zero,.L622
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,54
        li      a1,1
        lui     a5,%hi(.LC82)
        addi    a0,a5,%lo(.LC82)
        call    fwrite
        lw      a0,-28(s0)
        call    free
        call    free_all_memory
        call    abort
.L622:
        lui     a5,%hi(malloc_allocated)
        lw      a4,%lo(malloc_allocated)(a5)
        lw      a5,-36(s0)
        add     a4,a4,a5
        lui     a5,%hi(malloc_allocated)
        sw      a4,%lo(malloc_allocated)(a5)
        lw      a5,-28(s0)
        j       .L623
.L621:
        lui     a5,%hi(string_memory)
        lw      a5,%lo(string_memory)(a5)
        sw      a5,-20(s0)
        lbu     a5,-37(s0)
        beq     a5,zero,.L625
        lui     a5,%hi(struct_memory)
        lw      a5,%lo(struct_memory)(a5)
        sw      a5,-20(s0)
        lw      a5,-36(s0)
        addi    a5,a5,3
        andi    a5,a5,-4
        sw      a5,-36(s0)
        j       .L625
.L628:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        sub     a5,a4,a5
        lw      a4,-36(s0)
        bgtu    a4,a5,.L626
        lw      a5,-20(s0)
        lw      a4,8(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        add     a5,a4,a5
        sw      a5,-24(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        sub     a5,a4,a5
        lw      a4,-36(s0)
        bgtu    a4,a5,.L626
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lw      a5,-36(s0)
        add     a4,a4,a5
        lw      a5,-20(s0)
        sw      a4,4(a5)
        lw      a5,-24(s0)
        j       .L623
.L626:
        lw      a5,-20(s0)
        lw      a5,12(a5)
        sw      a5,-20(s0)
.L625:
        lw      a5,-20(s0)
        bne     a5,zero,.L628
        lbu     a5,-37(s0)
        beq     a5,zero,.L629
        lw      a1,-36(s0)
        lui     a5,%hi(struct_memory)
        addi    a0,a5,%lo(struct_memory)
        call    increase_memory
        j       .L630
.L629:
        lw      a1,-36(s0)
        lui     a5,%hi(string_memory)
        addi    a0,a5,%lo(string_memory)
        call    increase_memory
.L630:
        lbu     a5,-37(s0)
        mv      a1,a5
        lw      a0,-36(s0)
        call    alloc_memory
        mv      a5,a0
.L623:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC83:
        .string "[lib Error] at <string_splice>: Failed to format string\n"
.LC84:
        .string "[lib Fatal] at <string_splice>: Cannot allocate memory\n"
string_splice:
        addi    sp,sp,-80
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,4(s0)
        sw      a2,8(s0)
        sw      a3,12(s0)
        sw      a4,16(s0)
        sw      a5,20(s0)
        sw      a6,24(s0)
        sw      a7,28(s0)
        addi    a5,s0,32
        sw      a5,-40(s0)
        lw      a5,-40(s0)
        addi    a5,a5,-28
        sw      a5,-32(s0)
        lw      a5,-32(s0)
        mv      a3,a5
        lw      a2,-36(s0)
        li      a1,0
        li      a0,0
        call    vsnprintf
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        bgt     a5,zero,.L632
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,56
        li      a1,1
        lui     a5,%hi(.LC83)
        addi    a0,a5,%lo(.LC83)
        call    fwrite
        li      a5,0
        j       .L635
.L632:
        lw      a5,-20(s0)
        addi    a5,a5,1
        mv      a0,a5
        call    malloc
        mv      a5,a0
        sw      a5,-24(s0)
        lw      a5,-24(s0)
        bne     a5,zero,.L634
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,55
        li      a1,1
        lui     a5,%hi(.LC84)
        addi    a0,a5,%lo(.LC84)
        call    fwrite
        call    free_all_memory
        call    abort
.L634:
        addi    a5,s0,32
        sw      a5,-40(s0)
        lw      a5,-40(s0)
        addi    a5,a5,-28
        sw      a5,-32(s0)
        lw      a5,-20(s0)
        addi    a5,a5,1
        lw      a4,-32(s0)
        mv      a3,a4
        lw      a2,-36(s0)
        mv      a1,a5
        lw      a0,-24(s0)
        call    vsnprintf
        lw      a5,-20(s0)
        mv      a1,a5
        lw      a0,-24(s0)
        call    create_string
        sw      a0,-28(s0)
        lw      a0,-24(s0)
        call    free
        lw      a5,-28(s0)
.L635:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,80
        jr      ra
.LC85:
        .string "struct memory: [used/total: %zu/%zu, blocks: %zu]"
.LC86:
        .string "string memory: [used/total: %zu/%zu, blocks: %zu]"
.LC87:
        .string "platform: %d, malloc allocated: %zu, %s, %s"
get_info:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      zero,-20(s0)
        sw      zero,-24(s0)
        sw      zero,-28(s0)
        lui     a5,%hi(struct_memory)
        lw      a5,%lo(struct_memory)(a5)
        sw      a5,-32(s0)
        j       .L637
.L638:
        lw      a5,-32(s0)
        lw      a5,4(a5)
        lw      a4,-20(s0)
        add     a5,a4,a5
        sw      a5,-20(s0)
        lw      a5,-32(s0)
        lw      a5,0(a5)
        lw      a4,-24(s0)
        add     a5,a4,a5
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,1
        sw      a5,-28(s0)
        lw      a5,-32(s0)
        lw      a5,12(a5)
        sw      a5,-32(s0)
.L637:
        lw      a5,-32(s0)
        bne     a5,zero,.L638
        lw      a3,-28(s0)
        lw      a2,-24(s0)
        lw      a1,-20(s0)
        lui     a5,%hi(.LC85)
        addi    a0,a5,%lo(.LC85)
        call    string_splice
        sw      a0,-36(s0)
        sw      zero,-20(s0)
        sw      zero,-24(s0)
        sw      zero,-28(s0)
        lui     a5,%hi(string_memory)
        lw      a5,%lo(string_memory)(a5)
        sw      a5,-32(s0)
        j       .L639
.L640:
        lw      a5,-32(s0)
        lw      a5,4(a5)
        lw      a4,-20(s0)
        add     a5,a4,a5
        sw      a5,-20(s0)
        lw      a5,-32(s0)
        lw      a5,0(a5)
        lw      a4,-24(s0)
        add     a5,a4,a5
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,1
        sw      a5,-28(s0)
        lw      a5,-32(s0)
        lw      a5,12(a5)
        sw      a5,-32(s0)
.L639:
        lw      a5,-32(s0)
        bne     a5,zero,.L640
        lw      a3,-28(s0)
        lw      a2,-24(s0)
        lw      a1,-20(s0)
        lui     a5,%hi(.LC86)
        addi    a0,a5,%lo(.LC86)
        call    string_splice
        sw      a0,-40(s0)
        lui     a5,%hi(malloc_allocated)
        lw      a5,%lo(malloc_allocated)(a5)
        lw      a4,-36(s0)
        lw      a3,-40(s0)
        mv      a2,a5
        li      a1,3
        lui     a5,%hi(.LC87)
        addi    a0,a5,%lo(.LC87)
        call    string_splice
        mv      a5,a0
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC88:
        .string "import"
.LC89:
        .string "from"
.LC90:
        .string "func"
.LC91:
        .string "class"
.LC92:
        .string "self"
.LC93:
        .string "if"
.LC94:
        .string "elif"
.LC95:
        .string "else"
.LC96:
        .string "while"
.LC97:
        .string "for"
.LC98:
        .string "true"
.LC99:
        .string "false"
.LC100:
        .string "return"
.LC101:
        .string "break"
.LC102:
        .string "continue"
.LC103:
        .string "int"
.LC104:
        .string "float"
.LC105:
        .string "string"
.LC106:
        .string "bool"
.LC107:
        .string "void"
.LC108:
        .string "var"
.LC109:
        .string "pointer"
.LC110:
        .string "const"
keywordStrings:
        .word   .LC88
        .word   .LC89
        .word   .LC90
        .word   .LC91
        .word   .LC28
        .word   .LC92
        .word   .LC93
        .word   .LC94
        .word   .LC95
        .word   .LC96
        .word   .LC97
        .word   .LC98
        .word   .LC99
        .word   .LC100
        .word   .LC101
        .word   .LC102
        .word   .LC103
        .word   .LC104
        .word   .LC105
        .word   .LC106
        .word   .LC107
        .word   .LC108
        .word   .LC109
        .word   .LC110
keywordList:
        .zero   96
.LC111:
        .string "("
.LC112:
        .string ")"
.LC113:
        .string "{"
.LC114:
        .string "}"
.LC115:
        .string ","
.LC116:
        .string "!"
.LC117:
        .string "["
.LC118:
        .string "]"
.LC119:
        .string ";"
.LC120:
        .string "_"
.LC121:
        .string "+"
.LC122:
        .string "-"
.LC123:
        .string "*"
.LC124:
        .string "/"
.LC125:
        .string "%"
.LC126:
        .string "<"
.LC127:
        .string ">"
.LC128:
        .string "="
.LC129:
        .string "=="
.LC130:
        .string "!="
.LC131:
        .string "<="
.LC132:
        .string ">="
.LC133:
        .string "+="
.LC134:
        .string "-="
.LC135:
        .string "*="
.LC136:
        .string "/="
.LC137:
        .string "%="
.LC138:
        .string "&&"
.LC139:
        .string "||"
symbolStrings:
        .word   .LC111
        .word   .LC112
        .word   .LC113
        .word   .LC114
        .word   .LC115
        .word   .LC116
        .word   .LC42
        .word   .LC117
        .word   .LC118
        .word   .LC119
        .word   .LC120
        .word   .LC121
        .word   .LC122
        .word   .LC123
        .word   .LC124
        .word   .LC125
        .word   .LC126
        .word   .LC127
        .word   .LC128
        .word   .LC129
        .word   .LC130
        .word   .LC131
        .word   .LC132
        .word   .LC133
        .word   .LC134
        .word   .LC135
        .word   .LC136
        .word   .LC137
        .word   .LC138
        .word   .LC139
symbolList:
        .zero   120
.LC140:
        .string "$init"
.LC141:
        .string "$to_int"
.LC142:
        .string "$to_float"
.LC143:
        .string "$to_string"
.LC144:
        .string "$to_bool"
.LC145:
        .string "$add"
.LC146:
        .string "$sub"
.LC147:
        .string "$mul"
.LC148:
        .string "$div"
.LC149:
        .string "$mod"
.LC150:
        .string "$eq"
.LC151:
        .string "$ne"
.LC152:
        .string "$lt"
.LC153:
        .string "$ge"
.LC154:
        .string "$gt"
.LC155:
        .string "$le"
.LC156:
        .string "$and"
.LC157:
        .string "$or"
.LC158:
        .string "$not"
.LC159:
        .string "$neg"
specialStrings:
        .word   .LC140
        .word   .LC141
        .word   .LC142
        .word   .LC143
        .word   .LC144
        .word   .LC145
        .word   .LC146
        .word   .LC147
        .word   .LC148
        .word   .LC149
        .word   .LC150
        .word   .LC151
        .word   .LC152
        .word   .LC153
        .word   .LC154
        .word   .LC155
        .word   .LC156
        .word   .LC157
        .word   .LC158
        .word   .LC159
specialList:
        .zero   80
KEYWORD_IMPORT:
        .zero   4
KEYWORD_FROM:
        .zero   4
KEYWORD_FUNC:
        .zero   4
KEYWORD_CLASS:
        .zero   4
KEYWORD_METHOD:
        .zero   4
KEYWORD_SELF:
        .zero   4
KEYWORD_IF:
        .zero   4
KEYWORD_ELIF:
        .zero   4
KEYWORD_ELSE:
        .zero   4
KEYWORD_WHILE:
        .zero   4
KEYWORD_FOR:
        .zero   4
KEYWORD_TRUE:
        .zero   4
KEYWORD_FALSE:
        .zero   4
KEYWORD_RETURN:
        .zero   4
KEYWORD_BREAK:
        .zero   4
KEYWORD_CONTINUE:
        .zero   4
KEYWORD_INT:
        .zero   4
KEYWORD_FLOAT:
        .zero   4
KEYWORD_STRING:
        .zero   4
KEYWORD_BOOL:
        .zero   4
KEYWORD_VOID:
        .zero   4
KEYWORD_VAR:
        .zero   4
KEYWORD_POINTER:
        .zero   4
KEYWORD_CONST:
        .zero   4
SYMBOL_L_PAREN:
        .zero   4
SYMBOL_R_PAREN:
        .zero   4
SYMBOL_L_BRACE:
        .zero   4
SYMBOL_R_BRACE:
        .zero   4
SYMBOL_COMMA:
        .zero   4
SYMBOL_NOT:
        .zero   4
SYMBOL_DOT:
        .zero   4
SYMBOL_L_BRACKET:
        .zero   4
SYMBOL_R_BRACKET:
        .zero   4
SYMBOL_SEMICOLON:
        .zero   4
SYMBOL_UNDERLINE:
        .zero   4
SYMBOL_ADD:
        .zero   4
SYMBOL_SUB:
        .zero   4
SYMBOL_MUL:
        .zero   4
SYMBOL_DIV:
        .zero   4
SYMBOL_MOD:
        .zero   4
SYMBOL_LT:
        .zero   4
SYMBOL_GT:
        .zero   4
SYMBOL_ASSIGN:
        .zero   4
SYMBOL_EQ:
        .zero   4
SYMBOL_NE:
        .zero   4
SYMBOL_LE:
        .zero   4
SYMBOL_GE:
        .zero   4
SYMBOL_ADD_ASSIGN:
        .zero   4
SYMBOL_SUB_ASSIGN:
        .zero   4
SYMBOL_MUL_ASSIGN:
        .zero   4
SYMBOL_DIV_ASSIGN:
        .zero   4
SYMBOL_MOD_ASSIGN:
        .zero   4
SYMBOL_AND:
        .zero   4
SYMBOL_OR:
        .zero   4
SPECIAL_INIT:
        .zero   4
SPECIAL_TO_INT:
        .zero   4
SPECIAL_TO_FLOAT:
        .zero   4
SPECIAL_TO_STRING:
        .zero   4
SPECIAL_TO_BOOL:
        .zero   4
SPECIAL_ADD:
        .zero   4
SPECIAL_SUB:
        .zero   4
SPECIAL_MUL:
        .zero   4
SPECIAL_DIV:
        .zero   4
SPECIAL_MOD:
        .zero   4
SPECIAL_EQ:
        .zero   4
SPECIAL_NE:
        .zero   4
SPECIAL_LT:
        .zero   4
SPECIAL_GE:
        .zero   4
SPECIAL_GT:
        .zero   4
SPECIAL_LE:
        .zero   4
SPECIAL_AND:
        .zero   4
SPECIAL_OR:
        .zero   4
SPECIAL_NOT:
        .zero   4
SPECIAL_NEG:
        .zero   4
global_symbol_table:
        .zero   4
symbol_int:
        .zero   4
symbol_float:
        .zero   4
symbol_string:
        .zero   4
symbol_bool:
        .zero   4
symbol_void:
        .zero   4
symbol_pointer:
        .zero   4
symbol_const:
        .zero   4
parsed_files:
        .zero   4
init_constant:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s1,20(sp)
        addi    s0,sp,32
        sw      zero,-20(s0)
        j       .L643
.L644:
        lui     a5,%hi(keywordStrings)
        addi    a4,a5,%lo(keywordStrings)
        lw      a5,-20(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      s1,0(a5)
        lui     a5,%hi(keywordStrings)
        addi    a4,a5,%lo(keywordStrings)
        lw      a5,-20(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a0,a5
        call    strlen
        mv      a5,a0
        li      a2,0
        mv      a1,a5
        mv      a0,s1
        call    create_string_check
        mv      a3,a0
        lui     a5,%hi(keywordList)
        addi    a4,a5,%lo(keywordList)
        lw      a5,-20(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        sw      a3,0(a5)
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L643:
        lw      a4,-20(s0)
        li      a5,23
        bleu    a4,a5,.L644
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,0(a5)
        lui     a5,%hi(KEYWORD_IMPORT)
        sw      a4,%lo(KEYWORD_IMPORT)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FROM)
        sw      a4,%lo(KEYWORD_FROM)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,8(a5)
        lui     a5,%hi(KEYWORD_FUNC)
        sw      a4,%lo(KEYWORD_FUNC)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,12(a5)
        lui     a5,%hi(KEYWORD_CLASS)
        sw      a4,%lo(KEYWORD_CLASS)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,16(a5)
        lui     a5,%hi(KEYWORD_METHOD)
        sw      a4,%lo(KEYWORD_METHOD)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,20(a5)
        lui     a5,%hi(KEYWORD_SELF)
        sw      a4,%lo(KEYWORD_SELF)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,24(a5)
        lui     a5,%hi(KEYWORD_IF)
        sw      a4,%lo(KEYWORD_IF)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,28(a5)
        lui     a5,%hi(KEYWORD_ELIF)
        sw      a4,%lo(KEYWORD_ELIF)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,32(a5)
        lui     a5,%hi(KEYWORD_ELSE)
        sw      a4,%lo(KEYWORD_ELSE)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,36(a5)
        lui     a5,%hi(KEYWORD_WHILE)
        sw      a4,%lo(KEYWORD_WHILE)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,40(a5)
        lui     a5,%hi(KEYWORD_FOR)
        sw      a4,%lo(KEYWORD_FOR)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,44(a5)
        lui     a5,%hi(KEYWORD_TRUE)
        sw      a4,%lo(KEYWORD_TRUE)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,48(a5)
        lui     a5,%hi(KEYWORD_FALSE)
        sw      a4,%lo(KEYWORD_FALSE)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,52(a5)
        lui     a5,%hi(KEYWORD_RETURN)
        sw      a4,%lo(KEYWORD_RETURN)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,56(a5)
        lui     a5,%hi(KEYWORD_BREAK)
        sw      a4,%lo(KEYWORD_BREAK)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,60(a5)
        lui     a5,%hi(KEYWORD_CONTINUE)
        sw      a4,%lo(KEYWORD_CONTINUE)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,64(a5)
        lui     a5,%hi(KEYWORD_INT)
        sw      a4,%lo(KEYWORD_INT)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,68(a5)
        lui     a5,%hi(KEYWORD_FLOAT)
        sw      a4,%lo(KEYWORD_FLOAT)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,72(a5)
        lui     a5,%hi(KEYWORD_STRING)
        sw      a4,%lo(KEYWORD_STRING)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,76(a5)
        lui     a5,%hi(KEYWORD_BOOL)
        sw      a4,%lo(KEYWORD_BOOL)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,80(a5)
        lui     a5,%hi(KEYWORD_VOID)
        sw      a4,%lo(KEYWORD_VOID)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,84(a5)
        lui     a5,%hi(KEYWORD_VAR)
        sw      a4,%lo(KEYWORD_VAR)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,88(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        sw      a4,%lo(KEYWORD_POINTER)(a5)
        lui     a5,%hi(keywordList)
        addi    a5,a5,%lo(keywordList)
        lw      a4,92(a5)
        lui     a5,%hi(KEYWORD_CONST)
        sw      a4,%lo(KEYWORD_CONST)(a5)
        sw      zero,-24(s0)
        j       .L645
.L646:
        lui     a5,%hi(symbolStrings)
        addi    a4,a5,%lo(symbolStrings)
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      s1,0(a5)
        lui     a5,%hi(symbolStrings)
        addi    a4,a5,%lo(symbolStrings)
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a0,a5
        call    strlen
        mv      a5,a0
        li      a2,0
        mv      a1,a5
        mv      a0,s1
        call    create_string_check
        mv      a3,a0
        lui     a5,%hi(symbolList)
        addi    a4,a5,%lo(symbolList)
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        sw      a3,0(a5)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
.L645:
        lw      a4,-24(s0)
        li      a5,29
        bleu    a4,a5,.L646
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,0(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        sw      a4,%lo(SYMBOL_L_PAREN)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        sw      a4,%lo(SYMBOL_R_PAREN)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,8(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        sw      a4,%lo(SYMBOL_L_BRACE)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,12(a5)
        lui     a5,%hi(SYMBOL_R_BRACE)
        sw      a4,%lo(SYMBOL_R_BRACE)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,16(a5)
        lui     a5,%hi(SYMBOL_COMMA)
        sw      a4,%lo(SYMBOL_COMMA)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,20(a5)
        lui     a5,%hi(SYMBOL_NOT)
        sw      a4,%lo(SYMBOL_NOT)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,24(a5)
        lui     a5,%hi(SYMBOL_DOT)
        sw      a4,%lo(SYMBOL_DOT)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,28(a5)
        lui     a5,%hi(SYMBOL_L_BRACKET)
        sw      a4,%lo(SYMBOL_L_BRACKET)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,32(a5)
        lui     a5,%hi(SYMBOL_R_BRACKET)
        sw      a4,%lo(SYMBOL_R_BRACKET)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,36(a5)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        sw      a4,%lo(SYMBOL_SEMICOLON)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,40(a5)
        lui     a5,%hi(SYMBOL_UNDERLINE)
        sw      a4,%lo(SYMBOL_UNDERLINE)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,44(a5)
        lui     a5,%hi(SYMBOL_ADD)
        sw      a4,%lo(SYMBOL_ADD)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,48(a5)
        lui     a5,%hi(SYMBOL_SUB)
        sw      a4,%lo(SYMBOL_SUB)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,52(a5)
        lui     a5,%hi(SYMBOL_MUL)
        sw      a4,%lo(SYMBOL_MUL)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,56(a5)
        lui     a5,%hi(SYMBOL_DIV)
        sw      a4,%lo(SYMBOL_DIV)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,60(a5)
        lui     a5,%hi(SYMBOL_MOD)
        sw      a4,%lo(SYMBOL_MOD)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,64(a5)
        lui     a5,%hi(SYMBOL_LT)
        sw      a4,%lo(SYMBOL_LT)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,68(a5)
        lui     a5,%hi(SYMBOL_GT)
        sw      a4,%lo(SYMBOL_GT)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,72(a5)
        lui     a5,%hi(SYMBOL_ASSIGN)
        sw      a4,%lo(SYMBOL_ASSIGN)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,76(a5)
        lui     a5,%hi(SYMBOL_EQ)
        sw      a4,%lo(SYMBOL_EQ)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,80(a5)
        lui     a5,%hi(SYMBOL_NE)
        sw      a4,%lo(SYMBOL_NE)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,84(a5)
        lui     a5,%hi(SYMBOL_LE)
        sw      a4,%lo(SYMBOL_LE)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,88(a5)
        lui     a5,%hi(SYMBOL_GE)
        sw      a4,%lo(SYMBOL_GE)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,92(a5)
        lui     a5,%hi(SYMBOL_ADD_ASSIGN)
        sw      a4,%lo(SYMBOL_ADD_ASSIGN)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,96(a5)
        lui     a5,%hi(SYMBOL_SUB_ASSIGN)
        sw      a4,%lo(SYMBOL_SUB_ASSIGN)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,100(a5)
        lui     a5,%hi(SYMBOL_MUL_ASSIGN)
        sw      a4,%lo(SYMBOL_MUL_ASSIGN)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,104(a5)
        lui     a5,%hi(SYMBOL_DIV_ASSIGN)
        sw      a4,%lo(SYMBOL_DIV_ASSIGN)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,108(a5)
        lui     a5,%hi(SYMBOL_MOD_ASSIGN)
        sw      a4,%lo(SYMBOL_MOD_ASSIGN)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,112(a5)
        lui     a5,%hi(SYMBOL_AND)
        sw      a4,%lo(SYMBOL_AND)(a5)
        lui     a5,%hi(symbolList)
        addi    a5,a5,%lo(symbolList)
        lw      a4,116(a5)
        lui     a5,%hi(SYMBOL_OR)
        sw      a4,%lo(SYMBOL_OR)(a5)
        sw      zero,-28(s0)
        j       .L647
.L648:
        lui     a5,%hi(specialStrings)
        addi    a4,a5,%lo(specialStrings)
        lw      a5,-28(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      s1,0(a5)
        lui     a5,%hi(specialStrings)
        addi    a4,a5,%lo(specialStrings)
        lw      a5,-28(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a0,a5
        call    strlen
        mv      a5,a0
        li      a2,0
        mv      a1,a5
        mv      a0,s1
        call    create_string_check
        mv      a3,a0
        lui     a5,%hi(specialList)
        addi    a4,a5,%lo(specialList)
        lw      a5,-28(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        sw      a3,0(a5)
        lw      a5,-28(s0)
        addi    a5,a5,1
        sw      a5,-28(s0)
.L647:
        lw      a4,-28(s0)
        li      a5,19
        bleu    a4,a5,.L648
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,0(a5)
        lui     a5,%hi(SPECIAL_INIT)
        sw      a4,%lo(SPECIAL_INIT)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,4(a5)
        lui     a5,%hi(SPECIAL_TO_INT)
        sw      a4,%lo(SPECIAL_TO_INT)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,8(a5)
        lui     a5,%hi(SPECIAL_TO_FLOAT)
        sw      a4,%lo(SPECIAL_TO_FLOAT)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,12(a5)
        lui     a5,%hi(SPECIAL_TO_STRING)
        sw      a4,%lo(SPECIAL_TO_STRING)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,16(a5)
        lui     a5,%hi(SPECIAL_TO_BOOL)
        sw      a4,%lo(SPECIAL_TO_BOOL)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,20(a5)
        lui     a5,%hi(SPECIAL_ADD)
        sw      a4,%lo(SPECIAL_ADD)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,24(a5)
        lui     a5,%hi(SPECIAL_SUB)
        sw      a4,%lo(SPECIAL_SUB)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,28(a5)
        lui     a5,%hi(SPECIAL_MUL)
        sw      a4,%lo(SPECIAL_MUL)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,32(a5)
        lui     a5,%hi(SPECIAL_DIV)
        sw      a4,%lo(SPECIAL_DIV)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,36(a5)
        lui     a5,%hi(SPECIAL_MOD)
        sw      a4,%lo(SPECIAL_MOD)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,40(a5)
        lui     a5,%hi(SPECIAL_EQ)
        sw      a4,%lo(SPECIAL_EQ)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,44(a5)
        lui     a5,%hi(SPECIAL_NE)
        sw      a4,%lo(SPECIAL_NE)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,48(a5)
        lui     a5,%hi(SPECIAL_LT)
        sw      a4,%lo(SPECIAL_LT)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,52(a5)
        lui     a5,%hi(SPECIAL_GE)
        sw      a4,%lo(SPECIAL_GE)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,56(a5)
        lui     a5,%hi(SPECIAL_GT)
        sw      a4,%lo(SPECIAL_GT)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,60(a5)
        lui     a5,%hi(SPECIAL_LE)
        sw      a4,%lo(SPECIAL_LE)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,64(a5)
        lui     a5,%hi(SPECIAL_AND)
        sw      a4,%lo(SPECIAL_AND)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,68(a5)
        lui     a5,%hi(SPECIAL_OR)
        sw      a4,%lo(SPECIAL_OR)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,72(a5)
        lui     a5,%hi(SPECIAL_NOT)
        sw      a4,%lo(SPECIAL_NOT)(a5)
        lui     a5,%hi(specialList)
        addi    a5,a5,%lo(specialList)
        lw      a4,76(a5)
        lui     a5,%hi(SPECIAL_NEG)
        sw      a4,%lo(SPECIAL_NEG)(a5)
        call    list_create
        mv      a4,a0
        lui     a5,%hi(parsed_files)
        sw      a4,%lo(parsed_files)(a5)
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        addi    sp,sp,32
        jr      ra
list_create:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        sw      zero,0(a5)
        lw      a5,-20(s0)
        sw      zero,4(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC160:
        .string "[lib Fatal] at <list_append>: List is NULL\n"
list_append:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        lw      a5,-36(s0)
        bne     a5,zero,.L652
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,43
        li      a1,1
        lui     a5,%hi(.LC160)
        addi    a0,a5,%lo(.LC160)
        call    fwrite
        call    abort
.L652:
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        sw      zero,4(a5)
        lw      a5,-36(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L653
        lw      a5,-36(s0)
        lw      a4,-20(s0)
        sw      a4,0(a5)
        lw      a5,-36(s0)
        lw      a4,-20(s0)
        sw      a4,4(a5)
        j       .L655
.L653:
        lw      a5,-36(s0)
        lw      a5,4(a5)
        lw      a4,-20(s0)
        sw      a4,4(a5)
        lw      a5,-36(s0)
        lw      a4,-20(s0)
        sw      a4,4(a5)
.L655:
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
list_pop_front:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        beq     a5,zero,.L657
        lw      a5,-36(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L658
.L657:
        li      a5,0
        j       .L659
.L658:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a5,0(a5)
        sw      a5,-20(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a4,4(a5)
        lw      a5,-36(s0)
        sw      a4,0(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L660
        lw      a5,-36(s0)
        sw      zero,4(a5)
.L660:
        lw      a5,-20(s0)
.L659:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
is_special:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      zero,-20(s0)
        j       .L662
.L665:
        lui     a5,%hi(specialList)
        addi    a4,a5,%lo(specialList)
        lw      a5,-20(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        lw      a4,-36(s0)
        bne     a4,a5,.L663
        li      a5,1
        j       .L664
.L663:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L662:
        lw      a4,-20(s0)
        li      a5,19
        bleu    a4,a5,.L665
        li      a5,0
.L664:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC161:
        .string "Usage: %s <source_file> [output_file] [options]\n"
.LC162:
        .string "Options:"
.LC163:
        .string "  -o  Output compile result"
.LC164:
        .string "  -i  Output IR"
.LC165:
        .string "  -a  Output AST"
.LC166:
        .string "  -l  Output tokens"
.LC167:
        .string "  -s  Output symbol table"
.LC168:
        .string "  -h  Show this help message"
.LC169:
        .string "[Error] Unexpected argument: %s\n"
.LC170:
        .string "[Error] No source file provided\n"
parse_args:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s1,36(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,12
        call    alloc_memory
        sw      a0,-24(s0)
        li      a2,12
        li      a1,0
        lw      a0,-24(s0)
        call    memset
        li      a5,1
        sw      a5,-20(s0)
        j       .L667
.L677:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        lbu     a4,0(a5)
        li      a5,45
        bne     a4,a5,.L668
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        addi    a5,a5,1
        lbu     a4,0(a5)
        li      a5,111
        bne     a4,a5,.L669
        lw      a5,-24(s0)
        lw      a5,8(a5)
        ori     a4,a5,1
        lw      a5,-24(s0)
        sw      a4,8(a5)
        j       .L670
.L669:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        addi    a5,a5,1
        lbu     a4,0(a5)
        li      a5,105
        bne     a4,a5,.L671
        lw      a5,-24(s0)
        lw      a5,8(a5)
        ori     a4,a5,2
        lw      a5,-24(s0)
        sw      a4,8(a5)
        j       .L670
.L671:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        addi    a5,a5,1
        lbu     a4,0(a5)
        li      a5,97
        bne     a4,a5,.L672
        lw      a5,-24(s0)
        lw      a5,8(a5)
        ori     a4,a5,4
        lw      a5,-24(s0)
        sw      a4,8(a5)
        j       .L670
.L672:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        addi    a5,a5,1
        lbu     a4,0(a5)
        li      a5,108
        bne     a4,a5,.L673
        lw      a5,-24(s0)
        lw      a5,8(a5)
        ori     a4,a5,8
        lw      a5,-24(s0)
        sw      a4,8(a5)
        j       .L670
.L673:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        addi    a5,a5,1
        lbu     a4,0(a5)
        li      a5,115
        bne     a4,a5,.L674
        lw      a5,-24(s0)
        lw      a5,8(a5)
        ori     a4,a5,16
        lw      a5,-24(s0)
        sw      a4,8(a5)
        j       .L670
.L674:
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        addi    a5,a5,1
        lbu     a4,0(a5)
        li      a5,104
        bne     a4,a5,.L670
        lw      a5,-40(s0)
        lw      a5,0(a5)
        mv      a1,a5
        lui     a5,%hi(.LC161)
        addi    a0,a5,%lo(.LC161)
        call    printf
        lui     a5,%hi(.LC162)
        addi    a0,a5,%lo(.LC162)
        call    puts
        lui     a5,%hi(.LC163)
        addi    a0,a5,%lo(.LC163)
        call    puts
        lui     a5,%hi(.LC164)
        addi    a0,a5,%lo(.LC164)
        call    puts
        lui     a5,%hi(.LC165)
        addi    a0,a5,%lo(.LC165)
        call    puts
        lui     a5,%hi(.LC166)
        addi    a0,a5,%lo(.LC166)
        call    puts
        lui     a5,%hi(.LC167)
        addi    a0,a5,%lo(.LC167)
        call    puts
        lui     a5,%hi(.LC168)
        addi    a0,a5,%lo(.LC168)
        call    puts
        li      a0,0
        call    exit
.L668:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L675
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      s1,0(a5)
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a0,a5
        call    strlen
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    create_string
        mv      a5,a0
        mv      a0,a5
        call    create_file
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        j       .L670
.L675:
        lw      a5,-24(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L676
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      s1,0(a5)
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a0,a5
        call    strlen
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    create_string
        mv      a5,a0
        mv      a0,a5
        call    create_file
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,4(a5)
        j       .L670
.L676:
        lui     a5,%hi(stderr)
        lw      a3,%lo(stderr)(a5)
        lw      a5,-20(s0)
        slli    a5,a5,2
        lw      a4,-40(s0)
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a2,a5
        lui     a5,%hi(.LC169)
        addi    a1,a5,%lo(.LC169)
        mv      a0,a3
        call    fprintf
.L670:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L667:
        lw      a4,-20(s0)
        lw      a5,-36(s0)
        blt     a4,a5,.L677
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L678
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,32
        li      a1,1
        lui     a5,%hi(.LC170)
        addi    a0,a5,%lo(.LC170)
        call    fwrite
        li      a0,1
        call    exit
.L678:
        lw      a5,-24(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L679
        lw      a5,-24(s0)
        lw      a5,0(a5)
        lw      a5,0(a5)
        mv      a0,a5
        call    create_file
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,4(a5)
.L679:
        lw      a5,-24(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        addi    sp,sp,48
        jr      ra
.LC171:
        .string ".ast"
.LC172:
        .string "[Error] Failed to open AST output file\n"
.LC173:
        .string "\n%s\n"
.LC174:
        .string ".sym"
.LC175:
        .string "[Error] Failed to open symbol table output file\n"
main:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        call    init
        call    init_symbol
        lw      a1,-56(s0)
        lw      a0,-52(s0)
        call    parse_args
        sw      a0,-24(s0)
        sw      zero,-20(s0)
        lw      a5,-24(s0)
        lw      a5,8(a5)
        beq     a5,zero,.L682
        lw      a5,-24(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    create_lexer
        sw      a0,-20(s0)
.L682:
        lw      a5,-24(s0)
        lw      a5,8(a5)
        andi    a5,a5,8
        beq     a5,zero,.L683
        li      a1,1
        li      a0,36
        call    alloc_memory
        sw      a0,-28(s0)
        li      a2,36
        lw      a1,-20(s0)
        lw      a0,-28(s0)
        call    memcpy
        lw      a5,-24(s0)
        lw      a5,4(a5)
        mv      a1,a5
        lw      a0,-28(s0)
        call    output_tokens
.L683:
        sw      zero,-32(s0)
        lw      a5,-24(s0)
        lw      a5,8(a5)
        andi    a5,a5,4
        beq     a5,zero,.L684
        lw      a0,-20(s0)
        call    create_parser
        sw      a0,-36(s0)
        lw      a0,-36(s0)
        call    parse_code
        sw      a0,-32(s0)
        lw      a0,-32(s0)
        call    analyzer
        sw      a0,-32(s0)
        lw      a5,-32(s0)
        beq     a5,zero,.L684
        lui     a5,%hi(parsed_files)
        lw      a5,%lo(parsed_files)(a5)
        lw      a1,-32(s0)
        mv      a0,a5
        call    list_append
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(.LC171)
        addi    a1,a5,%lo(.LC171)
        mv      a0,a4
        call    change_extension
        mv      a4,a0
        lui     a5,%hi(.LC50)
        addi    a1,a5,%lo(.LC50)
        mv      a0,a4
        call    fopen
        sw      a0,-40(s0)
        lw      a5,-40(s0)
        bne     a5,zero,.L685
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,39
        li      a1,1
        lui     a5,%hi(.LC172)
        addi    a0,a5,%lo(.LC172)
        call    fwrite
        li      a0,1
        call    exit
.L685:
        lw      a1,-40(s0)
        lw      a0,-32(s0)
        call    print_ast
        call    get_info
        mv      a5,a0
        mv      a2,a5
        lui     a5,%hi(.LC173)
        addi    a1,a5,%lo(.LC173)
        lw      a0,-40(s0)
        call    fprintf
        lw      a0,-40(s0)
        call    fclose
.L684:
        lw      a5,-24(s0)
        lw      a5,8(a5)
        andi    a5,a5,16
        beq     a5,zero,.L686
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(.LC174)
        addi    a1,a5,%lo(.LC174)
        mv      a0,a4
        call    change_extension
        mv      a4,a0
        lui     a5,%hi(.LC50)
        addi    a1,a5,%lo(.LC50)
        mv      a0,a4
        call    fopen
        sw      a0,-44(s0)
        lw      a5,-44(s0)
        bne     a5,zero,.L687
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,48
        li      a1,1
        lui     a5,%hi(.LC175)
        addi    a0,a5,%lo(.LC175)
        call    fwrite
        li      a0,1
        call    exit
.L687:
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        lw      a1,-44(s0)
        mv      a0,a5
        call    print_symbol_table
        call    get_info
        mv      a5,a0
        mv      a2,a5
        lui     a5,%hi(.LC173)
        addi    a1,a5,%lo(.LC173)
        lw      a0,-44(s0)
        call    fprintf
        lw      a0,-44(s0)
        call    fclose
.L686:
        li      a5,0
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        addi    sp,sp,64
        jr      ra
.LC176:
        .string ""
.LC177:
        .string "%*s{\n"
.LC178:
        .string "%*serror: \"Unknown code member type\"\n"
.LC179:
        .string "%*s}\n"
print_ast:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        li      a2,0
        lui     a5,%hi(.LC177)
        addi    a1,a5,%lo(.LC177)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-20(s0)
        j       .L690
.L701:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L691
.L699:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L692
.L698:
        lw      a5,-28(s0)
        lw      a5,4(a5)
        li      a4,2
        beq     a5,a4,.L693
        li      a4,2
        bgtu    a5,a4,.L694
        beq     a5,zero,.L695
        li      a4,1
        beq     a5,a4,.L696
        j       .L694
.L695:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        li      a2,1
        lw      a1,-40(s0)
        mv      a0,a5
        call    print_function
        j       .L697
.L696:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        li      a2,1
        lw      a1,-40(s0)
        mv      a0,a5
        call    print_class
        j       .L697
.L693:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        li      a2,1
        lw      a1,-40(s0)
        mv      a0,a5
        call    print_import
        j       .L697
.L694:
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        li      a2,4
        lui     a5,%hi(.LC178)
        addi    a1,a5,%lo(.LC178)
        lw      a0,-40(s0)
        call    fprintf
        nop
.L697:
        sw      zero,-28(s0)
.L692:
        lw      a5,-28(s0)
        bne     a5,zero,.L698
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L691:
        lw      a5,-24(s0)
        bne     a5,zero,.L699
        sw      zero,-20(s0)
.L690:
        lw      a5,-20(s0)
        beq     a5,zero,.L700
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L701
.L700:
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        li      a2,0
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC180:
        .string "%*sfunction: {\n"
.LC181:
        .string "%*sname: {\n"
.LC182:
        .string "%*sreturn_type: %s(%zu)\n"
.LC183:
        .string "%*sparameters: {\n"
.LC184:
        .string "%*sbody: {\n"
print_function:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        sw      a2,-60(s0)
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC180)
        addi    a1,a5,%lo(.LC180)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC181)
        addi    a1,a5,%lo(.LC181)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-52(s0)
        lw      a4,0(a5)
        lw      a5,-60(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-56(s0)
        mv      a0,a4
        call    print_symbol
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a2,a5,2
        lw      a5,-52(s0)
        lw      a5,4(a5)
        lw      a4,0(a5)
        lw      a5,-52(s0)
        lw      a5,4(a5)
        lw      a5,12(a5)
        lui     a3,%hi(.LC176)
        addi    a3,a3,%lo(.LC176)
        lui     a1,%hi(.LC182)
        addi    a1,a1,%lo(.LC182)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC183)
        addi    a1,a5,%lo(.LC183)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-52(s0)
        lw      a5,8(a5)
        sw      a5,-20(s0)
        j       .L703
.L709:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L704
.L707:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L705
.L706:
        lw      a5,-60(s0)
        addi    a5,a5,2
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC177)
        addi    a1,a5,%lo(.LC177)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,3
        mv      a2,a5
        lw      a1,-56(s0)
        lw      a0,-28(s0)
        call    print_symbol
        lw      a5,-60(s0)
        addi    a5,a5,2
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        sw      zero,-28(s0)
.L705:
        lw      a5,-28(s0)
        bne     a5,zero,.L706
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L704:
        lw      a5,-24(s0)
        bne     a5,zero,.L707
        sw      zero,-20(s0)
.L703:
        lw      a5,-20(s0)
        beq     a5,zero,.L708
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L709
.L708:
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC184)
        addi    a1,a5,%lo(.LC184)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-52(s0)
        lw      a5,12(a5)
        sw      a5,-32(s0)
        j       .L710
.L716:
        lw      a5,-32(s0)
        lw      a5,0(a5)
        sw      a5,-36(s0)
        j       .L711
.L714:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-40(s0)
        j       .L712
.L713:
        lw      a5,-60(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-56(s0)
        lw      a0,-40(s0)
        call    print_statement
        sw      zero,-40(s0)
.L712:
        lw      a5,-40(s0)
        bne     a5,zero,.L713
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-36(s0)
.L711:
        lw      a5,-36(s0)
        bne     a5,zero,.L714
        sw      zero,-32(s0)
.L710:
        lw      a5,-32(s0)
        beq     a5,zero,.L715
        lw      a5,-32(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L716
.L715:
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        nop
        lw      ra,60(sp)
        lw      s0,56(sp)
        addi    sp,sp,64
        jr      ra
.LC185:
        .string "%*sclass: {\n"
.LC186:
        .string "%*serror: \"Unknown class member type\"\n"
print_class:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC185)
        addi    a1,a5,%lo(.LC185)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC181)
        addi    a1,a5,%lo(.LC181)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_symbol
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-20(s0)
        j       .L718
.L727:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L719
.L725:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L720
.L724:
        lw      a5,-28(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L721
        lw      a5,-28(s0)
        lw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_method
        j       .L722
.L721:
        lw      a5,-28(s0)
        lw      a4,4(a5)
        li      a5,1
        bne     a4,a5,.L723
        lw      a5,-28(s0)
        lw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_variable
        j       .L722
.L723:
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC186)
        addi    a1,a5,%lo(.LC186)
        lw      a0,-40(s0)
        call    fprintf
.L722:
        sw      zero,-28(s0)
.L720:
        lw      a5,-28(s0)
        bne     a5,zero,.L724
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L719:
        lw      a5,-24(s0)
        bne     a5,zero,.L725
        sw      zero,-20(s0)
.L718:
        lw      a5,-20(s0)
        beq     a5,zero,.L726
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L727
.L726:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC187:
        .string "%*simport: {\n"
.LC188:
        .string "%*spath: \"%s\"\n"
print_import:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        sw      a2,-28(s0)
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC187)
        addi    a1,a5,%lo(.LC187)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-28(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC181)
        addi    a1,a5,%lo(.LC181)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-24(s0)
        mv      a0,a4
        call    print_symbol
        lw      a5,-28(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-28(s0)
        addi    a5,a5,1
        slli    a2,a5,2
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a4,a5
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        lui     a5,%hi(.LC188)
        addi    a1,a5,%lo(.LC188)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC189:
        .string "[output Warning] at <print_statement>: Cannot exist declare list in statement. This should have been split into multiple declare statements in the parsing stage.\n"
.LC190:
        .string "%*sbreak: null\n"
.LC191:
        .string "%*scontinue: null\n"
.LC192:
        .string "%*sreturn: null\n"
.LC193:
        .string "%*sreturn: {\n"
.LC194:
        .string "%*sexpression: {\n"
.LC195:
        .string "%*serror: \"Unknown statement type\"\n"
print_statement:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        lw      a5,-36(s0)
        lw      a5,4(a5)
        li      a4,8
        beq     a5,a4,.L730
        li      a4,8
        bgtu    a5,a4,.L731
        li      a4,7
        beq     a5,a4,.L732
        li      a4,7
        bgtu    a5,a4,.L731
        li      a4,6
        beq     a5,a4,.L733
        li      a4,6
        bgtu    a5,a4,.L731
        li      a4,5
        beq     a5,a4,.L734
        li      a4,5
        bgtu    a5,a4,.L731
        li      a4,4
        beq     a5,a4,.L735
        li      a4,4
        bgtu    a5,a4,.L731
        li      a4,3
        beq     a5,a4,.L736
        li      a4,3
        bgtu    a5,a4,.L731
        li      a4,2
        beq     a5,a4,.L737
        li      a4,2
        bgtu    a5,a4,.L731
        beq     a5,zero,.L738
        li      a4,1
        bne     a5,a4,.L731
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a2,-44(s0)
        lw      a1,-40(s0)
        mv      a0,a5
        call    print_variable
        j       .L739
.L738:
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        mv      a3,a5
        li      a2,162
        li      a1,1
        lui     a5,%hi(.LC189)
        addi    a0,a5,%lo(.LC189)
        call    fwrite
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-20(s0)
        j       .L740
.L746:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L741
.L744:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L742
.L743:
        lw      a2,-44(s0)
        lw      a1,-40(s0)
        lw      a0,-28(s0)
        call    print_variable
        sw      zero,-28(s0)
.L742:
        lw      a5,-28(s0)
        bne     a5,zero,.L743
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L741:
        lw      a5,-24(s0)
        bne     a5,zero,.L744
        sw      zero,-20(s0)
.L740:
        lw      a5,-20(s0)
        beq     a5,zero,.L749
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L746
        j       .L749
.L737:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a2,-44(s0)
        lw      a1,-40(s0)
        mv      a0,a5
        call    print_if
        j       .L739
.L736:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a2,-44(s0)
        lw      a1,-40(s0)
        mv      a0,a5
        call    print_for
        j       .L739
.L735:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a2,-44(s0)
        lw      a1,-40(s0)
        mv      a0,a5
        call    print_while
        j       .L739
.L734:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC190)
        addi    a1,a5,%lo(.LC190)
        lw      a0,-40(s0)
        call    fprintf
        j       .L739
.L733:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC191)
        addi    a1,a5,%lo(.LC191)
        lw      a0,-40(s0)
        call    fprintf
        j       .L739
.L732:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L747
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC192)
        addi    a1,a5,%lo(.LC192)
        lw      a0,-40(s0)
        call    fprintf
        j       .L739
.L747:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC193)
        addi    a1,a5,%lo(.LC193)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L739
.L730:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC194)
        addi    a1,a5,%lo(.LC194)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L739
.L731:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC195)
        addi    a1,a5,%lo(.LC195)
        lw      a0,-40(s0)
        call    fprintf
        j       .L739
.L749:
        nop
.L739:
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC196:
        .string "%*smethod: {\n"
print_method:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        sw      a2,-60(s0)
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC196)
        addi    a1,a5,%lo(.LC196)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC181)
        addi    a1,a5,%lo(.LC181)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-52(s0)
        lw      a4,0(a5)
        lw      a5,-60(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-56(s0)
        mv      a0,a4
        call    print_symbol
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a2,a5,2
        lw      a5,-52(s0)
        lw      a5,4(a5)
        lw      a4,0(a5)
        lw      a5,-52(s0)
        lw      a5,4(a5)
        lw      a5,12(a5)
        lui     a3,%hi(.LC176)
        addi    a3,a3,%lo(.LC176)
        lui     a1,%hi(.LC182)
        addi    a1,a1,%lo(.LC182)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC183)
        addi    a1,a5,%lo(.LC183)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-52(s0)
        lw      a5,8(a5)
        sw      a5,-20(s0)
        j       .L751
.L757:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L752
.L755:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L753
.L754:
        lw      a5,-60(s0)
        addi    a5,a5,2
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC177)
        addi    a1,a5,%lo(.LC177)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,3
        mv      a2,a5
        lw      a1,-56(s0)
        lw      a0,-28(s0)
        call    print_symbol
        lw      a5,-60(s0)
        addi    a5,a5,2
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        sw      zero,-28(s0)
.L753:
        lw      a5,-28(s0)
        bne     a5,zero,.L754
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L752:
        lw      a5,-24(s0)
        bne     a5,zero,.L755
        sw      zero,-20(s0)
.L751:
        lw      a5,-20(s0)
        beq     a5,zero,.L756
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L757
.L756:
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC184)
        addi    a1,a5,%lo(.LC184)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-52(s0)
        lw      a5,12(a5)
        sw      a5,-32(s0)
        j       .L758
.L764:
        lw      a5,-32(s0)
        lw      a5,0(a5)
        sw      a5,-36(s0)
        j       .L759
.L762:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-40(s0)
        j       .L760
.L761:
        lw      a5,-60(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-56(s0)
        lw      a0,-40(s0)
        call    print_statement
        sw      zero,-40(s0)
.L760:
        lw      a5,-40(s0)
        bne     a5,zero,.L761
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-36(s0)
.L759:
        lw      a5,-36(s0)
        bne     a5,zero,.L762
        sw      zero,-32(s0)
.L758:
        lw      a5,-32(s0)
        beq     a5,zero,.L763
        lw      a5,-32(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L764
.L763:
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        nop
        lw      ra,60(sp)
        lw      s0,56(sp)
        addi    sp,sp,64
        jr      ra
.LC197:
        .string "%*sif: {\n"
.LC198:
        .string "%*scondition: {\n"
.LC199:
        .string "%*selif_list: {\n"
.LC200:
        .string "%*selse_body: {\n"
print_if:
        addi    sp,sp,-80
        sw      ra,76(sp)
        sw      s0,72(sp)
        addi    s0,sp,80
        sw      a0,-68(s0)
        sw      a1,-72(s0)
        sw      a2,-76(s0)
        lw      a5,-76(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC197)
        addi    a1,a5,%lo(.LC197)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-76(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC198)
        addi    a1,a5,%lo(.LC198)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-68(s0)
        lw      a4,0(a5)
        lw      a5,-76(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-72(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-76(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-76(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC184)
        addi    a1,a5,%lo(.LC184)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-68(s0)
        lw      a5,4(a5)
        sw      a5,-20(s0)
        j       .L766
.L772:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L767
.L770:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L768
.L769:
        lw      a5,-76(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-72(s0)
        lw      a0,-28(s0)
        call    print_statement
        sw      zero,-28(s0)
.L768:
        lw      a5,-28(s0)
        bne     a5,zero,.L769
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L767:
        lw      a5,-24(s0)
        bne     a5,zero,.L770
        sw      zero,-20(s0)
.L766:
        lw      a5,-20(s0)
        beq     a5,zero,.L771
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L772
.L771:
        lw      a5,-76(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-76(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC199)
        addi    a1,a5,%lo(.LC199)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-68(s0)
        lw      a5,8(a5)
        sw      a5,-32(s0)
        j       .L773
.L786:
        lw      a5,-32(s0)
        lw      a5,0(a5)
        sw      a5,-36(s0)
        j       .L774
.L784:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-40(s0)
        j       .L775
.L783:
        lw      a5,-76(s0)
        addi    a5,a5,2
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC177)
        addi    a1,a5,%lo(.LC177)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-76(s0)
        addi    a5,a5,3
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC198)
        addi    a1,a5,%lo(.LC198)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-40(s0)
        lw      a4,0(a5)
        lw      a5,-76(s0)
        addi    a5,a5,4
        mv      a2,a5
        lw      a1,-72(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-76(s0)
        addi    a5,a5,3
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-76(s0)
        addi    a5,a5,3
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC184)
        addi    a1,a5,%lo(.LC184)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-40(s0)
        lw      a5,4(a5)
        sw      a5,-44(s0)
        j       .L776
.L782:
        lw      a5,-44(s0)
        lw      a5,0(a5)
        sw      a5,-48(s0)
        j       .L777
.L780:
        lw      a5,-48(s0)
        lw      a5,0(a5)
        sw      a5,-52(s0)
        j       .L778
.L779:
        lw      a5,-76(s0)
        addi    a5,a5,4
        mv      a2,a5
        lw      a1,-72(s0)
        lw      a0,-52(s0)
        call    print_statement
        sw      zero,-52(s0)
.L778:
        lw      a5,-52(s0)
        bne     a5,zero,.L779
        lw      a5,-48(s0)
        lw      a5,4(a5)
        sw      a5,-48(s0)
.L777:
        lw      a5,-48(s0)
        bne     a5,zero,.L780
        sw      zero,-44(s0)
.L776:
        lw      a5,-44(s0)
        beq     a5,zero,.L781
        lw      a5,-44(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L782
.L781:
        lw      a5,-76(s0)
        addi    a5,a5,3
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-76(s0)
        addi    a5,a5,2
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-72(s0)
        call    fprintf
        sw      zero,-40(s0)
.L775:
        lw      a5,-40(s0)
        bne     a5,zero,.L783
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-36(s0)
.L774:
        lw      a5,-36(s0)
        bne     a5,zero,.L784
        sw      zero,-32(s0)
.L773:
        lw      a5,-32(s0)
        beq     a5,zero,.L785
        lw      a5,-32(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L786
.L785:
        lw      a5,-76(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-76(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC200)
        addi    a1,a5,%lo(.LC200)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-68(s0)
        lw      a5,12(a5)
        sw      a5,-56(s0)
        j       .L787
.L793:
        lw      a5,-56(s0)
        lw      a5,0(a5)
        sw      a5,-60(s0)
        j       .L788
.L791:
        lw      a5,-60(s0)
        lw      a5,0(a5)
        sw      a5,-64(s0)
        j       .L789
.L790:
        lw      a5,-76(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-72(s0)
        lw      a0,-64(s0)
        call    print_statement
        sw      zero,-64(s0)
.L789:
        lw      a5,-64(s0)
        bne     a5,zero,.L790
        lw      a5,-60(s0)
        lw      a5,4(a5)
        sw      a5,-60(s0)
.L788:
        lw      a5,-60(s0)
        bne     a5,zero,.L791
        sw      zero,-56(s0)
.L787:
        lw      a5,-56(s0)
        beq     a5,zero,.L792
        lw      a5,-56(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L793
.L792:
        lw      a5,-76(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-72(s0)
        call    fprintf
        lw      a5,-76(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-72(s0)
        call    fprintf
        nop
        lw      ra,76(sp)
        lw      s0,72(sp)
        addi    sp,sp,80
        jr      ra
.LC201:
        .string "%*sfor: {\n"
.LC202:
        .string "%*sinit: {\n"
.LC203:
        .string "%*sinit: null\n"
.LC204:
        .string "%*scondition: null\n"
.LC205:
        .string "%*sincrement: {\n"
.LC206:
        .string "%*sincrement: null\n"
print_for:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC201)
        addi    a1,a5,%lo(.LC201)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L795
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC202)
        addi    a1,a5,%lo(.LC202)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_variable
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L796
.L795:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L797
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC202)
        addi    a1,a5,%lo(.LC202)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L796
.L797:
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC203)
        addi    a1,a5,%lo(.LC203)
        lw      a0,-40(s0)
        call    fprintf
.L796:
        lw      a5,-36(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L798
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC198)
        addi    a1,a5,%lo(.LC198)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,4(a5)
        lw      a5,-44(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L799
.L798:
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC204)
        addi    a1,a5,%lo(.LC204)
        lw      a0,-40(s0)
        call    fprintf
.L799:
        lw      a5,-36(s0)
        lw      a5,8(a5)
        beq     a5,zero,.L800
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC205)
        addi    a1,a5,%lo(.LC205)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,8(a5)
        lw      a5,-44(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L801
.L800:
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC206)
        addi    a1,a5,%lo(.LC206)
        lw      a0,-40(s0)
        call    fprintf
.L801:
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC184)
        addi    a1,a5,%lo(.LC184)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a5,12(a5)
        sw      a5,-20(s0)
        j       .L802
.L808:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L803
.L806:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L804
.L805:
        lw      a5,-44(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-40(s0)
        lw      a0,-28(s0)
        call    print_statement
        sw      zero,-28(s0)
.L804:
        lw      a5,-28(s0)
        bne     a5,zero,.L805
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L803:
        lw      a5,-24(s0)
        bne     a5,zero,.L806
        sw      zero,-20(s0)
.L802:
        lw      a5,-20(s0)
        beq     a5,zero,.L807
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L808
.L807:
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC207:
        .string "%*swhile: {\n"
print_while:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC207)
        addi    a1,a5,%lo(.LC207)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC198)
        addi    a1,a5,%lo(.LC198)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC184)
        addi    a1,a5,%lo(.LC184)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-20(s0)
        j       .L810
.L816:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L811
.L814:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L812
.L813:
        lw      a5,-44(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-40(s0)
        lw      a0,-28(s0)
        call    print_statement
        sw      zero,-28(s0)
.L812:
        lw      a5,-28(s0)
        bne     a5,zero,.L813
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L811:
        lw      a5,-24(s0)
        bne     a5,zero,.L814
        sw      zero,-20(s0)
.L810:
        lw      a5,-20(s0)
        beq     a5,zero,.L815
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L816
.L815:
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC208:
        .string "%*sprimary: {\n"
.LC209:
        .string "%*sleft: {\n"
.LC210:
        .string "%*soperator: \"%s\"\n"
.LC211:
        .string "%*sright: {\n"
print_expression:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s1,20(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        sw      a2,-28(s0)
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,21
        bne     a4,a5,.L818
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC208)
        addi    a1,a5,%lo(.LC208)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-24(s0)
        mv      a0,a4
        call    print_primary
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        j       .L820
.L818:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC209)
        addi    a1,a5,%lo(.LC209)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-24(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-28(s0)
        slli    s1,a5,2
        lw      a5,-20(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    operator_string
        mv      a5,a0
        mv      a4,a5
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,s1
        lui     a5,%hi(.LC210)
        addi    a1,a5,%lo(.LC210)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC211)
        addi    a1,a5,%lo(.LC211)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lw      a5,-28(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-24(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
.L820:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        lw      s1,20(sp)
        addi    sp,sp,32
        jr      ra
.LC212:
        .string "%*svariable: {\n"
.LC213:
        .string "%*sinitializer: {\n"
.LC214:
        .string "%*sinitializer: null\n"
print_variable:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        sw      a2,-28(s0)
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC212)
        addi    a1,a5,%lo(.LC212)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-28(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC181)
        addi    a1,a5,%lo(.LC181)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-24(s0)
        mv      a0,a4
        call    print_symbol
        lw      a5,-28(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L822
        lw      a5,-28(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC213)
        addi    a1,a5,%lo(.LC213)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lw      a5,-28(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-24(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-28(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        j       .L823
.L822:
        lw      a5,-28(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC214)
        addi    a1,a5,%lo(.LC214)
        lw      a0,-24(s0)
        call    fprintf
.L823:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC215:
        .string "%*sint literal: %s\n"
.LC216:
        .string "%*sfloat literal: %s\n"
.LC217:
        .string "%*sstring literal: \"%s\"\n"
.LC218:
        .string "%*sbool literal: %s\n"
.LC219:
        .string "%*snot: {\n"
.LC220:
        .string "%*sneg: {\n"
.LC221:
        .string "%*sexp: {\n"
.LC222:
        .string "%*serror: \"Unknown primary type\"\n"
print_primary:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        sw      a2,-28(s0)
        lw      a5,-20(s0)
        lw      a5,8(a5)
        li      a4,7
        beq     a5,a4,.L825
        li      a4,7
        bgtu    a5,a4,.L826
        li      a4,6
        beq     a5,a4,.L827
        li      a4,6
        bgtu    a5,a4,.L826
        li      a4,5
        beq     a5,a4,.L828
        li      a4,5
        bgtu    a5,a4,.L826
        li      a4,4
        beq     a5,a4,.L829
        li      a4,4
        bgtu    a5,a4,.L826
        li      a4,3
        beq     a5,a4,.L830
        li      a4,3
        bgtu    a5,a4,.L826
        li      a4,2
        beq     a5,a4,.L831
        li      a4,2
        bgtu    a5,a4,.L826
        beq     a5,zero,.L832
        li      a4,1
        beq     a5,a4,.L833
        j       .L826
.L832:
        lw      a5,-28(s0)
        slli    a2,a5,2
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a4,a5
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        lui     a5,%hi(.LC215)
        addi    a1,a5,%lo(.LC215)
        lw      a0,-24(s0)
        call    fprintf
        j       .L834
.L833:
        lw      a5,-28(s0)
        slli    a2,a5,2
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a4,a5
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        lui     a5,%hi(.LC216)
        addi    a1,a5,%lo(.LC216)
        lw      a0,-24(s0)
        call    fprintf
        j       .L834
.L831:
        lw      a5,-28(s0)
        slli    a2,a5,2
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a4,a5
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        lui     a5,%hi(.LC217)
        addi    a1,a5,%lo(.LC217)
        lw      a0,-24(s0)
        call    fprintf
        j       .L834
.L830:
        lw      a5,-28(s0)
        slli    a2,a5,2
        lw      a5,-20(s0)
        lw      a5,0(a5)
        mv      a4,a5
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        lui     a5,%hi(.LC218)
        addi    a1,a5,%lo(.LC218)
        lw      a0,-24(s0)
        call    fprintf
        j       .L834
.L827:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC219)
        addi    a1,a5,%lo(.LC219)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-24(s0)
        mv      a0,a4
        call    print_primary
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        j       .L834
.L828:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC220)
        addi    a1,a5,%lo(.LC220)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-24(s0)
        mv      a0,a4
        call    print_primary
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        j       .L834
.L829:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC221)
        addi    a1,a5,%lo(.LC221)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-28(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-24(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-24(s0)
        call    fprintf
        j       .L834
.L825:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        lw      a2,-28(s0)
        lw      a1,-24(s0)
        mv      a0,a5
        call    print_variable_access
        j       .L834
.L826:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC222)
        addi    a1,a5,%lo(.LC222)
        lw      a0,-24(s0)
        call    fprintf
        nop
.L834:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC223:
        .string "%*sbase: {\n"
.LC224:
        .string "%*svar: {\n"
.LC225:
        .string "%*scall: {\n"
.LC226:
        .string "%*sarg[%d]: {\n"
.LC227:
        .string "%*sattribute: {\n"
.LC228:
        .string "%*sindex: {\n"
.LC229:
        .string "%*serror: \"Unknown variable access type\"\n"
print_variable_access:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L836
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC223)
        addi    a1,a5,%lo(.LC223)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_variable_access
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
.L836:
        lw      a5,-36(s0)
        lw      a5,12(a5)
        li      a4,3
        beq     a5,a4,.L837
        li      a4,3
        bgtu    a5,a4,.L838
        li      a4,2
        beq     a5,a4,.L839
        li      a4,2
        bgtu    a5,a4,.L838
        beq     a5,zero,.L840
        li      a4,1
        beq     a5,a4,.L841
        j       .L838
.L840:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC224)
        addi    a1,a5,%lo(.LC224)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,4(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_symbol
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L842
.L841:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC225)
        addi    a1,a5,%lo(.LC225)
        lw      a0,-40(s0)
        call    fprintf
        sw      zero,-20(s0)
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
        j       .L843
.L849:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L844
.L847:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        sw      a5,-32(s0)
        j       .L845
.L846:
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a2,a5,2
        lw      a5,-20(s0)
        addi    a4,a5,1
        sw      a4,-20(s0)
        mv      a4,a5
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        lui     a5,%hi(.LC226)
        addi    a1,a5,%lo(.LC226)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-44(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-40(s0)
        lw      a0,-32(s0)
        call    print_expression
        lw      a5,-44(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        sw      zero,-32(s0)
.L845:
        lw      a5,-32(s0)
        bne     a5,zero,.L846
        lw      a5,-28(s0)
        lw      a5,4(a5)
        sw      a5,-28(s0)
.L844:
        lw      a5,-28(s0)
        bne     a5,zero,.L847
        sw      zero,-24(s0)
.L843:
        lw      a5,-24(s0)
        beq     a5,zero,.L848
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L849
.L848:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L842
.L839:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC227)
        addi    a1,a5,%lo(.LC227)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,4(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_symbol
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L842
.L837:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC228)
        addi    a1,a5,%lo(.LC228)
        lw      a0,-40(s0)
        call    fprintf
        lw      a5,-36(s0)
        lw      a4,4(a5)
        lw      a5,-44(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-40(s0)
        mv      a0,a4
        call    print_expression
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-40(s0)
        call    fprintf
        j       .L842
.L838:
        lw      a5,-44(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC229)
        addi    a1,a5,%lo(.LC229)
        lw      a0,-40(s0)
        call    fprintf
        nop
.L842:
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC230:
        .string "%*sname: \"%s(%zu)\"\n"
.LC231:
        .string "%*skind: \"type\"\n"
.LC232:
        .string "%*skind: \"variable\"\n"
.LC233:
        .string "%*skind: \"function\"\n"
.LC234:
        .string "%*skind: \"class\"\n"
.LC235:
        .string "%*skind: \"method\"\n"
.LC236:
        .string "%*skind: \"attribute\"\n"
.LC237:
        .string "%*skind: \"parameter\"\n"
.LC238:
        .string "%*skind: \"unknown\"\n"
.LC239:
        .string "%*stype: \"%s(%zu)\"\n"
.LC240:
        .string "%*stype: null\n"
.LC241:
        .string "%*soffset: %zu\n"
.LC242:
        .string "%*soffset: null\n"
print_symbol:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        sw      a2,-28(s0)
        lw      a5,-28(s0)
        slli    a2,a5,2
        lw      a5,-20(s0)
        lw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a5,12(a5)
        lui     a3,%hi(.LC176)
        addi    a3,a3,%lo(.LC176)
        lui     a1,%hi(.LC230)
        addi    a1,a1,%lo(.LC230)
        lw      a0,-24(s0)
        call    fprintf
        lw      a5,-20(s0)
        lw      a5,8(a5)
        li      a4,6
        beq     a5,a4,.L851
        li      a4,6
        bgtu    a5,a4,.L852
        li      a4,5
        beq     a5,a4,.L853
        li      a4,5
        bgtu    a5,a4,.L852
        li      a4,4
        beq     a5,a4,.L854
        li      a4,4
        bgtu    a5,a4,.L852
        li      a4,3
        beq     a5,a4,.L855
        li      a4,3
        bgtu    a5,a4,.L852
        li      a4,2
        beq     a5,a4,.L856
        li      a4,2
        bgtu    a5,a4,.L852
        beq     a5,zero,.L857
        li      a4,1
        beq     a5,a4,.L858
        j       .L852
.L857:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC231)
        addi    a1,a5,%lo(.LC231)
        lw      a0,-24(s0)
        call    fprintf
        j       .L859
.L858:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC232)
        addi    a1,a5,%lo(.LC232)
        lw      a0,-24(s0)
        call    fprintf
        j       .L859
.L856:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC233)
        addi    a1,a5,%lo(.LC233)
        lw      a0,-24(s0)
        call    fprintf
        j       .L859
.L855:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC234)
        addi    a1,a5,%lo(.LC234)
        lw      a0,-24(s0)
        call    fprintf
        j       .L859
.L854:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC235)
        addi    a1,a5,%lo(.LC235)
        lw      a0,-24(s0)
        call    fprintf
        j       .L859
.L853:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC236)
        addi    a1,a5,%lo(.LC236)
        lw      a0,-24(s0)
        call    fprintf
        j       .L859
.L851:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC237)
        addi    a1,a5,%lo(.LC237)
        lw      a0,-24(s0)
        call    fprintf
        j       .L859
.L852:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC238)
        addi    a1,a5,%lo(.LC238)
        lw      a0,-24(s0)
        call    fprintf
        nop
.L859:
        lw      a5,-20(s0)
        lw      a5,4(a5)
        beq     a5,zero,.L860
        lw      a5,-28(s0)
        slli    a2,a5,2
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a5,12(a5)
        lui     a3,%hi(.LC176)
        addi    a3,a3,%lo(.LC176)
        lui     a1,%hi(.LC239)
        addi    a1,a1,%lo(.LC239)
        lw      a0,-24(s0)
        call    fprintf
        j       .L861
.L860:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC240)
        addi    a1,a5,%lo(.LC240)
        lw      a0,-24(s0)
        call    fprintf
.L861:
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,1
        beq     a4,a5,.L862
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,6
        beq     a4,a5,.L862
        lw      a5,-20(s0)
        lw      a4,8(a5)
        li      a5,5
        bne     a4,a5,.L863
.L862:
        lw      a5,-28(s0)
        slli    a2,a5,2
        lw      a5,-20(s0)
        lw      a5,16(a5)
        mv      a4,a5
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        lui     a5,%hi(.LC241)
        addi    a1,a5,%lo(.LC241)
        lw      a0,-24(s0)
        call    fprintf
        j       .L864
.L863:
        lw      a5,-28(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC242)
        addi    a1,a5,%lo(.LC242)
        lw      a0,-24(s0)
        call    fprintf
        nop
.L864:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC243:
        .string "(none)"
.LC244:
        .string "(unknown operator)"
operator_string:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a4,-20(s0)
        li      a5,21
        beq     a4,a5,.L866
        lw      a4,-20(s0)
        li      a5,21
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,20
        beq     a4,a5,.L868
        lw      a4,-20(s0)
        li      a5,20
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,19
        beq     a4,a5,.L869
        lw      a4,-20(s0)
        li      a5,19
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,18
        beq     a4,a5,.L870
        lw      a4,-20(s0)
        li      a5,18
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,17
        beq     a4,a5,.L871
        lw      a4,-20(s0)
        li      a5,17
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,16
        beq     a4,a5,.L872
        lw      a4,-20(s0)
        li      a5,16
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,15
        beq     a4,a5,.L873
        lw      a4,-20(s0)
        li      a5,15
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,14
        beq     a4,a5,.L874
        lw      a4,-20(s0)
        li      a5,14
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,13
        beq     a4,a5,.L875
        lw      a4,-20(s0)
        li      a5,13
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,12
        beq     a4,a5,.L876
        lw      a4,-20(s0)
        li      a5,12
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,11
        beq     a4,a5,.L877
        lw      a4,-20(s0)
        li      a5,11
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,10
        beq     a4,a5,.L878
        lw      a4,-20(s0)
        li      a5,10
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,9
        beq     a4,a5,.L879
        lw      a4,-20(s0)
        li      a5,9
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,8
        beq     a4,a5,.L880
        lw      a4,-20(s0)
        li      a5,8
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,7
        beq     a4,a5,.L881
        lw      a4,-20(s0)
        li      a5,7
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,6
        beq     a4,a5,.L882
        lw      a4,-20(s0)
        li      a5,6
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,5
        beq     a4,a5,.L883
        lw      a4,-20(s0)
        li      a5,5
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,4
        beq     a4,a5,.L884
        lw      a4,-20(s0)
        li      a5,4
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,3
        beq     a4,a5,.L885
        lw      a4,-20(s0)
        li      a5,3
        bgtu    a4,a5,.L867
        lw      a4,-20(s0)
        li      a5,2
        beq     a4,a5,.L886
        lw      a4,-20(s0)
        li      a5,2
        bgtu    a4,a5,.L867
        lw      a5,-20(s0)
        beq     a5,zero,.L887
        lw      a4,-20(s0)
        li      a5,1
        beq     a4,a5,.L888
        j       .L867
.L887:
        lui     a5,%hi(.LC121)
        addi    a5,a5,%lo(.LC121)
        j       .L889
.L888:
        lui     a5,%hi(.LC122)
        addi    a5,a5,%lo(.LC122)
        j       .L889
.L886:
        lui     a5,%hi(.LC123)
        addi    a5,a5,%lo(.LC123)
        j       .L889
.L885:
        lui     a5,%hi(.LC124)
        addi    a5,a5,%lo(.LC124)
        j       .L889
.L884:
        lui     a5,%hi(.LC125)
        addi    a5,a5,%lo(.LC125)
        j       .L889
.L883:
        lui     a5,%hi(.LC128)
        addi    a5,a5,%lo(.LC128)
        j       .L889
.L882:
        lui     a5,%hi(.LC129)
        addi    a5,a5,%lo(.LC129)
        j       .L889
.L881:
        lui     a5,%hi(.LC130)
        addi    a5,a5,%lo(.LC130)
        j       .L889
.L880:
        lui     a5,%hi(.LC126)
        addi    a5,a5,%lo(.LC126)
        j       .L889
.L879:
        lui     a5,%hi(.LC127)
        addi    a5,a5,%lo(.LC127)
        j       .L889
.L878:
        lui     a5,%hi(.LC131)
        addi    a5,a5,%lo(.LC131)
        j       .L889
.L877:
        lui     a5,%hi(.LC132)
        addi    a5,a5,%lo(.LC132)
        j       .L889
.L876:
        lui     a5,%hi(.LC133)
        addi    a5,a5,%lo(.LC133)
        j       .L889
.L875:
        lui     a5,%hi(.LC134)
        addi    a5,a5,%lo(.LC134)
        j       .L889
.L874:
        lui     a5,%hi(.LC135)
        addi    a5,a5,%lo(.LC135)
        j       .L889
.L873:
        lui     a5,%hi(.LC136)
        addi    a5,a5,%lo(.LC136)
        j       .L889
.L872:
        lui     a5,%hi(.LC137)
        addi    a5,a5,%lo(.LC137)
        j       .L889
.L871:
        lui     a5,%hi(.LC138)
        addi    a5,a5,%lo(.LC138)
        j       .L889
.L870:
        lui     a5,%hi(.LC139)
        addi    a5,a5,%lo(.LC139)
        j       .L889
.L869:
        lui     a5,%hi(.LC122)
        addi    a5,a5,%lo(.LC122)
        j       .L889
.L868:
        lui     a5,%hi(.LC116)
        addi    a5,a5,%lo(.LC116)
        j       .L889
.L866:
        lui     a5,%hi(.LC243)
        addi    a5,a5,%lo(.LC243)
        j       .L889
.L867:
        lui     a5,%hi(.LC244)
        addi    a5,a5,%lo(.LC244)
.L889:
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC245:
        .string "%*sSymbolTable (type: global): {\n"
.LC246:
        .string "%*sSymbolTable (type: function): {\n"
.LC247:
        .string "%*sSymbolTable (type: class): {\n"
.LC248:
        .string "%*sSymbolTable (type: method): {\n"
.LC249:
        .string "%*sSymbolTable (type: block): {\n"
.LC250:
        .string "%*sSymbolTable (type: unknown): {\n"
.LC251:
        .string "%*ssymbols:\n"
.LC252:
        .string "%*ssub-tables:\n"
print_symbol_table_recursive:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        sw      a2,-60(s0)
        lw      a5,-52(s0)
        lw      a5,4(a5)
        li      a4,4
        beq     a5,a4,.L891
        li      a4,4
        bgtu    a5,a4,.L892
        li      a4,3
        beq     a5,a4,.L893
        li      a4,3
        bgtu    a5,a4,.L892
        li      a4,2
        beq     a5,a4,.L894
        li      a4,2
        bgtu    a5,a4,.L892
        beq     a5,zero,.L895
        li      a4,1
        beq     a5,a4,.L896
        j       .L892
.L895:
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC245)
        addi    a1,a5,%lo(.LC245)
        lw      a0,-56(s0)
        call    fprintf
        j       .L897
.L896:
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC246)
        addi    a1,a5,%lo(.LC246)
        lw      a0,-56(s0)
        call    fprintf
        j       .L897
.L894:
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC247)
        addi    a1,a5,%lo(.LC247)
        lw      a0,-56(s0)
        call    fprintf
        j       .L897
.L893:
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC248)
        addi    a1,a5,%lo(.LC248)
        lw      a0,-56(s0)
        call    fprintf
        j       .L897
.L891:
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC249)
        addi    a1,a5,%lo(.LC249)
        lw      a0,-56(s0)
        call    fprintf
        j       .L897
.L892:
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC250)
        addi    a1,a5,%lo(.LC250)
        lw      a0,-56(s0)
        call    fprintf
        nop
.L897:
        lw      a5,-52(s0)
        lw      a5,8(a5)
        beq     a5,zero,.L898
        lw      a5,-52(s0)
        lw      a5,8(a5)
        lw      a5,0(a5)
        beq     a5,zero,.L898
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC251)
        addi    a1,a5,%lo(.LC251)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-52(s0)
        lw      a5,8(a5)
        sw      a5,-20(s0)
        j       .L899
.L904:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
        j       .L900
.L903:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L901
.L902:
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC177)
        addi    a1,a5,%lo(.LC177)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-60(s0)
        addi    a5,a5,2
        mv      a2,a5
        lw      a1,-56(s0)
        lw      a0,-28(s0)
        call    print_symbol
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        sw      zero,-28(s0)
.L901:
        lw      a5,-28(s0)
        bne     a5,zero,.L902
        lw      a5,-24(s0)
        lw      a5,4(a5)
        sw      a5,-24(s0)
.L900:
        lw      a5,-24(s0)
        bne     a5,zero,.L903
        sw      zero,-20(s0)
.L899:
        lw      a5,-20(s0)
        beq     a5,zero,.L898
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L904
.L898:
        lw      a5,-52(s0)
        lw      a5,12(a5)
        beq     a5,zero,.L905
        lw      a5,-52(s0)
        lw      a5,12(a5)
        lw      a5,0(a5)
        beq     a5,zero,.L905
        lw      a5,-60(s0)
        addi    a5,a5,1
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC252)
        addi    a1,a5,%lo(.LC252)
        lw      a0,-56(s0)
        call    fprintf
        lw      a5,-52(s0)
        lw      a5,12(a5)
        sw      a5,-32(s0)
        j       .L906
.L911:
        lw      a5,-32(s0)
        lw      a5,0(a5)
        sw      a5,-36(s0)
        j       .L907
.L910:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        sw      a5,-40(s0)
        j       .L908
.L909:
        lw      a5,-60(s0)
        addi    a5,a5,1
        mv      a2,a5
        lw      a1,-56(s0)
        lw      a0,-40(s0)
        call    print_symbol_table_recursive
        sw      zero,-40(s0)
.L908:
        lw      a5,-40(s0)
        bne     a5,zero,.L909
        lw      a5,-36(s0)
        lw      a5,4(a5)
        sw      a5,-36(s0)
.L907:
        lw      a5,-36(s0)
        bne     a5,zero,.L910
        sw      zero,-32(s0)
.L906:
        lw      a5,-32(s0)
        beq     a5,zero,.L905
        lw      a5,-32(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L911
.L905:
        lw      a5,-60(s0)
        slli    a4,a5,2
        lui     a5,%hi(.LC176)
        addi    a3,a5,%lo(.LC176)
        mv      a2,a4
        lui     a5,%hi(.LC179)
        addi    a1,a5,%lo(.LC179)
        lw      a0,-56(s0)
        call    fprintf
        nop
        lw      ra,60(sp)
        lw      s0,56(sp)
        addi    sp,sp,64
        jr      ra
print_symbol_table:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        li      a2,0
        lw      a1,-24(s0)
        lw      a0,-20(s0)
        call    print_symbol_table_recursive
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
create_parser:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        li      a4,1
        sb      a4,32(a5)
        li      a1,1
        li      a0,24
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,4(a5)
        lw      a5,-36(s0)
        lw      a4,0(a5)
        lw      a5,-20(s0)
        sw      a4,8(a5)
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC253:
        .string "Unexpected token"
.LC254:
        .string "[parser Error] at %s:%zu:%zu: %s, "
parse_code:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s1,36(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        li      a1,1
        li      a0,12
        call    alloc_memory
        sw      a0,-24(s0)
        call    list_create
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,4(a5)
        lw      a5,-36(s0)
        lw      a4,8(a5)
        lw      a5,-24(s0)
        sw      a4,0(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        mv      a1,a5
        li      a0,0
        call    create_symbol_table
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,8(a5)
        j       .L916
.L922:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L917
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_IMPORT)
        lw      a5,%lo(KEYWORD_IMPORT)(a5)
        bne     a4,a5,.L917
        lw      a5,-24(s0)
        lw      s1,4(a5)
        lw      a5,-24(s0)
        lw      a5,8(a5)
        lw      a2,-24(s0)
        mv      a1,a5
        lw      a0,-36(s0)
        call    parse_import
        mv      a5,a0
        mv      a1,a5
        li      a0,2
        call    create_code_member
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
        j       .L918
.L917:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L919
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_CLASS)
        lw      a5,%lo(KEYWORD_CLASS)(a5)
        bne     a4,a5,.L919
        lw      a5,-24(s0)
        lw      s1,4(a5)
        lw      a5,-24(s0)
        lw      a5,8(a5)
        mv      a1,a5
        lw      a0,-36(s0)
        call    parse_class
        mv      a5,a0
        mv      a1,a5
        li      a0,1
        call    create_code_member
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
        j       .L918
.L919:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L920
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FUNC)
        lw      a5,%lo(KEYWORD_FUNC)(a5)
        bne     a4,a5,.L920
        lw      a5,-24(s0)
        lw      s1,4(a5)
        lw      a5,-24(s0)
        lw      a5,8(a5)
        mv      a1,a5
        lw      a0,-36(s0)
        call    parse_function
        mv      a5,a0
        mv      a1,a5
        li      a0,0
        call    create_code_member
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
        j       .L918
.L920:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC253)
        addi    a5,a5,%lo(.LC253)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
.L918:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
.L916:
        lw      a5,-20(s0)
        beq     a5,zero,.L921
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,7
        bne     a4,a5,.L922
.L921:
        lw      a5,-24(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        addi    sp,sp,48
        jr      ra
create_code_member:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,4(a5)
        lw      a4,-36(s0)
        li      a5,2
        beq     a4,a5,.L925
        lw      a4,-36(s0)
        li      a5,2
        bgtu    a4,a5,.L926
        lw      a5,-36(s0)
        beq     a5,zero,.L927
        lw      a4,-36(s0)
        li      a5,1
        beq     a4,a5,.L928
        j       .L926
.L927:
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,0(a5)
        j       .L929
.L928:
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,0(a5)
        j       .L929
.L925:
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,0(a5)
        j       .L929
.L926:
        lw      a5,-20(s0)
        sw      zero,0(a5)
        nop
.L929:
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
from_file_import:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        sw      s1,52(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        lw      a0,-56(s0)
        call    create_file
        sw      a0,-36(s0)
        sw      zero,-20(s0)
        lui     a5,%hi(parsed_files)
        lw      a5,%lo(parsed_files)(a5)
        sw      a5,-24(s0)
        j       .L932
.L940:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L933
.L938:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        sw      a5,-32(s0)
        j       .L934
.L937:
        lw      a5,-32(s0)
        beq     a5,zero,.L935
        lw      a5,-32(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    file_full_path
        mv      s1,a0
        lw      a0,-36(s0)
        call    file_full_path
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    strcmp
        mv      a5,a0
        bne     a5,zero,.L935
        lw      a5,-32(s0)
        sw      a5,-20(s0)
        j       .L936
.L935:
        sw      zero,-32(s0)
.L934:
        lw      a5,-32(s0)
        bne     a5,zero,.L937
.L936:
        lw      a5,-28(s0)
        lw      a5,4(a5)
        sw      a5,-28(s0)
.L933:
        lw      a5,-28(s0)
        bne     a5,zero,.L938
        sw      zero,-24(s0)
.L932:
        lw      a5,-24(s0)
        beq     a5,zero,.L939
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L940
.L939:
        lw      a5,-20(s0)
        bne     a5,zero,.L941
        lw      a0,-36(s0)
        call    create_lexer
        mv      a5,a0
        mv      a0,a5
        call    create_parser
        mv      a5,a0
        mv      a0,a5
        call    parse_code
        sw      a0,-20(s0)
        lui     a5,%hi(parsed_files)
        lw      a5,%lo(parsed_files)(a5)
        lw      a1,-20(s0)
        mv      a0,a5
        call    list_append
.L941:
        lw      a5,-20(s0)
        lw      a5,8(a5)
        li      a4,0
        li      a3,0
        li      a2,0
        lw      a1,-52(s0)
        mv      a0,a5
        call    search_symbol
        mv      a5,a0
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        lw      s1,52(sp)
        addi    sp,sp,64
        jr      ra
.LC255:
        .string "Expected identifier after 'import'"
.LC256:
        .string "/home/su2u4/code/TC/std/"
.LC257:
        .string "%s/%s.tc"
.LC258:
        .string "Expected 'from' after import name"
.LC259:
        .string "Expected string literal after 'from'"
.LC260:
        .string "%s/%s"
.LC261:
        .string "Expected ';' after import path"
.LC262:
        .string "Failed to import module"
parse_import:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s1,36(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-24(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L944
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC255)
        addi    a5,a5,%lo(.LC255)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L945
.L944:
        lw      a5,-20(s0)
        lw      a5,4(a5)
        sw      a5,-28(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L946
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        bne     a4,a5,.L946
        lw      a2,-28(s0)
        lui     a5,%hi(.LC256)
        addi    a1,a5,%lo(.LC256)
        lui     a5,%hi(.LC257)
        addi    a0,a5,%lo(.LC257)
        call    string_splice
        mv      a5,a0
        mv      a0,a5
        call    create_file
        mv      a5,a0
        mv      a0,a5
        call    file_full_path
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,4(a5)
        j       .L947
.L946:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L948
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FROM)
        lw      a5,%lo(KEYWORD_FROM)(a5)
        beq     a4,a5,.L949
.L948:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC258)
        addi    a5,a5,%lo(.LC258)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L945
.L949:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,3
        beq     a4,a5,.L950
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC259)
        addi    a5,a5,%lo(.LC259)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L945
.L950:
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_dir_path
        mv      a4,a0
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a2,a5
        mv      a1,a4
        lui     a5,%hi(.LC260)
        addi    a0,a5,%lo(.LC260)
        call    string_splice
        mv      a5,a0
        mv      a0,a5
        call    create_file
        mv      a5,a0
        mv      a0,a5
        call    file_full_path
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,4(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L951
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        beq     a4,a5,.L947
.L951:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC261)
        addi    a5,a5,%lo(.LC261)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L945
.L947:
        lw      a5,-24(s0)
        lw      a5,4(a5)
        mv      a1,a5
        lw      a0,-28(s0)
        call    from_file_import
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L952
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC262)
        addi    a5,a5,%lo(.LC262)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a4,-40(s0)
        li      a3,0
        li      a2,1
        li      a1,0
        lw      a0,-28(s0)
        call    create_symbol
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        j       .L953
.L952:
        lw      a5,-40(s0)
        lw      a4,8(a5)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        mv      a1,a5
        mv      a0,a4
        call    list_append
        lw      a5,-24(s0)
        lw      a5,0(a5)
        lw      a4,8(a5)
        li      a5,3
        bne     a4,a5,.L954
        lw      a5,-44(s0)
        lw      s1,4(a5)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        lw      a5,16(a5)
        mv      a1,a5
        li      a0,1
        call    create_code_member
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
        j       .L953
.L954:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        lw      a4,8(a5)
        li      a5,2
        bne     a4,a5,.L953
        lw      a5,-44(s0)
        lw      s1,4(a5)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        lw      a5,16(a5)
        mv      a1,a5
        li      a0,0
        call    create_code_member
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
.L953:
        lw      a5,-24(s0)
.L945:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        addi    sp,sp,48
        jr      ra
.LC263:
        .string "Expected identifier after 'class'"
.LC264:
        .string "Expected '{' after class name"
.LC265:
        .string "Unexpected token in class body"
parse_class:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s1,36(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,12
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-36(s0)
        lw      a4,-20(s0)
        sw      a4,20(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L956
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC263)
        addi    a5,a5,%lo(.LC263)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        lw      a5,-36(s0)
        sw      zero,20(a5)
        li      a5,0
        j       .L957
.L956:
        lw      a5,-24(s0)
        lw      a5,4(a5)
        lw      a4,-40(s0)
        lw      a3,-20(s0)
        li      a2,3
        li      a1,0
        mv      a0,a5
        call    create_symbol
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L958
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        beq     a4,a5,.L959
.L958:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC264)
        addi    a5,a5,%lo(.LC264)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        lw      a5,-36(s0)
        sw      zero,20(a5)
        li      a5,0
        j       .L957
.L959:
        lw      a1,-40(s0)
        li      a0,2
        call    create_symbol_table
        sw      a0,-28(s0)
        lw      a5,-20(s0)
        lw      a4,-28(s0)
        sw      a4,8(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,4(a5)
.L968:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L960
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_BRACE)
        lw      a5,%lo(SYMBOL_R_BRACE)(a5)
        beq     a4,a5,.L961
.L960:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L962
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_METHOD)
        lw      a5,%lo(KEYWORD_METHOD)(a5)
        bne     a4,a5,.L962
        lw      a5,-20(s0)
        lw      s1,4(a5)
        lw      a1,-28(s0)
        lw      a0,-36(s0)
        call    parse_method
        mv      a5,a0
        mv      a1,a5
        li      a0,0
        call    create_class_member
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
        j       .L963
.L962:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L964
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VAR)
        lw      a5,%lo(KEYWORD_VAR)(a5)
        bne     a4,a5,.L964
        li      a2,5
        lw      a1,-28(s0)
        lw      a0,-36(s0)
        call    parse_variable
        sw      a0,-32(s0)
        j       .L965
.L967:
        lw      a5,-20(s0)
        lw      s1,4(a5)
        lw      a0,-32(s0)
        call    list_pop_front
        mv      a5,a0
        mv      a1,a5
        li      a0,1
        call    create_class_member
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
.L965:
        lw      a5,-32(s0)
        beq     a5,zero,.L969
        lw      a5,-32(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L967
        j       .L969
.L964:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC265)
        addi    a5,a5,%lo(.LC265)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        j       .L968
.L969:
        nop
.L963:
        j       .L968
.L961:
        lw      a5,-36(s0)
        sw      zero,20(a5)
        lw      a5,-20(s0)
.L957:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        addi    sp,sp,48
        jr      ra
create_class_member:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,4(a5)
        lw      a5,-36(s0)
        beq     a5,zero,.L971
        lw      a4,-36(s0)
        li      a5,1
        beq     a4,a5,.L972
        j       .L976
.L971:
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,0(a5)
        j       .L974
.L972:
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,0(a5)
        j       .L974
.L976:
        lw      a5,-20(s0)
        sw      zero,0(a5)
        nop
.L974:
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
.LC266:
        .string "Expected identifier or type after 'func'"
.LC267:
        .string "Expected identifier after function return type"
.LC268:
        .string "Expected '(' after function name"
.LC269:
        .string "Unexpected token in parameter list"
.LC270:
        .string "Expected identifier in parameter list"
.LC271:
        .string "Expected ',' or ')' in parameter list"
.LC272:
        .string "Expected '{' to start function body"
parse_function:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        sw      s1,52(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-24(s0)
        call    list_create
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,12(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,8(a5)
        lw      a5,-52(s0)
        lw      a4,-24(s0)
        sw      a4,16(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L978
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L979
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_INT)
        lw      a5,%lo(KEYWORD_INT)(a5)
        beq     a4,a5,.L978
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FLOAT)
        lw      a5,%lo(KEYWORD_FLOAT)(a5)
        beq     a4,a5,.L978
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_STRING)
        lw      a5,%lo(KEYWORD_STRING)(a5)
        beq     a4,a5,.L978
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_BOOL)
        lw      a5,%lo(KEYWORD_BOOL)(a5)
        beq     a4,a5,.L978
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VOID)
        lw      a5,%lo(KEYWORD_VOID)(a5)
        beq     a4,a5,.L978
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a5,%lo(KEYWORD_POINTER)(a5)
        beq     a4,a5,.L978
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_CONST)
        lw      a5,%lo(KEYWORD_CONST)(a5)
        beq     a4,a5,.L978
.L979:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC266)
        addi    a5,a5,%lo(.LC266)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,16(a5)
        li      a5,0
        j       .L980
.L978:
        lw      a1,-56(s0)
        lw      a0,-52(s0)
        call    parse_type
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,4(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L981
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC267)
        addi    a5,a5,%lo(.LC267)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,16(a5)
        li      a5,0
        j       .L980
.L981:
        lw      a5,-20(s0)
        lw      a0,4(a5)
        lw      a5,-24(s0)
        lw      a5,4(a5)
        lw      a4,-56(s0)
        lw      a3,-24(s0)
        li      a2,2
        mv      a1,a5
        call    create_symbol
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L982
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        beq     a4,a5,.L983
.L982:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC268)
        addi    a5,a5,%lo(.LC268)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,16(a5)
        li      a5,0
        j       .L980
.L983:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a1,-56(s0)
        li      a0,1
        call    create_symbol_table
        sw      a0,-28(s0)
        j       .L984
.L990:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L985
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L986
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_INT)
        lw      a5,%lo(KEYWORD_INT)(a5)
        beq     a4,a5,.L985
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FLOAT)
        lw      a5,%lo(KEYWORD_FLOAT)(a5)
        beq     a4,a5,.L985
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_STRING)
        lw      a5,%lo(KEYWORD_STRING)(a5)
        beq     a4,a5,.L985
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_BOOL)
        lw      a5,%lo(KEYWORD_BOOL)(a5)
        beq     a4,a5,.L985
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VOID)
        lw      a5,%lo(KEYWORD_VOID)(a5)
        beq     a4,a5,.L985
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a5,%lo(KEYWORD_POINTER)(a5)
        beq     a4,a5,.L985
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_CONST)
        lw      a5,%lo(KEYWORD_CONST)(a5)
        beq     a4,a5,.L985
.L986:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC269)
        addi    a5,a5,%lo(.LC269)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,16(a5)
        li      a5,0
        j       .L980
.L985:
        lw      a1,-56(s0)
        lw      a0,-52(s0)
        call    parse_type
        sw      a0,-40(s0)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L987
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC270)
        addi    a5,a5,%lo(.LC270)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,16(a5)
        li      a5,0
        j       .L980
.L987:
        lw      a5,-24(s0)
        lw      s1,8(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a4,-28(s0)
        li      a3,0
        li      a2,6
        lw      a1,-40(s0)
        mv      a0,a5
        call    create_symbol
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L988
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_COMMA)
        lw      a5,%lo(SYMBOL_COMMA)(a5)
        bne     a4,a5,.L988
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        j       .L984
.L988:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L989
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        beq     a4,a5,.L984
.L989:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC271)
        addi    a5,a5,%lo(.LC271)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,16(a5)
        li      a5,0
        j       .L980
.L984:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L990
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        bne     a4,a5,.L990
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L991
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        beq     a4,a5,.L992
.L991:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC272)
        addi    a5,a5,%lo(.LC272)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,16(a5)
        li      a5,0
        j       .L980
.L992:
        lw      a1,-28(s0)
        li      a0,4
        call    create_symbol_table
        sw      a0,-32(s0)
        lw      a5,-24(s0)
        lw      a5,12(a5)
        mv      a2,a5
        lw      a1,-32(s0)
        lw      a0,-52(s0)
        call    parse_body
        mv      a5,a0
        sb      a5,-33(s0)
        lw      a5,-52(s0)
        sw      zero,16(a5)
        lbu     a5,-33(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L993
        li      a5,0
        j       .L980
.L993:
        lw      a5,-24(s0)
.L980:
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        lw      s1,52(sp)
        addi    sp,sp,64
        jr      ra
.LC273:
        .string "Expected identifier or type after 'method'"
.LC274:
        .string "Expected identifier after method return type"
.LC275:
        .string "Expected '(' after method name"
.LC276:
        .string "Expected 'self' as the first parameter"
.LC277:
        .string "Expected '{' to start method body"
parse_method:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        sw      s1,52(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        li      a1,1
        li      a0,20
        call    alloc_memory
        sw      a0,-24(s0)
        call    list_create
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,12(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,8(a5)
        lw      a5,-52(s0)
        lw      a4,-24(s0)
        sw      a4,12(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L995
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L996
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_INT)
        lw      a5,%lo(KEYWORD_INT)(a5)
        beq     a4,a5,.L995
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FLOAT)
        lw      a5,%lo(KEYWORD_FLOAT)(a5)
        beq     a4,a5,.L995
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_STRING)
        lw      a5,%lo(KEYWORD_STRING)(a5)
        beq     a4,a5,.L995
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_BOOL)
        lw      a5,%lo(KEYWORD_BOOL)(a5)
        beq     a4,a5,.L995
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VOID)
        lw      a5,%lo(KEYWORD_VOID)(a5)
        beq     a4,a5,.L995
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a5,%lo(KEYWORD_POINTER)(a5)
        beq     a4,a5,.L995
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_CONST)
        lw      a5,%lo(KEYWORD_CONST)(a5)
        beq     a4,a5,.L995
.L996:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC273)
        addi    a5,a5,%lo(.LC273)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,12(a5)
        li      a5,0
        j       .L997
.L995:
        lw      a1,-56(s0)
        lw      a0,-52(s0)
        call    parse_type
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,4(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L998
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,8
        beq     a4,a5,.L998
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC274)
        addi    a5,a5,%lo(.LC274)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,12(a5)
        li      a5,0
        j       .L997
.L998:
        lw      a5,-20(s0)
        lw      a0,4(a5)
        lw      a5,-24(s0)
        lw      a5,4(a5)
        lw      a4,-56(s0)
        lw      a3,-24(s0)
        li      a2,4
        mv      a1,a5
        call    create_symbol
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,8
        bne     a4,a5,.L999
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    is_special
        mv      a5,a0
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L1000
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC43)
        addi    a5,a5,%lo(.LC43)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,12(a5)
        li      a5,0
        j       .L997
.L1000:
        lw      a5,-24(s0)
        li      a4,1
        sb      a4,16(a5)
.L999:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1001
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        beq     a4,a5,.L1002
.L1001:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC275)
        addi    a5,a5,%lo(.LC275)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,12(a5)
        li      a5,0
        j       .L997
.L1002:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a1,-56(s0)
        li      a0,3
        call    create_symbol_table
        sw      a0,-28(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1003
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_SELF)
        lw      a5,%lo(KEYWORD_SELF)(a5)
        beq     a4,a5,.L1004
.L1003:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC276)
        addi    a5,a5,%lo(.LC276)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,12(a5)
        li      a5,0
        j       .L997
.L1004:
        lw      a5,-24(s0)
        lw      s1,8(a5)
        lui     a5,%hi(KEYWORD_SELF)
        lw      a0,%lo(KEYWORD_SELF)(a5)
        lw      a5,-52(s0)
        lw      a5,20(a5)
        lw      a5,0(a5)
        lw      a4,-28(s0)
        li      a3,0
        li      a2,6
        mv      a1,a5
        call    create_symbol
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        j       .L1005
.L1012:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1006
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_COMMA)
        lw      a5,%lo(SYMBOL_COMMA)(a5)
        bne     a4,a5,.L1006
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        j       .L1007
.L1006:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1008
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        beq     a4,a5,.L1007
.L1008:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC271)
        addi    a5,a5,%lo(.LC271)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,12(a5)
        li      a5,0
        j       .L997
.L1007:
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L1009
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1010
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_INT)
        lw      a5,%lo(KEYWORD_INT)(a5)
        beq     a4,a5,.L1009
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FLOAT)
        lw      a5,%lo(KEYWORD_FLOAT)(a5)
        beq     a4,a5,.L1009
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_STRING)
        lw      a5,%lo(KEYWORD_STRING)(a5)
        beq     a4,a5,.L1009
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_BOOL)
        lw      a5,%lo(KEYWORD_BOOL)(a5)
        beq     a4,a5,.L1009
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VOID)
        lw      a5,%lo(KEYWORD_VOID)(a5)
        beq     a4,a5,.L1009
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a5,%lo(KEYWORD_POINTER)(a5)
        beq     a4,a5,.L1009
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_CONST)
        lw      a5,%lo(KEYWORD_CONST)(a5)
        beq     a4,a5,.L1009
.L1010:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC269)
        addi    a5,a5,%lo(.LC269)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,12(a5)
        li      a5,0
        j       .L997
.L1009:
        lw      a1,-56(s0)
        lw      a0,-52(s0)
        call    parse_type
        sw      a0,-40(s0)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L1011
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC270)
        addi    a5,a5,%lo(.LC270)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,12(a5)
        li      a5,0
        j       .L997
.L1011:
        lw      a5,-24(s0)
        lw      s1,8(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a4,-28(s0)
        li      a3,0
        li      a2,6
        lw      a1,-40(s0)
        mv      a0,a5
        call    create_symbol
        mv      a5,a0
        mv      a1,a5
        mv      a0,s1
        call    list_append
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
.L1005:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1012
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        bne     a4,a5,.L1012
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1013
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        beq     a4,a5,.L1014
.L1013:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC277)
        addi    a5,a5,%lo(.LC277)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-52(s0)
        sw      zero,12(a5)
        li      a5,0
        j       .L997
.L1014:
        lw      a1,-28(s0)
        li      a0,4
        call    create_symbol_table
        sw      a0,-32(s0)
        lw      a5,-24(s0)
        lw      a5,12(a5)
        mv      a2,a5
        lw      a1,-32(s0)
        lw      a0,-52(s0)
        call    parse_body
        mv      a5,a0
        sb      a5,-33(s0)
        lw      a5,-52(s0)
        sw      zero,12(a5)
        lbu     a5,-33(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L1015
        li      a5,0
        j       .L997
.L1015:
        lw      a5,-24(s0)
.L997:
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        lw      s1,52(sp)
        addi    sp,sp,64
        jr      ra
.LC278:
        .string "Expected 'var' at the beginning of variable declaration"
.LC279:
        .string "Expected ',' or ';' after variable declaration"
parse_variable:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s1,36(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        lw      a4,-44(s0)
        li      a5,1
        call    list_create
        sw      a0,-24(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_current_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1020
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VAR)
        lw      a5,%lo(KEYWORD_VAR)(a5)
        beq     a4,a5,.L1021
.L1020:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC278)
        addi    a5,a5,%lo(.LC278)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        lw      a5,-24(s0)
        j       .L1022
.L1021:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    parse_type
        sw      a0,-28(s0)
        j       .L1023
.L1028:
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-32(s0)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a4,-40(s0)
        li      a3,0
        lw      a2,-44(s0)
        lw      a1,-28(s0)
        mv      a0,a5
        call    create_symbol
        mv      a4,a0
        lw      a5,-32(s0)
        sw      a4,0(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1024
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_ASSIGN)
        lw      a5,%lo(SYMBOL_ASSIGN)(a5)
        bne     a4,a5,.L1024
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a2,-40(s0)
        li      a1,1
        lw      a0,-36(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-32(s0)
        sw      a4,4(a5)
        lw      a1,-32(s0)
        lw      a0,-24(s0)
        call    list_append
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
.L1024:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1025
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_COMMA)
        lw      a5,%lo(SYMBOL_COMMA)(a5)
        bne     a4,a5,.L1025
        j       .L1023
.L1025:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1026
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        beq     a4,a5,.L1027
.L1026:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC279)
        addi    a5,a5,%lo(.LC279)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        j       .L1027
.L1023:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L1028
.L1027:
        lw      a5,-24(s0)
.L1022:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        addi    sp,sp,48
        jr      ra
.LC280:
        .string "Expected type"
.LC281:
        .string "Unknown built-in type"
.LC282:
        .string "Unexpected token when parsing type"
.LC283:
        .string "Expected type in container type"
.LC284:
        .string "Expected '>' after container type"
parse_type:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s1,36(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_current_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L1030
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1031
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_INT)
        lw      a5,%lo(KEYWORD_INT)(a5)
        beq     a4,a5,.L1030
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FLOAT)
        lw      a5,%lo(KEYWORD_FLOAT)(a5)
        beq     a4,a5,.L1030
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_STRING)
        lw      a5,%lo(KEYWORD_STRING)(a5)
        beq     a4,a5,.L1030
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_BOOL)
        lw      a5,%lo(KEYWORD_BOOL)(a5)
        beq     a4,a5,.L1030
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VOID)
        lw      a5,%lo(KEYWORD_VOID)(a5)
        beq     a4,a5,.L1030
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a5,%lo(KEYWORD_POINTER)(a5)
        beq     a4,a5,.L1030
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_CONST)
        lw      a5,%lo(KEYWORD_CONST)(a5)
        beq     a4,a5,.L1030
.L1031:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC280)
        addi    a5,a5,%lo(.LC280)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1032
.L1030:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1033
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_INT)
        lw      a5,%lo(KEYWORD_INT)(a5)
        bne     a4,a5,.L1034
        lui     a5,%hi(symbol_int)
        lw      a5,%lo(symbol_int)(a5)
        sw      a5,-20(s0)
        j       .L1035
.L1034:
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FLOAT)
        lw      a5,%lo(KEYWORD_FLOAT)(a5)
        bne     a4,a5,.L1036
        lui     a5,%hi(symbol_float)
        lw      a5,%lo(symbol_float)(a5)
        sw      a5,-20(s0)
        j       .L1035
.L1036:
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_STRING)
        lw      a5,%lo(KEYWORD_STRING)(a5)
        bne     a4,a5,.L1037
        lui     a5,%hi(symbol_string)
        lw      a5,%lo(symbol_string)(a5)
        sw      a5,-20(s0)
        j       .L1035
.L1037:
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_BOOL)
        lw      a5,%lo(KEYWORD_BOOL)(a5)
        bne     a4,a5,.L1038
        lui     a5,%hi(symbol_bool)
        lw      a5,%lo(symbol_bool)(a5)
        sw      a5,-20(s0)
        j       .L1035
.L1038:
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VOID)
        lw      a5,%lo(KEYWORD_VOID)(a5)
        bne     a4,a5,.L1039
        lui     a5,%hi(symbol_void)
        lw      a5,%lo(symbol_void)(a5)
        sw      a5,-20(s0)
        j       .L1035
.L1039:
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a5,%lo(KEYWORD_POINTER)(a5)
        bne     a4,a5,.L1040
        lui     a5,%hi(symbol_pointer)
        lw      a5,%lo(symbol_pointer)(a5)
        sw      a5,-20(s0)
        j       .L1035
.L1040:
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_CONST)
        lw      a5,%lo(KEYWORD_CONST)(a5)
        bne     a4,a5,.L1041
        lui     a5,%hi(symbol_const)
        lw      a5,%lo(symbol_const)(a5)
        sw      a5,-20(s0)
        j       .L1035
.L1041:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC281)
        addi    a5,a5,%lo(.LC281)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1032
.L1033:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L1042
        lw      a5,-24(s0)
        lw      a5,4(a5)
        li      a4,0
        li      a3,3
        li      a2,1
        mv      a1,a5
        lw      a0,-40(s0)
        call    search_symbol
        sw      a0,-20(s0)
        j       .L1035
.L1042:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC282)
        addi    a5,a5,%lo(.LC282)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1032
.L1035:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    peek_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1043
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_LT)
        lw      a5,%lo(SYMBOL_LT)(a5)
        bne     a4,a5,.L1043
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L1044
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1045
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_INT)
        lw      a5,%lo(KEYWORD_INT)(a5)
        beq     a4,a5,.L1044
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FLOAT)
        lw      a5,%lo(KEYWORD_FLOAT)(a5)
        beq     a4,a5,.L1044
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_STRING)
        lw      a5,%lo(KEYWORD_STRING)(a5)
        beq     a4,a5,.L1044
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_BOOL)
        lw      a5,%lo(KEYWORD_BOOL)(a5)
        beq     a4,a5,.L1044
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VOID)
        lw      a5,%lo(KEYWORD_VOID)(a5)
        beq     a4,a5,.L1044
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a5,%lo(KEYWORD_POINTER)(a5)
        beq     a4,a5,.L1044
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_CONST)
        lw      a5,%lo(KEYWORD_CONST)(a5)
        beq     a4,a5,.L1044
.L1045:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC283)
        addi    a5,a5,%lo(.LC283)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1032
.L1044:
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    parse_type
        sw      a0,-28(s0)
        lw      a5,-28(s0)
        bne     a5,zero,.L1046
        li      a5,0
        j       .L1032
.L1046:
        lw      a5,-20(s0)
        lw      a4,-28(s0)
        sw      a4,4(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1047
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_GT)
        lw      a5,%lo(SYMBOL_GT)(a5)
        beq     a4,a5,.L1043
.L1047:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC284)
        addi    a5,a5,%lo(.LC284)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1032
.L1043:
        lw      a5,-20(s0)
.L1032:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        addi    sp,sp,48
        jr      ra
.LC285:
        .string "Expected ';' after statement"
parse_statement:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s1,36(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-24(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_current_token
        sw      a0,-28(s0)
        li      a5,1
        sb      a5,-17(s0)
        lw      a5,-28(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1049
        lw      a5,-28(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_IF)
        lw      a5,%lo(KEYWORD_IF)(a5)
        bne     a4,a5,.L1049
        lw      a5,-24(s0)
        li      a4,2
        sw      a4,4(a5)
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    parse_if
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        sb      zero,-17(s0)
        j       .L1050
.L1049:
        lw      a5,-28(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1051
        lw      a5,-28(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FOR)
        lw      a5,%lo(KEYWORD_FOR)(a5)
        bne     a4,a5,.L1051
        lw      a5,-24(s0)
        li      a4,3
        sw      a4,4(a5)
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    parse_for
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        sb      zero,-17(s0)
        j       .L1050
.L1051:
        lw      a5,-28(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1052
        lw      a5,-28(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_WHILE)
        lw      a5,%lo(KEYWORD_WHILE)(a5)
        bne     a4,a5,.L1052
        lw      a5,-24(s0)
        li      a4,4
        sw      a4,4(a5)
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    parse_while
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        sb      zero,-17(s0)
        j       .L1050
.L1052:
        lw      a5,-28(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1053
        lw      a5,-28(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_RETURN)
        lw      a5,%lo(KEYWORD_RETURN)(a5)
        bne     a4,a5,.L1053
        lw      a5,-24(s0)
        li      a4,7
        sw      a4,4(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-28(s0)
        lw      a5,-28(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1054
        lw      a5,-28(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        bne     a4,a5,.L1054
        lw      a5,-24(s0)
        sw      zero,0(a5)
        sb      zero,-17(s0)
        j       .L1050
.L1054:
        lw      a2,-40(s0)
        li      a1,1
        lw      a0,-36(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        j       .L1050
.L1053:
        lw      a5,-28(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1056
        lw      a5,-28(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_BREAK)
        lw      a5,%lo(KEYWORD_BREAK)(a5)
        bne     a4,a5,.L1056
        lw      a5,-24(s0)
        li      a4,5
        sw      a4,4(a5)
        lw      a5,-24(s0)
        sw      zero,0(a5)
        j       .L1050
.L1056:
        lw      a5,-28(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1057
        lw      a5,-28(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_CONTINUE)
        lw      a5,%lo(KEYWORD_CONTINUE)(a5)
        bne     a4,a5,.L1057
        lw      a5,-24(s0)
        li      a4,6
        sw      a4,4(a5)
        lw      a5,-24(s0)
        sw      zero,0(a5)
        j       .L1050
.L1057:
        lw      a5,-28(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1058
        lw      a5,-28(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VAR)
        lw      a5,%lo(KEYWORD_VAR)(a5)
        bne     a4,a5,.L1058
        lw      a5,-24(s0)
        sw      zero,4(a5)
        li      a2,1
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    parse_variable
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        sb      zero,-17(s0)
        j       .L1050
.L1058:
        lw      a5,-24(s0)
        li      a4,8
        sw      a4,4(a5)
        lw      a2,-40(s0)
        li      a1,1
        lw      a0,-36(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
.L1050:
        lbu     a5,-17(s0)
        beq     a5,zero,.L1059
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-28(s0)
        lw      a5,-28(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1060
        lw      a5,-28(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        beq     a4,a5,.L1059
.L1060:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-28(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-28(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC285)
        addi    a5,a5,%lo(.LC285)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-28(s0)
        call    output_one_token
        li      a5,0
        j       .L1061
.L1059:
        lw      a5,-24(s0)
.L1061:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        addi    sp,sp,48
        jr      ra
.LC286:
        .string "Expected '(' after 'if'"
.LC287:
        .string "Expected ')' after if condition"
.LC288:
        .string "Expected '{' to start if body"
.LC289:
        .string "Expected '(' after 'elif'"
.LC290:
        .string "Expected ')' after elif condition"
.LC291:
        .string "Expected '{' to start elif body"
.LC292:
        .string "Expected '{' to start else body"
parse_if:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        sw      s1,52(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-24(s0)
        call    list_create
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,4(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,8(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,12(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1063
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        beq     a4,a5,.L1064
.L1063:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC286)
        addi    a5,a5,%lo(.LC286)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1065
.L1064:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a2,-56(s0)
        li      a1,1
        lw      a0,-52(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1066
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        beq     a4,a5,.L1067
.L1066:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC287)
        addi    a5,a5,%lo(.LC287)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1065
.L1067:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1068
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        beq     a4,a5,.L1069
.L1068:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC288)
        addi    a5,a5,%lo(.LC288)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1065
.L1069:
        lw      a1,-56(s0)
        li      a0,4
        call    create_symbol_table
        sw      a0,-28(s0)
        lw      a5,-24(s0)
        lw      a5,4(a5)
        mv      a2,a5
        lw      a1,-28(s0)
        lw      a0,-52(s0)
        call    parse_body
        mv      a5,a0
        sb      a5,-29(s0)
        lbu     a5,-29(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L1070
        li      a5,0
        j       .L1065
.L1070:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    peek_next_token
        sw      a0,-20(s0)
        j       .L1071
.L1080:
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-36(s0)
        call    list_create
        mv      a4,a0
        lw      a5,-36(s0)
        sw      a4,4(a5)
        lw      a5,-36(s0)
        sw      zero,8(a5)
        lw      a5,-36(s0)
        sw      zero,12(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1072
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        beq     a4,a5,.L1073
.L1072:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC289)
        addi    a5,a5,%lo(.LC289)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1065
.L1073:
        lw      a2,-56(s0)
        li      a1,1
        lw      a0,-52(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-36(s0)
        sw      a4,0(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1074
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        beq     a4,a5,.L1075
.L1074:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC290)
        addi    a5,a5,%lo(.LC290)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1065
.L1075:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1076
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        beq     a4,a5,.L1077
.L1076:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC291)
        addi    a5,a5,%lo(.LC291)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1065
.L1077:
        lw      a1,-56(s0)
        li      a0,4
        call    create_symbol_table
        sw      a0,-40(s0)
        lw      a5,-36(s0)
        lw      a5,4(a5)
        mv      a2,a5
        lw      a1,-40(s0)
        lw      a0,-52(s0)
        call    parse_body
        mv      a5,a0
        sb      a5,-29(s0)
        lbu     a5,-29(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L1078
        li      a5,0
        j       .L1065
.L1078:
        lw      a5,-24(s0)
        lw      a5,8(a5)
        lw      a1,-36(s0)
        mv      a0,a5
        call    list_append
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    peek_next_token
        sw      a0,-20(s0)
.L1071:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1079
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_ELIF)
        lw      a5,%lo(KEYWORD_ELIF)(a5)
        beq     a4,a5,.L1080
.L1079:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1081
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_ELSE)
        lw      a5,%lo(KEYWORD_ELSE)(a5)
        bne     a4,a5,.L1081
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1082
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        beq     a4,a5,.L1083
.L1082:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC292)
        addi    a5,a5,%lo(.LC292)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1065
.L1083:
        lw      a1,-56(s0)
        li      a0,4
        call    create_symbol_table
        sw      a0,-44(s0)
        lw      a5,-24(s0)
        lw      a5,12(a5)
        mv      a2,a5
        lw      a1,-44(s0)
        lw      a0,-52(s0)
        call    parse_body
        mv      a5,a0
        sb      a5,-29(s0)
        lbu     a5,-29(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L1081
        li      a5,0
        j       .L1065
.L1081:
        lw      a5,-24(s0)
.L1065:
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        lw      s1,52(sp)
        addi    sp,sp,64
        jr      ra
.LC293:
        .string "Expected '(' after 'for'"
.LC294:
        .string "Expected exactly one variable declaration in for loop initializer"
.LC295:
        .string "Expected expression in for loop initializer"
.LC296:
        .string "Expected expression in for loop condition"
.LC297:
        .string "Expected ';' after for loop condition"
.LC298:
        .string "Expected expression in for loop increment"
.LC299:
        .string "Expected ')' after for loop increment"
.LC300:
        .string "Expected '{' to start for loop body"
parse_for:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        sw      s1,52(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        li      a1,1
        li      a0,20
        call    alloc_memory
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        sw      zero,0(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,12(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1085
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        beq     a4,a5,.L1086
.L1085:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC293)
        addi    a5,a5,%lo(.LC293)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1087
.L1086:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a1,-56(s0)
        li      a0,4
        call    create_symbol_table
        sw      a0,-28(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1088
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_VAR)
        lw      a5,%lo(KEYWORD_VAR)(a5)
        bne     a4,a5,.L1088
        li      a2,1
        lw      a1,-28(s0)
        lw      a0,-52(s0)
        call    parse_variable
        sw      a0,-32(s0)
        lw      a5,-32(s0)
        beq     a5,zero,.L1089
        lw      a5,-32(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L1089
        lw      a5,-32(s0)
        lw      a4,0(a5)
        lw      a5,-32(s0)
        lw      a5,4(a5)
        beq     a4,a5,.L1090
.L1089:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC294)
        addi    a5,a5,%lo(.LC294)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1087
.L1090:
        lw      a5,-32(s0)
        lw      a5,0(a5)
        lw      a4,0(a5)
        lw      a5,-24(s0)
        sw      a4,0(a5)
        lw      a5,-24(s0)
        li      a4,1
        sb      a4,16(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        j       .L1091
.L1088:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1092
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        beq     a4,a5,.L1091
.L1092:
        lw      a2,-28(s0)
        li      a1,1
        lw      a0,-52(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,0(a5)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L1093
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC295)
        addi    a5,a5,%lo(.LC295)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1087
.L1093:
        lw      a5,-24(s0)
        sb      zero,16(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
.L1091:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1094
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        beq     a4,a5,.L1095
.L1094:
        lw      a2,-28(s0)
        li      a1,1
        lw      a0,-52(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,4(a5)
        lw      a5,-24(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L1096
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC296)
        addi    a5,a5,%lo(.LC296)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1087
.L1096:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
.L1095:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1097
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_SEMICOLON)
        lw      a5,%lo(SYMBOL_SEMICOLON)(a5)
        beq     a4,a5,.L1098
.L1097:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC297)
        addi    a5,a5,%lo(.LC297)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1087
.L1098:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1099
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        beq     a4,a5,.L1100
.L1099:
        lw      a2,-28(s0)
        li      a1,1
        lw      a0,-52(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-24(s0)
        sw      a4,8(a5)
        lw      a5,-24(s0)
        lw      a5,8(a5)
        bne     a5,zero,.L1101
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC298)
        addi    a5,a5,%lo(.LC298)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1087
.L1101:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
.L1100:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1102
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        beq     a4,a5,.L1103
.L1102:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC299)
        addi    a5,a5,%lo(.LC299)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1087
.L1103:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1104
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        beq     a4,a5,.L1105
.L1104:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC300)
        addi    a5,a5,%lo(.LC300)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1087
.L1105:
        lw      a1,-28(s0)
        li      a0,4
        call    create_symbol_table
        sw      a0,-36(s0)
        lw      a5,-24(s0)
        lw      a5,12(a5)
        mv      a2,a5
        lw      a1,-36(s0)
        lw      a0,-52(s0)
        call    parse_body
        mv      a5,a0
        sb      a5,-37(s0)
        lbu     a5,-37(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L1106
        li      a5,0
        j       .L1087
.L1106:
        lw      a5,-24(s0)
.L1087:
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        lw      s1,52(sp)
        addi    sp,sp,64
        jr      ra
.LC301:
        .string "Expected '(' after 'while'"
.LC302:
        .string "Expected ')' after while condition"
.LC303:
        .string "Expected '{' to start while body"
parse_while:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s1,36(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-20(s0)
        call    list_create
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,4(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1108
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        beq     a4,a5,.L1109
.L1108:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC301)
        addi    a5,a5,%lo(.LC301)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1110
.L1109:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a2,-40(s0)
        li      a1,1
        lw      a0,-36(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1111
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        beq     a4,a5,.L1112
.L1111:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC302)
        addi    a5,a5,%lo(.LC302)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1110
.L1112:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1113
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACE)
        lw      a5,%lo(SYMBOL_L_BRACE)(a5)
        beq     a4,a5,.L1114
.L1113:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC303)
        addi    a5,a5,%lo(.LC303)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1110
.L1114:
        lw      a1,-40(s0)
        li      a0,4
        call    create_symbol_table
        sw      a0,-28(s0)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        mv      a2,a5
        lw      a1,-28(s0)
        lw      a0,-36(s0)
        call    parse_body
        mv      a5,a0
        sb      a5,-29(s0)
        lbu     a5,-29(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L1115
        li      a5,0
        j       .L1110
.L1115:
        lw      a5,-20(s0)
.L1110:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        addi    sp,sp,48
        jr      ra
operator_precedence:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a4,-20(s0)
        li      a5,18
        bgtu    a4,a5,.L1117
        lw      a4,-20(s0)
        li      a5,17
        bgeu    a4,a5,.L1118
        lw      a4,-20(s0)
        li      a5,16
        bgtu    a4,a5,.L1117
        lw      a4,-20(s0)
        li      a5,12
        bgeu    a4,a5,.L1119
        lw      a4,-20(s0)
        li      a5,11
        bgtu    a4,a5,.L1117
        lw      a4,-20(s0)
        li      a5,6
        bgeu    a4,a5,.L1120
        lw      a4,-20(s0)
        li      a5,5
        beq     a4,a5,.L1119
        lw      a4,-20(s0)
        li      a5,5
        bgtu    a4,a5,.L1117
        lw      a4,-20(s0)
        li      a5,1
        bleu    a4,a5,.L1121
        lw      a5,-20(s0)
        addi    a4,a5,-2
        li      a5,2
        bgtu    a4,a5,.L1117
        j       .L1124
.L1119:
        li      a5,1
        j       .L1123
.L1118:
        li      a5,2
        j       .L1123
.L1120:
        li      a5,3
        j       .L1123
.L1121:
        li      a5,4
        j       .L1123
.L1124:
        li      a5,5
        j       .L1123
.L1117:
        li      a5,0
.L1123:
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
operator:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lui     a5,%hi(SYMBOL_ADD)
        lw      a5,%lo(SYMBOL_ADD)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1126
        li      a5,0
        j       .L1127
.L1126:
        lui     a5,%hi(SYMBOL_SUB)
        lw      a5,%lo(SYMBOL_SUB)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1128
        li      a5,1
        j       .L1127
.L1128:
        lui     a5,%hi(SYMBOL_MUL)
        lw      a5,%lo(SYMBOL_MUL)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1129
        li      a5,2
        j       .L1127
.L1129:
        lui     a5,%hi(SYMBOL_DIV)
        lw      a5,%lo(SYMBOL_DIV)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1130
        li      a5,3
        j       .L1127
.L1130:
        lui     a5,%hi(SYMBOL_MOD)
        lw      a5,%lo(SYMBOL_MOD)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1131
        li      a5,4
        j       .L1127
.L1131:
        lui     a5,%hi(SYMBOL_ASSIGN)
        lw      a5,%lo(SYMBOL_ASSIGN)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1132
        li      a5,5
        j       .L1127
.L1132:
        lui     a5,%hi(SYMBOL_EQ)
        lw      a5,%lo(SYMBOL_EQ)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1133
        li      a5,6
        j       .L1127
.L1133:
        lui     a5,%hi(SYMBOL_NE)
        lw      a5,%lo(SYMBOL_NE)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1134
        li      a5,7
        j       .L1127
.L1134:
        lui     a5,%hi(SYMBOL_LT)
        lw      a5,%lo(SYMBOL_LT)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1135
        li      a5,8
        j       .L1127
.L1135:
        lui     a5,%hi(SYMBOL_GT)
        lw      a5,%lo(SYMBOL_GT)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1136
        li      a5,9
        j       .L1127
.L1136:
        lui     a5,%hi(SYMBOL_LE)
        lw      a5,%lo(SYMBOL_LE)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1137
        li      a5,10
        j       .L1127
.L1137:
        lui     a5,%hi(SYMBOL_GE)
        lw      a5,%lo(SYMBOL_GE)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1138
        li      a5,11
        j       .L1127
.L1138:
        lui     a5,%hi(SYMBOL_ADD_ASSIGN)
        lw      a5,%lo(SYMBOL_ADD_ASSIGN)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1139
        li      a5,12
        j       .L1127
.L1139:
        lui     a5,%hi(SYMBOL_SUB_ASSIGN)
        lw      a5,%lo(SYMBOL_SUB_ASSIGN)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1140
        li      a5,13
        j       .L1127
.L1140:
        lui     a5,%hi(SYMBOL_MUL_ASSIGN)
        lw      a5,%lo(SYMBOL_MUL_ASSIGN)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1141
        li      a5,14
        j       .L1127
.L1141:
        lui     a5,%hi(SYMBOL_DIV_ASSIGN)
        lw      a5,%lo(SYMBOL_DIV_ASSIGN)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1142
        li      a5,15
        j       .L1127
.L1142:
        lui     a5,%hi(SYMBOL_MOD_ASSIGN)
        lw      a5,%lo(SYMBOL_MOD_ASSIGN)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1143
        li      a5,16
        j       .L1127
.L1143:
        lui     a5,%hi(SYMBOL_AND)
        lw      a5,%lo(SYMBOL_AND)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1144
        li      a5,17
        j       .L1127
.L1144:
        lui     a5,%hi(SYMBOL_OR)
        lw      a5,%lo(SYMBOL_OR)(a5)
        lw      a4,-20(s0)
        bne     a4,a5,.L1145
        li      a5,18
        j       .L1127
.L1145:
        li      a5,21
.L1127:
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
.LC304:
        .string "Expected expression"
.LC305:
        .string "Expected expression after operator"
parse_expression_prec:
        addi    sp,sp,-80
        sw      ra,76(sp)
        sw      s0,72(sp)
        sw      s1,68(sp)
        sw      s2,64(sp)
        sw      s3,60(sp)
        addi    s0,sp,80
        sw      a0,-68(s0)
        sw      a1,-72(s0)
        sw      a2,-76(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        sw      zero,12(a5)
        lw      a1,-76(s0)
        lw      a0,-68(s0)
        call    parse_primary
        mv      a4,a0
        lw      a5,-36(s0)
        sw      a4,0(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L1147
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-68(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      s3,a0
        lw      a5,-68(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_current_token
        mv      a5,a0
        lw      a5,8(a5)
        addi    s2,a5,1
        lw      a5,-68(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_current_token
        mv      a5,a0
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC304)
        addi    a5,a5,%lo(.LC304)
        mv      a3,s2
        mv      a2,s3
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lw      a5,-68(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_current_token
        mv      a4,a0
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        mv      a0,a4
        call    output_one_token
        li      a5,0
        j       .L1148
.L1147:
        lw      a5,-36(s0)
        sw      zero,4(a5)
        lw      a5,-36(s0)
        li      a4,21
        sw      a4,8(a5)
        li      a5,21
        sw      a5,-44(s0)
        sw      zero,-48(s0)
        lw      a5,-68(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    peek_next_token
        sw      a0,-40(s0)
        j       .L1149
.L1154:
        lw      a5,-68(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a5,-68(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-40(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-52(s0)
        lw      a5,-52(s0)
        sw      zero,12(a5)
        lw      a4,-44(s0)
        li      a5,5
        beq     a4,a5,.L1150
        lw      a4,-44(s0)
        li      a5,12
        beq     a4,a5,.L1150
        lw      a4,-44(s0)
        li      a5,13
        beq     a4,a5,.L1150
        lw      a4,-44(s0)
        li      a5,14
        beq     a4,a5,.L1150
        lw      a4,-44(s0)
        li      a5,15
        beq     a4,a5,.L1150
        lw      a4,-44(s0)
        li      a5,16
        beq     a4,a5,.L1150
        li      a5,1
        j       .L1151
.L1150:
        li      a5,0
.L1151:
        lw      a4,-48(s0)
        add     a5,a5,a4
        lw      a2,-76(s0)
        mv      a1,a5
        lw      a0,-68(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-52(s0)
        sw      a4,4(a5)
        lw      a5,-52(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L1152
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-68(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-40(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-40(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC305)
        addi    a5,a5,%lo(.LC305)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-40(s0)
        call    output_one_token
        li      a5,0
        j       .L1148
.L1152:
        lw      a5,-52(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        lw      a5,-52(s0)
        lw      a4,-44(s0)
        sw      a4,8(a5)
        lw      a5,-52(s0)
        sw      a5,-36(s0)
        lw      a5,-68(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    peek_next_token
        sw      a0,-40(s0)
.L1149:
        lw      a5,-40(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1153
        lw      a5,-40(s0)
        lw      a5,4(a5)
        mv      a0,a5
        call    operator
        sw      a0,-44(s0)
        lw      a4,-44(s0)
        li      a5,21
        beq     a4,a5,.L1153
        lw      a0,-44(s0)
        call    operator_precedence
        sw      a0,-48(s0)
        lw      a4,-48(s0)
        lw      a5,-72(s0)
        bge     a4,a5,.L1154
.L1153:
        lw      a5,-36(s0)
.L1148:
        mv      a0,a5
        lw      ra,76(sp)
        lw      s0,72(sp)
        lw      s1,68(sp)
        lw      s2,64(sp)
        lw      s3,60(sp)
        addi    sp,sp,80
        jr      ra
.LC306:
        .string "Expected expression after '!'"
.LC307:
        .string "Expected expression after '-'"
.LC308:
        .string "Expected expression after '('"
.LC309:
        .string "Expected ')' after expression"
.LC310:
        .string "Expected variable access"
.LC311:
        .string "Unexpected token in expression"
parse_primary:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        sw      s1,36(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,12
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        sw      zero,4(a5)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_current_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,1
        bne     a4,a5,.L1156
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        sw      zero,8(a5)
        j       .L1157
.L1156:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,2
        bne     a4,a5,.L1158
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        li      a4,1
        sw      a4,8(a5)
        j       .L1157
.L1158:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,3
        bne     a4,a5,.L1159
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        li      a4,2
        sw      a4,8(a5)
        j       .L1157
.L1159:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1160
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_TRUE)
        lw      a5,%lo(KEYWORD_TRUE)(a5)
        beq     a4,a5,.L1161
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_FALSE)
        lw      a5,%lo(KEYWORD_FALSE)(a5)
        bne     a4,a5,.L1160
.L1161:
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        li      a4,3
        sw      a4,8(a5)
        j       .L1157
.L1160:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1162
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_NOT)
        lw      a5,%lo(SYMBOL_NOT)(a5)
        bne     a4,a5,.L1162
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    parse_primary
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L1163
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC306)
        addi    a5,a5,%lo(.LC306)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1164
.L1163:
        lw      a5,-20(s0)
        li      a4,6
        sw      a4,8(a5)
        j       .L1157
.L1162:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1165
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_SUB)
        lw      a5,%lo(SYMBOL_SUB)(a5)
        bne     a4,a5,.L1165
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    parse_primary
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L1166
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC307)
        addi    a5,a5,%lo(.LC307)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1164
.L1166:
        lw      a5,-20(s0)
        li      a4,5
        sw      a4,8(a5)
        j       .L1157
.L1165:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1167
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        bne     a4,a5,.L1167
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a2,-40(s0)
        li      a1,1
        lw      a0,-36(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L1168
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC308)
        addi    a5,a5,%lo(.LC308)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1164
.L1168:
        lw      a5,-36(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1169
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        beq     a4,a5,.L1174
.L1169:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC309)
        addi    a5,a5,%lo(.LC309)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1164
.L1167:
        lw      a5,-24(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L1171
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1172
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_SELF)
        lw      a5,%lo(KEYWORD_SELF)(a5)
        bne     a4,a5,.L1172
.L1171:
        lw      a1,-40(s0)
        lw      a0,-36(s0)
        call    parse_variable_access
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L1173
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC310)
        addi    a5,a5,%lo(.LC310)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1164
.L1173:
        lw      a5,-20(s0)
        li      a4,7
        sw      a4,8(a5)
        j       .L1157
.L1172:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-36(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC311)
        addi    a5,a5,%lo(.LC311)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1164
.L1174:
        nop
.L1157:
        lw      a5,-20(s0)
.L1164:
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        lw      s1,36(sp)
        addi    sp,sp,48
        jr      ra
.LC312:
        .string "Expected identifier or 'self' in variable access"
.LC313:
        .string "Undefined variable"
.LC314:
        .string "Expected identifier after '.'"
.LC315:
        .string "Cannot access attribute of non-class type"
.LC316:
        .string "Undefined attribute"
.LC317:
        .string "Expected expression in index access"
.LC318:
        .string "Expected ']' after index expression"
.LC319:
        .string "Expected expression in function call"
.LC320:
        .string "Expected ',' or ')' in function call"
parse_variable_access:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        sw      s1,52(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        sw      zero,8(a5)
        lw      a5,-20(s0)
        sw      zero,0(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_current_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L1176
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,5
        bne     a4,a5,.L1177
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(KEYWORD_SELF)
        lw      a5,%lo(KEYWORD_SELF)(a5)
        beq     a4,a5,.L1176
.L1177:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC312)
        addi    a5,a5,%lo(.LC312)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1178
.L1176:
        lw      a5,-24(s0)
        lw      a5,4(a5)
        li      a4,0
        li      a3,0
        li      a2,0
        mv      a1,a5
        lw      a0,-56(s0)
        call    search_symbol
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,4(a5)
        lw      a5,-20(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L1179
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC313)
        addi    a5,a5,%lo(.LC313)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1178
.L1179:
        lw      a5,-20(s0)
        sw      zero,12(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    peek_next_token
        sw      a0,-24(s0)
        j       .L1180
.L1195:
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-28(s0)
        lw      a5,-28(s0)
        sw      zero,8(a5)
        lw      a5,-28(s0)
        lw      a4,-20(s0)
        sw      a4,0(a5)
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_DOT)
        lw      a5,%lo(SYMBOL_DOT)(a5)
        bne     a4,a5,.L1181
        lw      a5,-28(s0)
        li      a4,2
        sw      a4,12(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a5,0(a5)
        beq     a5,zero,.L1182
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC314)
        addi    a5,a5,%lo(.LC314)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1178
.L1182:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        lw      a5,4(a5)
        lw      a5,4(a5)
        sw      a5,-36(s0)
        lw      a5,-36(s0)
        beq     a5,zero,.L1183
        lw      a5,-36(s0)
        lw      a4,8(a5)
        li      a5,3
        beq     a4,a5,.L1184
.L1183:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC315)
        addi    a5,a5,%lo(.LC315)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1178
.L1184:
        lw      a5,-36(s0)
        lw      a5,16(a5)
        lw      a0,8(a5)
        lw      a5,-24(s0)
        lw      a5,4(a5)
        li      a4,0
        li      a3,0
        li      a2,0
        mv      a1,a5
        call    search_symbol
        mv      a4,a0
        lw      a5,-28(s0)
        sw      a4,4(a5)
        lw      a5,-28(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L1185
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC316)
        addi    a5,a5,%lo(.LC316)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1178
.L1181:
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACKET)
        lw      a5,%lo(SYMBOL_L_BRACKET)(a5)
        bne     a4,a5,.L1186
        lw      a5,-28(s0)
        li      a4,3
        sw      a4,12(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a2,-56(s0)
        li      a1,1
        lw      a0,-52(s0)
        call    parse_expression_prec
        mv      a4,a0
        lw      a5,-28(s0)
        sw      a4,4(a5)
        lw      a5,-28(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L1187
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC317)
        addi    a5,a5,%lo(.LC317)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1178
.L1187:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1188
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_BRACKET)
        lw      a5,%lo(SYMBOL_R_BRACKET)(a5)
        beq     a4,a5,.L1185
.L1188:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC318)
        addi    a5,a5,%lo(.LC318)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1178
.L1186:
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        bne     a4,a5,.L1185
        lw      a5,-28(s0)
        li      a4,1
        sw      a4,12(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-28(s0)
        sw      a4,4(a5)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        j       .L1189
.L1193:
        lw      a2,-56(s0)
        li      a1,1
        lw      a0,-52(s0)
        call    parse_expression_prec
        sw      a0,-32(s0)
        lw      a5,-32(s0)
        bne     a5,zero,.L1190
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC319)
        addi    a5,a5,%lo(.LC319)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1178
.L1190:
        lw      a5,-28(s0)
        lw      a5,4(a5)
        lw      a1,-32(s0)
        mv      a0,a5
        call    list_append
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1191
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_COMMA)
        lw      a5,%lo(SYMBOL_COMMA)(a5)
        bne     a4,a5,.L1191
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-24(s0)
        j       .L1189
.L1191:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1192
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        beq     a4,a5,.L1189
.L1192:
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-24(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-24(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC320)
        addi    a5,a5,%lo(.LC320)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-24(s0)
        call    output_one_token
        li      a5,0
        j       .L1178
.L1189:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1193
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_PAREN)
        lw      a5,%lo(SYMBOL_R_PAREN)(a5)
        bne     a4,a5,.L1193
.L1185:
        lw      a5,-28(s0)
        sw      a5,-20(s0)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    peek_next_token
        sw      a0,-24(s0)
.L1180:
        lw      a5,-24(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1194
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_DOT)
        lw      a5,%lo(SYMBOL_DOT)(a5)
        beq     a4,a5,.L1195
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_BRACKET)
        lw      a5,%lo(SYMBOL_L_BRACKET)(a5)
        beq     a4,a5,.L1195
        lw      a5,-24(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_L_PAREN)
        lw      a5,%lo(SYMBOL_L_PAREN)(a5)
        beq     a4,a5,.L1195
.L1194:
        lw      a5,-20(s0)
.L1178:
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        lw      s1,52(sp)
        addi    sp,sp,64
        jr      ra
.LC321:
        .string "Unexpected token in body"
parse_body:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        sw      s1,52(sp)
        addi    s0,sp,64
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        sw      a2,-60(s0)
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
        j       .L1197
.L1204:
        lw      a1,-56(s0)
        lw      a0,-52(s0)
        call    parse_statement
        sw      a0,-24(s0)
        lw      a5,-24(s0)
        bne     a5,zero,.L1198
        lui     a5,%hi(stderr)
        lw      s1,%lo(stderr)(a5)
        lw      a5,-52(s0)
        lw      a5,8(a5)
        mv      a0,a5
        call    file_full_path
        mv      a2,a0
        lw      a5,-20(s0)
        lw      a5,8(a5)
        addi    a3,a5,1
        lw      a5,-20(s0)
        lw      a5,12(a5)
        addi    a4,a5,1
        lui     a5,%hi(.LC321)
        addi    a5,a5,%lo(.LC321)
        lui     a1,%hi(.LC254)
        addi    a1,a1,%lo(.LC254)
        mv      a0,s1
        call    fprintf
        lui     a5,%hi(stderr)
        lw      a5,%lo(stderr)(a5)
        li      a2,0
        mv      a1,a5
        lw      a0,-20(s0)
        call    output_one_token
        li      a5,0
        j       .L1199
.L1198:
        lw      a5,-24(s0)
        lw      a5,4(a5)
        bne     a5,zero,.L1200
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L1201
.L1203:
        lw      a0,-28(s0)
        call    list_pop_front
        sw      a0,-32(s0)
        li      a1,1
        li      a0,8
        call    alloc_memory
        sw      a0,-36(s0)
        lw      a5,-36(s0)
        li      a4,1
        sw      a4,4(a5)
        lw      a5,-36(s0)
        lw      a4,-32(s0)
        sw      a4,0(a5)
        lw      a1,-36(s0)
        lw      a0,-60(s0)
        call    list_append
.L1201:
        lw      a5,-28(s0)
        beq     a5,zero,.L1202
        lw      a5,-28(s0)
        lw      a5,0(a5)
        bne     a5,zero,.L1203
        j       .L1202
.L1200:
        lw      a1,-24(s0)
        lw      a0,-60(s0)
        call    list_append
.L1202:
        lw      a5,-52(s0)
        lw      a5,0(a5)
        mv      a0,a5
        call    get_next_token
        sw      a0,-20(s0)
.L1197:
        lw      a5,-20(s0)
        lw      a4,0(a5)
        li      a5,4
        bne     a4,a5,.L1204
        lw      a5,-20(s0)
        lw      a4,4(a5)
        lui     a5,%hi(SYMBOL_R_BRACE)
        lw      a5,%lo(SYMBOL_R_BRACE)(a5)
        bne     a4,a5,.L1204
        li      a5,1
.L1199:
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        lw      s1,52(sp)
        addi    sp,sp,64
        jr      ra
.LC322:
        .string "[symbol_table Error] at <create_symbol> Symbol '%s' already exists in the current scope\n"
.LC323:
        .string "[symbol_table Warning] at <create_symbol> Symbol '%s' already exists in an outer scope, but with a different type or kind. Creating a new symbol in the current scope.\n"
.LC324:
        .string "[symbol_table Warning] at <create_symbol> Unknown symbol kind '%u' for symbol '%s'\n"
create_symbol:
        addi    sp,sp,-64
        sw      ra,60(sp)
        sw      s0,56(sp)
        addi    s0,sp,64
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        sw      a3,-48(s0)
        sw      a4,-52(s0)
        lw      a4,-40(s0)
        lw      a3,-44(s0)
        li      a2,1
        lw      a1,-36(s0)
        lw      a0,-52(s0)
        call    search_symbol
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        beq     a5,zero,.L1206
        lw      a5,-20(s0)
        lw      a5,8(a5)
        lw      a4,-44(s0)
        bne     a4,a5,.L1207
        lw      a5,-20(s0)
        lw      a5,4(a5)
        lw      a4,-40(s0)
        bne     a4,a5,.L1207
        lw      a5,-20(s0)
        j       .L1208
.L1207:
        lw      a5,-20(s0)
        lw      a5,20(a5)
        lw      a4,-52(s0)
        bne     a4,a5,.L1209
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lw      a2,-36(s0)
        lui     a5,%hi(.LC322)
        addi    a1,a5,%lo(.LC322)
        mv      a0,a4
        call    fprintf
        li      a5,0
        j       .L1208
.L1209:
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lw      a2,-36(s0)
        lui     a5,%hi(.LC323)
        addi    a1,a5,%lo(.LC323)
        mv      a0,a4
        call    fprintf
.L1206:
        li      a1,1
        li      a0,24
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,4(a5)
        lw      a5,-20(s0)
        lw      a4,-44(s0)
        sw      a4,8(a5)
        lui     a5,%hi(symbol_count.0)
        lw      a5,%lo(symbol_count.0)(a5)
        addi    a3,a5,1
        lui     a4,%hi(symbol_count.0)
        sw      a3,%lo(symbol_count.0)(a4)
        lw      a4,-20(s0)
        sw      a5,12(a4)
        lw      a4,-44(s0)
        li      a5,6
        bgtu    a4,a5,.L1210
        lw      a4,-44(s0)
        li      a5,5
        bgeu    a4,a5,.L1211
        lw      a4,-44(s0)
        li      a5,4
        beq     a4,a5,.L1212
        lw      a4,-44(s0)
        li      a5,4
        bgtu    a4,a5,.L1210
        lw      a4,-44(s0)
        li      a5,3
        beq     a4,a5,.L1213
        lw      a4,-44(s0)
        li      a5,3
        bgtu    a4,a5,.L1210
        lw      a4,-44(s0)
        li      a5,2
        beq     a4,a5,.L1214
        lw      a4,-44(s0)
        li      a5,2
        bgtu    a4,a5,.L1210
        lw      a5,-44(s0)
        beq     a5,zero,.L1215
        lw      a4,-44(s0)
        li      a5,1
        beq     a4,a5,.L1211
        j       .L1210
.L1214:
        lw      a5,-20(s0)
        lw      a4,-48(s0)
        sw      a4,16(a5)
        j       .L1216
.L1212:
        lw      a5,-20(s0)
        lw      a4,-48(s0)
        sw      a4,16(a5)
        j       .L1216
.L1213:
        lw      a5,-20(s0)
        lw      a4,-48(s0)
        sw      a4,16(a5)
        j       .L1216
.L1211:
        lw      a4,-48(s0)
        lw      a5,-20(s0)
        sw      a4,16(a5)
        j       .L1216
.L1215:
        lw      a4,-48(s0)
        lw      a5,-20(s0)
        sw      a4,16(a5)
        j       .L1216
.L1210:
        lui     a5,%hi(stderr)
        lw      a4,%lo(stderr)(a5)
        lw      a3,-36(s0)
        lw      a2,-44(s0)
        lui     a5,%hi(.LC324)
        addi    a1,a5,%lo(.LC324)
        mv      a0,a4
        call    fprintf
        nop
.L1216:
        lw      a5,-20(s0)
        lw      a4,-52(s0)
        sw      a4,20(a5)
        lw      a5,-52(s0)
        beq     a5,zero,.L1217
        lw      a5,-52(s0)
        lw      a5,8(a5)
        lw      a1,-20(s0)
        mv      a0,a5
        call    list_append
.L1217:
        lw      a5,-20(s0)
.L1208:
        mv      a0,a5
        lw      ra,60(sp)
        lw      s0,56(sp)
        addi    sp,sp,64
        jr      ra
create_symbol_table:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        li      a1,1
        li      a0,16
        call    alloc_memory
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        sw      a4,0(a5)
        lw      a5,-20(s0)
        lw      a4,-36(s0)
        sw      a4,4(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,8(a5)
        call    list_create
        mv      a4,a0
        lw      a5,-20(s0)
        sw      a4,12(a5)
        lw      a5,-40(s0)
        beq     a5,zero,.L1219
        lw      a5,-40(s0)
        lw      a5,12(a5)
        lw      a1,-20(s0)
        mv      a0,a5
        call    list_append
.L1219:
        lw      a5,-20(s0)
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
init_symbol:
        addi    sp,sp,-16
        sw      ra,12(sp)
        sw      s0,8(sp)
        addi    s0,sp,16
        li      a1,0
        li      a0,0
        call    create_symbol_table
        mv      a4,a0
        lui     a5,%hi(global_symbol_table)
        sw      a4,%lo(global_symbol_table)(a5)
        lui     a5,%hi(KEYWORD_INT)
        lw      a0,%lo(KEYWORD_INT)(a5)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        mv      a4,a5
        li      a3,4
        li      a2,0
        li      a1,0
        call    create_symbol
        mv      a4,a0
        lui     a5,%hi(symbol_int)
        sw      a4,%lo(symbol_int)(a5)
        lui     a5,%hi(KEYWORD_FLOAT)
        lw      a0,%lo(KEYWORD_FLOAT)(a5)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        mv      a4,a5
        li      a3,4
        li      a2,0
        li      a1,0
        call    create_symbol
        mv      a4,a0
        lui     a5,%hi(symbol_float)
        sw      a4,%lo(symbol_float)(a5)
        lui     a5,%hi(KEYWORD_STRING)
        lw      a0,%lo(KEYWORD_STRING)(a5)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        mv      a4,a5
        li      a3,4
        li      a2,0
        li      a1,0
        call    create_symbol
        mv      a4,a0
        lui     a5,%hi(symbol_string)
        sw      a4,%lo(symbol_string)(a5)
        lui     a5,%hi(KEYWORD_BOOL)
        lw      a0,%lo(KEYWORD_BOOL)(a5)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        mv      a4,a5
        li      a3,1
        li      a2,0
        li      a1,0
        call    create_symbol
        mv      a4,a0
        lui     a5,%hi(symbol_bool)
        sw      a4,%lo(symbol_bool)(a5)
        lui     a5,%hi(KEYWORD_VOID)
        lw      a0,%lo(KEYWORD_VOID)(a5)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        mv      a4,a5
        li      a3,1
        li      a2,0
        li      a1,0
        call    create_symbol
        mv      a4,a0
        lui     a5,%hi(symbol_void)
        sw      a4,%lo(symbol_void)(a5)
        lui     a5,%hi(KEYWORD_POINTER)
        lw      a0,%lo(KEYWORD_POINTER)(a5)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        mv      a4,a5
        li      a3,4
        li      a2,0
        li      a1,0
        call    create_symbol
        mv      a4,a0
        lui     a5,%hi(symbol_pointer)
        sw      a4,%lo(symbol_pointer)(a5)
        lui     a5,%hi(KEYWORD_CONST)
        lw      a0,%lo(KEYWORD_CONST)(a5)
        lui     a5,%hi(global_symbol_table)
        lw      a5,%lo(global_symbol_table)(a5)
        mv      a4,a5
        li      a3,4
        li      a2,0
        li      a1,0
        call    create_symbol
        mv      a4,a0
        lui     a5,%hi(symbol_const)
        sw      a4,%lo(symbol_const)(a5)
        nop
        lw      ra,12(sp)
        lw      s0,8(sp)
        addi    sp,sp,16
        jr      ra
search_symbol:
        addi    sp,sp,-80
        sw      ra,76(sp)
        sw      s0,72(sp)
        addi    s0,sp,80
        sw      a0,-52(s0)
        sw      a1,-56(s0)
        mv      a5,a2
        sw      a3,-64(s0)
        sw      a4,-68(s0)
        sb      a5,-57(s0)
        sw      zero,-20(s0)
        j       .L1223
.L1246:
        lw      a5,-52(s0)
        sw      a5,-24(s0)
        j       .L1224
.L1242:
        lw      a5,-24(s0)
        lw      a5,8(a5)
        lw      a5,0(a5)
        sw      a5,-28(s0)
        j       .L1225
.L1241:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        sw      a5,-36(s0)
        lw      a5,-36(s0)
        lw      a5,0(a5)
        lw      a4,-56(s0)
        bne     a4,a5,.L1247
        sb      zero,-29(s0)
        lw      a4,-20(s0)
        li      a5,2
        beq     a4,a5,.L1228
        lw      a4,-20(s0)
        li      a5,2
        bgt     a4,a5,.L1248
        lw      a5,-20(s0)
        beq     a5,zero,.L1230
        lw      a4,-20(s0)
        li      a5,1
        beq     a4,a5,.L1231
        j       .L1248
.L1230:
        lbu     a5,-57(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        bne     a5,zero,.L1232
        lw      a5,-36(s0)
        lw      a5,8(a5)
        lw      a4,-64(s0)
        bne     a4,a5,.L1233
.L1232:
        lw      a5,-68(s0)
        beq     a5,zero,.L1234
        lw      a5,-36(s0)
        lw      a5,4(a5)
        lw      a4,-68(s0)
        bne     a4,a5,.L1233
.L1234:
        li      a5,1
        j       .L1235
.L1233:
        li      a5,0
.L1235:
        sb      a5,-29(s0)
        lbu     a5,-29(s0)
        andi    a5,a5,1
        sb      a5,-29(s0)
        j       .L1236
.L1231:
        lw      a5,-68(s0)
        beq     a5,zero,.L1237
        lw      a5,-36(s0)
        lw      a5,4(a5)
        lw      a4,-68(s0)
        bne     a4,a5,.L1238
.L1237:
        li      a5,1
        j       .L1239
.L1238:
        li      a5,0
.L1239:
        sb      a5,-29(s0)
        lbu     a5,-29(s0)
        andi    a5,a5,1
        sb      a5,-29(s0)
        j       .L1236
.L1228:
        li      a5,1
        sb      a5,-29(s0)
        j       .L1236
.L1248:
        nop
.L1236:
        lbu     a5,-29(s0)
        beq     a5,zero,.L1227
        lw      a5,-36(s0)
        j       .L1240
.L1247:
        nop
.L1227:
        lw      a5,-28(s0)
        lw      a5,4(a5)
        sw      a5,-28(s0)
.L1225:
        lw      a5,-28(s0)
        bne     a5,zero,.L1241
        lw      a5,-24(s0)
        lw      a5,0(a5)
        sw      a5,-24(s0)
.L1224:
        lw      a5,-24(s0)
        bne     a5,zero,.L1242
        lw      a5,-20(s0)
        bne     a5,zero,.L1243
        lbu     a5,-57(s0)
        xori    a5,a5,1
        andi    a5,a5,0xff
        beq     a5,zero,.L1243
        lw      a5,-68(s0)
        beq     a5,zero,.L1249
.L1243:
        lw      a4,-20(s0)
        li      a5,1
        bne     a4,a5,.L1245
        lw      a5,-68(s0)
        beq     a5,zero,.L1250
.L1245:
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L1223:
        lw      a4,-20(s0)
        li      a5,2
        ble     a4,a5,.L1246
        j       .L1244
.L1249:
        nop
        j       .L1244
.L1250:
        nop
.L1244:
        li      a5,0
.L1240:
        mv      a0,a5
        lw      ra,76(sp)
        lw      s0,72(sp)
        addi    sp,sp,80
        jr      ra
