#!/bin/bash

mkdir -p /var/www/html && chown -R root:root /var/www/html

if ! id "$FTP_USER" &>/dev/null; then
    useradd -d /var/www/html -s /bin/bash $FTP_USER
    echo "$FTP_USER:$FTP_PASS" | chpasswd
fi

chown -R $FTP_USER:$FTP_USER /var/www/html

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

mkdir -p /var/run/vsftpd/empty
chown root:root /var/run/vsftpd/empty

mkdir -p /home/$FTP_USER/ftp_dir/upload
chmod 550 /home/$FTP_USER/ftp_dir
chmod -R 750 /home/$FTP_USER/ftp_dir/upload
chown -R $FTP_USER: /home/$FTP_USER/ftp_dir

vsftpd /etc/vsftpd.conf
