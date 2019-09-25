/* 
 * File:   Access Control.c
 * Author: Casey Dixon
 *
 * Created on June 14, 2019, 4:40 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *openfile(char* filename, char* mode){
    FILE *file;
    file = fopen(filename, mode);
    if(file == NULL){
        printf("Failed to find database file.\n");
    }
    return file;
}

void init(){
    char *status = NULL;
    char *username = malloc(100), *password = malloc(100);
    int choice = 0, auth = 0;
    FILE *file;
    file = openfile("Users.txt","r");
    if(file == NULL){
        printf("This is the first time you have used the system please select the admin username:");
        scanf("%s",username);
        printf("Please select admin password:");
        scanf("%s",password);
        intial_create("Users.txt");
        intial_insert("Users.txt",username,password);
        intial_create("Permissions.txt");
        intial_insert("Permissions.txt",username,"111111111111");
    }
    fclose(file);
    while(auth != 1){
        printf("Please enter username:");
        scanf("%s",username);
        printf("Please enter password:");
        scanf("%s",password);
        auth = authenticate(username,password);
        if(auth == 0){
            printf("\nSorry either the username or password is wrong please try again.\n");
        }
        if(auth == 1){
            printf("Authentication successful\n");
        }
    }
    while(status != "exit"){
        while(choice!=1&&choice!=2&&choice!=3&&choice!=4&&choice!=5&&choice!=6
                &&choice!=7&&choice!=8&&choice!=9&&choice!=10&&choice!=11&&choice!=12&&choice!=13){
            printf("Would you like to:\n");
            printf("(1)Create a table\n");
            printf("(2)Drop a table\n");
            printf("(3)Select from a table\n");
            printf("(4)Insert a row into a table\n");
            printf("(5)Delete a row from a table\n");
            printf("(6)Commit a backup of the database\n");
            printf("(7)Rollback a databast\n");
            printf("(8)Grant privileges\n");
            printf("(9)Revoke privileges\n");
            printf("(10)Transfer privileges\n");
            printf("(11)Create a user\n");
            printf("(12)Delete a user\n");
            printf("(13)Exit\n");
            scanf("%d", &choice);
        }
        if(choice == 13){
            status = "exit";
        }
        if(choice == 1){
            char *dbname = malloc(100);
            printf("What table would you like to create?:");
            scanf("%s",dbname);
            create(username,dbname);
            printf("Creating database %s.\n", dbname);
            free(dbname);
            choice = 0;
        }
        if(choice == 2){
            char *dbname = malloc(100);
            printf("What table would you like to drop?:");
            scanf("%s",dbname);
            drop(username,dbname);
            printf("Dropping %s from database.\n",dbname);
            free(dbname);
            choice = 0;
        }
        if(choice == 3){
            char *dbname = malloc(100);
            char *query = malloc(100);
            printf("What table do you want to query?:");
            scanf("%s",dbname);
            printf("What value are you looking for?:");
            scanf("%s",query);
            select(username,dbname,query);
            free(dbname);
            free(query);
            choice = 0;
        }
        if(choice == 4){
            char *dbname = malloc(100);
            char *value1 = malloc(100);
            char *value2 = malloc(100);
            printf("What database do you want to add data too?:");
            scanf("%s",dbname);
            printf("What is the first value to enter?:");
            scanf("%s",value1);
            printf("What is the second value to enter?:");
            scanf("%s",value2);
            insert(username,dbname,value1,value2);
            printf("Inserting %s,%s into %s\n",value1,value2,dbname);
            free(dbname);
            free(value1);
            free(value2);
            choice = 0;
        }
        if(choice == 5){
            char *dbname = malloc(100);
            int row;
            printf("What database are you removing data from?:");
            scanf("%s",dbname);
            printf("What row are you removing?:");
            scanf("%d", &row);
            delete(username,dbname,row);
            printf("Removing row %d from %s\n",row,dbname);
            free(dbname);
            choice = 0;
        }
        if(choice == 6){
            char *dbname = malloc(100);
            printf("What database do you want to backup?:");
            scanf("%s",dbname);
            commit(username,dbname);
            printf("Creating backup of %s\n",dbname);
            free(dbname);
            choice = 0;
        }
        if(choice == 7){
            char *dbname = malloc(100);
            char *backup = malloc(100);
            printf("What database are you rolling back?:");
            scanf("%s",dbname);
            printf("What is the name of the backup file?:");
            scanf("%s",backup);
            rollback(username,dbname,backup);
            printf("Rolling back %s with %s\n",dbname,backup);
            free(dbname);
            free(backup);
            choice = 0;
        }
        if(choice == 8){
            char *user = malloc(100);
            int level = 1;
            printf("What user would you like to elevate permissions for?:");
            scanf("%s",user);
            printf("What level of security are they being elevated too?:\n");
            printf("(1)Basic user\n");
            printf("(2)Security Officer\n");
            printf("(3)Local admin\n");
            scanf("%d", &level);
            grant(username, user, level);
            printf("Promoting %s to level %d\n",user,level);
            free(user);
            choice = 0;
        }
        if(choice == 9){
            char *user = malloc(100);
            printf("What user would you like to remove privileges for?:");
            scanf("%s",user);
            revoke(username,user);
            printf("Removing access for %s\n",user);
            free(user);
            choice = 0;
        }
        if(choice == 10){
            char *user = malloc(100);
            printf("What user would you like to transfer privileges to?:");
            scanf("%s",user);
            transfer(username,user);
            printf("Transferring access to %s\n",user);
            free(user);
            choice = 0;
        }
        if(choice == 11){
            char *user = malloc(100);
            char *password = malloc(100);
            printf("What is the new username?:");
            scanf("%s",user);
            printf("What is their temporary password?:");
            scanf("%s",password);
            createuser(username,user,password,"001110000000");
            printf("Creating new user\n");
            free(user);
            free(password);
            choice = 0;
        }
        if(choice == 12){
            char *user = malloc(100);
            printf("What user do you wish to delete?:");
            scanf("%s",user);
            deleteuser(username,user);
            printf("Deleting %s from user list\n",user);
            free(user);
            choice = 0;
        }
    }
}

void intial_create(char* dbname){
    FILE *file;
    file = openfile(dbname, "w");
    if(file == NULL){
        return;
    }
    fclose(file);
}

void intial_insert(char* dbname, char* value1, char* value2){
    FILE *file;
    file = openfile(dbname, "a");
    if(file == NULL){
        return;
    }
    fprintf(file,"%s,%s\n",value1,value2);
    fclose(file);
}

void create(char* activeuser, char* dbname){
    if(permissions(activeuser,0) == 0){
        return;
    }
    FILE *file;
    file = openfile(dbname, "w");
    if(file == NULL){
        return;
    }
    fclose(file);
}

void drop(char* activeuser, char* dbname){
    if(permissions(activeuser,1) == 0){
        return;
    }
    remove(dbname);
}

void select(char* activeuser, char* dbname, char* search){
    if(permissions(activeuser,2) == 0){
        return;
    }
    FILE *file;
    char ch; 
    char tmp[4095+1];
    int counter = 0;
    file = openfile(dbname, "r");
    if(file == NULL){
        return;
    }
    while(fgets(tmp, sizeof tmp, file)){
        if(strstr(tmp, search)){
            printf("%s",tmp);
        }
    }
    fclose(file);
}

void insert(char* activeuser, char* dbname, char* value1, char* value2){
    if(permissions(activeuser,3) == 0){
        return;
    }
    FILE *file;
    file = openfile(dbname, "a");
    if(file == NULL){
        return;
    }
    fprintf(file,"%s,%s\n",value1,value2);
    fclose(file);
}

void delete(char* activeuser, char* dbname, int entry){
    if(permissions(activeuser,4) == 0){
        return;
    }
    FILE *file1,*file2;
    char ch; 
    char tmp[4095+1];
    int counter = 0;
    
    file1 = openfile(dbname, "r");
    if(file1 == NULL){
        return;
    }
    file2 = openfile("holder.txt", "w");
    if(file2 == NULL){
        return;
    }
    
    ch = fgetc(file1);
    while(!(feof(file1))){
        if(ch == 10){
            counter++;
        }
        if(counter != entry-1){
            fprintf(file2,"%c",ch);
        }
        ch = fgetc(file1);
    }
    fclose(file1);
    fclose(file2);
    drop(activeuser,dbname);
    rename("holder.txt", dbname);
}

void commit(char* activeuser, char* dbname){
    if(permissions(activeuser,5) == 0){
        return;
    }
    FILE *file1, *file2;
    char* backup = malloc(100);
    char ch;
    file1 = openfile(dbname, "r");
    if(file1 == NULL){
        return;
    }
    strcpy(backup,dbname);
    backup = strcat(backup,"_backup.txt");
    file2 = openfile(backup,"w");
    if(file2 == NULL){
        return;
    }
    ch = fgetc(file1);
    while(!(feof(file1))){
        fprintf(file2,"%c",ch);
        ch = fgetc(file1);
    }
    fclose(file1);
    fclose(file2);
}

void rollback(char* activeuser, char* dbname, char* backup){
    if(permissions(activeuser,6) == 0){
        return;
    }
    FILE *file1, *file2;
    char ch;
    file1 = openfile(dbname, "w");
    if(file1 == NULL){
        return;
    }
    file2 = openfile(backup, "r");
    if(file2 == NULL){
        return;
    }
    ch = fgetc(file2);
    while(!(feof(file2))){
        fprintf(file1,"%c",ch);
        ch = fgetc(file2);
    }
    fclose(file1);
    fclose(file2);
}

void grant(char* activeuser, char* username, int levelofsec){
    if(permissions(activeuser,7) == 0){
        return;
    }
    if(levelofsec == 1){
        revoke(username);
        insert(activeuser,"Permissions.txt",username,"001110000000");
    }
    else if(levelofsec == 2){
        revoke(username);
        insert(activeuser,"Permissions.txt",username,"000001111111");
    }
    else if(levelofsec == 3){
        revoke(username);
        insert(activeuser,"Permissions.txt",username,"111111111111");
    }
}

void revoke(char* activeuser, char* username){
    if(permissions(activeuser,8) == 0){
        return;
    }
    FILE *file;
    char tmp[4095+1];
    int counter = 0;
    file = openfile("Permissions.txt", "r");
    if(file == NULL){
        return;
    }
    while(fgets(tmp, sizeof tmp, file)){
        counter++;
        if(strstr(tmp, username)){    
            fclose(file);
            delete(activeuser,"Permissions.txt",counter);
            break;
        }
    }
    fclose(file);
}

void transfer(char* activeuser, char* user){
    if(permissions(activeuser,9) == 0){
        return;
    }
    FILE *file;
    char ch; 
    char tmp[4095+1];
    char permission[4095+1];
    int counter = 0;
    file = openfile("Permissions.txt", "r");
    if(file == NULL){
        return;
    }
    while(fgets(tmp, sizeof tmp, file)){
        if(strstr(tmp, activeuser)){
            strcpy(permission,tmp);
        }
    }
    while(counter < strlen(activeuser)){
        counter++;
        if(user[counter] == ','){
            counter++;
            strcpy(permission,(user+counter));
        }
    }
    deleteuser(activeuser,user);
    insert(activeuser,"Permissions.txt",user,permission);
    fclose(file);
    
}

void createuser(char* activeuser, char* username, char* password, char* permissionstring){
    if(permissions(activeuser,10) == 0){
        return;
    }
    insert(activeuser,"Users.txt", username, password);
    insert(activeuser,"Permissions.txt",username, permissionstring);
}

void deleteuser(char* activeuser, char* username){
    if(permissions(activeuser,11) == 0){
        return;
    }
    FILE *file;
    char tmp[4095+1];
    int counter = 0;
    file = openfile("Users.txt", "r");
    if(file == NULL){
        return;
    }
    while(fgets(tmp, sizeof tmp, file)){
        counter++;
        if(strstr(tmp, username)){    
            fclose(file);
            delete(activeuser,"Users.txt",counter);
            break;
        }
    }
    revoke(activeuser,username);
    fclose(file);
}

int authenticate(char* username, char* password){
    FILE *file;
    char tmp[4095+1];
    file = openfile("Users.txt", "r");
    if(file == NULL){
        return;
    }
    char* logindetails[(sizeof(strlen(username)) + sizeof(strlen(password)) + 1)];
    strcpy(logindetails,username);
    strcat(logindetails,",");
    strcat(logindetails,password);
    while(fgets(tmp, sizeof tmp, file)){
        if(strstr(tmp, logindetails)){
            return 1;
        }
    }
    return 0;
}

int permissions(char* username, int permissionbit){
    FILE *file;
    char tmp[4095+1],user[4095+1],permission[4095+1];
    int counter = 0;
    file = openfile("Permissions.txt","r");
    if(file == NULL){
        return;
    }
    
    while(fgets(tmp, sizeof tmp, file)){
        if(strstr(tmp, username)){
            strcpy(user,tmp);
        }
    }
    
    while(counter < strlen(user)){
        counter++;
        if(user[counter] == ','){
            counter++;
            strcpy(permission,(user+counter));
        }
    }
    
    if(permission[permissionbit] == '1'){
        fclose(file);
        return 1;
    }
    else{
        printf("Access denied you do not have permission to use this function.\n");
        fclose(file);
        return 0;
    }
}

int main(int argc, char** argv){
    init();
    return (EXIT_SUCCESS);
}