\c test_students

\copy Students(Student,StudentId) FROM '/home/master/test_postgres/students.csv' DELIMITER ',' CSV HEADER;
\copy Result(StudentId,Task1,Task2,Task3,Task4) FROM '/home/master/test_postgres/result.csv' DELIMITER ',' CSV HEADER;
