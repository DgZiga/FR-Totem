.gba
.thumb
.open "./BPRE0.gba","./multi.gba", 0x08000000
.loadtable "./charmap.txt"


.org 0x08013194
.thumb
.align 2
LDR r3, = hijack|1
BX r3
.pool

.org 0x08032b18 ;hijack_msg
.thumb
.align 2
LDR r0, = hijack_msg|1
BX r0
.pool


flag                equ 0x1777
string_buffer_maybe equ 0x0202298C

.org freespace
.importobj "./build/linked.o"

.align 2
new_msg:
.string 0x0,0xFA,"The FOE had its stats\nincreased!",0xFB,0xFF

.thumb
.align 2

hijack_msg:
    PUSH {r0-r4}
    LDR  r0, =main|1
    BL   goto_r0

msg_back_to_normal:
    POP  {r0-r4}
    LDRH r0, [r4]
    LDR  r1, =0x080D89B0|1
    BL   goto_r1
    LSL  r0, r0, #0x18
    CMP  r0, #0
    BEQ  resume_from_08032B44
    LDR r0, =string_buffer_maybe
    LDR r1, =0x08032B26|1
    BX  r1

resume_from_08032B44:
    LDR r0, =0x08032B44|1
    BX  r0

hijack:
    PUSH {r0-r5}
    LDRB r0, [r4]
    CMP  r0, #1 ;check if it's opponent pokemon
    BNE  set_stat_normal
    LDR  r0, =flag
    LDR  r3, =check_flag|1
    BL   goto_r3
    CMP  r0, #0
    BEQ  set_stat_normal
    POP {r0-r5}
    MOV  r3, #7
    B    loop_08013196

set_stat_normal:
    POP {r0-r5}
    MOV  r3, #6

loop_08013196: ; this sets the stat modifier value contained in r3 into every stat slot
    LDRB R0, [R4]
    MUL  R0, R5
    ADD  R0, R2, R0
    ADD  R0, R0, R1
    STRB R3, [R0]
    ADD  R2, #1
    CMP  R2, #7
    BLE  loop_08013196

back_to_normal:
    LDR r1, =0x080131A6|1
    BX r1

goto_r3:
    BX r3
goto_r0:
    BX r0
goto_r1:
    BX r1

.pool
.close
