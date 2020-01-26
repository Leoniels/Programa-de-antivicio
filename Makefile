# pranvi - time lock puzzle cryptosystem
# See COPYING file for copyright and license details.
#TODO: Manual, distribution, install and uninstall

include config.mk

SRC = etlp.c dtlp.c
OBJ = $(SRC:.c=o)

all: options stlp

# Show compile options set
options:
	@echo stlp build options:
	@echo "CFLAGS  = $(CFLAGS)"
	@echo "LDFLAGS = $(LDFLAGS)"
	@echo "CC      = $(CC)"

# Compilation
.c.o:
	$(CC) -c $(CFLAGS) $<

# Configuration
#$(SRCD)/config.h:
#	cp $(SRCD)/config.def.h $@

# Project integrity check
#$(OBJ): config.h config.mk

# Linkage
etlp: etlp.o
	$(CC) -o $@ etlp.o $(LDFLAGS)

dtlp: dtlp.o
	$(CC) -o $@ dtlp.o $(LDFLAGS)

stlp: etlp dtlp

clean:
	rm -rf etlp etlp.o dtlp dtlp.o

.PHONY: all options clean
