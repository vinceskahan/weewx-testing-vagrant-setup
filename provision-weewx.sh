#!/bin/bash

# learn what's where
apt-get update  -y

# uncoment to catch up to current (might be slow)
# apt-get upgrade -y

# minimum packages needed to run weewx simulator
apt-get install -y sqlite3 wget curl procps nginx ntp lynx
apt-get install -y python-minimal python-configobj python-cheetah
apt-get install -y python-serial python-usb python-dev python-pil

# these are needed to run the test suite
apt-get install -y mysql-client python-mysqldb
apt-get install -y git make python-pip python-mock python-ephem

# lastly the mysql server requires some custom setup
#   - note the 'very poor' default root passowrd for mysql (do not use on a real system)
#
debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password       password root"
debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password_again password root"
apt-get install -y mysql-server-5.7
