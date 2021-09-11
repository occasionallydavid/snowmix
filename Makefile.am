#
# Snowmix main Makefile.
#
# Copyright 2012-2020 Peter Maersk-Moller
#
#SUBDIRS = src relay frames images ini slib scripts test tcl
SUBDIRS = src frames images ini slib scripts test tcl

snowmix_dir = $(DESTDIR)$(libdir)/Snowmix-@SNOWMIX_VERSION@
include_HEADERS =

EXTRA_DIST = bootstrap NEWS README Changelog AUTHORS INSTALL COPYING scripts test

ACLOCAL_AMFLAGS = -I m4

install-exec-hook:
	find $(snowmix_dir) -type d -exec chmod 755 {} \;
