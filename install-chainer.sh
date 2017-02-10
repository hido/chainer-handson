#!/bin/bash
# Update & Upgrade
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get clean

# Install Chainer
sudo apt-get -y install build-essential python-dev python-pip python-virtualenv libhdf5-dev
source $HOME/.bash_profile
pip install --user -U pip setuptools 
pip install --user numpy
pip install --user chainer=="1.20.0.1"

