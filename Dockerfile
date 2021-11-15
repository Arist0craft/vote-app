FROM python:3.9-slim
COPY . ./vote-app

WORKDIR ./vote-app
RUN mkdir static

RUN python -m pip install --upgrade pip && \
    apt-get update && \
    apt-get -y install libpq-dev gcc

RUN pip install poetry==1.1.11 && \
    poetry config virtualenvs.in-project true && \
    poetry install --no-dev

CMD poetry run python manage.py migrate && \
    poetry run uvicorn app.asgi:application --host 0.0.0.0  --port ${PORT}