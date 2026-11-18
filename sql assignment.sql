use college_db;

-- 1. Display the first names of all students in capital letters.
select upper (first_name ) from students;

-- 2. Display the last names of all students in small letters.
select lower (last_name) from students;

-- 3. Display the full name of every student (first name, a space, then last name) with the heading Full Name.
select concat(first_name," " , last_name)as 'full name' from students;

-- 4. Display each student’s first name along with the number of letters in it.
select length(first_name) from students;

-- 5. Display the first three letters of each student’s first name.
select left (first_name,3 ) from students;

-- 6. Display each student’s initials, made of the first letter of the first name followed by the first letter of the last name, with the heading Initials.
select concat(left(first_name,1),left(last_name,1)) from students;

-- 7. Display the first names of students whose first name has more than 6 letters.
select first_name from students where length(first_name)>6;


-- 8. Display a student code for every student, made of the first four letters of the department in
-- capital letters followed by the student ID (for example COMP1), with the heading Student
-- Code.
select concat(upper(left(department,4)),student_id) from students;

-- 9. Take the text Route Academy with 3 extra spaces typed before it and 3 extra spaces typed
-- after it. Display the text after removing the extra spaces, and also display its length before
-- and after removing the spaces.
SELECT TRIM('   Route Academy   ')         AS trimmed_text,
       LENGTH('   Route Academy   ')       AS length_before,
       LENGTH(TRIM('   Route Academy   ')) AS length_after;

-- 10. Display each student’s first name along with the year of birth.
select concat(first_name ," " ,year(date_of_birth)) from students ;

-- 11. Display each student’s first name along with the month of birth as a number.
select concat(first_name , " " , month(date_of_birth)) from students;

-- 12. Display the first name and date of birth of students born in March.
select first_name,date_of_birth from students where month(date_of_birth)=3;

-- 13. Display each student’s date of birth in the form 12-03-2004 (day, month, year).
select concat(day(date_of_birth),'-',month(date_of_birth),'-',year(date_of_birth)) as 'DD-MM-YYYY',student_id from students;

-- 14. Display each student’s date of birth in the form 12 March 2004.
select concat(day(date_of_birth),' ',monthname(date_of_birth),' ',year(date_of_birth)) as 'DD-Monthname-YYYY',student_id from students;

-- 15. Display each student’s first name along with the number of days from the date of birth to 1
-- January 2026.
select datediff('2026-01-01',date_of_birth) as 'since 01-01-26' from students ;

-- 16. Display the number of students born in each year.
SELECT YEAR(date_of_birth), COUNT(*)FROM students GROUP BY YEAR(date_of_birth);

-- 17. For students born in 2004, display the departments that have at least 5 such students, along
-- with the number of students.
SELECT department, COUNT(*) AS student_count FROM students WHERE YEAR(DATE_OF_BIRTH) = 2004 GROUP BY department HAVING COUNT(*) >= 5;