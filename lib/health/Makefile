CC	     = gcc
AR       = ar
#ifreq ($(DEBUGOPT),1)
CFLAGS   = -MMD -Wall -Wextra -O0  -g
#else
CFLAGS   = -MMD -Wall -Wextra -O2 
#endif

INCLUDE  = -I./include

SRCROOT  = src
SOURCES  = $(wildcard $(SRCROOT)/*.c)
$(warning $(SOURCES))

OBJROOT  = objs
OBJECTS  = $(addprefix $(OBJROOT)/, $(patsubst %.c,%.o,$(SOURCES)))
$(warning $(OBJECTS))

DEPENDS  = $(OBJECTS:.o=.d)

TARGETDIR= lib
TARGET   = $(TARGETDIR)/health.a

$(TARGET): $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

$(OBJROOT)/%.o:%.c
	@if [ ! -e `dirname $@` ]; then mkdir -p `dirname $@`; fi
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<

default: $(OBJECTS) $(TARGET)

clean:
	$(RM) $(OBJECTS) $(TARGET) $(DEPENDS)

-include $(DEPENDS)
