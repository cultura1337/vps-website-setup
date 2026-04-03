# Troubleshooting

## 404 Not Found

### Возможные причины

- `root` в Nginx указывает не на `public/`
- не работает `try_files`
- конфиг сайта не включён
- запрос уходит не в тот server block

### Что проверить

```bash
sudo nginx -t
grep -R "server_name" /etc/nginx/sites-available /etc/nginx/sites-enabled
grep -R "root " /etc/nginx/sites-available /etc/nginx/sites-enabled
```

## 500 Internal Server Error

### Возможные причины

- упал PHP-FPM
- ошибка в PHP
- проблема с правами
- приложение не может писать в `storage/`
- неверные параметры БД

### Что проверить

```bash
sudo systemctl status php8.3-fpm
journalctl -u php8.3-fpm -n 100 --no-pager
tail -n 100 /var/log/nginx/error.log
```

## Не открывается админка или часть маршрутов

Обычно это связано с одной из двух вещей:

1. неверный `document root`
2. не работает `try_files $uri $uri/ /index.php?$query_string;`

## Не создаётся кэш / не работают загрузки

Проверь права на:

- `storage/`
- `storage/logs/`
- `storage/app/cache/`
- `public/uploads/`

Пример:

```bash
sudo chown -R www-data:www-data /var/www/html/storage /var/www/html/public/uploads
sudo chmod -R 775 /var/www/html/storage /var/www/html/public/uploads
```

## Не работает PHP-сокет

Проверь:

```bash
ls -la /var/run/php/
```

И убедись, что в Nginx указан существующий сокет.

## SSL не выпускается

Проверь:

- домен указывает на нужный IP
- открыт 80 порт
- Nginx отвечает по HTTP
- нет конфликта с Cloudflare / прокси / firewall

## Команды быстрой диагностики

```bash
hostname -I
ss -tulpn | grep -E ':80|:443'
systemctl status nginx php8.3-fpm mariadb
```
