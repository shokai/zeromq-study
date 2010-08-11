# Mac用Makefile

INCPATH=/usr/local/include
LIBPATH=/usr/local/lib

LIBS=$(LIBPATH)/libzmq.a

all:
	gcc -O pub.c -o pub_c.bin -I$(INCPATH) -L. -L$(LIBPATH) $(LIBPATH)/libzmq.dylib
	g++ -O pub.cpp -o pub.bin -I$(INCPATH) -L. -L$(LIBPATH) $(LIBS)
	g++ -O sub.cpp -o sub.bin -I$(INCPATH) -L. -L$(LIBPATH) $(LIBS)
