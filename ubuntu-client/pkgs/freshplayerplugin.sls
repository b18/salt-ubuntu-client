# <--STEP ONE-->
# FreshPlayer Plugin Signing Key
freshplayerplugin.key:
   cmd:
    - run
    - name: 'wget -q "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x531EE72F4C9D234C" -O- | sudo apt-key add -'
    - unless: 'apt-key list | grep nilarimogard_ubuntu_webupd8'

# <--STEP TWO-->
# FreshPlayer Plugin Repo
/etc/apt/sources.list.d/freshplayerplugin.list:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
{% if grains['osfinger'] == 'Ubuntu-15.10' %} # If Ubuntu 15.10 (Wily Werewolf)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/freshplayerplugin-15.10.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-15.04' %} # If Ubuntu 15.04 (Vivid Vervet)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/freshplayerplugin-15.04.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-14.04' %} # If Ubuntu 14.04 (Trusty Tahr)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/freshplayerplugin-14.04.list
{% endif %}
    - require:
      - cmd: freshplayerplugin.key
      - file: /etc/apt/sources.list.d/nilarimogard-ubuntu-webupd8-wily.list #TEMPORARY
      - file: /etc/apt/sources.list.d/nilarimogard-ubuntu-webupd8-vivid.list #TEMPORARY
      - file: /etc/apt/sources.list.d/nilarimogard-ubuntu-webupd8-trusty.list #TEMPORARY

# <--STEP THREE-->
# Install FreshPlayer Plugin
freshplayerplugin:
  pkg.latest:
    - name: freshplayerplugin
    - require:
      - file: /etc/apt/sources.list.d/freshplayerplugin.list

# <--STEP FOUR-->
# Clean up old files (Temporary for rewrite of module)
/etc/apt/sources.list.d/nilarimogard-ubuntu-webupd8-wily.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/nilarimogard-ubuntu-webupd8-wily.list

/etc/apt/sources.list.d/nilarimogard-ubuntu-webupd8-vivid.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/nilarimogard-ubuntu-webupd8-vivid.list

/etc/apt/sources.list.d/nilarimogard-ubuntu-webupd8-trusty.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/nilarimogard-ubuntu-webupd8-trusty.list
