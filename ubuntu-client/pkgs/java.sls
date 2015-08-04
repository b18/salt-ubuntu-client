# <--STEP ONE-->
# ppa:webupd8team/java
webupd8team-java-ppa:
  pkgrepo.managed:
    - ppa: webupd8team/java

# <--STEP TWO-->
# Accept Oracle licenses
oracle-java8-license:
   cmd:
    - run
    - name: echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    - unless: dpkg -l | grep oracle-java8-installer
    - require:
      - pkgrepo: webupd8team-java-ppa

# <--STEP THREE-->
# Install Java
oracle-java8-installer:
  pkg.latest:
    - name: oracle-java8-installer
    - require:
      - cmd: oracle-java8-license
