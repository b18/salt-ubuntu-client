root_crontab:
  cron.file:
{% if grains['nodename'] == 'default' %}
    - name: salt://ubuntu-client/files/root_crontab_master
{% endif %}
{% if grains['nodename'] != 'default' %}
    - name: salt://ubuntu-client/files/root_crontab
{% endif %}
    - user: root

# {% if grains['nodename'] != 'default' %}
# cd /srv/salt && git fetch origin && git reset --hard origin/master:
#   cron.present:
#     - user: root
#     - minute: 50
# {% endif %}
