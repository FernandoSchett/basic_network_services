# Use uma imagem base do Ubuntu
FROM ubuntu:20.04

# Defina o fuso horário
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Atualize o sistema e instale os pacotes necessários
RUN apt-get update && apt-get install -y \
    isc-dhcp-server \
    bind9 \
    apache2 \
    vsftpd \
    ntp \
    samba \
    openssh-server \
    rsyslog \
    systemd \
    systemctl

# Configurações para o SSH
RUN mkdir /var/run/sshd
RUN echo 'root:1234' | chpasswd

# Exponha as portas necessárias para os serviços
EXPOSE 67/udp 
EXPOSE 53/udp 
EXPOSE 53/tcp 
EXPOSE 80/tcp 
EXPOSE 21/tcp 
EXPOSE 123/udp
EXPOSE 445/tcp
EXPOSE 22/tcp 
EXPOSE 514/tcp

# DHCP
# DNS
# DNS
# WEB
# FTP
# NTP
# SMB
# SSH
# SYSLOG

# Copiar scripts de configuração para o contêiner
COPY ./config /root/config
RUN chmod +x /root/config/start.sh

# Ativar systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/lib/systemd/systemd"]



