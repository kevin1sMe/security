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
