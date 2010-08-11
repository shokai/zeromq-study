#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zmq.h>
#include <assert.h>

int main(int argc, char **argv){
  printf("pub start\n");
  int rc;
  void *ctx, *sock;
  zmq_msg_t msg;
  assert(ctx = zmq_init(1));
  assert(sock = zmq_socket(ctx, ZMQ_PUB));
  rc = zmq_bind(sock, "tcp://127.0.0.1:5000");
  assert(rc == 0);

  int count;
  count = 0;
  char m[128];

  for(;;){
    sprintf(m, "count %d", count);
    printf("%s\n", m);
    
    rc = zmq_msg_init(&msg);
    assert(rc == 0);

    zmq_msg_init_size(&msg, strlen(m)+1);
    assert(rc == 0);

    memcpy(zmq_msg_data(&msg), m, strlen(m)+1);
    zmq_send(sock, &msg, 0);
    assert(rc == 0);

    count++;
    sleep(1);
  }
}

