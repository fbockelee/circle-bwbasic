#
# Makefile
#

include ../../Config.mk

# bwbasic
CFLAGS += -g -ansi -DHAVE_UNIX
# Fin bwbasic

CIRCLEHOME = ../../libs/circle
NEWLIBDIR = ../../install/$(NEWLIB_ARCH)

CFILES=         bwbasic.c bwb_cmd.c bwb_cnd.c bwb_dio.c\
                bwb_exp.c bwb_fnc.c bwb_inp.c bwb_int.c\
                bwb_prn.c bwb_stc.c bwb_str.c bwb_tbl.c\
                bwb_var.c bwd_cmd.c bwd_fun.c bwx_tty.c

OBJS	= main.o kernel.o\
	 bwbasic.o bwb_cmd.o bwb_cnd.o bwb_dio.o\
         bwb_exp.o bwb_fnc.o bwb_inp.o bwb_int.o\
         bwb_prn.o bwb_stc.o bwb_str.o bwb_tbl.o\
         bwb_var.o bwd_cmd.o bwd_fun.o bwx_tty.o


include $(CIRCLEHOME)/Rules.mk

CFLAGS += -I "$(NEWLIBDIR)/include" -I $(STDDEF_INCPATH) -I ../../include
LIBS := "$(NEWLIBDIR)/lib/libm.a" "$(NEWLIBDIR)/lib/libc.a" "$(NEWLIBDIR)/lib/libcirclenewlib.a" \
 	$(CIRCLEHOME)/addon/SDCard/libsdcard.a \
  	$(CIRCLEHOME)/lib/usb/libusb.a \
 	$(CIRCLEHOME)/lib/input/libinput.a \
 	$(CIRCLEHOME)/lib/fs/fat/libfatfs.a \
 	$(CIRCLEHOME)/lib/fs/libfs.a \
  	$(CIRCLEHOME)/lib/net/libnet.a \
  	$(CIRCLEHOME)/lib/sched/libsched.a \
  	$(CIRCLEHOME)/lib/libcircle.a
