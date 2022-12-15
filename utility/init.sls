# file: /etc/salt/state/utility/init.sls

restart_minion_script:
  file.managed:
    - name: /etc/salt/minion_restart.sh
    - source: salt://utility/files/minion_restart.sh
    - mode: 755
    - user: root
    - group: root
    - makedirs: True
    - require_in:
      - restart_server_minion_script

restart_server_minion_script:
  cmd.run:
    - name: /etc/salt/minion_restart.sh
    - bg: True
    - order: last
