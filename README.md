# Flute CMS на VPS — кейс 

Понятный репозиторий про установку и сопровождение **Flute CMS** на **Ubuntu VPS**.

Этот репозиторий оформлен как **практический deployment case**: сайт уже развёрнут, работает на VPS и использует типичный стек для production-среды — **Nginx + PHP-FPM + MariaDB + SSL + CRON**.

## Что внутри

- гайд по подготовке VPS
- пошаговая установка Flute CMS
- пример Nginx-конфига под `public/`
- настройка CRON
- короткая схема архитектуры
- чек-лист проверки после деплоя
- раздел с частыми проблемами
- полезный shell-скрипт для быстрой проверки окружения

## Для кого этот репозиторий

- для тех, кто хочет показать **реальный кейс**
- для тех, кто разворачивает Flute CMS на VPS впервые
- для тех, кто хочет сделать игровой сервер

## Стек

- Ubuntu 22.04 LTS
- Nginx
- PHP 8.3 / PHP-FPM
- MariaDB
- SSL
- CRON
- Flute CMS

## Что показывает этот кейс

- подготовку VPS под PHP/CMS-проект
- работу с Nginx server blocks
- настройку PHP-FPM через Unix socket
- подключение базы данных
- корректный document root для Flute CMS (`public/`)
- базовое обслуживание и диагностику

## Структура репозитория

```text
.
├── README.md
├── configs
│   └── nginx
│       └── subcultura.fun.example.conf
├── docs
│   ├── project-summary.md
│   ├── server-preparation.md
│   ├── installation-guide.md
│   ├── nginx-setup.md
│   ├── cron-setup.md
│   ├── maintenance-checklist.md
│   ├── troubleshooting.md
│   └── architecture.md
├── screenshots
│   └── .gitkeep
└── scripts
    └── flute-health-check.sh
```

## Быстрый старт

### 1. Подготовить сервер

Установить:

- Nginx
- PHP и нужные расширения
- MariaDB
- SSL

Подробно: [`docs/02-server-preparation.md`](docs/02-server-preparation.md)

### 2. Разместить Flute CMS

Проект размещается в каталоге вида:

```bash
/var/www/html
```

А **web root** должен указывать именно на:

```bash
/var/www/html/public
```

Подробно: [`docs/03-installation-guide.md`](docs/03-installation-guide.md)

### 3. Настроить Nginx

Пример готового конфига лежит здесь:

```bash
configs/nginx/subcultura.fun.example.conf
```

### 4. Настроить CRON

Flute использует консольную команду:

```bash
php flute cron:run
```

Подробно: [`docs/05-cron-setup.md`](docs/05-cron-setup.md)

## Мини-чек после деплоя

Проверь:

- открывается ли сайт по домену
- корректно ли работает HTTPS
- указывает ли Nginx на `public/`
- запущен ли `php-fpm`
- подключается ли база данных
- пишется ли кэш и логи
- работает ли CRON

## Зачем это полезно для GitHub

Такой репозиторий показывает не просто “я поставил CMS”, а что ты умеешь:

- работать с Linux/VPS
- поднимать веб-стек
- читать и править конфиги Nginx
- обслуживать production-проект
- документировать свою работу как инженер

## Что ещё можно добавить потом

- реальные скриншоты сайта и админки
- схему домена / DNS / SSL
- примеры команд резервного копирования
- deploy notes по обновлениям Flute CMS
- systemd unit для кастомных фоновых задач

## Лицензия

Можно оставить без лицензии как personal portfolio repository или добавить MIT при желании.
