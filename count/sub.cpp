#include <stdio.h>
#include <iostream>
#include <string>
#include <zmq.hpp>
#include <boost/format.hpp>
using namespace std;
using namespace boost;
#define MSG_SIZE 128

int main(int argc, char **argv){
  cout << "sub start" << endl;
  zmq::context_t ctx(1);
  zmq::socket_t sock(ctx, ZMQ_SUB);
  sock.connect("tcp://127.0.0.1:5000");
  string opt = string("count");
  sock.setsockopt(ZMQ_SUBSCRIBE, opt.c_str(), opt.size());
  zmq::message_t msg(MSG_SIZE);

  for(;;){
    try{
      sock.recv(&msg);
      string data = string((char *)msg.data());
      cout << data << endl;
    }
    catch (std::exception &e) {
      cerr << e.what() << endl;
    }
  }
}
