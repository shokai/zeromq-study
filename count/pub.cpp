#include <stdio.h>
#include <iostream>
#include <string>
#include <zmq.hpp>
#include <boost/format.hpp>
using namespace std;
using namespace boost;

int main(int argc, char **argv){
  cout << "pub start" << endl;
  zmq::context_t ctx(1);
  zmq::socket_t sock(ctx, ZMQ_PUB);
  sock.bind("tcp://127.0.0.1:5000");
  int count = 0;
  for(;;){
    try{
      string m = str(format("count %d") % count);
      cout << m << endl;
      zmq::message_t msg(m.size()+1);
      memcpy(msg.data(), m.c_str(), m.size()+1);
      sock.send(msg);
      count++;
      sleep(1);
    }
    catch (std::exception &e) {
      cerr << e.what() << endl;
    }
  }
}
