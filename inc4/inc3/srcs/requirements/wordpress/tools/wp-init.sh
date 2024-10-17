#!/bin/sh

# Change directory to WordPress installation directory
cd /var/www/html/

# Check if wp-config.php exists
if [ ! -f wp-config.php ]; then
  # Download WordPress core files
  wp core download --allow-root
  
  # Create wp-config.php with database details
  wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
  
  # Install WordPress with provided settings
  wp core install --url=$DOMAIN_NAME --title="My WordPress Site" --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root
  
  # Create a new WordPress user with contributor role
  wp user create $WORDPRESS_USER user@test.com --role=contributor --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
fi

# Start PHP-FPM
php-fpm7.4 -F