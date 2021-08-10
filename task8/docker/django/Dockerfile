FROM python:3.9.6-alpine3.13
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code/

COPY ./docker/django/requirements.txt .

RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev \
    && pip install -r requirements.txt

COPY ./django/ ./django/
RUN python -m pip install -e django/

COPY ./bravo_test_application/ .

EXPOSE 8000
CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "bravo_test_application.wsgi"]
