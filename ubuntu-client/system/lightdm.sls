# LightDM Config

/usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf:
  file.managed:
    - name: /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
    - source: salt://ubuntu-client/files/usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
    - user: root
    - group: root
    - mode: 644

/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf:
  file.managed:
    - name: /usr/share/lightdm/lightdm.conf.d/50-no-guest.conf
    - source: salt://ubuntu-client/files/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf
    - user: root
    - group: root
    - mode: 644
