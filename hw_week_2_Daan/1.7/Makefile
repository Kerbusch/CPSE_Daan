#############################################################################
#
# Project Makefile
#
# (c) Wouter van Ooijen (www.voti.nl) 2016
#
# This file is in the public domain.
# 
#############################################################################

# source & header files in this project (main.cpp is automatically assumed)

HEADERS += note.hpp
HEADERS += melody.hpp
HEADERS += note_player.hpp
HEADERS += fur_elise.hpp

HEADERS += note_player_gpio.hpp
SOURCES += note_player_gpio.cpp

HEADERS += rtttl_player.hpp
SOURCES += rtttl_player.cpp

SOURCES += melody.cpp

# other places to look for files for this project
SEARCH  := 

# set REATIVE to the next higher directory 
# and defer to the Makefile.due there
RELATIVE := $(RELATIVE)../
include $(RELATIVE)Makefile.due

g++ := g++ -std=c++17
ln := g++ -std=c++17
#rm := rm -f

melody.cpp: generator.exe
	$ ./generator.exe

CLEAN += generator.exe generator.o rtttl_player2.o melody.cpp rtttl_player.o

generator.exe: generator.o rtttl_player2.o
	$(g++) generator.o rtttl_player2.o -o generator.exe

generator.o: generator.cpp note_player.hpp rtttl_player.hpp fur_elise.hpp
	$(g++) -c generator.cpp -o generator.o

rtttl_player2.o: rtttl_player.cpp rtttl_player.hpp
	$(g++) -c rtttl_player.cpp -o rtttl_player2.o