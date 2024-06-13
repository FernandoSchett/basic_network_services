#!/bin/bash
echo "Configuring SMB Server..."
cat <<EOF > /etc/samba/smb.conf
[global]
   workgroup = WORKGROUP
   server string = Samba Server
   security = user
   map to guest = Bad User
   dns proxy = no

[Public]
   path = /srv/samba/public
   browsable =yes
   writable = yes
   guest ok = yes
   read only = no
EOF

mkdir -p /srv/samba/public
chmod -R 0755 /srv/samba/public
chown -R nobody:nogroup /srv/samba/public
systemctl restart smbd
