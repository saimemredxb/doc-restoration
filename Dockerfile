FROM python:3.9

WORKDIR /app

# Sistem bağımlılıklarını yükleyin
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

# Gerekli Python paketlerini yükleyin
COPY requirements.txt .
RUN pip install -r requirements.txt

# Proje dosyalarını kopyalayın
COPY . .

# Çalıştırma komutu
ENTRYPOINT ["python", "inference.py"]