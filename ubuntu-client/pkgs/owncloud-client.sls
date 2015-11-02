# <--STEP ONE-->
# OwnCloud-Client Signing Key
owncloud.key:
   cmd:
    - run
{% if grains['osfinger'] == 'Ubuntu-15.10' %} # If Ubuntu 15.10 (Wily Werewolf)
    - name: 'wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/xUbuntu_15.10/Release.key | sudo apt-key add -'
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-15.04' %} # If Ubuntu 15.04 (Vivid Vervet)
    - name: 'wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/xUbuntu_15.04/Release.key | sudo apt-key add -'
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-14.04' %} # If Ubuntu 14.04 (Trusty Tahr)
    - name: 'wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/xUbuntu_14.04/Release.key | sudo apt-key add -'
{% endif %}
    - unless: 'apt-key list | grep ownCloud'

# <--STEP TWO-->
# OwnCloud-Client Repo
/etc/apt/sources.list.d/owncloud-client.list:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
{% if grains['osfinger'] == 'Ubuntu-15.10' %} # If Ubuntu 15.10 (Wily Werewolf)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/owncloud-client-15.10.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-15.04' %} # If Ubuntu 15.04 (Vivid Vervet)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/owncloud-client-15.04.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-14.04' %} # If Ubuntu 14.04 (Trusty Tahr)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/owncloud-client-14.04.list
{% endif %}
    - require:
      - cmd: owncloud.key

# <--STEP THREE-->
# Install OwnCloud-Client
owncloud-client:
  pkg.installed:
    - name: owncloud-client
    - require:
      - file: /etc/apt/sources.list.d/owncloud-client.list
