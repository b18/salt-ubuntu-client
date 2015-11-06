# Install Pac Manager & requirements

# Install Latest Pac Manager if not already installed
pac:
   cmd:
    - run
    - name: 'dpkg -i /srv/salt/ubuntu-client/media/pac-4.5.5.7-all.deb'
    - unless: 'dpkg -l pac | grep 4.5.5.7'

# Pac app
#pac:
#  pkg.installed:
#    - name: pac
#    - sources:
#      - file: salt://ubuntu-client/media/pac-4.5.5.7-all.deb

cu:
  pkg.installed:
    - name: cu

rdesktop:
  pkg.installed:
    - name: rdesktop
