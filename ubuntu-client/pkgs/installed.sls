# Install these packages
pkg-installed:
  pkg.installed:
    - pkgs:
      - cu # Serial-USB
      - htop
      - ipset
      - iptables
      - keepass2
      - libreoffice
      - network-manager-vpnc # Cisco VPN
      - nmap
      - python-gpgme
      - python-software-properties
      - rdesktop
      - salt-minion
      - traceroute
      - unattended-upgrades
      - wireshark

# Install PAC Manager from .deb
pac:
   cmd:
    - run
    - name: 'dpkg -i /srv/salt/ubuntu-client/media/pac-4.5.5.7-all.deb'
    - unless: 'dpkg -l pac | grep 4.5.5.7'
