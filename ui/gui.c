#include <stdio.h>

#include <system_server.h>
#include <gui.h>
#include <input.h>
#include <web_server.h>

int create_gui()
{
    pid_t systemPid;

    printf("여기서 GUI 프로세스를 생성합니다.\n");

    sleep(3);
    if( (systemPid = fork()) < 0) {
        perror("Error::In int create_gui: failed to fork");
        exit(-1);
    }
    if (systemPid == 0) {
        (execl("/usr/bin/google-chrome-stable", "google-chrome-stable", "http://localhost:8282", NULL));
    }

    return 0;
}
