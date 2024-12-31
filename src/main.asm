org 0x7C00            ; Set origin to 0x7C00
bits 16               ; 16-bit real mode

main:
    hlt               ; Halt the CPU (simple functionality for testing)

.halt:
    jmp .halt         ; Infinite loop to keep the CPU busy

times 510-($-$$) db 0 ; Pad the rest of the boot sector to 510 bytes
dw 0xAA55             ; Boot signature (must be at offset 0x1FE)

