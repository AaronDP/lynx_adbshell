# $LynxId: makefile.in,v 1.156 2016/04/11 00:23:19 tom Exp $
##makefile for lynx

SHELL		= /bin/sh
CDPATH		= .

.SUFFIXES:

prefix		= /data/local/tmp
exec_prefix	= ${prefix}
top_srcdir	= .
srcdir		= .
builddir	= .


CC		= /tmp/chain/bin/arm-linux-androideabi-gcc
CFLAGS		= -UHAVE_TTYNAME -UHAVE_LOCALE_H --sysroot=/opt/ndk/platforms/android-17/arch-arm -I/opt/ndk/platforms/android-17/arch-arm/usr/include -I/tmp/chain/include -I/opt/android/bionic -I/data/local/tmp/lib/include 
DEFS		= -DHAVE_CONFIG_H
CPPFLAGS	= -UHAVE_TTYNAME -UHAVE_LOCALE_H --sysroot=/opt/ndk/platforms/android-17/arch-arm -I/opt/ndk/platforms/android-17/arch-arm/usr/include -I/tmp/chain/include -I/opt/android/bionic -I/data/local/tmp/lib/include  -D_XOPEN_SOURCE=500  -DLINUX -I/data/local/tmp/lib/include/openssl -D_XOPEN_SOURCE_EXTENDED
LINT		= lint
ETAGS		= 

BUILD_CC	= gcc
BUILD_CPP	= ${BUILD_CC} -E
BUILD_CFLAGS	= 
BUILD_CPPFLAGS	= # -DHAVE_CONFIG_H
BUILD_EXEEXT	= 
BUILD_LDFLAGS	= 
BUILD_LIBS	= 

x		= 
o		= .o

LDFLAGS		= -Wl,-rpath,/data/local/tmp/lib -Wl,-rpath,/tmp/chain/lib -Wl,-rpath,/opt/ndk/platforms/android-17/arch-arm/usr/lib -Wl,-rpath,/lib   -L/lib -L/opt/ndk/platforms/android-17/arch-arm/usr/lib -L/tmp/chain/lib -L/data/local/tmp/lib
LIBS		=  -lz -lncurses -lssl -lcrypto -ldl

INSTALL		= /usr/bin/install -c
INSTALL_PROGRAM	= ${INSTALL}
INSTALL_DATA	= ${INSTALL} -m 644
transform	= s,x,x,

LN_S		= ln -s

TAR		= /bin/tar
TAR_UP		= $(TAR) -cf -
TAR_DOWN	= $(TAR) -xf -

# $Format: "LYNX_VERSION	= $ProjectVersion$"$
LYNX_VERSION	= 2.8.9dev.9

## This is the version which we are developing (or, upon release, make this
## the same).  Use no dots in the name, since it must work on VMS and MS-DOS.
VERSION		= 2-8-8

##this is the name of the directory the lynx source code is in.
##(e.g., lynx2-8-8, not the full path)
lynxdir= lynx$(VERSION)
lynxname= lynx$(VERSION)

## The 'DESTDIR' variable allows you to install the program into a different
## location, e.g., for packaging, without affecting the compiled-in pathnames.
DESTDIR= 

## Where you want lynx installed
bindir= /data/local/tmp/xbin
BINDIR= $(DESTDIR)$(bindir)

## Where you want the lynx man file installed
mandir= /data/local/tmp/lib/share/man/man1
MANDIR= $(DESTDIR)$(mandir)

## Where you want the lynx.cfg file installed
sysconfdir= /data/local/tmp/etc
SYSCONFDIR= $(DESTDIR)$(sysconfdir)

## Where you want the doc-files installed
datarootdir= /data/local/tmp/lib/share
docdir    = /data/local/tmp/lib/share/lynx_doc
DOCDIR    = $(DESTDIR)$(docdir)

## Where you want the help-files installed
helpdir   = /data/local/tmp/lib/share/lynx_help
HELPDIR   = $(DESTDIR)$(helpdir)

##set the relative location of the WWW library Implementation directory,
##from this directory
##do not set this to be an absolute path!!!
WWW_DIR   = $(builddir)/WWW/Library/Implementation

##set the relative location of the message-file directory
##do not set this to be an absolute path!!!
PO_DIR    = $(builddir)/po
PO_SRCDIR = $(srcdir)/po

##set the relative location of the main source-directory
##do not set this to be an absolute path!!!
SRC_DIR   = $(builddir)/src

