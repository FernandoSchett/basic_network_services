#!/bin/bash
echo "Configuring DNS Server..."
cat <<EOF > /etc/bind/named.conf.local
zone "cimatec.com.br" {
    type master;
    file "/etc/bind/db.cimatec.com.br";
};
EOF

cat <<EOF > /etc/bind/db.cimatec.com.br
$TTL    604800
@       IN      SOA     cimatec.com.br. root.cimatec.com.br. (
                             2         ; Serial
                        604800         ; Refresh
                         86400         ; Retry
                       2419200         ; Expire
                        604800 )       ; Negative Cache TTL
;
@       IN      NS      cimatec.com.br.
@       IN      A       172.16.0.10
EOF

systemctl restart bind9
