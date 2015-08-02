sysctl_config:
  file.managed:
    - name: /etc/sysctl.conf
    - source: salt://ubuntu-client/files/etc/sysctl.conf
    - user: root
    - group: root
    - mode: 644

# <--Reload SysCtl if conf file changes-->
sysctl_reload:
  cmd.wait:
    - name: sysctl -p
    - watch:
      - file: sysctl_config
