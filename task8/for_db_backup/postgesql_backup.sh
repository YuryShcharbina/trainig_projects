#!/bin/sh
DUMP_FILE=${DB_NAME}-backup_$(date +"%Y-%m-%d_%H:%M:%S")
echo "Creating postgresql dump: $DUMP_FILE"

mkdir $BACKUP_DIR

gcsfuse --key-file=$PATH_TO_KEY_FILE $BUCKET_NAME $BACKUP_DIR

PGPASSWORD="$DB_PASSWORD" pg_dump -h $DB_HOST -U $DB_USER $DB_NAME > $BACKUP_DIR/$DUMP_FILE

if [ $? -ne 0 ]; then
  rm $BACKUP_DIR/$DUMP_FILE
  echo "Back up failed!!!"
  exit 1
fi

echo "Successfully backed up"

fusermount -u $BACKUP_DIR
rmdir $BACKUP_DIR

exit 0
