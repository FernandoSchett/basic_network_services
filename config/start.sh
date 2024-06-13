#!/bin/bash
/root/config/dhcp.sh
/root/config/dns.sh
/root/config/web.sh
/root/config/ftp.sh
/root/config/ntp.sh
/root/config/smb.sh
/root/config/ssh.sh
/root/config/syslog.sh

# Mantém o contêiner em execução
tail -f /dev/null