##set the relative location of the character-translation data directory
##do not set this to be an absolute path!!!
CHR_DIR   = $(SRC_DIR)/chrtrans

## Path to gzip that will compress the help files.
## It will be used when --enable-gzip-help is set by configure.
## Leave *both* empty if you don't want to gzip help files.
COMPRESS_PROG=
COMPRESS_EXT=

# Path of scripts directory
scripts_dir=$(srcdir)/scripts

MAKE_RECUR = $(MAKE)  DESTDIR="$(DESTDIR)" CC="$(CC)"

#CFG2HTML = alphatoc.html body.html cattoc.html

# !!!!!!!!!!! SUN resolv LIBRARY !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# To include resolv in the LIBS="" list for SUN 3, 4 or Solaris OS,
# point RESOLVLIB to that library.  You need this if you get the message
# "Alert!:  Unable to connect to remote host" whenever you try to
# access a host other than localhost and have made Lynx without it.
# See the PROBLEMS file for more information.
#RESOLVLIB= -lresolv

# !!!!!!!!!!!!!  DIRECT WAIS ACCESS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# If you are adding direct wais access you must fill in the
# location of wais.a, client.a and the standard math library, libm.a.
# You can pick up the most current freeWAIS sources from
#	ftp://ftp.cnidr.org/pub/NIDR.tools/freewais
# If you are using freeWAIS-0.202 or older, include -DDECLARE_WAIS_LOGFILES
# in your SITE_DEFS.
# Please put an ABSOLUTE address here if you want it to work!
#WAISLIB= ../../freeWAIS-0.202/bin/client.a ../../freeWAIS-0.202/bin/wais.a /usr/lib/libm.a

# !!!!!!!!!!!!! SLANG Support (For color version of Lynx). !!!!!!!!!!!!!!!!
# The slang library is an alternative to curses, developed by John E. Davis
# (davis@space.mit.edu).  Version 0.99-27 or higher is available from
#	ftp://space.mit.edu/pub/davis
# It provides color support for Lynx.

# !!!!!!!!!!!!! NCURSES Support (For color version of Lynx). !!!!!!!!!!!!!!
# If you need ncurses, the latest version can always be found
# in ftp://invisible-island.net/ncurses/
# or ftp://ftp.gnu.org/pub/gnu/

# Also be sure to check out the compilation symbols in userdefs.h
# before building Lynx!

# If you apply patches which require linking to site-specific libraries, set
# SITE_LIBS to those libraries.
SITE_LIBS= # Your libraries here

# Set SITE_LYDEFS to one or more of the defines for the WWW Library:
SITE_LYDEFS = # Your defines here

# Set SITE_DEFS to one or more of the defines for lynx below:
SITE_DEFS = # Your defines here

# defines for which there are no configure options:
# -DHP_TERMINAL    For DIM workaround to REVERSE problems on HP terminals.
# -DIGNORE_CTRL_C  Define if Control-C shouldn't exit lynx.
# -DNO_RULES       Disables CERN-style access rules (see lynx.cfg).
# -DMISC_EXP       Enable some truly experimental stuff
# -DSHORTENED_RBIND  For a SOCKSified lynx with the short version of Rbind.
# -DSLANG_MBCS_HACK prevent cutoff lines when using UTF8 console (slang only)
# -DUSE_VASPRINT   Use vasprintf() function
#
# if you are linking to freeWAIS-0.202 or older, you should define this
# in SITE_DEFS
#
# -DDECLARE_WAIS_LOGFILES
#
# if you have the reverse clear screen problem of some SUN4 systems you
# should define this in SITE_DEFS
#
# -DREVERSE_CLEAR_SCREEN_PROBLEM
#
# if you have an SVR4 system with the "type any key" problem, try defining
# this in LYFLAGS (SITE_LYDEFS) and SITE_DEFS
#
# -DSVR4_BSDSELECT
#
# Old Data General systems may need this in their SITE_LYDEFS
# for their inet_addr(host) calls.
#
# -DDGUX_OLD

# Many other defines have configure options  (see INSTALLATION, Section II-1c.):
#
# for installation of local execution links, please see the file userdefs.h

WWW_CFLAGS = \
	LY_CFLAGS="$(CFLAGS)" \
	CPPFLAGS="$(CPPFLAGS)" \
	LYFLAGS="$(SITE_LYDEFS)"

