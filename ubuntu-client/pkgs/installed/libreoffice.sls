repo.libreoffice.libreoffice-5-0:
  pkgrepo.managed:
    - humanname: ppa:libreoffice/libreoffice-5-0
    - name: deb http://ppa.launchpad.net/libreoffice/libreoffice-5-0/ubuntu {{ salt['grains.get']('oscodename') }} main
    - dist: {{ salt['grains.get']('oscodename') }}
    - file: /etc/apt/sources.list.d/libreoffice.libreoffice-5-0.list
    - keyid: 1378B444
    - keyserver: keyserver.ubuntu.com

libreoffice-5-0:
  pkg.installed:
    - name: libreoffice
    - refresh: True
