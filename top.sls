# file: /srv/salt/state/top.sls

base:
  '*':
    - utility
  'local-minion':
    - log
  'A-remote-minion':
    - beacon