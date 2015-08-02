b18/ubuntu-client-salt
==============

###Notes###
This is a repository that configures a standalone Salt-Minion (masterless) on Ubuntu for the purpose of system configuration and
packages that should be installed. I built this for myself in order to simplify the process of building or re-building Ubuntu
clients, but anyone is welcome to use it.

Most packages here will run on any version of Ubuntu, but a few of the packages require third-party or custom repositories, and
these have only been configured to match the latest regular and LTS releases: Ubuntu 14.04 (Trusty Tahr) and Ubuntu 15.04 (Vivid Vervet).
If anyone using this repository wishes for me to add other Ubuntu versions, please let me know, and I'll add these as time allows.

###Prerequisites###
Please complete all prerequisite items before cloning the repository.

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

###Cloning the repository###
Now, it's time to set things up.

First, create the local directory needed, if not already there:
> \# sudo mkdir /srv/salt/

Move into this directory:
> \# cd /srv/salt/

Next, clone this repository into your base Salt directory. (Please note that the /srv/salt/ directory must be empty in order to
proceed:
> \# sudo git clone git@github.com:b18/ubuntu-client-salt

###Using Salt###
Now, you've got your SaltStack directory in place. Before we begin, you'll need to open the file /srv/salt/top.sls and ensure that any
pieces of software that you want to be installed or configured are uncommented in the file.

After doing so, let's enforce a highstate against our client and set up everything that's mentioned in our top.sls:
> \# sudo salt-call --local state.highstate

You should have seen a bunch of stuff happen.. Some software get installed, some configurations happen, etc. One of the other things that
happened, was that a cron task for the 'root' user was created that enforces a high state every hour (at 0 minutes on the clock). So, every
hour moving forward, the configuration in /srv/salt will be applied to machine and enforced, ensuring the software remains installed, and
the configurations in place. If you ever want to manually run Salt and not wait for the Cron job to run, do so with the last command you
ran:
> \# sudo salt-call --local state.highstate

To delete any local changes you've made in /srv/salt, and pull down the latest updates from GitHub for this repository, run the following
commands:
> \# git fetch origin

> \# git reset --hard origin/master