CHR_CFLAGS = \
	SITE_DEFS="$(SITE_DEFS)" \
	BUILD_CFLAGS="$(BUILD_CFLAGS)" \
	BUILD_CPPFLAGS="$(BUILD_CPPFLAGS)" \
	BUILD_LDFLAGS="$(BUILD_LDFLAGS)" \
	BUILD_LIBS="$(BUILD_LIBS)" \
	BUILD_CC="$(BUILD_CC)"

SRC_CFLAGS = \
	CFLAGS="$(CFLAGS)" \
	CPPFLAGS="$(CPPFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	LIBS="$(LIBS) $(RESOLVLIB) $(WAISLIB) $(SITE_LIBS)" \
	SITE_DEFS="$(SITE_DEFS)" \
	WWWINC=$(WWW_DIR) \
	WWWLIB="../$(WWW_DIR)/libwww.a"

actual_PROG  = `echo lynx|    sed '$(transform)'`
binary_PROG  = $(actual_PROG)$x

all lynx$x: cfg_defs.h LYHelp.h
#	$(SHELL) $(scripts_dir)/fixtext.sh $(srcdir)/LYMessages_en.h >LYMessages.c
#	cd $(PO_DIR) && $(MAKE_RECUR)
	cd $(WWW_DIR) && $(MAKE_RECUR) $(WWW_CFLAGS)
	cd $(CHR_DIR) && $(MAKE_RECUR) all $(CHR_CFLAGS)
	cd $(SRC_DIR) && $(MAKE_RECUR) all $(SRC_CFLAGS)

lint:
	cd $(WWW_DIR) && $(MAKE_RECUR) LINT="$(LINT)" $(WWW_CFLAGS) $@
	cd $(SRC_DIR) && $(MAKE_RECUR) LINT="$(LINT)" $(SRC_CFLAGS) $@
	cd $(CHR_DIR) && $(MAKE_RECUR) LINT="$(LINT)" $@

tags:
	cd $(WWW_DIR) && $(MAKE_RECUR) $(WWW_CFLAGS) $@
	cd $(SRC_DIR) && $(MAKE_RECUR) $(SRC_CFLAGS) $@
	cd $(CHR_DIR) && $(MAKE_RECUR) $@

etags:
	$(ETAGS) *.[ch] */*.[ch] */*/*.[ch] */*/*/*.[ch]

help:
	@echo
	@echo "Please run make with one of the following arguments"
	@echo "all        -- to make the executable, put it in this directory"
	@echo "clean      -- removes all '$o' and 'core' files"
	@echo "distclean  -- removes all generated files"
	@echo "depend     -- use makedepend to generate header-dependencies"
	@echo

##Miscellaneous actions
clean:
	rm -f WWW/Library/*/*.[aoib]
	rm -f WWW/Library/*/.created
	cd $(WWW_DIR) && $(MAKE_RECUR) $@
	cd $(SRC_DIR) && $(MAKE_RECUR) $@
#	rm -f LYMessages.c
#	cd $(PO_DIR) && $(MAKE_RECUR) $@
	rm -f *.b $(SRC_DIR)/lynx$x *.leaks cfg_defs.h LYHelp.h lint.*
#	-rm -f $(CFG2HTML)
	rm -f help_files.sed
	rm -f core *.core

depend: cfg_defs.h LYHelp.h
	cd $(WWW_DIR) && $(MAKE_RECUR) $@
	cd $(SRC_DIR) && $(MAKE_RECUR) $@

distclean: clean
	-rm -f WWW/Library/*/*~
	-rm -f WWW/Library/*/*.bak
	-rm -rf $(SRC_DIR)/obsolete
	-cd $(WWW_DIR) && $(MAKE_RECUR) $@
	-cd $(SRC_DIR) && $(MAKE_RECUR) $@
	-cd $(CHR_DIR) && $(MAKE_RECUR) $@
#	cd $(PO_DIR) && $(MAKE_RECUR) $@
#	-rmdir $(PO_DIR)
	-rm -f *~ *.bak *.sav tags TAGS
	-rm -f $(WWW_DIR)/makefile $(SRC_DIR)/makefile $(CHR_DIR)/makefile
#	-rmdir $(WWW_DIR) && rmdir WWW/Library && rmdir WWW
#	-rmdir $(CHR_DIR) && rmdir $(SRC_DIR)
	-rm -f makefile lynx_cfg.h config.status config.log config.cache
	-rm -f lynx$x

maintainer-clean: distclean
	-find . -type f -name '*.rej' -exec rm -f {} \;
	-find . -type f -name '*.orig' -exec rm -f {} \;
	-rm -rf WWW/Library/*/obsolete
	-rm -f Lynx.prj .*_aux

