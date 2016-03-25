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

salt-minion:
  pkg.installed:
    - name: salt-minion
    - require:
      - file: /etc/apt/sources.list.d/saltstack.list
