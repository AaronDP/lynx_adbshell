#!/bin/sh
DEV_PREFIX=/opt
ANDROID_NDK=${DEV_PREFIX}/ndk
CROSS_COMPILE=arm-linux-androideabi
ANDROID_PREFIX=/tmp/chain
SYSROOT=${ANDROID_NDK}/platforms/android-17/arch-arm
CROSS_PATH=${ANDROID_PREFIX}/bin/${CROSS_COMPILE}
export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
export LD=${CROSS_PATH}-ld
export RANLIB=${CROSS_PATH}-ranlib
export PREFIX=/data/local/tmp
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export CFLAGS="-UHAVE_TTYNAME -UHAVE_LOCALE_H --sysroot=${SYSROOT} -I${SYSROOT}/usr/include -I${ANDROID_PREFIX}/include -I${DEV_PREFIX}/android/bionic -I/data/local/tmp/lib/include"
export CPPFLAGS="${CFLAGS}"
export LDFLAGS="${LDFLAGS} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib -L/data/local/tmp/lib"
export GZIP_PATH="/data/local/tmp/xbin/busybox gzip"
PREFIX= ./configure \
  --disable-nls \
  --with-zlib \
  --with-ssl=/data/local/tmp/lib \
  --bindir=/data/local/tmp/xbin \
  --libexecdir=/data/local/tmp/libexec \
  --sysconfdir=/data/local/tmp/etc \
  --datarootdir=/data/local/tmp/lib/share \
  --datadir=/data/local/tmp/lib/share \
  --sharedstatedir=/data/local/tmp/var \
  --localstatedir=/data/local/tmp/var \
  --mandir=/data/local/tmp/lib/share/man \
  --libdir=/data/local/tmp/lib \
  --includedir=/data/local/tmp/lib/include \
  --oldincludedir=/data/local/tmp/lib/include \
  --infodir=/data/local/tmp/lib/share/info \
  --host=${CROSS_COMPILE} \
  --with-sysroot=${SYSROOT} \
  --prefix=${PREFIX} \
  "CFLAGS=${CFLAGS}" \
  "LDFLAGS=${LDFLAGS}" \
  "$@" && make && make install
