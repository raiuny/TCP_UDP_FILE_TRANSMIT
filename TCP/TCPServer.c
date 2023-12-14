#include "config.h"

int main(int argc, char **argv) 
{
    struct sockaddr_in servaddr, cliaddr;

    int listenfd, connfd;
    pid_t childpid;

    socklen_t clilen;

    if((listenfd = socket(AF_INET,SOCK_STREAM,0)) < 0)
    {
        perror("socket error");
        exit(1);
    }
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(PORT);
 
    if(bind(listenfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0)
    {
        perror("bind error");
        exit(1);
    }

    // 监听客户端请求
    if(listen(listenfd, LISTENQ) < 0)
    {
        perror("listen error");
        exit(1);
    }

    // 接受客户端请求
    while(1)
    {
        clilen = sizeof(cliaddr);
        if((connfd = accept(listenfd, (struct sockaddr*)&cliaddr, &clilen)) < 0)
        {
            perror("accept error");
            exit(1);
        }
        char *cip = inet_ntoa(cliaddr.sin_addr);
        if((childpid = fork()) == 0) {
            printf("正在接受来自%s的文件...\n", cip);
            // fflush(stdout);
            close(listenfd); // 关闭监听socket
            ssize_t n;
            char buff[MAX_LINE];
            memset(buff, 0, sizeof(buff));

            // 接收文件头
            char filename[100];
            if((n = read(connfd, buff, MAX_LINE)) > 0) {
                write(connfd, buff, n);
            }
            
            if(!strlen(buff)) {
                close(connfd);
                _exit(0);
            }
            char server_filename[100] = "ubuntu-";
            strcat(server_filename, buff);
            // 生成一个文件
            FILE *des = fopen(server_filename, "wb"); //清空
            // 接受整个文件
            while((n = read(connfd, buff, MAX_LINE)) > 0)
            {
                write(connfd, buff, n);
                fwrite(buff, 1, n, des);
            }
            fclose(des);
            printf("接收完成.\n");
            fflush(stdout);
            close(connfd);
            _exit(0);
        }
        close(connfd); // 在父进程中关闭已连接socket
    }

    close(listenfd);
}