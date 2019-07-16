#!/bin/bash

# check for system variables
if [ -z $HOME_FOLDER ]; then
    HOME_FOLDER=/opt/
    echo -e "INFO: setting \$HOME_FOLDER to $HOME";
fi
if [ -z $USER_NAME ]; then
    USER_NAME=`whoami`
    echo -e "INFO: setting \$USER_NAME to `whoami`";
fi

# install sslyze
if ! type "sslyze" > /dev/null 2>&1; then
    cd $GAUNTLT_DIR/vendor/sslyze
    pip install -r requirements.txt
    ln -s `pwd`/sslyze_cli.py /usr/bin/sslyze
fi

# install Go, Heartbleed
if ! type "Heartbleed" > /dev/null 2>&1; then
    go get github.com/FiloSottile/Heartbleed
fi

# install dirb
if ! type "dirb" > /dev/null 2>&1; then
	wget -q http://www6.atomicorp.com/channels/atomic/fedora/30/x86_64/RPMS/dirb-222-6934.fc30.art.x86_64.rpm
	rpm -ivh dirb-222-6934.fc30.art.x86_64.rpm
	cd /opt ; git clone https://github.com/v0re/dirb.git
fi
export DIRB_WORDLISTS=`find / -iname dirb | grep "/dirb/wordlists$"`

# install Garmr, from source
if ! type "garmr" > /dev/null 2>&1; then
    cd $GAUNTLT_DIR/vendor/Garmr
    mkdir -p /usr/local/lib/python2.7/dist-packages/
    python setup.py install
fi

# set the environmental variables
export SSLYZE_PATH=`which sslyze`
export SQLMAP_PATH=`which sqlmap`

# save environmental variables to .bashrc
cat << EOF >> $HOME_FOLDER/.bashrc

# configure environmental variables for Gauntlt
export DIRB_WORDLISTS=`find / -iname dirb | grep "/dirb/wordlists$"`
export SSLYZE_PATH=`which sslyze`
export SQLMAP_PATH=`which sqlmap`
EOF
