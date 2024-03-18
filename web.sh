#!/bin/bash
yum install -y httpd

mkdir -p /var/www/html/sa


cat <<EOF > /etc/httpd/conf.d/sa.conf
<Directory /var/www/html/sa>
    AllowOverride All
    Require all granted
</Directory>
EOF


cat <<EOF > /var/www/html/sa/.htaccess
AuthType Basic
AuthName "Restricted Access"
AuthUserFile /etc/httpd/.htpasswd
Require valid-user
EOF
htpasswd -c /etc/httpd/.htpasswd somaia
systemctl restart httpd