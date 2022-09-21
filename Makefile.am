################################################################################
# Set Up Other Variables
BNFC_MAKEFILE = Makefile.bnfc

BNFC_TARGET = haskell

BNFC_OPTIONS = --$(BNFC_TARGET) --make=$(BNFC_MAKEFILE)

## Enable local m4 cache
ACLOCAL_AMFLAGS = -I m4

## Documentation Compilation
info_TEXINFOS = doc/pseudotaxus.texi

## Extra Files for Distribution
EXTRA_DIST =  Changelog.md \
              LICENSE \
              COPYING \
              NEWS \
              AUTHORS \
              README.org \
              README.md \
              README \
              Changelog.md \
              ChangeLog \
              COPYING \
              m4/tar-edited.m4 \
              guix.scm \
              doc/version.texi.in \
              doc/fdl-1.3.texi \
              doc/procedure-types.texi

BNFC_SOURCE = $(srcdir)/pseudotaxus/pseudotaxus.cf

## Symlinks Can Go Here, along with other end-of-install changes
# install-data-hook:
# 	$(LN_S) $(DESTDIR)$(bindir)/realfile $(DESTDIR)$(bindir)/link
# 	chmod +x $(DESTDIR)$(javadir)/pseudotaxus.jar

## Sources and Extras
EXTRA_DIST += $(BNFC_SOURCE)
################################################################################
# Added Jobs
bin_PROGRAMS = TestPseudotaxus
TestPseudotaxus_SOURCES = TestPseudotaxus.hs

# install-exec: TestPseudotaxus
# 	install -c -m 755 TestPseudotaxus $(my_execbindir)

TestPseudotaxus$(EXEEXT): $(BNFC_MAKEFILE)
	$(MAKE) -f $(BNFC_MAKEFILE)

$(BNFC_MAKEFILE): $(BNFC_SOURCE)
	$(BNFC) $(BNFC_OPTIONS) $(BNFC_SOURCE)

################################################################################

# # Tests (Not Working Right Now, as \$\(srcdir\) is not allowed.).
# TESTS = tests/tests.scm

# TEST_EXTENSIONS = .scm
# SCM_LOG_DRIVER =                                \
#   $(top_builddir)/pre-inst-env                  \
#   $(GUILE) --no-auto-compile -e main            \
#       $(top_srcdir)/build-aux/test-driver.scm

# # Tell 'build-aux/test-driver.scm' to display only source file names,
# # not indivdual test names.
# AM_SCM_LOG_DRIVER_FLAGS = --brief=yes

# AM_SCM_LOG_FLAGS = --no-auto-compile -L "$(top_srcdir)"

# AM_TESTS_ENVIRONMENT = abs_top_srcdir="$(abs_top_srcdir)"
