b18/ubuntu-client-salt
==============

###Notes###
This is a repository that configures a standalone Salt-Minion (masterless) on Ubuntu for the purpose of system configuration and
packages that should be installed. I built this for myself in order to simplify the process of building or re-building Ubuntu
clients, but anyone is welcome to use it.

Most packages here will run on any version of Ubuntu, but a few of the packages require third-party or custom repositories, and
these have only been configured to match the latest regular and LTS releases: Ubuntu 14.04 (Trusty Tahr) and Ubuntu 15.04 (Vivid Vervet).
If anyone using this repository wishes for me to add other Ubuntu versions, please let me know, and I'll add these as time allows.

###Prerequisite Software###
To get started, you'll need to install the applications "Git" and "Salt-Minion".

Install Git first:
> \# sudo apt-get install git

Then, add the SaltStack repository:
> \# sudo add-apt-repository ppa:saltstack/salt

When prompted to hit Enter to continue, do so. Next, you'll need to refresh the apt-get cache:
> \# sudo apt-get update

Then, install salt-minion:
> \# sudo apt-get install salt-minion

Lastly, stop the Salt-Minion daemon & remove from startup. The daemon is in no way needed for a standalone minion:
> \# sudo service salt-minion stop
> \# sudo update-rc.d salt-minion remove
