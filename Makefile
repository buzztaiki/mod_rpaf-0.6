# Makefile for mod_rpaf.c (gmake)
APXS=$(shell which apxs || which apxs2) 
PKG_NAME=mod_rpaf-2.0

default: rpaf

rpaf: mod_rpaf-2.0.la

mod_rpaf-2.0.la: mod_rpaf-2.0.c
	$(APXS) -c -n $@ mod_rpaf-2.0.c

mod_rpaf-2.0.c:

install: mod_rpaf-2.0.la
	$(APXS) -A -i mod_rpaf-2.0.la

dist: distclean
	git ls-files -z | cpio -pd -0 --quiet dist/$(PKG_NAME)
	cd dist && tar zcf $(PKG_NAME).tar.gz $(PKG_NAME)

distclean:
	rm -rf dist

clean:
	rm -rf *~ *.o *.so *.lo *.la *.slo *.loT .libs/ 
