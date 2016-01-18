# Online search
disable-online-search:
   cmd.run:
     - name: gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
     - unless: gsettings get com.canonical.Unity.Lenses remote-content-search | grep none

# Whoopsie
/etc/whoopsie:
  file.managed:
    - name: /etc/whoopsie
    - user: root
    - group: root
    - mode: 644
    - source: salt://ubuntu-client/files/etc/whoopsie
/etc/init/whoopsie.override:
  file.managed:
    - name: /etc/init/whoopsie.override
    - user: root
    - group: root
    - mode: 644
    - source: salt://ubuntu-client/files/etc/init/whoopsie.override

