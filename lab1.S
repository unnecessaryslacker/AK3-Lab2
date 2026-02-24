.syntax unified
.cpu cortex-m4
.thumb

.global lab1
.type lab1, %function

lab1:
  push {r4, r5, r6, lr} // збереження регістрів та LR

  mov  r0, #99 // a
  mov  r1, #77 // b
  mov  r2, #10 // c

  and  r3, r0, r1 // r3 = a & b
  lsr  r3, r3, #1 // r3 = (a & b) >> (логічний зсув)

  mov  r4, #1 // r4 = акумулятор факторіала
  mov  r5, r2 // r5 = лічильник = c
  cmp  r5, #0 // перевірка c == 0
  beq  factorial_done // для c == 0 факторіал дорівнює 1

factorial_loop:
  mul  r4, r4, r5 // r4 *= лічильник
  subs r5, r5, #1 // лічильник--
  bne  factorial_loop // цикл, доки лічильник != 0

factorial_done:
  add  r0, r3, r4 // r0 = (a & b) >> + c!

  pop  {r4, r5, r6, pc} // відновлення регістрів та повернення
.size lab1, .-lab1
