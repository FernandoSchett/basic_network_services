#!/bin/bash
echo "Configuring DHCP Server..."
cat <<EOF > /etc/dhcp/dhcpd.conf
# DHCP configuration
subnet 172.16.0.0 netmask 255.255.255.0 {
    range 172.16.0.20 172.16.0.30;
    option routers 172.16.0.1;
    option domain-name-servers 172.16.0.10;
}
EOF
systemctl restart isc-dhcp-server
