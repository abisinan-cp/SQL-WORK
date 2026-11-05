use college_db;
select * from students ;

-- 1. Display the total number of students.
select count(*) as 'STUDENTS' from students ;

-- 2. Display the number of students whose percentage is available.
select count(percentage) as students_percentage from students;

-- 3. Display the highest, lowest and average percentage of all students, with the headings Highest, Lowest and Average.
select max(percentage) as Highest , min(percentage) as lowest , avg(percentage) from students ;

-- 4. Display the total number of courses and the total credits in the courses table.
select count(*) as total_courses , sum(credits) as total_credits from courses ;

-- 5. Display the highest and lowest marks in the enrollments table.
select max(marks) as higest_mark , min(marks) as lowest_mark from enrollments ;

-- 6. Display the number of students in each department.
select department , count(*) as number_of_students 	from students group by department;

-- 7. Display the number of students from each city.
select city , count(*) as number_of_students from students group by city ;

-- 8. Display the average percentage of each department.
select department , avg(percentage) as average_percentage from students group by department ;

-- 9. Display the number of students admitted in each year, with the latest year first.
SELECT YEAR(admission_year) AS admission_year, COUNT(*) AS number_of_students FROM students GROUP BY YEAR(admission_year)
ORDER BY admission_year DESC;

-- 10. Display the number of male and female students in each department.
SELECT department, gender, COUNT(*) AS number_of_students FROM students GROUP BY department, gender;

-- 11. Display the average marks of each course in the enrollments table, showing the course ID.
SELECT course_id, AVG(marks) AS average_marks FROM enrollments GROUP BY course_id;

-- 12. Display the student ID and the number of courses for students who are enrolled in at least 2 courses.
SELECT student_id, COUNT(*) AS number_of_courses FROM enrollments GROUP BY student_id HAVING COUNT(*) >= 2;

-- 13. Display the cities that have at least 6 students.
SELECT city FROM students GROUP BY city HAVING COUNT(*) >= 6;

-- 14. Display the departments whose average percentage is above 70.
SELECT department FROM students GROUP BY department HAVING AVG(percentage) > 70;

-- 15. For students admitted in 2022 or later, display the departments whose average percentage is 75 or more.
select department FROM students WHERE YEAR(admission_year) >= 2022 GROUP BY department HAVING AVG(percentage) >= 75;


-- 16. Among enrollments with marks of 80 or more, display the course IDs that have at least 3 such enrollments.
SELECT course_id FROM enrollments WHERE marks >= 80 GROUP BY course_id HAVING COUNT(*) >= 3;