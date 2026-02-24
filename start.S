.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global __hard_reset__

.type vtable, %object
.type __hard_reset__, %function

vtable:
  .word __stack_start // початкове значення SP (верх RAM)
  .word __hard_reset__+1 // адреса обробника Reset (Thumb)
.size vtable, .-vtable

__hard_reset__:
  ldr r0, =__stack_start // завантаження адреси верхівки стеку
  mov sp, r0 // ініціалізація SP

  bl lab1 // виконання обчислення

hang:
  b hang // нескінченний цикл очікування
.size __hard_reset__, .-__hard_reset__
