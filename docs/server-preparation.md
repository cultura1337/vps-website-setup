# Подготовка сервера

## 1. Обновить систему

```bash
sudo apt update && sudo apt upgrade -y
```

## 2. Установить базовый набор пакетов

```bash
sudo apt install -y nginx mariadb-server unzip curl git ca-certificates
```

## 3. Установить PHP и расширения

Состав пакетов зависит от того, как именно у тебя установлен PHP на сервере.

Минимально стоит проверить наличие:

- php-cli
- php-fpm
- php-mysql
- php-curl
- php-mbstring
- php-xml
- php-zip
- php-gd
- php-bcmath
- php-gmp

Пример для PHP 8.3:

```bash
sudo apt install -y \
  php8.3 php8.3-cli php8.3-fpm php8.3-mysql php8.3-curl \
  php8.3-mbstring php8.3-xml php8.3-zip php8.3-gd \
  php8.3-bcmath php8.3-gmp
```

## 4. Проверить службы

```bash
systemctl status nginx
systemctl status php8.3-fpm
systemctl status mariadb
```

## 5. Подготовить директорию проекта

```bash
sudo mkdir -p /var/www/html
sudo chown -R $USER:$USER /var/www/html
```

## 6. Создать базу данных

```sql
CREATE DATABASE flute_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'flute_user'@'localhost' IDENTIFIED BY 'strong_password_here';
GRANT ALL PRIVILEGES ON flute_db.* TO 'flute_user'@'localhost';
FLUSH PRIVILEGES;
```

## 7. Подготовить домен

Нужно, чтобы домен уже указывал на IP VPS.

Проверь:

```bash
dig +short your-domain.com
```

## 8. SSL

Если домен уже смотрит на сервер, можно выпустить сертификат через Let's Encrypt.

Пример:

```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d your-domain.com -d www.your-domain.com
```

## 9. Что проверить до установки Flute

Перед загрузкой CMS желательно убедиться, что:

- Nginx установлен
- нужная версия PHP доступна
- php-fpm запущен
- база создана
- домен резолвится
- 80/443 открыты в firewall
