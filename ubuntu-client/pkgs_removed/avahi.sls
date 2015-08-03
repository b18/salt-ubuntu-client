# Removes all games that come loaded on
# Ubuntu by default

avahi-daemon:
  pkg.removed:
    - name: avahi-daemon

