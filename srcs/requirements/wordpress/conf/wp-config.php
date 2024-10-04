<?php
define( 'DB_NAME', getenv('DATABASE_NAME') );
define( 'DB_USER', getenv('DATABASE_USER') );
define( 'DB_PASSWORD', getenv('DATABASE_PASSWORD') );
define( 'DB_HOST', getenv('DATABASE_HOST') . ':' . getenv('DATABASE_PORT') );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('PHP_MAILER', false);
define('FS_METHOD','direct');
$table_prefix = 'wp_';
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );}
    require_once ABSPATH . 'wp-settings.php';