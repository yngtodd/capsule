#!/bin/sh
set -ex

# Module for Newer versions of Swig
# Author: Todd Young (03 July 2018)

source /sw/summitdev/init/profile

PKGNAME=swig
PKGVER=3.0.12

BSECMODULEDIR=/gpfs/alpinetds/proj-shared/csc276/modules
PKGDIR=${BSECMODULEDIR}/$PKGNAME
DISTDIR=$PKGDIR/dist
INSTDIR=$PKGDIR/$PKGVER

LIBEVENTVER=3.0.12
LIBEVENTSRCDIR=$PKGDIR/${LIBEVENTVER}
LIBEVENTTARBALL=${PKGNAME}-${PKGVER}.tar.gz

mkdir -p $DISTDIR
mkdir -p $LIBEVENTSRCDIR
mkdir -p $INSTDIR

# Load modules for building
module restore
module load cmake gcc python/3.6.4
module list

wget https://downloads.sourceforge.net/${PKGNAME}/${LIBEVENTTARBALL}

tar -zxf $LIBEVENTTARBALL
cd ${PKGNAME}-${PKGVER}
./configure --prefix=$INSTDIR
make && make install
