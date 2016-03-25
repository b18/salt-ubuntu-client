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

virtualbox:
  pkg.installed:
    - name: virtualbox
    - require:
      - file: /etc/apt/sources.list.d/virtualbox.list
