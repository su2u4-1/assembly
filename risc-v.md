# RISC-V 32-bit Basic Integer Instruction Set
## register
|register|ABI name|comment|saver|
|-|-|-|-|
|x0|zero|Hard-wired zero, constant 0|N|
|x1|ra|Return address|caller, caller instruction pc|
|x2|sp|Stack pointer|callee, callee instruction pc|
|x3|gp|Global pointer|N|
|x4|tp|Thread pointer|N|
|x5|t0|Temporary/alternate link register|caller|
|x6|t1|Temporaries|caller|
|x7|t2|Temporaries|caller|
|x8|s0/fp|Saved register/frame pointer|caller|
|x9|s1|Saved register|caller|
|x10|a0|Function arguments/return values|caller|
|x11|a1|Function arguments/return values|caller|
|x12|a2|Function arguments|caller|
|x13|a3|Function arguments|caller|
|x14|a4|Function arguments|caller|
|x15|a5|Function arguments|caller|
|x16|a6|Function arguments|caller|
|x17|a7|Function arguments|caller|
|x18|s2|Saved registers|caller|
|x19|s3|Saved registers|caller|
|x20|s4|Saved registers|caller|
|x21|s5|Saved registers|caller|
|x22|s6|Saved registers|caller|
|x23|s7|Saved registers|caller|
|x24|s8|Saved registers|caller|
|x25|s9|Saved registers|caller|
|x26|s10|Saved registers|caller|
|x27|s11|Saved registers|caller|
|x28|t3|Temporaries|caller|
|x29|t4|Temporaries|caller|
|x30|t5|Temporaries|caller|
|x31|t6|Temporaries|caller|
## instruction
### load and store
- `lb`: load byte
    - `lb rd, offset(rs1)`
    - `// rd = (signed char)M[rs1 + offset]`
- `lh`: load half-word
    - `lh rd, offset(rs1)`
    - `// rd = (signed short)M[rs1 + offset]`
- `lw`: load word
    - `lw rd, offset(rs1)`
    - `// rd = (signed int)M[rs1 + offset]`
- `lbu`: load byte unsigned
    - `lbu rd, offset(rs1)`
    - `// rd = (unsigned byte)M[rs1 + offset]`
- `lhu`: load half-word unsigned
    - `lhu rd, offset(rs1)`
    - `// rd = (unsigned short)M[rs1 + offset]`
- `sb`: store byte
    - `sb rs2, offset(rs1)`
    - `// M[rs1 + offset] = (unsigned char)rs2`
- `sh`: store half-word
    - `sh rs2, offset(rs1)`
    - `// M[rs1 + offset] = (unsigned short)rs2`
- `sw`: store word
    - `sw rs2, offset(rs1)`
    - `// M[rs1 + offset] = (unsigned int)rs2`
### arithmetic
- `add`: add
    - `add rd, rs1, rs2`
    - `// rd = rs1 + rs2`
- `addi`: add immediate
    - `addi rd, rs1, imm`
    - `// rd = rs1 + imm`
- `sub`: subtract
    - `sub rd, rs1, rs2`
    - `// rd = rs1 - rs2`
- `lui`: load upper immediate
    - `lui rd, imm`
    - `// rd = imm << 12`
- `auipc`: add upper immediate to pc
    - `auipc rd, imm`
    - `// rd = pc + (imm << 12)`
### logical
- `xor`: bitwise xor
    - `xor rd, rs1, rs2`
    - `// rd = rs1 ^ rs2`
- `xori`: bitwise xor immediate
    - `xori rd, rs1, imm`
    - `// rd = rs1 ^ imm`
- `or`: bitwise or
    - `or rd, rs1, rs2`
    - `// rd = rs1 | rs2`
- `ori`: bitwise or immediate
    - `ori rd, rs1, imm`
    - `// rd = rs1 | imm`
