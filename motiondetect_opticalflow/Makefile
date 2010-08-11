SRC = motiondetect_pub.cpp
DST = motiondetect_pub.bin

CV_INCPATH=/opt/local/include/opencv
CV_LIBS= -lcv -lcvaux -lcxcore -lhighgui 

INCPATH=/usr/local/include
LIBPATH=/usr/local/lib
ZMQ_LIB=$(LIBPATH)/libzmq.a

all:
	g++ -O $(SRC) -o $(DST) -I$(CV_INCPATH) $(CV_LIBS) -I$(INCPATH) $(ZMQ_LIB)
