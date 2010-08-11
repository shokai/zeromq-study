# Mac用Makefile
SRC = pub.cpp
DST = pub.bin

INCPATH=/usr/local/include
LIBPATH=/usr/local/lib

LIBS=$(LIBPATH)/libzmq.a

all:
	g++ -O $(SRC) -o $(DST) -I$(INCPATH) -L. -L$(LIBPATH) $(LIBS)
