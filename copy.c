#include <stdio.h>
#include <stdlib.h>

#define MAX_BUFFER_SIZE 1024

int main(int argv, char **argc) {
    if(argv!=3){
        printf("wrong input: ./copy x y\n");
    }
    FILE *src, *des;
    char buf[MAX_BUFFER_SIZE];
    size_t bytesRead;
    src = fopen(argc[1], "rb");
    if(!src) {
        perror("Error opening source file");
        exit(1);
    }
    des = fopen(argc[2], "wb");
    
    while((bytesRead = fread(buf, 1, sizeof(buf), src)) > 0) {
        fwrite(buf, 1, bytesRead, des);
    }
    fclose(src);
    fclose(des);
    printf("File copy success.\n");
    
    return 0;
}