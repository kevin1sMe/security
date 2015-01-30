##ghost.c

* 漏洞名称：CVE-2015-0235-GHOST
* 在2015年1月27号glibc爆了一个buffer overflow漏洞。
* 原因是gethostbyname*系列函数底层某函数在计算使用内存的长度时少计算了一个sizeof(char*)

* 这个程序是用来测试本地版本是否有溢出漏洞。执行输出vulnerable为有漏洞
* 在glibc2.18及后版本已经修复， 查看glibc版本号方式
    * ubuntu  -> apt-cache show libc6 / ldd --version
    * macosx -> ?

