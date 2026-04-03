# Архитектура

```mermaid
flowchart TD
    A[Client Browser] --> B[Domain / DNS]
    B --> C[Nginx]
    C --> D[PHP-FPM]
    D --> E[Flute CMS]
    E --> F[(MariaDB)]
    E --> G[storage/ cache / logs]
    E --> H[public/uploads]
    I[CRON] --> E
```

## Кратко

- **Nginx** принимает HTTP/HTTPS-запросы
- **PHP-FPM** обрабатывает PHP
- **Flute CMS** отвечает за приложение
- **MariaDB** хранит данные
- **CRON** запускает фоновые задачи
- **public/** — единственная директория, которую должен видеть веб-сервер
