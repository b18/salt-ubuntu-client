/etc/salt/minion:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://ubuntu-client/files/etc/salt/minion
    - user: root
    - group: root
    - mode: 644
