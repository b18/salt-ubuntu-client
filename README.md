b18/ubuntu-client-salt
==============

###Notes###
Most packages here will run on any version of Ubuntu, but a few of the packages require third-party or custom repositories, and
these have only been configured to match the latest regular and LTS releases: Ubuntu 14.04 (Trusty Tahr) and Ubuntu 15.04 (Vivid Vervet).
If anyone using this repository wishes for me to add other Ubuntu versions, please let me know, and I'll add these as time allows.

###Prerequisites###
To get started, you'll need to install the applications "Git" and "Salt-Minion".

Install Git first:
> \# sudo apt-get install git

Then, add the SaltStack repository:
> \# sudo add-apt-repository ppa:saltstack/salt

When prompted to hit Enter to continue, do so. Next, you'll need to refresh the apt-get cache:
> \# sudo apt-get update

And finally, install salt-minion:
> \# sudo apt-get install salt-minion
