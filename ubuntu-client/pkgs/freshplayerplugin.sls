# <--STEP ONE-->
# ppa:nilarimogard/webupd8
nilarimogard-webupd8-ppa:
  pkgrepo.managed:
    - ppa: nilarimogard/webupd8

# <--STEP TWO-->
# Install plugin
freshplayerplugin:
  pkg.latest:
    - name: freshplayerplugin
    - require:
      - pkgrepo: nilarimogard-webupd8-ppa
