###研究函数调用的堆栈情况

* 基本如预期，但是mac osx下面反汇编时的rip , rsp, rbp等需要理解为eip,esp,ebp
* mac下的gdb反汇编的代码是Intel格式的，mov 0x01, rax 
* mac下无objdump,  有其类似的otool工具，用法 
    * `otool -tV test.bin` 普通反编译
    * `otool -dV test.bin` 查看数据段
    * `otool -lV test.bin` 查看load commands
* 关于nm
    * nm -px test.bin 查看符号表 
        * -p 原始顺序，不做symbol字母或者数字排序。
        * -x 16进制表示 
