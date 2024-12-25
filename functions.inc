%macro BEGIN 0
  push    bp 
  mov     bp,sp 
  sub     sp, 0x40
  mov     bx, [bp+4]
%endmacro

%macro END 0
  mov sp, bp
  pop bp 
  ret
%endmacro