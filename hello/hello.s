#hello.s

.data
    msg: .string "hello, kevin\\n" 
    len = . -msg

.text
.global _start

_start:
    movl $len, %edx
    movl $msg, %esi
    movl $1, %edi
    call write
#    movl $64, %eax
#    int $0x80

    movl $0, %ebx
    call exit
    ;movl $93, %eax
    ;int $0x80

