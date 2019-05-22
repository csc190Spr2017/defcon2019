from PIL import Image
from PIL import ImageDraw
from decode import *
import math;

# process each frame and return a new image
def procFrame(fr):
	(w, h) = fr.size;
	imgNew = Image.new('RGB', (w,h));
	pixels = imgNew.load();
	for x in range(w):
		for y in range(h):
			cidx = im.getpixel((x,y));
			if cidx==0:
				color = (100, 0, 0);
			elif cidx==1:
				color = (0, 100, 0);
			elif cidx==2:
				color = (0, 0, 100);
			else:
				color = (100, 100, 100);
			pixels[x,y] = color
	return imgNew;

def getFrames(im):
	arr = [];
	(w,h) = im.size;
	for x in range(0, im.n_frames):
			fname = "imgs/img"+str(x)+ ".gif";
			im.seek(x);
			imgNew = procFrame(im);
			imgNew.save(fname);
			imgNew2 = Image.open(fname);
			arr.append(imgNew2);
		
	return arr;

def loadFrames():
	arr = [];
	for x in range(35):
		fname = "imgs/img"+str(x)+".gif";
		img = Image.open(fname);
		arr.append(img);
	return arr;

def mergeFrames(arrFrames, w, h):
	imgNew = Image.new('RGB', (w,h));
	pixels = imgNew.load();
	idx = 0;
	for im in arrFrames:
		idx += 1;
		for x in range(w):
			for y in range(h):
				cidx = im.getpixel((x,y));
				if cidx==0:
					color = (100, 0, 0);
				elif cidx==1:
					color = (0, 100, 0);
				elif cidx==2:
					color = (0, 0, 100);
				else:
					color = (100, 100, 100);
				if cidx==2:
					pixels[x,y] = (color[0], color[1], 255-idx*5);
	imgNew.save("imgs/all.gif");	
	return imgNew;
	

def loadMerged():
	img = Image.open("imgs/all.gif");
	(w, h) = img.size;
	draw = ImageDraw.Draw(img);
	draw.rectangle([(w/2-10, h/2-10), (w/2+10, h/2+10)], fill=(100,0,0));
	radius = 300;
	cx = w/2;
	cy = h/2;
	for u in range(8):
		angle = u * 360/8 + 22.5;
		rangle = math.radians(angle);
		x = cx + radius*math.cos(rangle);
		y = cy + radius*math.sin(rangle);
		print("x:", x, "y:", y, "angle: ", angle);
		draw.rectangle([(x-10,y-10), (x+10, y+10)], fill=(100, 0, 0));
	img.show();

def getBitsPattern(frame):
	arr = [];
	pixels = frame.load();
	(w,h) = frame.size;
	cx = w/2;
	cy = h/2;
	radius = 300;
	for u in range(8):
		angle = u * 360/8 + 22.5;
		rangle = math.radians(angle);
		x = int(cx + radius*math.cos(rangle));
		y = int(cy + radius*math.sin(rangle));
		# test each pixel in range [(x-10, y-10), (x+10, y+10)]
		bVal = False;
		for nx in range(x-10, x+11):
			for ny in range(y-10, y+11):
				cidx = frame.getpixel((nx, ny));
				if cidx==2:
					bVal = True;
		if bVal: 
			arr.append(1);
		else: 
			arr.append(0);
	return arr;


# MAIN PROGRAM
im = Image.open("red1.gif");
#arr1 = getFrames(im);
arr1 = loadFrames();
(w,h) = im.size;

#1. get all bit patterns
arrBits = [];
for arr in arr1:
	b1 = getBitsPattern(arr);
	#b1.reverse();
	arrBits.append(b1);
	print(b1);
translate(arrBits);

