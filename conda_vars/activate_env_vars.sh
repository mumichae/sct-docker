#!/bin/sh

CFLAGS_OLD=$CFLAGS
export CFLAGS_OLD
export CFLAGS="`gsl-config --cflags` ${CFLAGS_OLD}"
 
LDFLAGS_OLD=$LDFLAGS
export LDFLAGS_OLD
export LDFLAGS="`gsl-config --libs` ${LDFLAGS_OLD}"

R_LIBS_OLD=$R_LIBS
export R_LIBS_OLD
export R_LIBS=$CONDA_PREFIX/lib/R/library/

R_LIBS_USER_OLD=$R_LIBS_USER
export R_LIBS_USER_OLD
export R_LIBS_USER=$R_LIBS

