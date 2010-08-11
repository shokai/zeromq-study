#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zmq.h>

int main(int argc, char **argv){
  printf("pub start\n");
  void *ctx, *sock;
  zmq_msg_t msg;
  ctx = zmq_init(1);
  sock = zmq_socket (ctx, ZMQ_PUB);
  zmq_bind(sock, "tcp://127.0.0.1:5000");

  int count;
  count = 0;
  char m[128];

  for(;;){
    sprintf(m, "count %d", count);
    printf("%s\n", m);
    
    zmq_msg_init(&msg);
    zmq_msg_init_size(&msg, strlen(m)+1);
    memcpy(zmq_msg_data(&msg), m, strlen(m)+1);
    zmq_send (sock, &msg, 0);
    count++;
    sleep(1);
  }
}

