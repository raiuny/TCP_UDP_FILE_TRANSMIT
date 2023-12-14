#include "config.h"

typedef struct {
    int seqnum;
    int seqlen;
    char data[MAX_LINE];
} Package;
void printPkg(const Package x) {
    printf("%d:%s\n", x.seqnum, x.data);
}
int main(int argc, char **argv) 
{
    int sockfd;
    struct sockaddr_in servaddr, local;
    Package pkg;
    memset(pkg.data, 0, sizeof(pkg.data));
    if(argc != 3)
    {
        perror("usage:tcpcli <IPaddress> <Port>");
        exit(1);
    }
    if((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) == -1) 
    {
        perror("socket error");
        exit(1);
    }
    // 设置客户端地址结构（UDP）
    local.sin_family = AF_INET;
    local.sin_addr.s_addr = htonl(INADDR_ANY);
    local.sin_port = htons(0);
    // 与socket绑定
    if(bind(sockfd, (struct sockaddr*)&local, sizeof(local)) < 0) {
        perror("bind error");
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
    char *p = strrchr(src_fpath, '/');
    pkg.seqnum = 0;
    if(!p) {
        strcpy(pkg.data, src_fpath);
        pkg.seqlen = strlen(src_fpath);
        // printPkg(pkg);
        ssize_t n  = sendto(sockfd, &pkg, sizeof(pkg), 0, (struct sockaddr*)&servaddr, sizeof(servaddr));
    }
    else {
        strcpy(pkg.data, p+1);
        pkg.seqlen = strlen(p+1);
        pkg.data[strlen(pkg.data)]='\0';
        sendto(sockfd, &pkg, sizeof(pkg), 0, (struct sockaddr*)&servaddr, sizeof(servaddr));
    }
    size_t bytesRead;
    Package recvpkg;
    ssize_t rc = recvfrom(sockfd, &recvpkg, sizeof(recvpkg), 0, NULL, NULL);
    if (rc < 0) {
        perror("recv error");
        close(sockfd);
        exit(1);
    }

    while((bytesRead = fread(pkg.data, 1, sizeof(pkg.data), src)) > 0) {
        pkg.seqnum ++;
        pkg.seqlen = bytesRead;
        // printPkg(pkg);
        // fflush(stdout);
        sendto(sockfd, &pkg, sizeof(pkg), 0, (struct sockaddr*)&servaddr, sizeof(servaddr));
        if(recvfrom(sockfd, &recvpkg, sizeof(recvpkg), 0, NULL, NULL) < 0) {
            perror("recv error");
            exit(1);
        }
    }
    // 发送结尾包，表明文件发送结束
    Package ending;
    ending.seqnum = -1;
    sendto(sockfd, &ending, sizeof(ending), 0, (struct sockaddr*)&servaddr, sizeof(servaddr));
    if(recvfrom(sockfd, &recvpkg, sizeof(recvpkg), 0, NULL, NULL) < 0) {
        perror("recv error");
        exit(1);
    }
    printf("发送成功\n");
    fclose(src);
    close(sockfd);
    return 0;
}
