/* Скрипт компонування: розмітка памʼяті для STM32F4 (FLASH + RAM). */
MEMORY
{
  FLASH ( rx )  : ORIGIN = 0x08000000, LENGTH = 1M   /* код програми */
  RAM   ( rxw ) : ORIGIN = 0x20000000, LENGTH = 128K /* дані та стек */
}

/* Початкове значення SP (верх RAM). */
__stack_start = ORIGIN(RAM) + LENGTH(RAM);
