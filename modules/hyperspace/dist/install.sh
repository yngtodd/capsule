#!/bin/sh

# Module for distributed Bayesian optimization.
# Author: Todd Young (March 29, 2018)

source /sw/summit/init/profile

# Install location
INSTDIR=/gpfs/alpinetds/proj-shared/csc276/modules/hyperspace/0.2

# Load modules for building
module restore
module load python/3.6.4 spectrum-mpi/10.2.0.0-20180110
module list

# emulate loading the module
export PATH=$INSTDIR/bin:$PATH
export LD_LIBRARY_PATH=$INSTDIR/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$INSTDIR/lib/python3.6/site-packages:$PYTHONPATH

# checkout hyperspace
git clone https://github.com/yngtodd/hyperspace.git

# install
cd hyperspace
python setup.py install --prefix=$INSTDIR
