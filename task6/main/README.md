### Work with Postgresql

```
select Task1,Task2,Task3,Task4 from result where id=(select id from students where student ~'Михаил');
```