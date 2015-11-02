# <--STEP ONE-->
# Java Signing Key
java.key:
   cmd:
    - run
    - name: 'wget -q "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0xC2518248EEA14886" -O- | sudo apt-key add -'
    - unless: 'apt-key list | grep java'

# <--STEP TWO-->
# Java Repo
/etc/apt/sources.list.d/java.list:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
{% if grains['osfinger'] == 'Ubuntu-15.10' %} # If Ubuntu 15.10 (Wily Werewolf)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/java-15.10.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-15.04' %} # If Ubuntu 15.04 (Vivid Vervet)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/java-15.04.list
{% endif %}
{% if grains['osfinger'] == 'Ubuntu-14.04' %} # If Ubuntu 14.04 (Trusty Tahr)
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/java-14.04.list
{% endif %}
    - require:
      - cmd: java.key
      - file: /etc/apt/sources.list.d/webupd8team-ubuntu-java-wily.list #TEMPORARY
      - file: /etc/apt/sources.list.d/webupd8team-ubuntu-java-vivid.list #TEMPORARY
      - file: /etc/apt/sources.list.d/webupd8team-ubuntu-java-trusty.list #TEMPORARY

# <--STEP THREE-->
# Accept Oracle licenses
oracle-java8-license:
   cmd:
    - run
    - name: echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    - unless: dpkg -l | grep oracle-java8-installer
    - require:
      - file: /etc/apt/sources.list.d/java.list

# <--STEP FOUR-->
# Install Java
oracle-java8-installer:
  pkg.latest:
    - name: oracle-java8-installer
    - require:
      - cmd: oracle-java8-license

# <--STEP FIVE-->
# Clean up old files (Temporary for rewrite of module)
/etc/apt/sources.list.d/webupd8team-ubuntu-java-wily.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/webupd8team-ubuntu-java-wily.list

/etc/apt/sources.list.d/webupd8team-ubuntu-java-vivid.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/webupd8team-ubuntu-java-vivid.list

/etc/apt/sources.list.d/webupd8team-ubuntu-java-trusty.list:
  file:
    - absent
    - name: /etc/apt/sources.list.d/webupd8team-ubuntu-java-trusty.list