# Directory containing reference source for patch generation,
#     either absolute or relative to $(top_srcdir)/..
REFDIR=orig/$(lynxdir)

lynx.patch: $(top_srcdir) $(top_srcdir)/CHANGES
	- cd $(top_srcdir)/.. && cd $(REFDIR) && { rm -f \
		config.log \
		config.status \
		lynx_cfg.h \
			; \
		for I in . $(SRC_DIR) $(WWW_DIR); do ( set +e; \
			( set -x; cd $$I && rm -f *.orig *.rej makefile ); : ); \
		done; }
	( cd $(top_srcdir)/..; echo "%%% Created `date` by target $@. %%%"; \
	   if diff -bru /dev/null /dev/null;		     \
		   then diff -bru $(REFDIR) $(lynxdir);	     \
		   else diff -brc $(REFDIR) $(lynxdir); fi ) \
		| grep -v '^Common' \
		| grep -v '^Binary files ' \
		| grep -v '^Only ' | tee $@ | egrep '^\-\-\- .*$(lynxdir)'

install: install-bin install-man install-cfg install-lss
	@echo
	@echo "Use $(MAKE) install-help to install the help-files"
	@echo "Use $(MAKE) install-doc to install extra documentation files"
	@echo

install-full: install install-help install-doc
	@echo Full installation complete.

install-bin: $(BINDIR) lynx$x
#	cd $(PO_DIR) && $(MAKE_RECUR) install
	$(SHELL) -c \
	'if test -f $(BINDIR)/$(binary_PROG) ; then \
	      mv -f $(BINDIR)/$(binary_PROG) $(BINDIR)/lynx.old; fi'
	$(INSTALL_PROGRAM) lynx$x $(BINDIR)/$(binary_PROG)

install-man : $(MANDIR)
	$(INSTALL_DATA) $(srcdir)/lynx.man $(MANDIR)/$(actual_PROG).1

install-doc : $(DOCDIR) $(HELPDIR)
	@echo Copying sample files
	$(SHELL) -c '\
		( umask 022; \
		  cd $(srcdir) && \
		  $(TAR_UP) C[HO]* PROBLEMS README docs samples test ) | \
		( umask 022; \
		  cd $(DOCDIR) && \
		  chmod -R u+w . && $(TAR_DOWN) )'
	$(SHELL) -c 'if test "$(COMPRESS_PROG)" != "" ; then \
		(cd $(DOCDIR) && $(COMPRESS_PROG) -f docs/CHANGES*.[0-9] docs/*.announce ) \
	fi'
	$(SHELL) -c 'for name in COPYING COPYHEADER; do \
		cd $(HELPDIR) && rm -f $$name ;\
		r= ;\
		test "$(LN_S)" = "ln -s" || r=`echo $(helpdir)|sed -e "s%[^/]\+%..%g" -e "s%^.%%"`; \
		cd $(HELPDIR) && ( $(LN_S) $$r$(docdir)/$$name . || cp $(DOCDIR)/$$name . );\
		done'
	-$(SHELL) -c 'case `id|sed -e "s/(.*//"` in uid=0) chown -R root $(DOCDIR);; esac'

# HPUX 'sed' does not seem to like '=' as pattern delimiter.
# We cannot use '%' because it may appear in a URL.
# Andrew filesystem uses '@'.
# So we limit sed delimiters to '!' and '%', depending on the expected text.
FIX_SED = tr '=' '"'

LYNX_URL='http://lynx.invisible-island.net/release/breakout'
LYNXDOCS_URL='$(LYNX_URL)/docs/'
LYNXHELP_URL='$(LYNX_URL)/lynx_help/'

#$(CFG2HTML) :
#	@echo 'Making htmlized lynx.cfg'
#	cd $(SRC_DIR) && $(MAKE_RECUR) LYReadCFG.i
#	@-rm -f $(CFG2HTML)
#	sed -n -e '/Config_Type  *Config_Table/,/{0, *0, *0}/ p' $(SRC_DIR)/LYReadCFG.i | \
#	sed  -e 's/ *{ *"\([^"]*\)".*/\1/' | \
#	perl $(scripts_dir)/cfg2html.pl -ams $(srcdir)/lynx.cfg
#	-rm -f $(SRC_DIR)/LYReadCFG.i

