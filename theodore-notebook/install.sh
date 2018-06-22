#!/bin/bash

# Bootstrap script to install ORBKIT and TheoDORE

# Use conda to install into base environment
conda env update -n=base -f environment.yml
# If installing into a new conda env
# Use: conda env create -f environment.yml
# AND change the SITEPACKAGES var below to that location

## ORBKIT Install
SITEPACKAGES=${SITEPACKAGES:-/opt/conda/lib/python2.7/site-packages}
git clone https://github.com/orbkit/orbkit.git 
mv orbkit $SITEPACKAGES/orbkit 
cd $SITEPACKAGES/orbkit
python setup.py build_ext --inplace cleand
echo './orbkit' > $SITEPACKAGES/orbkit.pth

## TheoDORE Install
cd $HOME
wget https://sourceforge.net/projects/theodore-qc/files/TheoDORE_1.7.2.tgz/download
tar -xf download
chown 1000:100 TheoDORE_1.7.2
rm -rf download work
echo '~/TheoDORE_1.7.2/bin' > ../theodore.pth
echo '~/TheoDORE_1.7.2/lib' >> ../theodore.pth
echo 'source TheoDORE_1.7.2/setpaths.bash' >> ~/.bashrc