# Настройка CRON

## Зачем это нужно

Flute CMS использует фоновые задачи. Для нормальной работы их нужно запускать через CRON.

## Базовая команда

```bash
php flute cron:run
```

## Настройка через crontab

Открыть crontab:

```bash
crontab -e
```

Добавить строку:

```bash
* * * * * /usr/bin/php8.3 /var/www/html/flute cron:run >/dev/null 2>&1
```

## Если путь к PHP другой

Проверь так:

```bash
which php
ls /usr/bin/php*
```

## Проверка вручную

```bash
cd /var/www/html
php flute cron:run
```

## Проверка, что CRON записан

```bash
crontab -l
```

## Если нужен более безопасный вариант

Чтобы не запускать новый процесс, пока старый ещё работает:

```bash
* * * * * flock -n /tmp/flute-cron.lock /usr/bin/php8.3 /var/www/html/flute cron:run >/dev/null 2>&1
```

## Логи CRON

На Ubuntu удобно смотреть так:

```bash
tail -f /var/log/syslog | grep CRON
```
