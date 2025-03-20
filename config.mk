# st version
VERSION = 0.3

# Customize below to fit your system

# paths
CROSS_COMPILE ?= /usr/bin/aarch64-linux-gnu-
# CROSS_COMPILE ?= /usr/bin/
CC = ${CROSS_COMPILE}gcc
SYSROOT ?= $(shell ${CC} --print-sysroot)

# includes and libs
#INCS = -I. -I${SYSROOT}/usr/include/SDL -I./sdl12-compat/build -D_GNU_SOURCE=1 -D_REENTRANT
#LIBS = -lc -L${SYSROOT}/usr/lib -lSDL -lSDL-1.2 -lpthread -Wl,-Bstatic,-lutil,-Bdynamic

INCS = -I. -I${SYSROOT}/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT
LIBS = -lc -L${SYSROOT}/usr/lib -lSDL -lpthread -Wl,-Bstatic,-lutil,-Bdynamic

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\"
CFLAGS = -O1 -march=armv8-a -mtune=cortex-a55
# CFLAGS = -Os 
CFLAGS += ${INCS} ${CPPFLAGS} -std=gnu11
CFLAGS += -fPIC -ffunction-sections -fdata-sections -Wall
LDFLAGS = ${LIBS} -Wl,--gc-sections -s
