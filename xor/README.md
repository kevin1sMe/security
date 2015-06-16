###maild测试
@(安全研究)[异或|解密|maild]

###账号
>>用户：test1
全名：test1 test
密码: just123


在安装目录下，对应用户的子目录下有个userinfo.txt文件，里面有一项
`PASSWORD2=vEb1BKmdaA==`	

可以看出，是经过base64编码的内容，将其解码后为：` \xbc \x46 \xf5 \x04 \xa9 \x9d \x68 `。长度和我们密码的长度一样，都是7位数字。


###解密
* 计算xor的密钥
encode_str="\xbc\x46\xf5\x04\xa9\x9d\x68"
decode_str="just123"

```
#!/usr/bin/env python
import base64

#encode_str="\xbc\x46\xf5\x04\xa9\x9d\x68"
encode_str = "vEb1BKmdaA=="
decode_str="just123"


encode = [ ord(i) for i in base64.decodestring(encode_str) ]
decode = [ ord(i) for i in decode_str ]
key_str=[]

print "len of encode:",len(encode)

for i in range(len(encode)):
    print "encode[%d]:0x%X"%(i, encode[i])
    for key in range(255):
        if encode[i]^key == decode[i]:
            print "find key[%d]:0x%x"%(i,key)
            key_str.append(key)
            break
print "\n\n"
print "encode_str:", encode_str
print "decode_str:", decode_str
print "key:",key_str



```

运行结果：
```
[~/myrepo/security/xor]$ ./calc_key.py                               *[master] 
len of encode: 7
encode[0]:0xBC
find key[0]:0xd6
encode[1]:0x46
find key[1]:0x33
encode[2]:0xF5
find key[2]:0x86
encode[3]:0x4
find key[3]:0x70
encode[4]:0xA9
find key[4]:0x98
encode[5]:0x9D
find key[5]:0xaf
encode[6]:0x68
find key[6]:0x5b


encode_str: vEb1BKmdaA==
decode_str: just123
key: [214, 51, 134, 112, 152, 175, 91]
```

