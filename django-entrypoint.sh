#!/bin/sh
echo "Собираем статические файлы"
python manage.py collectstatic --noinput

echo "Применяем миграции..."
python manage.py migrate --noinput

exec "$@"