- `and`: bitwise and
    - `and rd, rs1, rs2`
    - `// rd = rs1 & rs2`
- `andi`: bitwise and immediate
    - `andi rd, rs1, imm`
    - `// rd = rs1 & imm`
### shift
> shamt: shift amount, 5-bit unsigned integer

> `rs2 & 0x1f`: mask the lower 5 bits of rs2 to get the shift amount

- `sll`: shift left logical
    - `sll rd, rs1, rs2`
    - `// rd = rs1 << (rs2 & 0x1f)`
- `slli`: shift left logical immediate
    - `slli rd, rs1, shamt`
    - `// rd = rs1 << shamt`
- `srl`: shift right logical
    - `srl rd, rs1, rs2`
    - `// rd = rs1 >> (rs2 & 0x1f)`
- `srli`: shift right logical immediate
    - `srli rd, rs1, shamt`
    - `// rd = rs1 >> shamt`
- `sra`: shift right arithmetic
    - `sra rd, rs1, rs2`
    - `// rd = (signed)rs1 >> (rs2 & 0x1f)`
- `srai`: shift right arithmetic immediate
    - `srai rd, rs1, shamt`
    - `// rd = (signed)rs1 >> shamt`
### compare
- `slt`: set less than
    - `slt rd, rs1, rs2`
    - `// rd = (rs1 < rs2) ? 1 : 0`
- `slti`: set less than immediate
    - `slti rd, rs1, imm`
    - `// rd = (rs1 < imm) ? 1 : 0`
- `sltu`: set less than unsigned
    - `sltu rd, rs1, rs2`
    - `// rd = (rs1 < rs2) ? 1 : 0`
- `sltiu`: set less than immediate unsigned
    - `sltiu rd, rs1, imm`
    - `// rd = (rs1 < imm) ? 1 : 0`
### control
> sext(offset): sign-extend the offset to 32 bits
- `beq`: branch if equal
    - `beq rs1, rs2, offset`
    - `// if (rs1 == rs2) pc += sext(offset)`
- `bne`: branch if not equal
    - `bne rs1, rs2, offset`
    - `// if (rs1 != rs2) pc += sext(offset)`
- `blt`: branch if less than
    - `blt rs1, rs2, offset`
    - `// if (rs1 < rs2) pc += sext(offset)`
- `bge`: branch if greater than or equal
    - `bge rs1, rs2, offset`
    - `// if (rs1 >= rs2) pc += sext(offset)`
- `bltu`: branch if less than unsigned
    - `bltu rs1, rs2, offset`
    - `// if (rs1 < rs2) pc += sext(offset)`
- `bgeu`: branch if greater than or equal unsigned
    - `bgeu rs1, rs2, offset`
    - `// if (rs1 >= rs2) pc += sext(offset)`
- `jal`: jump and link
    - `jal rd, offset`
    - `// rd = pc + 4; pc += sext(offset)`
- `jalr`: jump and link register
    - `jalr rd, rs1, offset`
    - `// rd = pc + 4; pc = (rs1 + sext(offset)) & ~1`
### other
- `fence`: fence
    - `fence pred, succ`
    - `// memory and I/O ordering`
    - `iorw: device i/o, memory r/w`
- `ecall`: environment call
    - `ecall`
    - `// call to the environment (e.g., system call)`
- `ebreak`: environment break
    - `ebreak`
    - `// breakpoint for debugger`
## pseudo instruction
> `pcrel`: PC-relative
- `call`: call function  
    - `call label`
    ```asm
        auipc ra, %pcrel_hi(label)
        jalr ra, ra, %pcrel_lo(label)
    ```
- `la`: load address
    - `la rs1 label`
    ```asm
        auipc rs1, %pcrel_hi(label)
        addi rs1, rs1, %pcrel_lo(label)
    ```
    or

    ```asm
        lui rs1, %hi(label)
        addi rs1, rs1, %lo(label)
    ```
