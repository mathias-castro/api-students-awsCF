#!/usr/bin/env bash
set -e

# Crea la base SQLite si no existe (usa tu db.py)
[ -f /app/students.sqlite ] || python /app/db.py || true

# Arranca la app (asegúrate que app.py use puerto 8000)
exec python /app/app.py
