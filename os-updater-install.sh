#!/bin/bash

### OS-UPDATER
os_updater=$(cat << 'EOF'
apt-get update &&
apt-get upgrade &&
apt-get dist-upgrade &&
apt-get autoremove &&
apt-get autoclean
EOF
)

### INSTALL OS-UPDATER
echo $os_updater | sudo tee /etc/cron.monthly/os-updater >/dev/null

### PAUSE FOR 60 SECONDS
/usr/bin/sleep 60

### REBOOT IF REQUIRED
if [[ -f /var/run/reboot-required ]]; then
  shutdown -r now
fi
