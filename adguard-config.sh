#!/bin/bash

adguard_conf=$(cat << 'EOF'
[Resolve]
DNS=127.0.0.1
DNSStubListener=no
EOF
)

sudo mkdir /etc/systemd/resolved.conf.d

sudo touch /etc/systemd/resolved.conf.d/adguard.conf

echo "$adguard_conf" | sudo tee /etc/systemd/resolved.conf.d/adguard.conf >/dev/null

sudo mv /etc/resolv.conf /etc/resolv.conf.backup

sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

sudo systemctl reload-or-restart systemd-resolved