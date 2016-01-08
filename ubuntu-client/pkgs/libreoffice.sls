# <--STEP ONE-->
# LibreOffice Signing Key
libreoffice.key:
   cmd:
    - run
    - name: 'wget -q "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x83FBA1751378B444" -O- | sudo apt-key add -'
    - unless: 'apt-key list | grep LibreOffice'

# <--STEP TWO-->
# LibreOffice Repo
/etc/apt/sources.list.d/libreoffice-client.list:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
{% if grains['osfinger'] == 'Ubuntu-15.10' %} # If Ubuntu 15.10 (Wily Werewolf)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/libreoffice-15.10.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-15.04' %} # If Ubuntu 15.04 (Vivid Vervet)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/libreoffice-15.04.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-14.04' %} # If Ubuntu 14.04 (Trusty Tahr)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/libreoffice-14.04.list
{% endif %}
    - require:
      - cmd: libreoffice.key
      - file: /etc/apt/sources.list.d/libreoffice-ubuntu-ppa-wily.list #TEMPORARY
      - file: /etc/apt/sources.list.d/libreoffice-ubuntu-ppa-vivid.list #TEMPORARY
      - file: /etc/apt/sources.list.d/libreoffice-ubuntu-ppa-trusty.list #TEMPORARY

# <--STEP THREE-->
# Install LibreOffice
libreoffice:
  pkg.installed:
    - name: libreoffice
    - require:
      - file: /etc/apt/sources.list.d/libreoffice-client.list

# <--STEP FOUR-->
# Clean up old files (Temporary for rewrite of module)
/etc/apt/sources.list.d/libreoffice-ubuntu-ppa-wily.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/libreoffice-ubuntu-ppa-wily.list

/etc/apt/sources.list.d/libreoffice-ubuntu-ppa-vivid.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/libreoffice-ubuntu-ppa-vivid.list

/etc/apt/sources.list.d/libreoffice-ubuntu-ppa-trusty.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/libreoffice-ubuntu-ppa-trusty.list
