export PATH+=:$(CURDIR)/bin
export WGETRC=$(CURDIR)/etc/wget.conf

.PHONY: var var/all all clean

all: var var/derivatives var/template.txt var/all

clean:
	rm -rf var

var:
	mkdir --parents $@

var/census.html:
	get-wiki-html Census $@

var/derivatives: var/census.html
	wiki-html-to-derivatives-list $^ $@

var/template.txt:
	get-wiki-text CensusTemplate $@

var/all: var/derivatives
	ls -l $^
	for d in $$( cat $^ ); do \
		mkdir --parents "$(dir $@)$$d" ; \
		$(MAKE) -C "$(dir $@)$$d" -f $(CURDIR)/Makefile.deriv all ; \
	done
