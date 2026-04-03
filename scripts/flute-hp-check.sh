#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/var/www/html"
PUBLIC_DIR="$APP_DIR/public"
STORAGE_DIR="$APP_DIR/storage"
UPLOADS_DIR="$PUBLIC_DIR/uploads"
PHP_SOCK="/var/run/php/php8.3-fpm.sock"

say() {
  printf '\n[%s] %s\n' "INFO" "$1"
}

check_path() {
  local path="$1"
  if [[ -e "$path" ]]; then
    printf "  [OK] %s exists\n" "$path"
  else
    printf "  [FAIL] %s missing\n" "$path"
  fi
}

check_service() {
  local svc="$1"
  if systemctl is-active --quiet "$svc"; then
    printf "  [OK] service active: %s\n" "$svc"
  else
    printf "  [FAIL] service inactive: %s\n" "$svc"
  fi
}

say "Checking directories"
check_path "$APP_DIR"
check_path "$PUBLIC_DIR"
check_path "$STORAGE_DIR"
check_path "$UPLOADS_DIR"

say "Checking key files"
check_path "$PUBLIC_DIR/index.php"
check_path "$APP_DIR/flute"

say "Checking services"
check_service nginx
check_service php8.3-fpm
check_service mariadb

say "Checking PHP socket"
check_path "$PHP_SOCK"

say "Checking nginx config"
if nginx -t >/tmp/flute-nginx-check.log 2>&1; then
  echo "  [OK] nginx config test passed"
else
  echo "  [FAIL] nginx config test failed"
  cat /tmp/flute-nginx-check.log
fi

say "Checking permissions overview"
namei -l "$APP_DIR" || true
namei -l "$PUBLIC_DIR" || true
namei -l "$STORAGE_DIR" || true

say "Done"
