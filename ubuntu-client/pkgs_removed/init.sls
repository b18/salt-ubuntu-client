# Remove packages that I don't use/need/want.

pkg-removed-games:
  pkg.removed:
    - pkgs:
      - aisleriot
      - gnome-mahjongg
      - gnome-mines
      - gnome-sudoku
      - gnomine

pkgs-removed-media:
  pkg.removed:
    - pkgs:
      - account-plugin-aim
      - account-plugin-facebook
      - account-plugin-flickr
      - account-plugin-jabber
      - account-plugin-salut
      - account-plugin-yahoo
      - empathy
      - flashplugin-installer
      - pidgin
      - rhythmbox
      - thunderbird
      - thunderbird-gnome-support
      - thunderbird-locale-en
      - transmission-common

pkgs-removed-system:
  pkg.removed:
    - pkgs:
      - avahi-daemon # .local domain issues
      - pppoeconf
      - ufw
      - whoopsie # Error reporting
