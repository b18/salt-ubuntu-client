base:

  '*':
    - ubuntu-client.pkgs.installed # Installed pkgs
    - ubuntu-client.pkgs.latest # Up-to-date pkgs
    - ubuntu-client.pkgs.removed # Removed pkgs
    - ubuntu-client.pkgs.repos # Added Repos
    - ubuntu-client.system.cron # Cron settings
    - ubuntu-client.system.privacy # Privacy settings
    - ubuntu-client.system.security # Security settings
