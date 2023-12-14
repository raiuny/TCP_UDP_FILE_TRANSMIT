#include "config.h"

int main(int arc, char **argv) 
{
    struct sockaddr_in servaddr, cliaddr;

    int listenfd, connfd;
    pid_t childpid;

    char buf[MAX_LINE];
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
        if((childpid = fork()) == 0) {
            close(listenfd); // 关闭监听socket
            ssize_t n;
            char buff[MAX_LINE];
            while((n = read(connfd, buff, MAX_LINE)) > 0)
            {
                write(connfd, buff, n);
            }
            close(connfd);
            _exit(0);
        }
        close(connfd); // 在父进程中关闭已连接socket
    }

    close(listenfd);
}