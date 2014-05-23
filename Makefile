ARCH=arm
PROJ_NAME=grabberCV
CROSS_COMPILE=arm-linux-gnueabihf-
CC=$(CROSS_COMPILE)gcc

CFLAGS +=`pkg-config --cflags opencv` -lm
LDFLAGS+=`pkg-config --libs opencv libv4l2`

PROG=framegrabber
OBJS=$(PROG).o

.PHONY: all clean

$(PROG): $(OBJS)
	$(CC) -o $(PROG) $(OBJS) $(LDFLAGS)

%.o: %.cpp
	$(CC) -c $(CFLAGS) $<

all: $(PROG)

clean:
	rm -f $(OBJS) $(PROG)


