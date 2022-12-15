# file: /srv/salt/state/beacon/tva.sls

spooler_service_beacon:
  beacon.present:
    - name: spooler
    - save: True
    - enable: True
    - services:
        spooler: stopped