help_files.sed : makefile $(srcdir)/lynx_help/help_files.txt
	@echo Constructing sed-script $@
	@-rm -f $@ help_files.tmp
	@cat $(srcdir)/lynx_help/help_files.txt > help_files.tmp
#	echo 's!$(LYNXDOCS_URL)!file://$(docdir)/!g' >> help_files.tmp
#	echo 's!$(LYNXHELP_URL)alphatoc.html!alphatoc.html!g' >> help_files.tmp
#	echo 's!$(LYNXHELP_URL)cattoc.html!cattoc.html!g' >> help_files.tmp
#	echo 's!alphatoc\.html!alphatoc.html$(COMPRESS_EXT)!g' >> help_files.tmp
#	echo 's!cattoc\.html!cattoc.html$(COMPRESS_EXT)!g' >> help_files.tmp
#	echo 's!body\.html!body.html$(COMPRESS_EXT)!g' >> help_files.tmp
	sed	-e '/^#/d' -e '/^$$/d' \
		-e 's%\(.*\)=\(.*\@.*\)$$%s=@\1@=\2=g%' \
		-e 's%\(.*\)=\(http:.*\)$$%s=@\1@=\2=g%' \
		-e 's%\(.*\)=\(ftp:.*\)$$%s=@\1@=\2=g%' \
		-e 's%\(.*\)=\(.*\.html\)$$%s=@\1@=\2$(COMPRESS_EXT)=g%' \
		help_files.tmp | $(FIX_SED) > $@
	@echo Appending interim-fix for existing html files to $@
	sed	-e '/^#/d' -e '/[:@]/d' -e '/^$$/d' \
		-e 's%\(.*\)=\(.*\.html\)$$%s=\2=\2$(COMPRESS_EXT)=g%' \
		-e 's%\.html=%\\.html=%' \
		help_files.tmp | $(FIX_SED) >> $@
	if test -n "$(COMPRESS_EXT)"; then echo "s%\\(\$(COMPRESS_EXT)\\)*\$(COMPRESS_EXT)%$(COMPRESS_EXT)%g" >> $@; fi
	@-rm -f help_files.tmp

install-help : $(CFG2HTML) help_files.sed $(HELPDIR) $(SYSCONFDIR)
	-$(SHELL) -c 'if cd "$(HELPDIR)" ; then \
		WD=`pwd` ; \
		TAIL=`basename "$(helpdir)"` ; \
		HEAD=`echo "$$WD"|sed -e "s,/$${TAIL}$$,,"` ; \
		test "x$$WD" != "x$$HEAD" && rm -fr * ; \
		fi'
	test -d $(HELPDIR)/keystrokes || mkdir $(HELPDIR)/keystrokes
	@echo Translating/copying html files
#	@$(SHELL) -c 'for f in $(CFG2HTML) ; do \
#		sed -f help_files.sed $$f > $(HELPDIR)/$$f ; \
#		done'
	$(SHELL) -c 'sed_prog=`pwd`/help_files.sed && \
		cd $(srcdir)/lynx_help && \
		dirs=keystrokes && \
		files="*.html */*.html" && \
		for f in $$files ; do \
			sed -f $$sed_prog $$f > $(HELPDIR)/$$f ; \
		done && \
		if test "$(COMPRESS_PROG)" != "" ; then \
			(cd $(HELPDIR) && $(COMPRESS_PROG) $$files ) \
		fi'
	@echo Updating $(sysconfdir)/lynx.cfg
	$(SHELL) -c \
	'if test -f $(SYSCONFDIR)/lynx.cfg ; then \
		mv $(SYSCONFDIR)/lynx.cfg $(SYSCONFDIR)/lynx.tmp ; \
	else \
		cp $(srcdir)/lynx.cfg $(SYSCONFDIR)/lynx.tmp ; \
	fi'
	@echo Updating $(sysconfdir)/lynx.cfg to point to installed help-files
	sed	-e '/^HELPFILE:http/s!^!#!' \
		-e '/^#HELPFILE:file/s!#!!' \
		$(SYSCONFDIR)/lynx.tmp | \
	$(SHELL) $(scripts_dir)/cfg_path.sh lynx_help $(helpdir) | \
	$(SHELL) $(scripts_dir)/cfg_path.sh lynx_doc  $(helpdir) | \
	sed	-e '/^HELPFILE:file/s!$$!$(COMPRESS_EXT)!' \
		-e '/^HELPFILE:file/s!$(COMPRESS_EXT)$(COMPRESS_EXT)$$!$(COMPRESS_EXT)!' \
		>$(SYSCONFDIR)/lynx.cfg
	chmod 644 $(SYSCONFDIR)/lynx.cfg
	-rm -f $(SYSCONFDIR)/lynx.tmp

