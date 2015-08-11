iptables:
  pkg.installed:
    - name: iptables

ipset:
  pkg.installed:
    - name: ipset

/etc/iptables.sh:
  file.managed:
    - name: /etc/iptables.sh
    - source: salt://ubuntu-client/files/etc/iptables.sh
    - user: root
    - group: root
    - mode: 744
    - require:
      - pkg: iptables
      - pkg: ipset

iptables_enforce:
   cmd:
    - run
    - name: cd /etc/ && ./iptables.sh
    - unless: iptables -L | grep "match-set geoblock dst"
    - require:
      - file: /etc/iptables.sh
