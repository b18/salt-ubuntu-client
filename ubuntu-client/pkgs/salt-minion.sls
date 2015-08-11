# <--STEP ONE-->
# ppa:saltstack/salt
saltstack-salt-ppa:
  pkgrepo.managed:
    - ppa: saltstack/salt

# <--STEP TWO-->
# Install salt-minion
salt-minion:
  pkg.latest:
    - name: salt-minion
    - require:
      - pkgrepo: saltstack-salt-ppa

# <--STEP THREE-->
# Salt-Minion stopped
salt-minion-service:
  service.disabled:
  - name: salt-minion
  - require:
    - pkg: salt-minion

# <--STEP FOUR-->
# Configure minion
/etc/salt/minion:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://ubuntu-client/files/etc/salt/minion
    - user: root
    - group: root
    - mode: 644
