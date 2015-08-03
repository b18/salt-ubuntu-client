/usr/bin/salt-call --local state.highstate:
  cron.present:
    - user: root
    - minute: 0
