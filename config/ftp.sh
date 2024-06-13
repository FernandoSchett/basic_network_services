#!/bin/bash
echo "Configuring FTP Server..."
echo "listen=YES" >> /etc/vsftpd.conf
echo "anonymous_enable=YES" >> /etc/vsftpd.conf
systemctl restart vsftpd
