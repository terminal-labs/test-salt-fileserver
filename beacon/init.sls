# file: /srv/salt/state/beacon/init.sls

setup_beacon_file:
  file.managed:
    - name: /etc/salt/minion.d/beacon.conf
    - source: salt://beacon/files/beacon.conf

include:
  - utility
