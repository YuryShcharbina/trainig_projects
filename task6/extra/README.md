### Advanced load data script
In this approach all data stores in one csv file. When run script for the first time  
it creates two tables in database test_students, and temp table temp_data, which  
will be deleted after transfer:  
```angular2html
$ psql -h localhost -U postgres -W -f full_data_load.sql 
Password: 
Password: 
You are now connected to database "test_students" as user "postgres".
CREATE TABLE
CREATE TABLE
CREATE TABLE
COPY 22
INSERT 0 22
INSERT 0 22
DROP TABLE
```
you see: created three tables, copy data to tables and delete tem_table
And now, if you load data and data not changed, nothing happens:
```angular2html
$ psql -h localhost -U postgres -W -f full_data_load.sql 
Password: 
Password: 
You are now connected to database "test_students" as user "postgres".
CREATE TABLE
psql:full_data_load.sql:15: NOTICE:  relation "students" already exists, skipping
CREATE TABLE
psql:full_data_load.sql:23: NOTICE:  relation "result" already exists, skipping
CREATE TABLE
COPY 22
INSERT 0 0
INSERT 0 0
DROP TABLE
```

### Ansible playbook for logical replication
Made several roles for installation postgresql on master and slave node, configure them for logical replication,
and load test data to master server