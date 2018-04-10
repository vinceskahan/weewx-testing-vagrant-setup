## weewx testing setup in Vagrant / Virtual Box

This Vagrantfile and optional provisioner sets up a local VM for running 'make test' on a desired version of weewx.

### Usage:

* clone this repository to a scratch tree
* edit the variables at the top of the Vagrantfile
* vagrant up
* follow the instructions that will be printed for how to clone/test weewx


### Notes:

* the Vagrantfile uses three provisioners, one to set up a vanilla weewx-testable platform, one to (optionally) install and configure git-prompt, one giving instructions for how to test weewx within the VM.   The git-prompt provisioner is optional, just comment it out if you don't want to use it.

