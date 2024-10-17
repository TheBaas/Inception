#!/bin/bash

# Check if the MySQL system database is initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    # If not, initialize the MySQL data directory
    mysqld --initialize --user=root --datadir=/var/lib/mysql
fi

# Run MySQL in bootstrap mode to execute initial SQL commands
mysqld --user=root --bootstrap << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
EOF

# Start MySQL in a safe mode using dumb-init (init system to manage signal handling)
exec dumb-init -- mysqld_safe --user=root --datadir='/var/lib/mysql'