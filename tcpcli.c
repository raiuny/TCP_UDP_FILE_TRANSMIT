#include "config.h"

int main(int argc, char **argv) 
{
    int sockfd;
    struct sockaddr_in servaddr;
    char buf[MAX_LINE];
    if(argc != 3)
    {
        perror("usage:tcpcli <IPaddress> <Port>");
        exit(1);
    }
    if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) 
    {
        perror("socket error");
        exit(1);
    }

    // 设置链接服务器地址结构
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(atoi(argv[2]));
    if(inet_pton(AF_INET, argv[1], &servaddr.sin_addr) < 0) 
    {
        printf("inet_pton error for %s\n", argv[1]);
        exit(1);
    }
    if(connect(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0)
    {
        perror("connect error");
        exit(1);
    }
    // 消息处理
    char src_fpath[MAX_LINE];
    printf("connect success! Please input your file path: ");
    scanf("%s", src_fpath);
    FILE* src;
    src = fopen(src_fpath, "rb");
    if(!src) {
        perror("Error opening source file!");
        exit(1);
    }
    char *sip = inet_ntoa(servaddr.sin_addr);
    int server_port = ntohs(servaddr.sin_port);
    printf("正在传输文件%s -> %s:%d ....\n",src_fpath,sip,server_port);
    
    // 传输文件名称
    char recvline[MAX_LINE];
    write(sockfd, src_fpath, strlen(src_fpath));
    char *end = "\0";
    write(sockfd,end, strlen(end));
    size_t bytesRead;
    ssize_t rc = read(sockfd, recvline, MAX_LINE);
    if (rc < 0) {
        perror("recv error");
        exit(1);
    }
    while((bytesRead = fread(buf, 1, sizeof(buf), src)) > 0) {
        printf("%ld", bytesRead);
        // fflush()
        write(sockfd, buf, bytesRead);
        if(read(sockfd, recvline, MAX_LINE) < 0) {
            perror("recv error");
            exit(1);
        }
    }
    printf("%s接收成功\n", recvline);
    fclose(src);
    close(sockfd);
    return 0;
}
