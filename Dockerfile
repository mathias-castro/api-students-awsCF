FROM python:3.11-slim

WORKDIR /app

# Dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Código de tu API
COPY app.py db.py ./

# Entrypoint que crea la DB si falta y arranca la app
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# La API escucha en 8000
EXPOSE 8000

CMD ["/entrypoint.sh"]
