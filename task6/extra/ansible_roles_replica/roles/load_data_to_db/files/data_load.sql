
CREATE TABLE IF NOT EXISTS temp_data (
                StudentId INT,
                Student VARCHAR(50) NOT NULL,
                Task1 VARCHAR(20) NOT NULL,
                Task2 VARCHAR(20) NOT NULL,
                Task3 VARCHAR(20) NOT NULL,
                Task4 VARCHAR(20) NOT NULL
);

\copy temp_data FROM '/tmp/full_data.csv' DELIMITER ',' CSV HEADER;

INSERT INTO Students (Student, StudentId)
SELECT Student,StudentId FROM temp_data
WHERE temp_data.StudentId NOT IN (SELECT StudentId FROM Students);

INSERT INTO Result (StudentId,Task1,Task2,Task3,Task4)
SELECT StudentId,Task1,Task2,Task3,Task4 FROM temp_data
WHERE temp_data.StudentId NOT IN (SELECT StudentId FROM Result);

DROP TABLE temp_data;
