#!/bin/bash

# Install Juppyter
sudo apt-get -y build-dep python-matplotlib
cd chainer-handson
pip uninstall --user pyparsing
pip install --user pyparsing=="1.5.7" pydot matplotlib
pip install --user -U jupyter
echo "export PATH=$HOME/.local/bin:\$PATH" >> $HOME/.bash_profile
source $HOME/.bash_profile
jupyter notebook --generate-config
cd $HOME/.jupyter/
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj "/C=US/ST=California/L=./O=./CN=." -keyout mykey.key -out mycert.pem
echo "c = get_config()" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.IPKernelApp.pylab = 'inline'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.certfile = u'$HOME/.jupyter/mycert.pem'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.keyfile = u'$HOME/.jupyter/mykey.key'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '*'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = u'sha1:059992789265:2e6f948e2326288b4ae40055591ae686a6c1b33c'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 8888" >> $HOME/.jupyter/jupyter_notebook_config.py
