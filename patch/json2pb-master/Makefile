CPPFLAGS = -g -fPIC -I. -I/opt/third_party/protobuf/include -I/opt/third_party/jansson/include
LDFLAGS = -L. -L/opt/third_party/protobuf/lib -L/opt/third_party/jansson/lib

all: libjson2pb.so

install:
	sudo cp json2pb.h /opt/third_party/json2pb/include
	sudo cp libjson2pb.so /opt/third_party/json2pb/lib

clean:
	-rm -f *.o *.so *.a libjson2pb.so.* test

json2pb.o: bin2ascii.h

libjson2pb.so: json2pb.o
	$(CC) $(LDFLAGS) -o $@ $^ -Wl,-soname=$@ -Wl,-h -Wl,$@ -shared -L. -lprotobuf -lstdc++ -ljansson

