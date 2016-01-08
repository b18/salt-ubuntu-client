# <--STEP ONE-->
# KeePass Signing Key
keepass.key:
   cmd:
    - run
    - name: 'wget -q "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x7858088158B80F90" -O- | sudo apt-key add -'
    - unless: 'apt-key list | grep Julian'

# <--STEP TWO-->
# KeePass Repo
/etc/apt/sources.list.d/keepass.list:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
{% if grains['osfinger'] == 'Ubuntu-15.10' %} # If Ubuntu 15.10 (Wily Werewolf)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/keepass-15.10.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-15.04' %} # If Ubuntu 15.04 (Vivid Vervet)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/keepass-15.04.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-14.04' %} # If Ubuntu 14.04 (Trusty Tahr)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/keepass-14.04.list
{% endif %}
    - require:
      - cmd: keepass.key
      - file: /etc/apt/sources.list.d/jtaylor-ubuntu-keepass-wily.list #TEMPORARY
      - file: /etc/apt/sources.list.d/jtaylor-ubuntu-keepass-vivid.list #TEMPORARY
      - file: /etc/apt/sources.list.d/jtaylor-ubuntu-keepass-trusty.list #TEMPORARY

# <--STEP THREE-->
# Install KeePass	
keepass2:
  pkg.installed:
    - name: keepass2
    - require:
      - file: /etc/apt/sources.list.d/keepass.list

# <--STEP FOUR-->
# Clean up old files (Temporary for rewrite of module)
/etc/apt/sources.list.d/jtaylor-ubuntu-keepass-wily.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/jtaylor-ubuntu-keepass-wily.list

/etc/apt/sources.list.d/jtaylor-ubuntu-keepass-vivid.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/jtaylor-ubuntu-keepass-vivid.list

/etc/apt/sources.list.d/jtaylor-ubuntu-keepass-trusty.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/jtaylor-ubuntu-keepass-trusty.list
