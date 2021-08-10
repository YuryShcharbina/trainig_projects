\c test_students

\copy Students(Student,StudentId) FROM '/tmp/students.csv' DELIMITER ',' CSV HEADER;
\copy Result(StudentId,Task1,Task2,Task3,Task4) FROM '/tmp/result.csv' DELIMITER ',' CSV HEADER;
