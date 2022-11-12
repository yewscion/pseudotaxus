################################################################################
# Set Up Other Variables

BNFC_MAIN = haskell

BNFC_PYGMENTS = pygments

BNFC_LATEX = latex

BNFC_MAIN_MAKEFILE = Makefile.$(BNFC_MAIN).bnfc
BNFC_LATEX_MAKEFILE = Makefile.$(BNFC_LATEX).bnfc

BNFC_MAIN_OPTIONS = --$(BNFC_MAIN) -d --xml --agda --make=$(BNFC_MAIN_MAKEFILE)
BNFC_PYGMENTS_OPTIONS = --$(BNFC_PYGMENTS)
BNFC_LATEX_OPTIONS = --$(BNFC_LATEX) --make=$(BNFC_LATEX_MAKEFILE)


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
              doc/procedure-types.texi \
	      doc/syntax.texi

BNFC_SOURCE = $(srcdir)/pseudotaxus/pseudotaxus.cf

## Symlinks Can Go Here, along with other end-of-install changes
# install-data-hook:
# 	$(LN_S) $(DESTDIR)$(bindir)/realfile $(DESTDIR)$(bindir)/link
# 	chmod +x $(DESTDIR)$(javadir)/pseudotaxus.jar

# ## Sources and Extras
EXTRA_DIST += $(BNFC_SOURCE)
################################################################################
# Added Jobs
bin_PROGRAMS = pseudotaxus-parse pseudotaxus-xml
pseudotaxus_parse_SOURCES = $(BNFC_SOURCE)
pseudotaxus_xml_SOURCES = $(BNFC_SOURCE)

# install-exec: pseudotaxus-parse
# 	install -c -m 755 pseudotaxus-parse $(my_execbindir)

pseudotaxus-parse$(EXEEXT) pseudotaxus-xml$(EXEEXT) &: Main
	cp -v Main pseudotaxus-parse
	cp -v Pseudotaxus/Test pseudotaxus-xml

Main: $(BNFC_MAIN_MAKEFILE)
	$(MAKE) -f $(BNFC_MAIN_MAKEFILE)

$(BNFC_MAIN_MAKEFILE): $(BNFC_SOURCE)
	$(BNFC) $(BNFC_MAIN_OPTIONS) $(BNFC_SOURCE)

pseudotaxus-bnfc.pdf: pseudotaxus.tex
	lualatex --jobname=pseudotaxus-bnfc pseudotaxus.tex

pseudotaxus.tex: $(BNFC_SOURCE)
	$(BNFC) $(BNFC_LATEX_OPTIONS) $(BNFC_SOURCE)

install-docs: all-docs 
	DESTDIR=$(DESTDIR) $(MAKE) install-pdf
	DESTDIR=$(DESTDIR) $(MAKE) install-dvi
	DESTDIR=$(DESTDIR) $(MAKE) install-html
	DESTDIR=$(DESTDIR) $(MAKE) install-ps
	install -c -m 644 pseudotaxus-bnfc.pdf \
$(DESTDIR)/usr/local/share/doc/pseudotaxus/

all-docs: doc/pseudotaxus.texi pseudotaxus-bnfc.pdf
	$(MAKE) pdf
	$(MAKE) dvi
	$(MAKE) html
	$(MAKE) ps


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
