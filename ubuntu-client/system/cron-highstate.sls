/usr/bin/salt-call --local state.highstate > /tmp/last_highstate:
  cron.present:
    - user: root
    - minute: 0
