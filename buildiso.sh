#!/bin/bash

nasm -felf32 boot.asm -o boot.o \
  && i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -Wall -Wextra \
  && i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc \
  && mkdir -p isodir/boot/grub \
  && cp myos.bin isodir/boot/myos.bin \
  && cp grub.cfg isodir/boot/grub/grub.cfg \
  && grub-mkrescue -o myos.iso isodir \
  && rm -rf isodir \
  && mv boot.o kernel.o myos.bin myos.iso build \
  && echo "Build success!"