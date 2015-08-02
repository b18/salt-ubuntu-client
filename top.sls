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
    - ubuntu-client.pkgs.python-gpgme
    - ubuntu-client.pkgs.python-software-properties

    # System Config
    - ubuntu-client.system.sysctl
