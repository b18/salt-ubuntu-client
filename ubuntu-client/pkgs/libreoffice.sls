# <--STEP ONE-->
# ppa:libreoffice/ppa
libreoffice/ppa:
  pkgrepo.managed:
    - ppa: libreoffice/ppa

# <--STEP TWO-->
# Install app
libreoffice:
  pkg.installed:
    - name: libreoffice
    - require:
      - pkgrepo: libreoffice/ppa
