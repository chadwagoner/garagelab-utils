#!/bin/bash

### OS-UPDATER
os_updater=$(cat << 'EOF'
apt-get update
apt-get upgrade
apt-get dist-upgrade
apt-get autoremove
apt-get autoclean
EOF
)

### INSTALL OS-UPDATER
echo $os_updater | sudo tee /etc/cron.monthly/os-updater >/dev/null