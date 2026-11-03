use college_db;
show tables;
describe students;
describe enrollments;
describe courses;


-- Display the different cities the students come from.
select distinct city from students;

--  Display the different departments.
select distinct department from courses;

--  Display the different combinations of department and admission_year.
select distinct department , admission_year from students;

--  Display all students from Kochi.
select * from students where city ='Kochi';

--  Display first_name, last_name and percentage of students who scored above 80.
SELECT first_name, last_name, percentage FROM students WHERE percentage > 80;

--  Display all students who are not in the Commerce department.
select first_name , last_name ,department from students where not department ='commerce';

--  Display all students admitted in 2023 or later.
select first_name , last_name , admission_year from students where admission_year >='2023-01-01';

--  Display all female students in Computer Science.
select first_name , last_name from students where gender ='f';

--  Display all students in Electronics or Mechanical.
select first_name , last_name , department from students where department = 'Mechanical' or department = 'Electronics';

--  Display all students from Kochi, Thrissur or Kozhikode.
select first_name , last_name , city from students where city in ('Kochi' , 'Thrissur' , 'kozhikode');

--  Display all students who are not from Chennai, Bengaluru or Trivandrum.
SELECT * FROM students WHERE city NOT IN ('Chennai', 'Bengaluru', 'Trivandrum');

--  Display first_name, department and percentage of students who scored 70 or more and 85 or less.
SELECT first_name, department, percentage FROM students WHERE percentage BETWEEN 70 AND 85;

--  Display first_name and date_of_birth of students born on or after 1 January 2004 and on or before 30 June 2004.
SELECT first_name, date_of_birth FROM students WHERE date_of_birth BETWEEN '2004-01-01' AND '2004-06-30';

-- Display first_name, department and percentage of Computer Science or Electronics students who scored above 85.
SELECT first_name, department, percentage FROM students WHERE department IN ('Computer Science', 'Electronics')
  AND percentage > 85;
  
-- Display all courses that have 4 credits.
SELECT * FROM courses WHERE credits = 4;

-- Display all enrollments of course 101 where the marks are 80 or more.
SELECT * FROM enrollments WHERE course_id = 101 AND marks >= 80;