## Work with Postgresql

### Setting up a Postgres database
In this task database runs in Docker container:
```angular2html
$ docker run -d --rm -p 5432:5432 -e POSTGRES_PASSWORD=<your_password> --name test_db postgres
```
if you need to keep database data, you should mount database data directory to the host:
```angular2html
$ docker run -d --rm -p 5432:5432 -e POSTGRES_PASSWORD=<your_password> \
  -v <your_mount_point>:/var/lib/postgresql/data--name test_db postgres
```

### Setting up a postgres client
For work with postgres you could install a client. For example, on ubuntu you need to perform following steps:
```angular2html
$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
$ echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
$ sudo apt install postgresql-client-13
```
version of client depends on your needs

### Create test database
To create database run command:
```angular2html
$ psql -h localhost -U postgres -W -c 'CREATE DATABASE test_students'
```
after you enter the postgres user password, database test_students will be created  

Another approach it is make a sql file with necessary commands and run it:
```
$ psql -h localhost -U postgres -W -f db_init.sql
```

### Load test data in database
One of the methods to load data in database through csv files. You need keep in mind that the structure of csv file must be the same as database table.  
When you prepared the csv file(s) run command:
```angular2html
$ psql -h localhost -U postgres -W test_students\
  -c "\copy Students(Student,StudentId) FROM './students.csv' DELIMITER ',' CSV HEADER;"
```
or this can be done through the sql file(see above)


### Make test query from database
Now you can make different actions with your database. For example, to view student results run query:
```
$ psql -h localhost -U postgres -W test_students \
  -c "select students.student, task1, task2, task3, task4 \
  from students,result where students.studentid=result.studentid \
  and students.student ~ 'Щербина';
```
after you enter the postgres user password, you should see the output:
```angular2html
Password: 
   student    | task1 | task2 | task3 | task4 
--------------+-------+-------+-------+-------
 Юрий Щербина | Done  | Done  | Done  | Done
(1 row)
```

### Create database dump
To create database dump run command:
```angular2html
$ pg_dump -h localhost -U postgres -W test_students > test_dump.sql
```

### Restore database from dump file
To restore database yuo need make following steps:
* create database for restore(see "Create database" above)
* run command:
  ```angular2html
  $ psql -h localhost -U postgres -W test_students < test_dump.sql    
  ```

### Setting up Postgres database with Ansible
In ansible_playbook folder created three ansible roles:
* `postgresql_up` - deploy Docker container with Postgresql
* `install_psql` - install postgresql-client-13 on remote host
* `create_test_db` - create database from dump file  

to execute tasks run command:
```angular2html
$ ansible-playbook setup_postgres.yml --ask-vault-pass
```
after provide vault password, all tasks will be executed