bin_PROGRAMS = dacquery
man_MANS = dacquery.1

dacquery_SOURCES = dacquery.c debug.c

AM_CFLAGS = -fno-common -Wno-multichar -Wall -Wextra -Wno-clobbered -Wno-psabi -pthread --include=config.h --include=debug.h

if USE_GIT_VERSION
## Check if the git version information has changed and rebuild gitversion.h if so
.PHONY: gitversion-check
gitversion-check: 
	$(top_srcdir)/check-gitversion

BUILT_SOURCES = gitversion-check
CLEANFILES = gitversion-stamp gitversion.h
endif
