# Makefile for f2022, ecs36b
#
# g++ -std=c++14 test_GPS.cpp GPS.cpp -o test_GPS
#
# example: $ ./test_GPS 48.88 2.3

CC = g++ -std=c++14

# CFLAGS = -g -I/usr/include/jsoncpp
CFLAGS = -I/usr/local/Cellar/jsoncpp/1.9.5/include


# CFLAGS = -g -D_ECS36BHW7 -I/usr/include/jsoncpp
# CFLAGS = -g -DNOT_RIGHT_NOW -I/usr/include/jsoncpp

# CFLAGS = -g -D_ECS36BDEBUG -I/usr/include/jsoncpp
# CFLAGS = -g -Wall -Wstrict-prototypes
# CFLAGS = -O3

LDFLAGS = -L/usr/local/Cellar/jsoncpp/1.9.5/lib -ljsoncpp

INC    =    ecs36b_Common.h

# old: LDFLAGS =     -lc++ -ljsoncpp

#LDFLAGS =     -ljsoncpp -lmicrohttpd -ljsonrpccpp-common -ljsonrpccpp-server -lcurl -ljsonrpccpp-client

# rules.
output:        GPS_DD.o main.o Thing.o Person.o JvTime.o Record.o
	g++ -std=c++14 main.o GPS_DD.o Thing.o Record.o Person.o JvTime.o -o output $(LDFLAGS)

#
#

GPS_DD.o:        GPS_DD.cpp GPS_DD.h $(INC)
	$(CC) -c $(CFLAGS) GPS_DD.cpp

JvTime.o:    JvTime.cpp JvTime.h $(INC)
	$(CC) -c $(CFLAGS) JvTime.cpp

Person.o:    Person.cpp Person.h $(INC)
	$(CC) -c $(CFLAGS) Person.cpp

Thing.o:    Thing.cpp Thing.h $(INC)
	$(CC) -c $(CFLAGS) Thing.cpp
Record.o:    Record.cpp Record.h $(INC)
	$(CC) -c $(CFLAGS) Record.cpp


main.o:    main.cpp GPS_DD.h Thing.h Record.h Person.h JvTime.h $(INC)
	$(CC) -c $(CFLAGS) main.cpp



clean:
	rm -f .o~ core main