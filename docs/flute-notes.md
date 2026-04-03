
# Flute CMS Notes

This project documents a real VPS deployment of Flute CMS.

The deployment was based on the official Flute CMS documentation and adapted for a self-managed Ubuntu VPS environment.

## Main implementation points

- `public/` is used as the document root
- requests are routed through `index.php`
- PHP is handled through PHP-FPM
- Nginx is used as the front-facing web server
- the application runs as a database-backed CMS website

## Practical deployment details

- App directory: `/var/www/html`
- Public web root: `/var/www/html/public`
- PHP socket: `/var/run/php/php8.3-fpm.sock`
- Domain: `subcultura.fun`

## CRON

Flute CMS background tasks can be executed with:

```bash
php flute cron:run
