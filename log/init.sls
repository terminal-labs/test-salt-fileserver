# file: /srv/salt/state/log/init.sls

minion_log_warn:
  file.managed:
    - name: /etc/salt/minion.d/log.conf
    - source: salt://log/files/log.conf


restart_minion_script:
  file.managed:
    - name: /etc/salt/minion_restart.sh
    - source: salt://utility/files/minion_restart.sh
    - mode: 755
    - user: root
    - group: root
    - makedirs: True

restart_server_minion_script:
  cmd.run:
    - name: /etc/salt/minion_restart.sh
    - bg: True
