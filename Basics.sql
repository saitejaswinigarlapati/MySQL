create  database  learning;
use learning;
create table students 
		(id Int primary key ,
			 name varchar(50),
			 age int);

insert into students (id,name,age) 
values (1,"Alice",20),
		(2,"Bob",22);
					
insert into students (id,name,age) 
values (3, 'Charlie', 19),
       (4, 'David', 21);
select * from students;


select name from students where age >20;

update students
set age =21 where
id =1;

delete from students where id =2;
