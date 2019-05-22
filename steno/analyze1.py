import requests
import gifparse
import types
from binascii import *;
import codecs
import sys
import string

def isPrintable(s):
	for x in s:
		if not x in string.printable:
			return False;
	return True;

def beautifyStr(s):
	if isPrintable(s):
		return s;
	else:
		return "0x" + hexlify(s);

def dump(obj, level):
	if isinstance(obj, types.StringType):
		print level*' ' +  beautifyStr(obj);
	elif isinstance(obj, types.ListType):
		for u in obj:
			dump(u, level + 2);
	elif isinstance(obj, types.DictType):
		for key in obj:
			print " "*level + key + ":";
			dump(obj[key], level + 2);
	elif isinstance(obj, types.StringTypes):
		print " "*level + str(obj);
	elif isinstance(obj, types.ClassType) or isinstance(obj, types.InstanceType) or "object" in str(type(obj)) or "class" in str(type(obj)):
		for x, val in obj.__dict__.items():
			val = obj.__dict__[str(x)];
			#print level*" " + str(x) + " => type: " + str(type(val)) + ": ";
			print level*" " + str(x) + " => ";
			dump(val, level+2);
	elif "BytesIO" in str(type(obj)):
		s2 = obj.read();
		print " " *level + " bytes: " + s2;
	else:
		print " "*level + "type: " + str(type(obj)) + ": " + str(obj);

# main program
gif_bytes = open("./red2.gif", "rb").read();
gif = gifparse.parse(gif_bytes);

print(gif.__dict__);
print("-------- details of ALL ------------"); 
dump(gif, 1);
