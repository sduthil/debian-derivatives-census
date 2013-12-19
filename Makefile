# Copyright 2011 Paul Wise
# Released under the MIT/Expat license, see doc/COPYING

export PATH:=$(CURDIR)/bin:$(PATH)
export CURLRC=$(CURDIR)/etc/curl.conf
export APT_CONFIG=$(CURDIR)/etc/apt.conf

.PHONY: var clean

all: var

clean:
	$(MAKE) -C var clean
	rmdir var

var:
	mkdir --parents $@
	ln -sf ../Makefile.var $@/Makefile
	$(MAKE) -C $@
