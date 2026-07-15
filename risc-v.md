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
    `lb rd, offset(rs1)`
    `// rd = (signed char)M[rs1 + offset]`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |000|     |0000011|
    ```
- `lh`: load half-word 
    `lh rd, offset(rs1)`
    `// rd = (signed short)M[rs1 + offset]`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |001|     |0000011|
    ```
- `lw`: load word 
    `lw rd, offset(rs1)`
    `// rd = (signed int)M[rs1 + offset]`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |010|     |0000011|
    ```
- `lbu`: load byte unsigned 
    `lbu rd, offset(rs1)`
    `// rd = (unsigned byte)M[rs1 + offset]`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |100|     |0000011|
    ```
- `lhu`: load half-word unsigned 
    `lhu rd, offset(rs1)`
    `// rd = (unsigned short)M[rs1 + offset]`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |101|     |0000011|
    ```
- `sb`: store byte 
    `sb rs2, offset(rs1)`
    `// M[rs1 + offset] = (unsigned char)rs2`
    instruction format: S
    ```
    |imm(h) |rs2  |rs1  |f3 |imm  |opcode |
    |-------|-----|-----|---|-----|-------|
    |       |     |     |000|     |0100011|
    ```
- `sh`: store half-word 
    `sh rs2, offset(rs1)`
    `// M[rs1 + offset] = (unsigned short)rs2`
    instruction format: S
    ```
    |imm(h) |rs2  |rs1  |f3 |imm  |opcode |
    |-------|-----|-----|---|-----|-------|
    |       |     |     |001|     |0100011|
    ```
- `sw`: store word 
    `sw rs2, offset(rs1)`
    `// M[rs1 + offset] = (unsigned int)rs2`
    instruction format: S
    ```
    |imm(h) |rs2  |rs1  |f3 |imm  |opcode |
    |-------|-----|-----|---|-----|-------|
    |       |     |     |010|     |0100011|
    ```
### arithmetic
- `add`: add 
    `add rd, rs1, rs2`
    `// rd = rs1 + rs2`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |000|     |0110011|
    ```
- `addi`: add immediate 
    `addi rd, rs1, imm`
    `// rd = rs1 + imm`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |000|     |0010011|
    ```
- `sub`: subtract 
    `sub rd, rs1, rs2`
    `// rd = rs1 - rs2`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0100000|     |     |000|     |0110011|
    ```
- `lui`: load upper immediate 
    `lui rd, imm`
    `// rd = imm << 12`
    instruction format: U
    ```
    |immediate           |rd   |opcode |
    |--------------------|-----|-------|
    |                    |     |0110111|
    ```
- `auipc`: add upper immediate to pc 
    `auipc rd, imm`
    `// rd = pc + (imm << 12)`
    instruction format: U
    ```
    |immediate           |rd   |opcode |
    |--------------------|-----|-------|
    |                    |     |0010111|
    ```
### logical
- `xor`: bitwise xor 
    `xor rd, rs1, rs2`
    `// rd = rs1 ^ rs2`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |100|     |0110011|
    ```
- `xori`: bitwise xor immediate 
    `xori rd, rs1, imm`
    `// rd = rs1 ^ imm`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |100|     |0010011|
    ```
- `or`: bitwise or 
    `or rd, rs1, rs2`
    `// rd = rs1 | rs2`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |110|     |0110011|
    ```
- `ori`: bitwise or immediate 
    `ori rd, rs1, imm`
    `// rd = rs1 | imm`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |110|     |0010011|
    ```
- `and`: bitwise and 
    `and rd, rs1, rs2`
    `// rd = rs1 & rs2`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |111|     |0110011|
    ```
- `andi`: bitwise and immediate 
    `andi rd, rs1, imm`
    `// rd = rs1 & imm`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |111|     |0010011|
    ```
### shift
> shamt: shift amount, 5-bit unsigned integer

> `rs2 & 0x1f`: mask the lower 5 bits of rs2 to get the shift amount

- `sll`: shift left logical 
    `sll rd, rs1, rs2`
    `// rd = rs1 << (rs2 & 0x1f)`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |001|     |0110011|
    ```
- `slli`: shift left logical immediate 
    `slli rd, rs1, shamt`
    `// rd = rs1 << shamt`
    instruction format: I
    ```
    |func7  |shamt|rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |001|     |0010011|
    ```
- `srl`: shift right logical 
    `srl rd, rs1, rs2`
    `// rd = rs1 >> (rs2 & 0x1f)`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |101|     |0110011|
    ```
- `srli`: shift right logical immediate 
    `srli rd, rs1, shamt`
    `// rd = rs1 >> shamt`
    instruction format: I
    ```
    |func7  |shamt|rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |101|     |0010011|
    ```
- `sra`: shift right arithmetic 
    `sra rd, rs1, rs2`
    `// rd = (signed)rs1 >> (rs2 & 0x1f)`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0100000|     |     |101|     |0110011|
    ```
- `srai`: shift right arithmetic immediate 
    `srai rd, rs1, shamt`
    `// rd = (signed)rs1 >> shamt`
    instruction format: I
    ```
    |func7  |shamt|rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0100000|     |     |101|     |0010011|
    ```
