; boot.asm

%define CRLF 13,10

%include "functions.inc"

jmp main

print:
  BEGIN

  mov ah, 0x0E ; ksdhfskdfhglshafl AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA jasdhf hasldk fhklasdhf lasdkjlhflasfdjl f
  int 0x10

  END

print_str:
  BEGIN

  lea si, [bx]
  
  .ch_loop:lodsb
    cmp al, 0 ; zero=end of str
    je .done

    push ax
    call print

    jmp .ch_loop

  .done:
  END

main:
bits 16
[ORG 0x7c00]
 
  xor ax, ax ; make it zero
  mov ds, ax

  ; setup stack
  mov bp, 0x9000
  mov sp, bp

  push msg
  call print_str

  push msg2
  call print_str

hang:
   hlt
   jmp hang
 
msg       db 'Hello World', CRLF, 0
msg2       db 'Hello World woohoo', CRLF, 0

   times 510-($-$$) db 0
   db 0x55
   db 0xAA