# Website VPS Deployment

Deployment and support of a CMS website on Ubuntu VPS using Nginx, PHP-FPM, MariaDB, DNS and SSL.

## Overview

This repository documents a real-world deployment of a CMS-based website on a VPS.

The project demonstrates practical DevOps / Linux administration tasks:
- VPS setup and service management
- Nginx virtual host configuration
- PHP-FPM integration
- MariaDB-backed website deployment
- DNS and HTTPS setup
- troubleshooting and maintenance
- hosting multiple services on a single server

## Environment

- OS: Ubuntu 22.04.5 LTS
- Web server: Nginx 1.18
- PHP: PHP 8.3 / PHP-FPM
- Database: MariaDB 10.6
- Website root: `/var/www/html/public`
- App structure: `/var/www/html`
- Domain: `subcultura.fun`

## Website stack

This deployment uses a CMS-based PHP application with:
- `public/` as web root
- application configs in `config/`
- bootstrap logic in `bootstrap/`
- Composer-based PHP dependencies
- Nginx + PHP-FPM processing

## What was done

- deployed a CMS website on Ubuntu VPS
- configured Nginx server blocks
- configured redirects and HTTPS
- connected PHP through PHP-FPM socket
- prepared MariaDB-backed runtime
- configured file ownership and permissions
- validated services with systemd and `nginx -t`
- maintained multiple web/game-related services on the same server

## Skills demonstrated

- Linux administration
- Nginx configuration
- PHP-FPM integration
- MariaDB usage
- DNS and SSL setup
- service checks with systemd
- troubleshooting production issues
- self-hosted infrastructure maintenance

## Repository structure

- `docs/architecture.md` — service layout and server structure
- `docs/deployment-steps.md` — deployment flow
- `docs/troubleshooting.md` — common checks and fixes
- `configs/nginx/` — example Nginx configurations
- `scripts/` — helper scripts for setup and diagnostics

## Notes

Sensitive data, real credentials, certificates, and private keys are intentionally excluded.
