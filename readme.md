##linux shellcode

---
### Basic Knowledge
1. linux system call can find in /usr/include/asm/unistd.h
2. using asm for call system 
```
* eax -> hex code for system call
* ebx -> param1
* ecx -> param2
* edx -> param3
* esi -> param4
* edi -> param5
```

## 
1. exapmle (exit)
 gcc -static -o exit  exit.c 

 using -static  flag to link exit's code to bin executable

