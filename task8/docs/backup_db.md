## Organizing a database backup from kubernetes
### Creating image with gcsfuse support 
In our project we created Docker image with gcsfuse from [GoogleCloudPlatform/gcsfuse](https://github.com/GoogleCloudPlatform/gcsfuse) with changes:
* in [Dockerfile](../for_db_backup/Dockerfile) add additional packages postgresql-client, tzdata; change timezone and add script for database backup
* after image built push it to your registry, for example, to Dockerhub 

### Environment Variables
For proper work backup script need next environment variables:  
`DB_HOST` - Postgresql host address  
`DB_USER` - Postgresql superuser name  
`DB_PASSWORD` - Postgresql superuser password  
`BACKUP_DIR`  - name of the directory for GCE bucket mount  
`PATH_TO_KEY_FILE` - Path to Google service account key  
`BUCKET_NAME` - name of the GCS bucket storage  
`DB_NAME` - name of the database for backup

### How it works
In [cronjob_db_backup.yaml](../for_db_backup/cronjob_db_backup.yaml) manifest file change parameters for your needs
and apply it in Kubernetes cluster:  
```shell
$ kubectl apply -f cronjob_db_backup.yaml
```
it creates Kubernetes cronjob and according to the schedule will create Postgresql database backups to GCS bucket