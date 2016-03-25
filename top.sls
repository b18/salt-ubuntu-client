base:

  '*':
    - ubuntu-client.pkgs.installed.libreoffice
    - ubuntu-client.pkgs.installed.miscellaneous
    - ubuntu-client.pkgs.installed.pac
    - ubuntu-client.pkgs.installed.salt-minion
    - ubuntu-client.pkgs.installed.virtualbox
    - ubuntu-client.pkgs.latest.freshplayerplugin
    - ubuntu-client.pkgs.latest.google-chrome
    - ubuntu-client.pkgs.removed # Removed pkgs
    - ubuntu-client.system.cron # Cron settings
    - ubuntu-client.system.privacy # Privacy settings
    - ubuntu-client.system.security # Security settings
