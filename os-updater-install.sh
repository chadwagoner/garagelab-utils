#!/bin/bash

### OS-UPDATER
os_updater=$(cat << 'EOF'
#!/bin/bash

apt-get update && \
apt-get upgrade && \
apt-get dist-upgrade && \
apt-get autoremove && \
apt-get autoclean

/usr/bin/sleep 60

if [[ -f /var/run/reboot-required ]]; then
  shutdown -r now
fi
EOF
)

### INSTALL OS-UPDATER
echo "$os_updater" | sudo tee /etc/cron.monthly/os-updater >/dev/null
