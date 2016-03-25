# Install PAC Manager from .deb
pac:
   cmd:
    - run
    - name: 'dpkg -i /srv/salt/ubuntu-client/media/pac-4.5.5.7-all.deb'
    - unless: 'dpkg -l pac | grep 4.5.5.7'
