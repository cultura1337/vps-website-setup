# Установка Flute CMS на VPS

## Вариант для реального VPS

Ниже — практичный сценарий установки, когда у тебя есть SSH-доступ, домен и обычный Ubuntu VPS.

## 1. Перейти в директорию сайта

```bash
cd /var/www/html
```

## 2. Загрузить Flute CMS

Дальше есть два нормальных пути:

### Через архив

- скачать релиз Flute CMS;
- загрузить архив на сервер;
- распаковать его в `/var/www/html`.

Пример:

```bash
unzip flute-cms.zip -d /var/www/html
```

### Через Git / Composer

Подходит, если ты работаешь как разработчик и хочешь более привычный workflow.

## 3. Проверить структуру проекта

После распаковки важно убедиться, что внутри есть папка:

```bash
/var/www/html/public
```

Именно она должна быть web root для Nginx.

## 4. Права на каталоги

Для Flute важно, чтобы приложение могло писать в кэш, логи и загрузки.

```bash
sudo mkdir -p /var/www/html/public/uploads
sudo chown -R www-data:www-data /var/www/html/storage /var/www/html/public/uploads
sudo find /var/www/html/storage -type d -exec chmod 775 {} \;
sudo find /var/www/html/storage -type f -exec chmod 664 {} \;
sudo chmod -R 775 /var/www/html/public/uploads
```

## 5. Проверить владельца проекта

Если проект обслуживается через Nginx + PHP-FPM, обычно разумно использовать `www-data` для runtime-доступа.

```bash
sudo chown -R www-data:www-data /var/www/html
```

Если ты часто редактируешь файлы вручную, можно использовать более аккуратную схему с группами, но для первого запуска этого достаточно.

## 6. Настроить Nginx

После загрузки проекта настрой server block так, чтобы:

- `root` указывал на `/var/www/html/public`
- PHP обрабатывался через `php-fpm`
- маршруты шли через `index.php`

Готовый пример — в `configs/nginx/subcultura.fun.example.conf`.

## 7. Проверить конфиг и перезапустить сервисы

```bash
sudo nginx -t
sudo systemctl reload nginx
sudo systemctl restart php8.3-fpm
```

## 8. Открыть сайт в браузере

После этого должен открыться установщик Flute CMS.

В мастере установки обычно нужно указать:

- тип БД
- хост БД
- имя БД
- пользователя БД
- пароль
- данные администратора
- базовые настройки сайта

## 9. После установки

После завершения установки проверь:

- главная страница открывается
- не возникает 500 ошибки
- статические файлы отдаются
- админ-панель открывается
- загрузка файлов работает
- кэш создаётся без ошибок

## 10. Полезные команды после установки

Очистить кэш:

```bash
sudo -u www-data php /var/www/html/flute cache:clear
```

Прогреть кэш:

```bash
sudo -u www-data php /var/www/html/flute cache:warmup
```

Запустить CRON вручную:

```bash
sudo -u www-data php /var/www/html/flute cron:run
```
