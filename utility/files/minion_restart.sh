#!/usr/bin/env bash

echo "Starting salt-minion restart proceedure"

LOG=/var/log/salt/minion_manage.log
timestamp=$(date +%F_%T)

exec >> $LOG # redirect stdout to the LOG file
exec 2>&1 # redirect stderr to stdout ( also to the LOG file )
echo "$timestamp INFO restart_server_minion.sh begin"

echo "$timestamp INFO stopping salt-minion"
sleep 5s
systemctl stop salt-minion
sleep 5s

if leftover_stop_pids=$(ps -aux | grep salt-minion | grep root | grep -v "grep")
then
  echo "$timestamp ERROR after 'supervisorctl stop salt-minion' leftover salt-minion PIDs: $leftover_stop_pids"
  echo "$timestamp INFO killing the hung salt-minion proccesses"
  for variable in $(ps -aux | grep salt-minion | grep root | grep -v "grep" | awk '{print $2}'); do kill -9 $variable 2> /dev/null; done;
fi

if leftover_kill_pids=$(ps -aux | grep salt-minion | grep root | grep -v "grep")
then
  echo "$timestamp ERROR after kill -9 leftover salt-minion PIDs: $leftover_kill_pids"
fi

echo "$timestamp INFO starting salt-minion"
systemctl start salt-minion
sleep 5s

echo "$timestamp INFO status salt-minion"
systemctl status salt-minion
