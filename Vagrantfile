# -*- mode: ruby -*-
# vi: set ft=ruby :

#---------- start editing here ------


BOX_BASE = "ubuntu/xenial64"            # required
BOX_RAM  = "1024"                       # required

SETUP_GIT_USER   = "1"                  # optional, comment it out to skip this
GIT_USER_NAME    = "Vince Skahan"       # required if SETUP_GIT_USER defined
GIT_USER_EMAIL   = "vince@skahan.net"   # required if SETUP_GIT_USER defined

FORWARD_WEB_SERVER = "1"                # optional, comment it out to skip this
FORWARD_WEB_GUEST  = "80"               # required if FORWARD_WEB_SERVER defined
FORWARD_WEB_HOST   = "8080"             # required if FORWARD_WEB_SERVER defined

SYNCH_VAGRANT_DIR    = "1"              # optional, comment it out to skip this
SYNCHED_FOLDER_HOST  = "."              # required if SYNC_VAGRANT_DIR defined
SYNCHED_FOLDER_GUEST = "/vagrant"       # required if SYNC_VAGRANT_DIR defined

WEEWX_PROVISIONER_SCRIPT      = "provision-weewx.sh"       # required
GIT_PROMPT_PROVISIONER_SCRIPT = "provision-git-prompt.sh"  # opional, comemnt it out to skip this


#---------- stop editing here ------

Vagrant.configure("2") do |config|

  config.vm.box = BOX_BASE

  config.vm.provider "virtualbox" do |vb|
    vb.memory = BOX_RAM
  end

  # forward the web ports to the host os
  if defined? FORWARD_WEB_SERVER
    config.vm.network "forwarded_port", guest: FORWARD_WEB_GUEST, host: FORWARD_WEB_HOST
  end

  # optionally set up a synched folder to this directory from the guest
  if defined? SYNC_VAGRANT_DIR
    config.vm.synced_folder SYNCHED_FOLDER_HOST, SYNCHED_FOLDER_GUEST
  end

  # set up weewx
  config.vm.provision :shell, path: WEEWX_PROVISIONER_SCRIPT

  # optionally set up git-prompt
  if defined? GIT_PROMPT_PROVISIONER_SCRIPT
     config.vm.provision :shell, path: GIT_PROMPT_PROVISIONER_SCRIPT
  end

  # optionally set up for using git within the vm
  if defined? SETUP_GIT_USER
    config.vm.provision "shell", inline: <<-SHELL
      echo "-----------------------------------------"
      echo " setting up git config global variables"
      echo "-----------------------------------------"
      git config --global user.email GIT_USER_NAME
      git config --global user.name  GIT_USER_EMAIL
    SHELL
  end

  #--  this provisioner just prints some instructions
  config.vm.provision "shell", inline: <<-SHELL
    echo "-----------------------------------------"
    echo "to download and test weewx:"
    echo "   vagrant ssh"
    echo "   git clone https://github.com/weewx/weewx.git /tmp/weewx"
    echo "   cd /tmp/weewx"
    echo "   git checkout development"
    echo "   make test-setup"
    echo "   make test"
    echo "-----------------------------------------"
  SHELL

end


