### Work with Postgresql

```
select students.student, task1, task2, task3, task4 from students,result where students.studentid=result.studentid and students.student ~ 'Щербина';
```