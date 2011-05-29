export PATH+=:$(CURDIR)/bin
export WGETRC=$(CURDIR)/etc/wget.conf

.PHONY: var

all: var

clean:
	$(MAKE) -C var clean
	rmdir var

var:
	mkdir --parents $@
	ln -sf ../Makefile.var $@/Makefile
	$(MAKE) -C $@