LYHelp.h : help_files.sed $(srcdir)/LYHelp.hin
	@echo Creating $@
	@sed -f help_files.sed $(srcdir)/LYHelp.hin > $@
	@echo '**********************************************'
	@echo
	@$(SHELL) -c 'if test "$(COMPRESS_PROG)" = "" ; then \
		echo "       Help files will NOT be gzipped."; \
	else \
		echo "       Help links point to compressed files"; \
		echo "       To access them properly you have to type"; \
		echo "                 make install-help"; \
	fi'
	@echo
	@echo '**********************************************'

cfg_defs.h : $(scripts_dir)/cfg_defs.sh $(scripts_dir)/cfg_edit.sh config.cache lynx_cfg.h
	@rm -f $@
	$(SHELL) -c 'SHELL=$(SHELL) $(SHELL) $(scripts_dir)/cfg_defs.sh $(srcdir)'

install-cfg : $(SYSCONFDIR)
	@$(SHELL) $(scripts_dir)/install-cfg.sh "$(INSTALL_DATA)" $(srcdir)/lynx.cfg $(SYSCONFDIR)/lynx.cfg

install-lss : $(SYSCONFDIR)
	@$(SHELL) $(scripts_dir)/install-lss.sh "$(INSTALL_DATA)" $(srcdir)/samples/lynx.lss $(SYSCONFDIR)/lynx.lss

uninstall ::
#	cd $(PO_DIR) && $(MAKE_RECUR) uninstall
	-rm -f $(BINDIR)/$(binary_PROG)
	-rm -f $(MANDIR)/$(actual_PROG).1
	-rm -f $(SYSCONFDIR)/lynx.cfg
	-rm -f $(SYSCONFDIR)/lynx.lss

uninstall \
uninstall-help ::
	-$(SHELL) -c 'if test -d "$(HELPDIR)" ; then \
		WD=`cd "$(HELPDIR)" && pwd` ; \
		TAIL=`basename "$(helpdir)"` ; \
		HEAD=`echo "$$WD"|sed -e "s,/$${TAIL}$$,,"` ; \
		test "x$$WD" != "x$$HEAD" && rm -rf "$(HELPDIR)"; \
		fi'

uninstall \
uninstall-doc ::
	-$(SHELL) -c 'if test -d "$(DOCDIR)" ; then \
		WD=`cd "$(DOCDIR)" && pwd` ; \
		TAIL=`basename "$(docdir)"` ; \
		HEAD=`echo "$$WD"|sed -e "s,/$${TAIL}$$,,"` ; \
		test "x$$WD" != "x$$HEAD" && rm -rf "$(DOCDIR)"; \
		fi'
	-$(SHELL) -c 'if test -d "$(HELPDIR)" ; then \
		WD=`cd "$(HELPDIR)" && pwd` ; \
		TAIL=`basename "$(helpdir)"` ; \
		HEAD=`echo "$$WD"|sed -e "s,/'$${TAIL}'$$,,"` ; \
		test "x$$WD" != "x$$HEAD" ; \
		cd "$(HELPDIR)" && rm -f COPYING COPYHEADER ; \
		fi'

update-po:
	rsync -Lrtvz  translationproject.org::tp/latest/lynx/  $(PO_SRCDIR)
	test -f $(PO_SRCDIR)/makefile && cd $(PO_SRCDIR) && $(MAKE_RECUR) $@

preinstall :
	@ echo ''
	@ echo '** Configuration summary for LYNX $(LYNX_VERSION):'
	@ echo ''
	@ echo '       program name: '$(actual_PROG)
	@ echo ''
	@ echo '      bin directory: '$(BINDIR)
	@ echo '   config directory: '$(SYSCONFDIR)
	@ echo '      man directory: '$(MANDIR)
	@ echo '     help directory: '$(HELPDIR)
	@ echo '      doc directory: '$(DOCDIR)

$(BINDIR) \
$(MANDIR) \
$(SYSCONFDIR) \
$(HELPDIR) \
$(DOCDIR) :
	mkdir -p $@
