#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER $DJANGO_DB_USERNAME password '$DJANGO_USER_PASSWORD';
        ALTER ROLE $DJANGO_DB_USERNAME SET client_encoding to 'utf8';
        ALTER ROLE $DJANGO_DB_USERNAME SET default_transaction_isolation TO 'read committed';
        ALTER ROLE $DJANGO_DB_USERNAME SET timezone TO 'Europe/Minsk';
        CREATE DATABASE $DJANGO_DB_NAME OWNER $DJANGO_DB_USERNAME;
EOSQL
