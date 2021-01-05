CC=gcc
IDIR=./include
SDIR=./src
ODIR=./build
CFLAGS=-I. -I$(IDIR) -I\usr\include

DEP=$(wildcard $(IDIR)/*.h)
SRC=$(wildcard $(SDIR)/*.c)
OBJ = $(patsubst %.c, %.o, $(patsubst $(SDIR)/%, $(ODIR)/%, $(SRC)))


#make objects
all: $(OBJ)
	$(CC) -pthread $(OBJ) -o $(ODIR)/main.exe

$(ODIR)/%.o: $(SDIR)/%.c $(DEP) $(ODIR)
	$(CC) -c $< -o $@ $(CFLAGS)

$(ODIR):
	$(shell mkdir -p $(ODIR))

clean:
	rm -rf $(ODIR)
