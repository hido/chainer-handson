#!/bin/bash
# Download .deb file for CUDA
curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
rm cuda-repo-ubuntu1404_7.5-18_amd64.deb

# Update & Upgrade
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get clean

# Install DRM module and CUDA
sudo apt-get install -y linux-image-extra-`uname -r` linux-headers-`uname -r` linux-image-`uname -r`
sudo apt-get install -y cuda
sudo apt-get clean

# Set environmental variables
echo "export PATH=/usr/local/cuda/bin:\$PATH" >>  $HOME/.bash_profile
echo "export CPATH=/usr/local/cuda/include:\$CPATH" >> $HOME/.bash_profile
echo "export LIBRARY_PATH=/usr/local/cuda/lib64:\$LIBRARY_PATH" >> $HOME/.bash_profile
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:\$LD_LIBRARY_PATH" >> $HOME/.bash_profile
source $HOME/.bash_profile
