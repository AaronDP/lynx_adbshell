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
PREFIX=/data/local/tmp ./configure \
  --with-zlib \
  --with-ssl=/data/local/tmp/lib \
  --bindir=/data/local/tmp/xbin \
  --host=${CROSS_COMPILE} \
  --with-sysroot=${SYSROOT} \
  --prefix=${PREFIX} \
  "CFLAGS=${CFLAGS}" \
  "LDFLAGS=${LDFLAGS}" \
  "$@" && make && make install
# configure:  --prefix=PREFIX         install architecture-independent files in PREFIX
# configure:  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
# configure:an installation prefix other than \`$ac_default_prefix' using \`--prefix',
# configure:for instance \`--prefix=\$HOME'.
# configure:  --bindir=DIR            user executables [EPREFIX/bin]
# configure:  --sbindir=DIR           system admin executables [EPREFIX/sbin]
# configure:  --libexecdir=DIR        program executables [EPREFIX/libexec]
# configure:  --datarootdir=DIR       read-only architecture-independent data [PREFIX/share]
# configure:  --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
# configure:  --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
# configure:  --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
# configure:  --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
# configure:  --libdir=DIR            object code libraries [EPREFIX/lib]
# configure:  --includedir=DIR        C header files [PREFIX/include]
# configure:  --oldincludedir=DIR     C header files for non-gcc [/usr/include]
# configure:  --infodir=DIR           info documentation [DATAROOTDIR/info]
# configure:  --mandir=DIR            man documentation [DATAROOTDIR/man]
# configure:  --program-prefix=PREFIX            prepend PREFIX to installed program names
# configure:  --program-suffix=SUFFIX            append SUFFIX to installed program names
# configure:  --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
# configure:  --x-includes=DIR    X include files are in DIR
# configure:  --x-libraries=DIR   X library files are in DIR
# configure:  --build=BUILD           configure for building on BUILD [guessed]
# configure:  --host=HOST       build programs to run on HOST [BUILD]
# configure:  --target=TARGET   configure for building compilers for TARGET [HOST]
# configure:  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
# configure:  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
# configure:  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
# configure:  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
# configure:  --with-system-type=XXX  test: override derived host system-type
# configure:  --with-destdir=XXX      set DESTDIR destination for install (default: $DESTDIR)
# configure:  --with-build-cc=XXX     the build C compiler ($BUILD_CC)
# configure:  --with-build-cpp=XXX    the build C preprocessor ($BUILD_CPP)
# configure:  --with-build-cflags=XXX the build C compiler-flags ($BUILD_CFLAGS)
# configure:  --with-build-cppflags=XXX the build C preprocessor-flags ($BUILD_CPPFLAGS)
# configure:  --with-build-ldflags=XXX the build linker-flags ($BUILD_LDFLAGS)
# configure:  --with-build-libs=XXX   the build libraries (${BUILD_LIBS})
# configure:  --disable-echo          do not display "compiling" commands
# configure:  --enable-find-leaks     logic for testing memory leaks
# configure:  --enable-debug          compile w/ debugging (if \$CFLAGS is set, add -g there, too)
# configure:  --disable-trace         disable logic for trace code
# configure:  --enable-vertrace       verbose trace code
# configure:  --enable-warnings       GCC compiler warnings
# configure:  --with-dbmalloc         test: use Conor Cahill's dbmalloc library
# configure:  --with-dmalloc          test: use Gray Watson's dmalloc library
# configure:  --disable-largefile     omit support for large files
# configure:  --with-libiconv-prefix=DIR
# configure:  --enable-nls            use Native Language Support
# configure:  --with-included-gettext use the GNU gettext library included here
# configure:  --with-textdomain=PKG   NLS text-domain (default is package name)
# configure:  --disable-included-msgs use included messages, for i18n support
# configure:  --with-nls-datadir=DIR  NLS data, parent of locale (default: PREFIX/DATADIR)
# configure:  --disable-full-paths    control whether full utility pathnames are used
# configure:  --with-nss-compat{=path}       link with nss_compat library if available
# configure:  --with-ssl{=path}       link with ssl library if available
# configure:  --with-gnutls{=path}    link with gnutls support
# configure:  --enable-gnutls-compat  link with gnutls-openssl compat
# configure:  --with-socks{=path}     link with socks library if available
# configure:  --with-socks5{=path}    link with socks5 library if available
# configure:  --with-pkg-config{=path} enable/disable use of pkg-config
# configure:  --enable-ipv6           use ipv6 (with ipv4) support
# configure:  --with-screen=XXX       select screen type (XXX is curses (default),
# configure:  --with-curses-dir=DIR   directory in which (n)curses is installed
# configure:  --enable-widec          enable wide-curses features
# configure:  --disable-color-style   use color style (ncurses/curses)
# configure:  --with-lss-file{=path}  specify the default style-sheet file
# configure:  --with-cfg-file{=path}  specify the default configuration file
# configure:  --with-cfg-path{=path}  specify the default configuration directories
# configure:  --enable-htmlized-cfg   build htmlized lynx.cfg
# configure:  --enable-local-docs     link local doc-directory to help-page
# configure:  --with-mime-libdir=DIR  MIME data, mime.types and mailcap (default: /etc)
# configure:  --disable-locale-charset use locale-charset selection logic
# configure:  --with-charsets=list    limit charsets to given list of MIME names
# configure:  --disable-bibp-urls     disable support for bibp: URLs
# configure:  --disable-config-info   disable browsable configuration-info
# configure:  --disable-forms-options disable forms-based options
# configure:  --disable-menu-options  disable old-style option menu
# configure:  --disable-sessions      use sessions code
# configure:  --disable-session-cache use session-caching code
# configure:  --disable-addrlist-page disable address-list page
# configure:  --enable-cjk            use experimental CJK logic
# configure:  --enable-japanese-utf8  use experimental Japanese UTF-8 logic
# configure:  --enable-default-colors enable use of default-colors (ncurses/slang)
# configure:  --enable-kbd-layout     use experimental keyboard-layout support
# configure:  --enable-nested-tables  use experimental nested-table support
# configure:  --disable-alt-bindings  disable alternative line-edit bindings
# configure:  --disable-ascii-ctypes  disable use of ascii case-conversion
# configure:  --disable-extended-dtd  disable extended HTML DTD logic
# configure:  --disable-file-upload   disable file-upload support
# configure:  --disable-idna          disable IDNA support
# configure:  --disable-justify-elts  disable element-justification logic
# configure:  --disable-partial       disable partial-display logic
# configure:  --disable-persistent-cookies  disable persistent-cookie support
# configure:  --disable-prettysrc     disable colorization of HTML source
# configure:  --disable-progressbar   disable progress-bar
# configure:  --disable-read-eta      disable read-progress message shows ETA
# configure:  --disable-source-cache  do not cache HTML source for parse mode changes
# configure:  --disable-scrollbar     disable scrollbar with mouse
# configure:  --enable-charset-choice use charset-selection logic
# configure:  --enable-externs        use external commands
# configure:  --enable-font-switch    use Linux setfont for character-translation
# configure:  --enable-cgi-links      support cgi links w/o a http daemon
# configure:  --enable-change-exec    allow users to change exec options
# configure:  --enable-exec-links     allow lynx to execute programs accessed via a link
# configure:  --enable-exec-scripts   allow lynx to execute programs inferred from a link
# configure:  --enable-internal-links handle following links to same doc differently
# configure:  --enable-nsl-fork       fork NSL requests, allowing them to be aborted
# configure:  --enable-syslog         log URL requests via syslog
# configure:  --enable-underlines     underline links rather than using boldface
# configure:  --enable-gzip-help      install gzip'ed help files
# configure:  --with-bzlib            use libbz2 for decompression of some bzip2 files
# configure:  --with-zlib             use zlib for decompression of some gzip files
# configure:  --disable-finger        disable FINGER logic
# configure:  --disable-gopher        disable GOPHER logic
# configure:  --disable-news          disable NEWS logic
# configure:  --disable-ftp           disable FTP logic
# configure:  --enable-wais           enable WAIS logic
# configure:  --disable-dired          disable optional directory-editor, DirEd
# configure:  --disable-dired-dearchive disable dearchiving commands
# configure:  --disable-dired-override disable DirEd override keymap
# configure:  --disable-dired-permit  disable chmod/attrib commands
# configure:  --disable-dired-xpermit disable chmod/attrib commands
# configure:  --disable-dired-tar     disable "tar" command
# configure:  --disable-dired-uudecode disable "uudecode" command
# configure:  --disable-dired-zip     disable "zip", "unzip"  commands
# configure:  --disable-dired-gzip    disable "gzip", "gunzip" commands
# configure:  --disable-long-list     disable long "ls -l" directory listings
# configure:  --disable-parent-dir-refs
# configure:  --with-Xaw3d            link with Xaw 3d library
# configure:  --with-Xaw3dxft         link with Xaw 3d xft library
# configure:  --with-neXtaw           link with neXT Athena library
# configure:  --with-XawPlus          link with Athena-Plus library
# configure:  --with-x                use the X Window System
# configure:  --disable-rpath-hack    don't add rpath options for additional libraries
