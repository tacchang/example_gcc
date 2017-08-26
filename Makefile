SRCROOT  = src
SOURCES  = $(wildcard $(SRCROOT)/*.c) $(wildcard $(SRCROOT)/app/*.c)
$(warning $(SOURCES))

OBJROOT  = objs
OBJECTS  = $(addprefix $(OBJROOT)/, $(patsubst %.c,%.o,$(SOURCES)))
$(warning $(OBJECTS))

DEPENDS  = $(OBJECTS:.o=.d)

LIBROOT  = lib

LHEALTHROOT = $(LIBROOT)/health
LHEALTH     = $(LHEALTHROOT)/lib/health.a

LIBS     = $(LHEALTH)
$(warning $(LIBS))
LIBDIRS := $(LHEALTHROOT)

CC	     = gcc
AR       = ar
#ifreq ($(DEBUGOPT),1)
CFLAGS   = -MMD -Wall -Wextra -O0  -g
#else
CFLAGS   = -MMD -Wall -Wextra -O2 
#endif

INCLUDE  = -I$(LHEALTHROOT)/include

TARGETDIR= bin
TARGET   = $(TARGETDIR)/example

$(TARGET): $(OBJECTS) $(LIBS)
	$(CC) $(CFLAGS) -o $@ $+

.PHONY: all clean $(LIBDIRS)

all: $(LIBDIRS) $(TARGET)

$(LIBDIRS):
	$(MAKE) -C $@

clean:
	$(MAKE) -C $(LHEALTHROOT) clean
	$(RM) $(OBJECTS) $(TARGET) $(DEPENDS)

$(OBJROOT)/%.o:%.c
	@if [ ! -e `dirname $@` ]; then mkdir -p `dirname $@`; fi
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<

-include $(DEPENDS)
