# file: /srv/salt/state/beacon/present.sls

inotify_miniond_directory:
  beacon.present:
    - save: True
    - enable: True
    - files:
       /etc/salt/minion.d:
         mask:
           - create
    - beacon_module: inotify