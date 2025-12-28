FROM python:3.9-slim

WORKDIR /app

ENV FLASK_APP=app.py

ENV FLASK_ENV=development

COPY requirements.txt .

RUN pip install --no-cache-dir -r  requirements.txt

RUN pip install --no-cache-dir cryptography

COPY . .

EXPOSE 5000

CMD ["python","-m","flask","run","--host=0.0.0.0"]
