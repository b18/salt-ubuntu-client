# Install Pac Manager & requirements

# Pac app
pac:
  pkg.installed:
    - name: pac
    - sources:
      - file: salt://ubuntu-client/media/pac-4.5.5.7-all.deb

cu:
  pkg.installed:
    - name: cu

rdesktop:
  pkg.installed:
    - name: rdesktop
