###探究malloc时的内存分布

*遗留问题

malloc本身的对于分配 的内存块的管理 信息，通过反汇编查看上下内存并没有找到相关信息，比如malloc buffer len等。这个网上一些文章说是在所分配 的内存块的指针的前面一部分，但未找到。是和mac osx有关？和编译选项有关？-g,无优化

malloc分配的内存实际上有一块管理信息：
>struct mem_control_block {
             int is_available;    //free时仅设置此标志位
             int size;            //这是实际空间的大小
    };
