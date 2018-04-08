# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # uncomment to forward vm port 80 to localhost:8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  # this provisioner sets the VM up to be able to 'make test'
  # and gets the current sources for weewx from github
  #   (note 'root' is used for the db master password - do not use on a production system)
  #
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update  -y
    apt-get install -y git
    apt-get install -y sqlite3 lynx wget curl procps nginx ntp make
    apt-get install -y python-minimal
    apt-get install -y python-configobj python-cheetah python-serial python-usb python-dev
    apt-get install -y python-pil
    apt-get install -y python-pip python-mock python-ephem
    debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password       password root"
    debconf-set-selections <<< "mysql-server-5.7 mysql-server/root_password_again password root"
    apt-get install -y mysql-server-5.7
    apt-get install -y mysql-client python-mysqldb
  SHELL

  # expose this directory as /vagrant within the VM
  #   debian vagrant boxes likely will need this nest line commented out
  #   as they don't seem to have Virtual Box guest additions working always
  config.vm.synced_folder ".", "/vagrant"

  # this provisioner sets up git-prompt (optional)
  config.vm.provision :shell, path: "provision-git-prompt.sh"

  # this provisioner just prints some instructions
  config.vm.provision "shell", inline: <<-SHELL
    echo "-------------------"
    echo "to download and test weewx:"
    echo "   vagrant ssh"
    echo "   git clone https://github.com/weewx/weewx.git /tmp/weewx"
    echo "   cd /tmp/weewx"
    echo "   git checkout development"
    echo "   make test-setup"
    echo "   make test"
    echo "-------------------"
  SHELL

end



