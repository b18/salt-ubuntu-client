# Install Pac Manager & requirements

# Install Latest Pac Manager if not already installed
pac:
   cmd:
    - run
    - name: 'dpkg -i /srv/salt/ubuntu-client/media/pac-4.5.5.7-all.deb'
    - unless: 'dpkg -l pac | grep 4.5.5.7'

# Allows serial USB connections
cu:
  pkg.installed:
    - name: cu

# Remote desktop client used by Pac Manager
rdesktop:
  pkg.installed:
    - name: rdesktop
