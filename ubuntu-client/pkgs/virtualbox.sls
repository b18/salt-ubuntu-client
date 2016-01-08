# <--STEP ONE-->
# Oracle Virtualbox Signing Key
virtualbox.key:
   cmd:
    - run
    - name: 'wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -'
    - unless: 'apt-key list | grep VirtualBox'

# <--STEP TWO-->
# Virtualbox Repo
/etc/apt/sources.list.d/virtualbox.list:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
{% if grains['osfinger'] == 'Ubuntu-15.10' %} # If Ubuntu 15.10 (Wily Werewolf)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/virtualbox-15.10.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-15.04' %} # If Ubuntu 15.04 (Vivid Vervet)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/virtualbox-15.04.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-14.04' %} # If Ubuntu 14.04 (Trusty Tahr)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/virtualbox-14.04.list
{% endif %}
    - require:
      - cmd: virtualbox.key

# <--STEP THREE-->
# Install Virtualbox 5.0
#virtualbox-5.0:
#  pkg.installed:
#    - name: virtualbox-5.0
#    - require:
#      - file: /etc/apt/sources.list.d/virtualbox.list
