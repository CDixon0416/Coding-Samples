#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void frequency_analysis(char* filename){
    char ch,ascii = 'A';
    int freq[26],i = 0,s = 0,sum = 0;
    while(s != 26){
        freq[s] = 0;
        s++;
    }
    
    FILE *file;
    file = fopen(filename,"r");
    
    while (!(feof(file))) {
        ch = fgetc(file);
//        printf("%c ", ch);
        if ('a' <= ch && ch <= 'z'){      
            freq[ch-'a']++;
            sum++;
//            printf("lower %i\n",ch-'a');
        }
        else if ('A' <= ch && ch <= 'Z'){
            freq[ch-'A']++;
            sum++;
//            printf("upper %i\n",ch-'A');
        }
    }    
    fclose(file);
    
    printf("\nTotal number of characters is:%i \n\n", sum);
    while(i != 26){
        float percent = freq[i]/(float)sum;
        printf("%c%*i%*0.7f \n",ascii,15,freq[i],2,percent);
        i++;
        ascii++;
    } 
}

int main(){
    char *filename = malloc(100);
    printf("Please make sure the file is in the same directory as the Frequency Analysis.c file.\n");
    printf("What file would you like to analyze?\n>");
    scanf("%s", filename);
    printf("\nStarting analysis of %s",filename);
    frequency_analysis(filename);
    free(filename);
}