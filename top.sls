# Salt Top Config
# Add a comment (#) symbol before any of the lines
# beginning with a dash (-) if you wish to disable
# the relevant Salt state.

base:

  '*':
    # Packages
    - ubuntu-client.pkgs.duplicity
    - ubuntu-client.pkgs.freshplayerplugin
    - ubuntu-client.pkgs.google-chrome-stable
    - ubuntu-client.pkgs.htop
    - ubuntu-client.pkgs.java
    - ubuntu-client.pkgs.keepass
    - ubuntu-client.pkgs.libreoffice
    - ubuntu-client.pkgs.nmap
    - ubuntu-client.pkgs.owncloud-client
    - ubuntu-client.pkgs.pac
    - ubuntu-client.pkgs.python-gpgme
    - ubuntu-client.pkgs.python-software-properties
    - ubuntu-client.pkgs.salt-minion
    - ubuntu-client.pkgs.traceroute
    - ubuntu-client.pkgs.vpnc
    - ubuntu-client.pkgs.wireshark

    # Packages Removed
    - ubuntu-client.pkgs_removed.avahi
    - ubuntu-client.pkgs_removed.games
    - ubuntu-client.pkgs_removed.ufw
    - ubuntu-client.pkgs_removed.web-chat

    # System Config
    - ubuntu-client.system.cron
    - ubuntu-client.system.iptables
    - ubuntu-client.system.lightdm
    - ubuntu-client.system.sysctl
    - ubuntu-client.system.unattended-upgrades
