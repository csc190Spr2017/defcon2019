alpha = "+-=ABCDEFGHIJKLMNOPQRSTUVWXYZ_{}";

# return binary form
def getBin(n):
	arr = [];
	while n!=0:
		arr.append(n%2);
		n = n//2;
	for x in range(5-len(arr)):
		arr.append(0);
	arr.reverse();
	return arr;

# return arr of bits that represent o
def getPosO():
	for idx in range(len(alpha)):
		if alpha[idx]=="O":
			return getBin(idx);
	return [];	


# rotate left 
def rotate(arr, x):
	arr2 = arr[x:len(arr)] + arr[0:x];
	return arr2;

# find rotate value
def findRotateVal(arr, start = 0):
	arrRight = getPosO();
	for x in range(start, 8):
		arr2 = rotate(arr, x);
		if arr2[0:5]==arrRight:
			return x;
	return -1;

def getVal(arr):
	val = 0;
	for x in arr: 
		val = val*2 + x;
	return val;

# define translate
# arr of arr
def translate(arr):
	arr1 = arr[0];
	arrRet = [];
	shift = findRotateVal(arr1);
	print("shift IS: ", shift);
	if shift==-1:
		print("ERROR cannot find rotate bit!");
		return;
	else:
		for a in arr:
			a2 = rotate(a, shift);
			arrRet = arrRet + a2;

	# Do the translation
	s = "";
	for x in range(len(arrRet)//5):
		arrUnit = arrRet[x*5: x*5+5];
		idx = getVal(arrUnit);
		ch = alpha[idx]; 
		s = s + ch;
	print(s);
		
