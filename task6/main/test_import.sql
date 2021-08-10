\c test_students

\copy Students(Student,StudentId) FROM './students.csv' DELIMITER ',' CSV HEADER;
\copy Result(StudentId,Task1,Task2,Task3,Task4) FROM './result.csv' DELIMITER ',' CSV HEADER;
