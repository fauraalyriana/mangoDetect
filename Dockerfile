# Gunakan image resmi Python
FROM python:3.9-slim

# Set working directory di dalam kontainer
WORKDIR /app

# Salin file requirements.txt dan install dependensi
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Salin semua file aplikasi Flask ke dalam kontainer
COPY . /app/

# Set variabel lingkungan jika diperlukan
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Expose port untuk aplikasi Flask (default Flask port adalah 5000)
EXPOSE 8080

# Perintah untuk menjalankan aplikasi Flask
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
