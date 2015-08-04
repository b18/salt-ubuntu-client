/usr/bin/salt-call --local state.highstate:
  cron.present:
    - user: root
    - minute: 0

{% if grains['nodename'] != 'default' %}
cd /srv/salt && git fetch origin && git reset --hard origin/master:
  cron.present:
    - user: root
    - minute: 50
{% endif %}
