# Mac用Makefile

INCPATH=/usr/local/include
LIBPATH=/usr/local/lib

LIBS=$(LIBPATH)/libzmq.a

all:
	g++ -O pub.cpp -o pub.bin -I$(INCPATH) -L. -L$(LIBPATH) $(LIBS)
	g++ -O sub.cpp -o sub.bin -I$(INCPATH) -L. -L$(LIBPATH) $(LIBS)
