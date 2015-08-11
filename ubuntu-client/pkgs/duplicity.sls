# <--STEP ONE-->
# ppa:duplicity-team/ppa
duplicity-team/ppa:
  pkgrepo.managed:
    - ppa: duplicity-team/ppa

# <--STEP TWO-->
# Install plugin
duplicity:
  pkg.installed:
    - name: duplicity
    - require:
      - pkgrepo: duplicity-team/ppa
