#!/bin/bash

mkdir -p /var/run/vsftpd/empty

useradd -M -d $FTP_HOME -s /bin/bash $FTP_USER && \
echo "$FTP_USER:$FTP_PASS" | chpasswd && \
chown -R $FTP_USER:$FTP_USER $FTP_HOME

/usr/sbin/vsftpd 
/etc/vsftpd.conf