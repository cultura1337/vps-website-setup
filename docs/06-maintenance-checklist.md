# Чек-лист обслуживания

## После установки

- [ ] домен открывается по HTTPS
- [ ] главная страница загружается без 500
- [ ] Nginx указывает на `public/`
- [ ] PHP-FPM активен
- [ ] база данных доступна
- [ ] есть права на `storage/`
- [ ] есть права на `public/uploads/`
- [ ] выполняется `php flute cron:run`
- [ ] нет критических ошибок в `nginx` и `php-fpm` логах

## Полезные команды

### Проверка Nginx

```bash
sudo nginx -t
sudo systemctl status nginx
```

### Проверка PHP-FPM

```bash
sudo systemctl status php8.3-fpm
journalctl -u php8.3-fpm -n 100 --no-pager
```

### Проверка MariaDB

```bash
sudo systemctl status mariadb
mysql -u flute_user -p -e "SHOW DATABASES;"
```

### Проверка прав

```bash
namei -l /var/www/html/public
namei -l /var/www/html/storage
```

### Очистка и прогрев кэша

```bash
sudo -u www-data php /var/www/html/flute cache:clear
sudo -u www-data php /var/www/html/flute cache:warmup
```

## Перед обновлением

- [ ] сделать backup базы
- [ ] сделать backup файлов сайта
- [ ] сохранить Nginx config
- [ ] проверить свободное место на диске
- [ ] проверить текущую версию PHP

## Backup-файлы, которые особенно важны

- база данных
- директория проекта
- конфиг Nginx
- SSL-конфиги, если нужно
- `.env` и другие локальные конфигурации
