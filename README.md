## weewx testing setup in Vagrant / Virtual Box

This Vagrantfile and optional provisioner sets up a local VM for running 'make test' on a desired version of weewx.

### Usage:

* clone this repository to a scratch tree
* edit the variables at the top of the Vagrantfile
* vagrant up
* follow the instructions that will be printed for how to clone/test weewx


### Notes:

* these provisioners can 'probably' be used standalone within a vm, assuming use of sudo
* at this writing, you need to 'not' be root to run the weewx test suite successfully

