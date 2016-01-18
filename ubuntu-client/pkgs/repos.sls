repo.jtaylor.keepass:
  pkgrepo.managed:
    - humanname: ppa:jtaylor/keepass
    - name: deb http://ppa.launchpad.net/jtaylor/keepass/ubuntu {{ salt['grains.get']('oscodename') }} main
    - dist: {{ salt['grains.get']('oscodename') }}
    - file: /etc/apt/sources.list.d/jtaylor.keepass.list
    - keyid: 58B80F90
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: pkg-installed # Keepass2

repo.libreoffice.libreoffice-5-0:
  pkgrepo.managed:
    - humanname: ppa:libreoffice/libreoffice-5-0
    - name: deb http://ppa.launchpad.net/libreoffice/libreoffice-5-0/ubuntu {{ salt['grains.get']('oscodename') }} main
    - dist: {{ salt['grains.get']('oscodename') }}
    - file: /etc/apt/sources.list.d/libreoffice.libreoffice-5-0.list
    - keyid: 1378B444
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: pkg-installed # Libreoffice

repo.nilarimogard.webupd8:
  pkgrepo.managed:
    - humanname: ppa:nilarimogard/webupd8
    - name: deb http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu {{ salt['grains.get']('oscodename') }} main
    - dist: {{ salt['grains.get']('oscodename') }}
    - file: /etc/apt/sources.list.d/nilarimogard.webupd8.list
    - keyid: 4C9D234C
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: pkg-latest # FreshPlayerPlugin

repo.webupd8team.java:
  pkgrepo.managed:
    - humanname: ppa:webupd8team/java
    - name: deb http://ppa.launchpad.net/webupd8team/java/ubuntu {{ salt['grains.get']('oscodename') }} main
    - dist: {{ salt['grains.get']('oscodename') }}
    - file: /etc/apt/sources.list.d/webupd8team.java.list
    - keyid: EEA14886
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: pkg-latest # Java 8 JRE

# Google Chrome
google.key:
   cmd.run:
     - name: 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - '
     - unless: 'apt-key list | grep Google' # Already installed
/etc/apt/sources.list.d/google-chrome.list:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/google-chrome.list
    - require:
      - cmd: google.key
    - require_in:
      - pkg: pkg-latest # Google-Chome-Stable

# SaltStack
saltstack.key:
   cmd.run:
     - name: 'wget -O - https://repo.saltstack.com/apt/ubuntu/ubuntu14/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -'
     - unless: apt-key list | grep "SaltStack Packaging Team"
/etc/apt/sources.list.d/saltstack.list:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/saltstack-{{ salt['grains.get']('osrelease') }}.list
    - require:
      - cmd: saltstack.key
    - require_in:
      - pkg: pkg-installed # Salt-Minion

# VirtualBox
virtualbox.key:
   cmd.run:
     - name: 'wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -'
     - unless: 'apt-key list | grep VirtualBox'
/etc/apt/sources.list.d/virtualbox.list:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/virtualbox-{{ salt['grains.get']('osrelease') }}.list
    - require:
      - cmd: virtualbox.key
