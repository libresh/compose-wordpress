/bin/bash -eux

chfn -f 'Wordpress Admin' www-data

cat > /etc/ssmtp/ssmtp.conf << EOF
UseTLS=Yes
UseSTARTTLS=Yes
root=${MAIL_USER}
mailhub=${MAIL_HOST}:${MAIL_PORT}
hostname=${MAIL_USER}
AuthUser=${MAIL_USER}
AuthPass=${MAIL_PASS}
EOF

echo "www-data:${MAIL_USER}:${MAIL_HOST}:${MAIL_PORT}" >> /etc/ssmtp/revaliases

#echo "sendmail_from = ${MAIL_USER}" >> /usr/local/etc/php/php.ini

/entrypoint.sh php-fpm
