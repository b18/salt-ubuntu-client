# UFW Config
# Install, enable, & deny all incoming connections

# ufw - installed
ufw:
  pkg.installed:
    - name: ufw

# ufw - enable
ufw-enable:
   cmd:
    - run
    - name: 'ufw enable'
    - unless: 'ufw status | grep active'
    - require:
      - pkg: ufw

# ufw - disable inbound connections
ufw-deny-incoming:
   cmd:
    - run
    - name: 'ufw default deny incoming'
    - unless: 'iptables -L INPUT | grep policy\ DROP'
    - require:
      - cmd: ufw-enable
