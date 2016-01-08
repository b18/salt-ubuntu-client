unattended-upgrades:
  pkg.installed:
    - name: unattended-upgrades

/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - name: /etc/apt/apt.conf.d/50unattended-upgrades
    - source: salt://ubuntu-client/files/etc/apt/apt.conf.d/50unattended-upgrades
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: unattended-upgrades

/etc/apt/apt.conf.d/20auto-upgrades:
  file.managed:
    - name: /etc/apt/apt.conf.d/20auto-upgrades
    - source: salt://ubuntu-client/files/etc/apt/apt.conf.d/20auto-upgrades
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: unattended-upgrades
