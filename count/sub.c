#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zmq.h>
#include <assert.h>
#define MSG_SIZE 128

int main(int argc, char **argv){
  printf("sub start\n");
  int rc;
  void *ctx, *sock;
  zmq_msg_t msg;
  assert(ctx = zmq_init(1));
  assert(sock = zmq_socket(ctx, ZMQ_SUB));
  rc = zmq_connect(sock, "tcp://127.0.0.1:5000");
  assert(rc == 0);
  char *opt = "count";
  zmq_setsockopt(sock, ZMQ_SUBSCRIBE, opt, strlen(opt));
  assert(rc == 0);
  
  for(;;){
    rc = zmq_msg_init(&msg);
    assert(rc == 0);

    rc = zmq_msg_init_size(&msg, MSG_SIZE);
    assert(rc == 0);

    rc = zmq_recv(sock, &msg, 0);
    assert(rc == 0);

    char *data = (char *)zmq_msg_data(&msg);
    printf("%s\n", data);
  }
}

