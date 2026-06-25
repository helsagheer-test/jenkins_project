# 1- استخدم صورة Python الرسمية
FROM python:3.12-slim

# 2- حدد مجلد العمل داخل الـ Container
WORKDIR /app

# 3- انسخ ملف الـ requirements
COPY requirements.txt .

# 4- ثبت المكتبات
RUN pip install --no-cache-dir -r requirements.txt

# 5- انسخ باقي ملفات المشروع
COPY . .

# 6- افتح البورت 5000 (للتوثيق)
EXPOSE 5000

# 7- شغل التطبيق
CMD ["gunicorn","--bind","0.0.0.0:5000","app:app"]