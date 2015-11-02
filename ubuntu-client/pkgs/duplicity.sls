# <--STEP ONE-->
# Duplicity Signing Key
duplicity.key:
   cmd:
    - run
    - name: 'wget -q "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x8F571BB27A86F4A2" -O- | sudo apt-key add -'
    - unless: 'apt-key list | grep duplicity'

# <--STEP TWO-->
# Duplicity Repo
/etc/apt/sources.list.d/duplicity.list:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
{% if grains['osfinger'] == 'Ubuntu-15.10' %} # If Ubuntu 15.10 (Wily Werewolf)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/duplicity-15.10.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-15.04' %} # If Ubuntu 15.04 (Vivid Vervet)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/duplicity-15.04.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-14.04' %} # If Ubuntu 14.04 (Trusty Tahr)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/duplicity-14.04.list
{% endif %}
    - require:
      - cmd: duplicity.key
      - file: /etc/apt/sources.list.d/duplicity-team-ubuntu-ppa-wily.list #TEMPORARY
      - file: /etc/apt/sources.list.d/duplicity-team-ubuntu-ppa-vivid.list #TEMPORARY
      - file: /etc/apt/sources.list.d/duplicity-team-ubuntu-ppa-trusty.list #TEMPORARY

# <--STEP THREE-->
# Install Duplicity
duplicity:
  pkg.latest:
    - name: duplicity
    - require:
      - file: /etc/apt/sources.list.d/duplicity.list

# <--STEP FOUR-->
# Clean up old files (Temporary for rewrite of module)
/etc/apt/sources.list.d/duplicity-team-ubuntu-ppa-wily.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/duplicity-team-ubuntu-ppa-wily.list

/etc/apt/sources.list.d/duplicity-team-ubuntu-ppa-vivid.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/duplicity-team-ubuntu-ppa-vivid.list

/etc/apt/sources.list.d/duplicity-team-ubuntu-ppa-trusty.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/duplicity-team-ubuntu-ppa-trusty.list
