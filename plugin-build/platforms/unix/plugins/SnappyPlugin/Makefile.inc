XCPPFLAGS=-I$(topdir)/platforms/Cross/third-party/snappy-1.1.0
XLDFLAGS= -L$(topdir)/platforms/unix/third-party/snappy-1.1.0/lib -lsnappy
PLIBS=-lsnappy
