# <--STEP ONE-->
# Google Signing Key
google.key:
   cmd:
    - run
    - name: 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - '
    - unless: 'apt-key list | grep Google'

# <--STEP TWO-->
# Google-Chrome-Stable Repo
/etc/apt/sources.list.d/google-chrome.list:
  file:
    - managed
    - user: root
    - group: root
    - mode: 644
    - source: salt://ubuntu-client/files/etc/apt/sources.list.d/google-chrome.list
    - require:
      - cmd: google.key

# <--STEP THREE-->
# Install Google-Chrome-Stable
google-chrome-stable:
  pkg.installed:
    - name: google-chrome-stable
    - require:
      - file: /etc/apt/sources.list.d/google-chrome.list