#  --prefix=PREFIX         install architecture-independent files in PREFIX
#  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
#  --bindir=DIR            user executables [EPREFIX/bin]
#  --sbindir=DIR           system admin executables [EPREFIX/sbin]
#  --libexecdir=DIR        program executables [EPREFIX/libexec]
#  --datarootdir=DIR       read-only architecture-independent data [PREFIX/share]
#  --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
#  --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
#  --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
#  --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
#  --libdir=DIR            object code libraries [EPREFIX/lib]
#  --includedir=DIR        C header files [PREFIX/include]
#  --oldincludedir=DIR     C header files for non-gcc [/usr/include]
#  --infodir=DIR           info documentation [DATAROOTDIR/info]
#  --mandir=DIR            man documentation [DATAROOTDIR/man]
#  --program-prefix=PREFIX            prepend PREFIX to installed program names
#  --program-suffix=SUFFIX            append SUFFIX to installed program names
#  --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
#  --x-includes=DIR    X include files are in DIR
#  --x-libraries=DIR   X library files are in DIR
#  --build=BUILD           configure for building on BUILD [guessed]
#  --host=HOST       build programs to run on HOST [BUILD]
#  --target=TARGET   configure for building compilers for TARGET [HOST]
#  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
#  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
#  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
#  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
#  --with-system-type=XXX  test: override derived host system-type
#  --with-destdir=XXX      set DESTDIR destination for install (default: $DESTDIR)
#  --with-build-cc=XXX     the build C compiler ($BUILD_CC)
#  --with-build-cpp=XXX    the build C preprocessor ($BUILD_CPP)
#  --with-build-cflags=XXX the build C compiler-flags ($BUILD_CFLAGS)
#  --with-build-cppflags=XXX the build C preprocessor-flags ($BUILD_CPPFLAGS)
#  --with-build-ldflags=XXX the build linker-flags ($BUILD_LDFLAGS)
#  --with-build-libs=XXX   the build libraries (${BUILD_LIBS})
#  --disable-echo          do not display "compiling" commands
#  --enable-find-leaks     logic for testing memory leaks
#  --enable-debug          compile w/ debugging (if \$CFLAGS is set, add -g there, too)
#  --disable-trace         disable logic for trace code
#  --enable-vertrace       verbose trace code
#  --enable-warnings       GCC compiler warnings
#  --with-dbmalloc         test: use Conor Cahill's dbmalloc library
#  --with-dmalloc          test: use Gray Watson's dmalloc library
#  --disable-largefile     omit support for large files
#  --with-libiconv-prefix=DIR
#  --enable-nls            use Native Language Support
#  --with-included-gettext use the GNU gettext library included here
#  --with-textdomain=PKG   NLS text-domain (default is package name)
#  --disable-included-msgs use included messages, for i18n support
#  --with-nls-datadir=DIR  NLS data, parent of locale (default: PREFIX/DATADIR)
#  --disable-full-paths    control whether full utility pathnames are used
#  --with-nss-compat{=path}       link with nss_compat library if available
#  --with-ssl{=path}       link with ssl library if available
#  --with-gnutls{=path}    link with gnutls support
#  --enable-gnutls-compat  link with gnutls-openssl compat
#  --with-socks{=path}     link with socks library if available
#  --with-socks5{=path}    link with socks5 library if available
#  --with-pkg-config{=path} enable/disable use of pkg-config
#  --enable-ipv6           use ipv6 (with ipv4) support
#  --with-screen=XXX       select screen type (XXX is curses (default),
#  --with-curses-dir=DIR   directory in which (n)curses is installed
#  --enable-widec          enable wide-curses features
#  --disable-color-style   use color style (ncurses/curses)
#  --with-lss-file{=path}  specify the default style-sheet file
#  --with-cfg-file{=path}  specify the default configuration file
#  --with-cfg-path{=path}  specify the default configuration directories
#  --enable-htmlized-cfg   build htmlized lynx.cfg
#  --enable-local-docs     link local doc-directory to help-page
#  --with-mime-libdir=DIR  MIME data, mime.types and mailcap (default: /etc)
#  --disable-locale-charset use locale-charset selection logic
#  --with-charsets=list    limit charsets to given list of MIME names
#  --disable-bibp-urls     disable support for bibp: URLs
#  --disable-config-info   disable browsable configuration-info
#  --disable-forms-options disable forms-based options
#  --disable-menu-options  disable old-style option menu
#  --disable-sessions      use sessions code
#  --disable-session-cache use session-caching code
#  --disable-addrlist-page disable address-list page
#  --enable-cjk            use experimental CJK logic
#  --enable-japanese-utf8  use experimental Japanese UTF-8 logic
#  --enable-default-colors enable use of default-colors (ncurses/slang)
#  --enable-kbd-layout     use experimental keyboard-layout support
#  --enable-nested-tables  use experimental nested-table support
#  --disable-alt-bindings  disable alternative line-edit bindings
#  --disable-ascii-ctypes  disable use of ascii case-conversion
#  --disable-extended-dtd  disable extended HTML DTD logic
#  --disable-file-upload   disable file-upload support
#  --disable-idna          disable IDNA support
#  --disable-justify-elts  disable element-justification logic
#  --disable-partial       disable partial-display logic
#  --disable-persistent-cookies  disable persistent-cookie support
#  --disable-prettysrc     disable colorization of HTML source
#  --disable-progressbar   disable progress-bar
#  --disable-read-eta      disable read-progress message shows ETA
#  --disable-source-cache  do not cache HTML source for parse mode changes
#  --disable-scrollbar     disable scrollbar with mouse
#  --enable-charset-choice use charset-selection logic
#  --enable-externs        use external commands
#  --enable-font-switch    use Linux setfont for character-translation
#  --enable-cgi-links      support cgi links w/o a http daemon
#  --enable-change-exec    allow users to change exec options
#  --enable-exec-links     allow lynx to execute programs accessed via a link
#  --enable-exec-scripts   allow lynx to execute programs inferred from a link
#  --enable-internal-links handle following links to same doc differently
#  --enable-nsl-fork       fork NSL requests, allowing them to be aborted
#  --enable-syslog         log URL requests via syslog
#  --enable-underlines     underline links rather than using boldface
#  --enable-gzip-help      install gzip'ed help files
#  --with-bzlib            use libbz2 for decompression of some bzip2 files
#  --with-zlib             use zlib for decompression of some gzip files
#  --disable-finger        disable FINGER logic
#  --disable-gopher        disable GOPHER logic
#  --disable-news          disable NEWS logic
#  --disable-ftp           disable FTP logic
#  --enable-wais           enable WAIS logic
#  --disable-dired          disable optional directory-editor, DirEd
#  --disable-dired-dearchive disable dearchiving commands
#  --disable-dired-override disable DirEd override keymap
#  --disable-dired-permit  disable chmod/attrib commands
#  --disable-dired-xpermit disable chmod/attrib commands
#  --disable-dired-tar     disable "tar" command
#  --disable-dired-uudecode disable "uudecode" command
#  --disable-dired-zip     disable "zip", "unzip"  commands
#  --disable-dired-gzip    disable "gzip", "gunzip" commands
#  --disable-long-list     disable long "ls -l" directory listings
#  --disable-parent-dir-refs
#  --with-Xaw3d            link with Xaw 3d library
#  --with-Xaw3dxft         link with Xaw 3d xft library
#  --with-neXtaw           link with neXT Athena library
#  --with-XawPlus          link with Athena-Plus library
#  --with-x                use the X Window System
#  --disable-rpath-hack    don't add rpath options for additional libraries
