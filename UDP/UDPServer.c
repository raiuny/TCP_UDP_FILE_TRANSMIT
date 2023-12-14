#include "config.h"

typedef struct {
    int seqnum;
    int seqlen;
    char data[MAX_LINE];
} Package;
int main(int argc, char **argv) 
{
    struct sockaddr_in servaddr, cliaddr;

    int sockfd;
    ssize_t n;
    socklen_t clilen;

    if((sockfd = socket(AF_INET,SOCK_DGRAM,0)) < 0)
    {
        perror("socket error");
        exit(1);
    }
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(PORT);
 
    if(bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0)
    {
        perror("bind error");
        close(sockfd);
        exit(1);
    }
    // UDP不需要监听
    // 接受客户端请求
    Package pkg;
    memset(&pkg, 0, sizeof(pkg));
    FILE* des;
    while(1)
    {
        clilen = sizeof(cliaddr);
        // 接收文件名
        if((n = recvfrom(sockfd, &pkg, sizeof(pkg), 0, (struct sockaddr*)&cliaddr, &clilen)) > 0)
        {
            if(pkg.seqnum == 0) {
            char *cip = inet_ntoa(cliaddr.sin_addr);
            printf("正在接受来自%s的文件...\n", cip);
            char server_filename[100] = "ubuntu-";
            strcat(server_filename, pkg.data);
            des = fopen(server_filename, "wb");
            }
            if(pkg.seqnum > 0) {
                fwrite(pkg.data, 1, pkg.seqlen, des);
            }
            if(pkg.seqnum < 0) { // 发送结束
                fclose(des);
                printf("接收成功\n");
            }
            // printf("No.%d: ", pkg.seqnum);
            // printf("%s\n", pkg.data);
            // fflush(stdout);
            sendto(sockfd, &pkg, sizeof(pkg), 0, (struct sockaddr*)&cliaddr, clilen);
        }
        else {
            perror("recvfrom error");
            exit(1);
        }
    }
    
}