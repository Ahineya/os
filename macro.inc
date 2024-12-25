%define CRLF 13, 10

%macro ReadKey 0
  mov ah, 0
  int 16h ; after this, al contains the keyboard symbol
%endmacro

%macro Print 0
  mov ah, 0x0E
  int 0x10
%endmacro

%macro PrintNewLine 0
  mov al, 13
  Print
  mov al, 10
  Print
%endmacro

; Prints a string to the screen
%macro PrintString 1
lea si, [%1] 
%%ch_loop:lodsb
   cmp al, 0 ; zero=end of str
   je %%done   ; get out
   mov ah, 0x0E
   int 0x10
   jmp %%ch_loop
%%done:
%endmacro