# <--STEP ONE-->
# SaltStack Signing Key
saltstack.key:
   cmd:
    - run
    - name: 'wget -O - https://repo.saltstack.com/apt/ubuntu/ubuntu14/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -'
    - unless: apt-key list | grep "SaltStack Packaging Team"

# <--STEP TWO-->
# SaltStack Repo
/etc/apt/sources.list.d/saltstack.list:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
{% if grains['osfinger'] == 'Ubuntu-15.10' %} # If Ubuntu 15.10 (Wily Werewolf)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/saltstack-14.04.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-15.04' %} # If Ubuntu 15.04 (Vivid Vervet)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/saltstack-14.04.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-14.04' %} # If Ubuntu 14.04 (Trusty Tahr)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/saltstack-14.04.list
{% endif %}
    - require:
      - cmd: saltstack.key
      - file: /etc/apt/sources.list.d/saltstack-ubuntu-salt-wily.list #TEMPORARY
      - file: /etc/apt/sources.list.d/saltstack-ubuntu-salt-vivid.list #TEMPORARY
      - file: /etc/apt/sources.list.d/saltstack-ubuntu-salt-trusty.list #TEMPORARY

# <--STEP THREE-->
# Install Salt-Minion
salt-minion:
  pkg.latest:
    - name: salt-minion
    - require:
      - file: /etc/apt/sources.list.d/saltstack.list

# <--STEP FOUR-->
# Salt-Minion stopped
salt-minion-service:
  service.disabled:
  - name: salt-minion
  - require:
    - pkg: salt-minion

# <--STEP FIVE-->
# Clean up old files (Temporary for rewrite of module)
/etc/apt/sources.list.d/saltstack-ubuntu-salt-wily.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/saltstack-ubuntu-salt-wily.list

/etc/apt/sources.list.d/saltstack-ubuntu-salt-vivid.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/saltstack-ubuntu-salt-vivid.list

/etc/apt/sources.list.d/saltstack-ubuntu-salt-trusty.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/saltstack-ubuntu-salt-trusty.list
