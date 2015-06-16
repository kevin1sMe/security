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
