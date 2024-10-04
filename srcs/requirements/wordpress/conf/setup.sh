#!/bin/bash

# Wait for the database to be up
echo "Setting up WordPress..."
while ! nc -z ${DATABASE_HOST} ${DATABASE_PORT}; do
    sleep 1
done
echo "Database is up!"

# Create an admin user and a regular user
wp core install --allow-root --url=${DOMAIN} --title="Inception" --admin_user=${BACKEND_ADMIN} --admin_password=${BACKEND_ADMIN_PASSWORD} --admin_email=${BACKEND_ADMIN_EMAIL} --skip-email
wp user create --allow-root ${BACKEND_USER} ${BACKEND_USER_EMAIL} --user_pass=${BACKEND_USER_PASSWORD} --role=author 2>/dev/null || echo "User ${BACKEND_USER} already exists."

# Creates the necessary files for PHP-FPM to run
mkdir -p /run/php
touch /run/php/php7.4-fpm.pid

# Run PHP-FPM in the foreground and with root privileges
php-fpm7.4 -F -R
