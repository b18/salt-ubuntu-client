/etc/sysctl.conf:
  file.managed:
    - name: /etc/sysctl.conf
    - source: salt://ubuntu-client/files/etc/sysctl.conf
    - user: root
    - group: root
    - mode: 644

# Reload sysctl if config file changes
sysctl_reload:
  cmd.wait:
    - name: sysctl -p
    - watch:
      - file: /etc/sysctl.conf
