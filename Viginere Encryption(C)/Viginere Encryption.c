
/* 
 * File:   Viginere Encryption.c
 * Author: Casey Dixon
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void init(){
    char *status = NULL;
    int choice = 0;
    while(status != "exit"){
        while(choice !=1 && choice !=2 && choice !=3 && choice !=4){
            printf("Would you like to:\n(1)Encrypt\n(2)Decrypt\n(3)Frequency Analyze\n(4)Exit\n");
            scanf("%d", &choice);
        }
        if(choice == 4){
            status = "exit";
        }
        if(choice == 1){
            char *filename = malloc(100);
            char *key = malloc(10);
            printf("What file would you like to encrypt?");
            scanf("%s", filename);
            printf("What key should the file be encrypted with?");
            scanf("%s", key);
            encryption(filename,key);
            free(filename);
            free(key);
            choice = 0;
            printf("\n");
        }
        if(choice == 2){
            char *filename = malloc(100);
            char *key = malloc(10);
            printf("What file would you like to decrypt?");
            scanf("%s", filename);
            printf("What key was the file encrypted with?");
            scanf("%s", key);
            decryption(filename,key);
            free(filename);
            free(key);
            choice = 0;
            printf("\n");
        }
        if(choice == 3){
            char *filename = malloc(100);
            int keylength;
            printf("What file would you like analyzed?");
            scanf("%s", filename);
            printf("What is the maximum size of the key?");
            scanf("%d",&keylength);
            for(int i = 1; i <= keylength; i++){
                frequency_analysis(filename,i);
            }
            free(filename);
            choice = 0;
            printf("\n\n");
        }
    }

}

FILE *openfile(char* filename,char* mode){
    FILE *file;
    file = fopen(filename, mode);
    if(file == NULL){
        printf("File failed to open please make sure the file is in the correct place.\n");
    }
    return file;
}

void encryption(char* filename, char* key){
    printf("\nStarting encryption of %s with key %s\n",filename,key);
    FILE *file1,*file2;
    char ch,encrypt;
    int keyposition = 0,keylength = strlen(key);
    
    file1 = openfile(filename, "r");
    if(file1 == NULL){
        return;
    }
    file2 = openfile("encryptedfile.txt", "w");
    if(file2 == NULL){
        return;
    }
    
    ch = fgetc(file1);
    while (!(feof(file1))) {
        if(keyposition == keylength){
            keyposition = 0;
        }
        if('a' <= ch && ch <= 'z'){
            encrypt = (((ch+(tolower(key[keyposition])))%26)+85);
            if(encrypt < 'a'){
                encrypt = encrypt+26;
            }
            fprintf(file2,"%c",encrypt);
            keyposition++;
        }
        else if('A' <= ch && ch <= 'Z'){
            encrypt = (((ch+(toupper(key[keyposition])))%26)+65);
            if(encrypt < 'A'){
                encrypt = encrypt+26;
            }
            fprintf(file2,"%c",encrypt);
            keyposition++;
        }
        else{
            fprintf(file2,"%c",ch);
        }
        ch = fgetc(file1);
    }
    
    fclose(file1);
    fclose(file2);
    printf("\nEncryption of %s is now stored in encryptedfile.txt\n", filename);
}

void decryption(char* filename, char* key){
    printf("\nStarting decryption of %s with key %s\n",filename,key);
    FILE *file1,*file2;
    char ch,decrypt;
    int keyposition = 0,keylength = strlen(key);
    
    file1 = openfile(filename, "r");
    if(file1 == NULL){
        return;
    }
    file2 = openfile("decryptedfile.txt", "w");
    if(file2 == NULL){
        return;
    }
    
    ch = fgetc(file1);
    while (!(feof(file1))){
        if(keyposition == keylength){
            keyposition = 0;
        }
        if('a' <= ch && ch <= 'z'){
            decrypt = (((ch-(tolower(key[keyposition])))%26)+97);
            if(decrypt < 'a'){
                decrypt = decrypt+26;
            }
            fprintf(file2,"%c",decrypt);
            keyposition++;
        }
        else if('A' <= ch && ch <= 'Z'){
            decrypt = (((ch-(toupper(key[keyposition])))%26)+65);
            if(decrypt < 'A'){
                decrypt = decrypt+26;
            }
            fprintf(file2,"%c",decrypt);
            keyposition++;
        }
        else{
            fprintf(file2,"%c",ch);
        }
        ch = fgetc(file1);
    }
    
    fclose(file1);
    fclose(file2);
    printf("\nDecryption of %s is now stored in decryptedfile.txt\n", filename);
}

void frequency_analysis(char* filename, int keylength){
    char *newfilenameprefix = malloc(100);
    char *newfilenamepostfix = malloc(100);
    char *newfilenamekeylength = malloc(100);
    char *newfilename = malloc(100);
    
    strcpy(newfilenameprefix, "Analysis_Of_");
    strcpy(newfilenamepostfix, filename);
    itoa(keylength,newfilenamekeylength,10);
    
    newfilename = strcat(newfilenameprefix,newfilenamepostfix);
    newfilename = strcat(newfilename,"_With_Keylength=");
    newfilename = strcat(newfilename,newfilenamekeylength);
    newfilename = strcat(newfilename,".txt");
    
    FILE *file1, *file2;
    file1 = openfile(filename,"r");
    if(file1 == NULL){
        return;
    }
    file2 = openfile(newfilename,"w");
    if(file2 == NULL){
        return;
    }
    
    char ch,ascii = 'A';
    int s,i = 0,counter = 0,freq[keylength*26],sum[keylength];
    int skippedchar = 0, likelykey = 0,overflow =0;
    char likelychar, tmpchar;
    
    while(s != (keylength*26)){
        freq[s] = 0;
        s++;
    }
    
    s = 0;
    while(s != keylength){
        sum[s] = 0;
        s++;
    }
 
    while(!(feof(file1))){
        ch = fgetc(file1);
        if(counter < keylength-1){
            if ('a' <= ch && ch <= 'z'){      
                freq[(counter*26)+(ch-'a')]++;
                sum[counter]++;
            }
            else if ('A' <= ch && ch <= 'Z'){
                freq[(counter*26)+(ch-'A')]++;
                sum[counter]++;
            }
            counter++;
        }
        else if(counter == keylength-1){
            if ('a' <= ch && ch <= 'z'){      
                freq[(counter*26)+(ch-'a')]++;
                sum[counter]++;
            }
            else if ('A' <= ch && ch <= 'Z'){
                freq[(counter*26)+(ch-'A')]++;
                sum[counter]++;
            }
            counter=0;
        }
    }
    
    counter = 0;
    fprintf(file2,"Characters skipped %i starting at character %i\n",keylength-1,skippedchar);
    while(i != keylength*26){
        float percent = freq[i]/(float)sum[counter];
        fprintf(file2,"%c%*i%*0.7f \n",ascii,15,freq[i],2,percent);
        if(freq[i] > likelykey){
            likelykey = freq[i];
            likelychar = ascii;
        }
        i++;
        ascii++;
        if(i%26 == 0){
            tmpchar = likelychar - 'E';
            if(tmpchar < 0){
                likelychar = 91 + tmpchar;
            }
            else{
                likelychar = 'A' + tmpchar;
            }
            fprintf(file2,"Likely key for this substring is %c\n",likelychar);
            likelykey = 0;
            counter++;
            skippedchar++;
            if(i != keylength*26){
                fprintf(file2,"Characters skipped %i starting at character %i\n",keylength-1,skippedchar);
            }
            ascii = 'A';
        }
    } 
    
    fclose(file1);
    fclose(file2);
    printf("\nAnalysis of %s is now stored in %s", filename,newfilename);
    free(newfilename);
    free(newfilenameprefix);
    free(newfilenamepostfix);
    free(newfilenamekeylength);
}

int main(){
    init();
}