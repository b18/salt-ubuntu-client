repo.nilarimogard.webupd8:
  pkgrepo.managed:
    - humanname: ppa:nilarimogard/webupd8
    - name: deb http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu {{ salt['grains.get']('oscodename') }} main
    - dist: {{ salt['grains.get']('oscodename') }}
    - file: /etc/apt/sources.list.d/nilarimogard.webupd8.list
    - keyid: 4C9D234C
    - keyserver: keyserver.ubuntu.com

freshplayerplugin:
  pkg.latest:
    - name: freshplayerplugin
    - refresh: True
