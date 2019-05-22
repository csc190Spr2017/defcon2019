
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

short int arr [] = {1280,720, 592,595, 592,602, 577,608, 409,610, 616,592, 616,619, 590,584, 486,586, 495,630, 504,630, 574,581, 635,635, 572,637, 352,287, 559,559, 640,640, 640,640, 458,640, 640,549, 640,559, 565,559, 347,528, 638,450, 636,634, 633,634, 632,630, 583,630, 583,625, 622,474, 620,618, 589,614, 449,612, 605,608, 600,431};

int main(){
	for(int i=0; i<sizeof(arr)/4; i++){
		printf("%c", arr[i]%256);
	}
	printf("\n");
	for(int i=sizeof(arr)/4; i>=0; i--){
		printf("%c", arr[i]%256);
	}
	printf("\n");
	FILE *ptr = fopen("data2.txt", "w");
	fwrite(arr, sizeof(arr), 1, ptr);
	fclose(ptr);
	printf("write completed");
} 
