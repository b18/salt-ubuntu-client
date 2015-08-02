# <--STEP ONE-->
# ppa:jtaylor/keepass
keepass-ppa:
  pkgrepo.managed:
    - ppa: jtaylor/keepass

# <--STEP TWO-->
# Install Keepass2
keepass2:
  pkg.installed:
    - name: keepass2
    - require:
      - pkgrepo: keepass-ppa
