FROM python:3.12-alpine

WORKDIR /app

RUN apk update && apk upgrade && \
    apk add --no-cache \
        gcc \
        musl-dev \
        libffi-dev \
        postgresql-dev \
        python3-dev \
        build-base

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

RUN adduser -D djangouser
USER djangouser

EXPOSE 8000

ENTRYPOINT [ "./django-entrypoint.sh" ]

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
