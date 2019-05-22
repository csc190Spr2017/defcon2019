#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

short int arr [] = {341,61,341,59 ,353,56 ,334,56 ,332,76 ,332,49 ,362,49 ,466,47 ,460,45 ,451,45 ,323,96 ,323,42 ,387,42 ,607,392 ,320,121 ,320,40 ,320,40 ,411,40 ,320,131 ,320,121 ,395,121 ,320,152 ,320,107 ,322,43 ,324,43 ,324,45 ,370,45 ,370,47 ,330,198 ,330,52 ,332,52 ,334,54 ,336,56 ,341,230};

int main(){
	for(int i=0; i<sizeof(arr)/4; i+=2){
		printf("%c", arr[i]%256);
	}
	printf("\n");
	for(int i=sizeof(arr)/4; i>=0; i--){
		printf("%c", arr[i]%256);
	}
	printf("\n");
	FILE *ptr = fopen("data1.txt", "w");
	fwrite(arr, sizeof(arr), 1, ptr);
	fclose(ptr);
	printf("write completed");
} 