### compare
- `slt`: set less than 
    `slt rd, rs1, rs2`
    `// rd = (rs1 < rs2) ? 1 : 0`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |010|     |0110011|
    ```
- `slti`: set less than immediate 
    `slti rd, rs1, imm`
    `// rd = (rs1 < imm) ? 1 : 0`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |010|     |0010011|
    ```
- `sltu`: set less than unsigned 
    `sltu rd, rs1, rs2`
    `// rd = (rs1 < rs2) ? 1 : 0`
    instruction format: R
    ```
    |func7  |rs2  |rs1  |f3 |rd   |opcode |
    |-------|-----|-----|---|-----|-------|
    |0000000|     |     |011|     |0110011|
    ```
- `sltiu`: set less than immediate unsigned 
    `sltiu rd, rs1, imm`
    `// rd = (rs1 < imm) ? 1 : 0`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |011|     |0010011|
    ```
### control
> sext(offset): sign-extend the offset to 32 bits
- `beq`: branch if equal 
    `beq rs1, rs2, offset`
    `// if (rs1 == rs2) pc += sext(offset)`
    instruction format: B
    ```
    |imm    |rs2  |rs1  |f3 |imm  |opcode |
    |-------|-----|-----|---|-----|-------|
    |       |     |     |000|     |1100011|
    ```
- `bne`: branch if not equal 
    `bne rs1, rs2, offset`
    `// if (rs1 != rs2) pc += sext(offset)`
    instruction format: B
    ```
    |imm    |rs2  |rs1  |f3 |imm  |opcode |
    |-------|-----|-----|---|-----|-------|
    |       |     |     |001|     |1100011|
    ```
- `blt`: branch if less than 
    `blt rs1, rs2, offset`
    `// if (rs1 < rs2) pc += sext(offset)`
    instruction format: B
    ```
    |imm    |rs2  |rs1  |f3 |imm  |opcode |
    |-------|-----|-----|---|-----|-------|
    |       |     |     |100|     |1100011|
    ```
- `bge`: branch if greater than or equal 
    `bge rs1, rs2, offset`
    `// if (rs1 >= rs2) pc += sext(offset)`
    instruction format: B
    ```
    |imm    |rs2  |rs1  |f3 |imm  |opcode |
    |-------|-----|-----|---|-----|-------|
    |       |     |     |101|     |1100011|
    ```
- `bltu`: branch if less than unsigned 
    `bltu rs1, rs2, offset`
    `// if (rs1 < rs2) pc += sext(offset)`
    instruction format: B
    ```
    |imm    |rs2  |rs1  |f3 |imm  |opcode |
    |-------|-----|-----|---|-----|-------|
    |       |     |     |110|     |1100011|
    ```
- `bgeu`: branch if greater than or equal unsigned 
    `bgeu rs1, rs2, offset`
    `// if (rs1 >= rs2) pc += sext(offset)`
    instruction format: B
    ```
    |imm    |rs2  |rs1  |f3 |imm  |opcode |
    |-------|-----|-----|---|-----|-------|
    |       |     |     |111|     |1100011|
    ```
- `jal`: jump and link 
    `jal rd, offset`
    `// rd = pc + 4; pc += sext(offset)`
    instruction format: J
    ```
    |immediate           |rd   |opcode |
    |--------------------|-----|-------|
    |                    |     |1101111|
    ```
- `jalr`: jump and link register 
    `jalr rd, rs1, offset`
    `// rd = pc + 4; pc = (rs1 + sext(offset)) & ~1`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |            |     |000|     |1100111|
    ```
### other
- `fence`: fence 
    `fence pred, succ`
    `// memory and I/O ordering`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |000000000000|00000|000|00000|0001111|
    ```
    > iorw: device i/o, memory r/w
- `ecall`: environment call 
    `ecall`
    `// call to the environment (e.g., system call)`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |000000000000|00000|000|00000|1110011|
    ```
- `ebreak`: environment break 
    `ebreak`
    `// breakpoint for debugger`
    instruction format: I
    ```
    |immediate   |rs1  |f3 |rd   |opcode |
    |------------|-----|---|-----|-------|
    |000000000001|00000|000|00000|1110011|
    ```
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
- `li`: load immediate
    - `li rd, imm`
    ```asm
        addi rd, zero, imm
    ```
- `ble`: branch if less than or equal
    - `ble rs1, rs2, offset`
    ```asm
        bge rs2, rs1, offset
    ```
- `bgt`: branch if greater than
    - `bgt rs1, rs2, offset`
    ```asm
        ble rs2, rs1, offset
    ```
- `mv`: move
    - `mv rd, rs1`
    ```asm
        addi rd, rs1, 0
    ```
- `j`: jump
    - `j offset`
    ```asm
        jal zero, offset
    ```
- `ret`: return from function
    - `ret`
    ```asm
        jalr zero, ra, 0
    ```
