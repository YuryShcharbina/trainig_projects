# Bravo_django_project
[![pipeline status](https://gitlab.com/bravo_group1/bravo_django_project/badges/main/pipeline.svg)](https://gitlab.com/bravo_group1/bravo_django_project/-/commits/main)

## Description  
This project created to demonstrate CI/CD pipeline in GitLab for Django application.  
In production, it will be three services:  
* Postgresql and gunicorn application server as a backend
* Nginx proxy server as a frontend

## Project structure 
The project is very simple:
* **bravo-chart** - Helm chart for deploy to Kubernetes cluster
* **bravo_test_application** - django application  
* **django** - source code Django framework from official repo on GitHub
* **docker** - configurations, Dockerfiles for building images for nginx server, application server and Postgresql database server
* **docs** - additional documentation  
* **for_db_backup** - files for creating docker image with gcsfuse support and manifest for kubernetes cronjob 

## How it works
After each push in repository triggers pipeline with four stages:
* **build** - build images from Dockerfiles and push them into project registry
* **test** - make unittests in application stack
* **push** - tags images for deploy
* **deploy** - deploys containers in Google Kubernetes cluster

## Infrastructure
In this project we use Google Kubernetes cluster for deploy, Gitlab registry for storage images,
Google Cloud Storage bucket for Postgresql backups and Prometheus and Grafana for monitoring:  
* to create Kubernetes cluster and integrate it with Gitlab see [kubernetes.md](docs/kubernetes.md) in *docs* folder
* to create GCS bucket see documentation at [Creating storage buckets](https://cloud.google.com/storage/docs/creating-buckets)
* to organize Postgresql backup see [backup_db.md](docs/backup_db.md) in *docs* folder
* to create integration Prometheus with Gitlab see [monitoring.md](docs/monitoring.md) in *docs* folder

## Environment Variables
This pipeline uses next environment variables:  
`DATABASE_HOST`  - Postgresql host address for Django application  
`DATABASE_PORT` - Postgresql port for Django application  
`DJANGO_ALLOWED_HOSTS` - list of hosts/domain names that this Django application can serve  
`DJANGO_DB_NAME` - database name for Django application  
`DJANGO_DB_USERNAME` - username to use when connecting to the database  
`DJANGO_DEBUG` - on/off debug mode  
`DJANGO_HOST_ADDRESS` - Django hos address for nginx proxy settings  
`DJANGO_SECRET_KEY` -  a secret key for a particular Django installation  
`DJANGO_USER_PASSWORD` -  the password to use when connecting to the database   
`POSTGRES_DB` - name for the default Postgresql database  
`POSTGRES_PASSWORD` - sets the superuser password for Postgresql  
`POSTGRES_USER` - superuser name for Postgresql




