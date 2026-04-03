# Настройка Nginx

## Главная идея

Для Flute CMS **document root должен смотреть в `public/`**.

Не в корень проекта.
Не в `/var/www/html`.
Именно в:

```bash
/var/www/html/public
```

## Где хранить конфиг

Обычно:

```bash
/etc/nginx/sites-available/subcultura.fun
```

И симлинк:

```bash
/etc/nginx/sites-enabled/subcultura.fun
```

## Базовый порядок

### 1. Создать конфиг

```bash
sudo nano /etc/nginx/sites-available/subcultura.fun
```

### 2. Добавить server block

См. готовый файл:

```bash
configs/nginx/subcultura.fun.example.conf
```

### 3. Включить сайт

```bash
sudo ln -s /etc/nginx/sites-available/subcultura.fun /etc/nginx/sites-enabled/
```

### 4. Проверить конфиг

```bash
sudo nginx -t
```

### 5. Применить изменения

```bash
sudo systemctl reload nginx
```

## Что особенно важно

### `root`

Должен указывать на `public/`.

### `try_files`

Нужен для корректной маршрутизации Flute CMS.

### `fastcgi_pass`

Должен ссылаться на актуальный PHP-FPM socket, например:

```bash
unix:/var/run/php/php8.3-fpm.sock
```

### защита служебных файлов

Нужно запрещать доступ к:

- `.env`
- `vendor/`
- `storage/`
- скрытым файлам

## Полезные проверки

Показать активные virtual host файлы:

```bash
ls -la /etc/nginx/sites-enabled/
```

Проверить, какой сокет существует:

```bash
ls -la /var/run/php/
```

Проверить логи:

```bash
tail -f /var/log/nginx/error.log
tail -f /var/log/nginx/access.log
```
