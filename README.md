# Flute CMS on VPS

Real-world deployment and support of a Flute CMS website on Ubuntu VPS using Nginx, PHP-FPM, MariaDB, DNS and SSL.

## Overview

This repository documents a practical VPS deployment of a Flute CMS-based website.

It reflects a real self-managed environment where the website runs together with other hosted services on the same server. The project demonstrates practical DevOps / Linux administration tasks rather than just a local demo or a theory-only setup.

## Stack

- Ubuntu 22.04.5 LTS
- Nginx
- PHP 8.3 / PHP-FPM
- MariaDB
- DNS + SSL
- Flute CMS

## What this case shows

- VPS setup and service management
- Nginx virtual host configuration
- PHP-FPM integration
- database-backed CMS deployment
- HTTPS and domain routing
- troubleshooting and maintenance
- multi-service hosting on a single VPS

## Real deployment details

- App directory: `/var/www/html`
- Public web root: `/var/www/html/public`
- Domain: `subcultura.fun`
- PHP is handled through Unix socket
- Nginx is used as the front-facing web server

## Flute CMS notes

This deployment was based on the official Flute CMS documentation and adapted for a real VPS environment.

Important implementation points:
- `public/` is used as the document root
- requests are routed through `index.php`
- PHP is handled by PHP-FPM
- Flute CRON tasks can be run with:

```bash
php flute cron:run
