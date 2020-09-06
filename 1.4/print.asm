.cpu cortex-m0
.text
.align 2
.global application

print_asciz:
    push {r5,lr}
    mov r5, r0
loop:
    ldrb r0, [r5]
    add r0, r0, #0
    beq done
    bl toggle_case
    bl uart_put_char
    add r5, r5, #1
    b loop
done:
    pop {r5,pc}

application:
    push {lr}
    ldr r0, =msg
    bl print_asciz
    pop {pc}

toggle_case:
    push {R6}
    mov R6, R0
    cmp R6, #90
    ble check_for_up
    cmp R6, #122
    ble check_for_low
    POP {R6}
    mov PC, LR
    
check_for_up:
    cmp R6, #65
    bge lower
    mov PC, LR
    
check_for_low:
    cmp R6, #97
    bge up
    mov PC, LR
    
lower:
    add R6, #32 
    mov R0, R6
    mov PC, LR
    
up:
    sub R6, #32
    mov R0, R6
    mov PC, LR


.data
.align 4
msg:
.asciz "Hello world, the ANSWER is 42! @[]`{}~\n"