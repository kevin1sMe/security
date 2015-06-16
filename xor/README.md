###maild测试
@(安全研究)[异或|解密|maild]

###账号
域:kevin.com
管理员：kevinlin	/s***4***a

用户：test1
全名：test1 test
密码: just123

PASSWORD2=`vEb1BKmdaA==`
以上base64解码后为： \xbc \x46 \xf5 \x04 \xa9 \x9d \x68 


###解密
* 计算xor的密钥
encode_str="\xbc\x46\xf5\x04\xa9\x9d\x68"
decode_str="just123"

```
#!/usr/bin/env python

encode_str="\xbc\x46\xf5\x04\xa9\x9d\x68"
decode_str="just123"

print "len of encode_str:",len(encode_str)
key_str=[]

for i in range(len(encode_str)):
    print "encode_str[%d]:%s"%(i, encode_str[i])
    for key in range(255):
        if ord(encode_str[i])^key == ord(decode_str[i]):
            print "find key[%d]:%x"%(i,key)
            key_str.append(key)
            break
print "\n\n"
print "encode_str:", encode_str
print "decode_str:", decode_str
print "key:",key_str


```

```
[~/myrepo/security/xor]$ ./calc_key.py                               *
len of encode_str: 7
encode_str[0]:?
find key[0]:d6
encode_str[1]:F
find key[1]:33
encode_str[2]:?
find key[2]:86
encode_str[3]:
find key[3]:70
encode_str[4]:?
find key[4]:98
encode_str[5]:?
find key[5]:af
encode_str[6]:h
find key[6]:5b



encode_str: ?F???h
decode_str: just123
key_str: [214, 51, 134, 112, 152, 175, 91]
```

