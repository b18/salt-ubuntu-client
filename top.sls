# Salt Top Config
# Remove the comment (#) before any of the lines
# beginning with a dash (-) if you wish to enable
# the relevant package, config, or setting.

base:

  '*':
    # Packages
    - ubuntu-client.pkgs.google-chrome-stable
    - ubuntu-client.pkgs.htop
    - ubuntu-client.pkgs.keepass
    - ubuntu-client.pkgs.nmap
    - ubuntu-client.pkgs.owncloud-client
    - ubuntu-client.pkgs.pac
    - ubuntu-client.pkgs.python-gpgme
    - ubuntu-client.pkgs.python-software-properties
    - ubuntu-client.pkgs.traceroute
    - ubuntu-client.pkgs.ufw
    - ubuntu-client.pkgs.vpnc
    - ubuntu-client.pkgs.wireshark

    # Packages Removed
    - ubuntu-client.pkgs_removed.avahi
    - ubuntu-client.pkgs_removed.games
    - ubuntu-client.pkgs_removed.web-chat

    # System Config
    - ubuntu-client.system.cron-highstate
    - ubuntu-client.system.lightdm
    - ubuntu-client.system.minion-config
    - ubuntu-client.system.sysctl
