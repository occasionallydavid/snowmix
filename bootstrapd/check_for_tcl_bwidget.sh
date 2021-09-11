#!/bin/bash

# Copyright 2020 - Peter Maersk-Moller

BWIDGET_VERSION=1.9.14

if [ "X$BASH" != X ] ; then
  echo="echo -e"
else
  echo=echo
fi

DESTDIR=$1

echo "Checking for tclsh and BWidget"

tclsh=`which tclsh`
if [ X$tclsh = X ] ; then
  $echo "\nNo tclsh in path $PATH"
  $echo "You will need to manually install tclsh to finish bootstrap script."
  $echo "Press return to exit \c"
  read reply
fi
  
if tclsh bootstrapd/check_for_tcl_package.tcl BWidget 2>/dev/null ; then
  $echo "\nYou have BWidget for tcl installed. Good."
else
  if [ X$DESTDIR = X ] ; then DESTDIR=/usr/lib ; fi
  $echo "\nYou do not have BWidget for tcl installed. BWidget is needed for Snowmix GUI tools."
  $echo "Do you you want to download and install BWidget$BWIDGET_VERSION into $DESTDIR/bwidget-$BWIDGET_VERSION (Y/N) ? \c"
  read reply
  if [ "X$reply" = XY -o "X$reply" = Xy ] ; then
    echo wget -O bwidget-$BWIDGET_VERSION.tar.gz "https://downloads.sourceforge.net/project/tcllib/BWidget/$BWIDGET_VERSION/bwidget-$BWIDGET_VERSION.tar.gz?r=&ts="`date -u '+%s'`
    wget -O bwidget-$BWIDGET_VERSION.tar.gz "https://downloads.sourceforge.net/project/tcllib/BWidget/$BWIDGET_VERSION/bwidget-$BWIDGET_VERSION.tar.gz?r=&ts="`date -u '+%s'`
    if [ ! -f bwidget-$BWIDGET_VERSION.tar.gz ] ; then
      $echo "ERROR. Failed to download BWidget. Press return to continue \c"
    else
      $echo "Installing BWidget-$BWIDGET_VERSION"
      dir=`pwd`
      pushd $DESTDIR
      sudo tar -xzvf $dir/bwidget-$BWIDGET_VERSION.tar.gz
      popd
      rm bwidget-$BWIDGET_VERSION.tar.gz
    fi
  fi
fi
$echo "Press return to continue \c"
read reply
