DROP DATABASE IF EXISTS college_db;
CREATE DATABASE college_db;
USE college_db;

CREATE TABLE students (
    student_id     INT,
    first_name     VARCHAR(30),
    last_name      VARCHAR(30),
    gender         CHAR(1),
    date_of_birth  DATE,
    city           VARCHAR(30),
    department     VARCHAR(30),
    admission_year INT,
    percentage     DECIMAL(5,2)
);

INSERT INTO students
(student_id, first_name, last_name, gender, date_of_birth, city, department, admission_year, percentage) VALUES
(1,  'Aarav',    'Nair',      'M', '2004-03-12', 'Kochi',      'Computer Science', 2022, 82.50),
(2,  'Anjali',   'Menon',     'F', '2003-07-25', 'Thrissur',   'Computer Science', 2022, 91.20),
(3,  'Basil',    'Joseph',    'M', '2004-01-09', 'Kochi',      'Electronics',      2022, 68.40),
(4,  'Devika',   'Raj',       'F', '2004-11-30', 'Kozhikode',  'Commerce',         2022, 74.00),
(5,  'Eldho',    'Paul',      'M', '2003-05-18', 'Kochi',      'Mechanical',       2021, 59.80),
(6,  'Fathima',  'Noor',      'F', '2004-09-02', 'Kozhikode',  'Computer Science', 2023, 88.60),
(7,  'Gautham',  'Krishna',   'M', '2004-04-14', 'Trivandrum', 'Electronics',      2023, 71.30),
(8,  'Haritha',  'Das',       'F', '2003-12-21', 'Thrissur',   'Commerce',         2021, 79.90),
(9,  'Irfan',    'Ahmed',     'M', '2004-06-07', 'Chennai',    'Mechanical',       2022, 63.50),
(10, 'Jisha',    'Mathew',    'F', '2004-02-16', 'Kochi',      'Computer Science', 2023, 85.00),
(11, 'Karan',    'Mehta',     'M', '2003-08-29', 'Bengaluru',  'Computer Science', 2021, 93.40),
(12, 'Lekha',    'Suresh',    'F', '2004-10-11', 'Trivandrum', 'Commerce',         2023, 66.70),
(13, 'Midhun',   'Babu',      'M', '2004-05-05', 'Thrissur',   'Electronics',      2022, 77.20),
(14, 'Nandana',  'Varma',     'F', '2004-07-19', 'Kochi',      'Electronics',      2023, 84.10),
(15, 'Omar',     'Faizal',    'M', '2003-03-03', 'Kozhikode',  'Mechanical',       2021, 55.60),
(16, 'Parvathy', 'Nair',      'F', '2004-12-08', 'Trivandrum', 'Computer Science', 2022, 89.30),
(17, 'Rahul',    'Dev',       'M', '2004-01-27', 'Chennai',    'Commerce',         2022, 72.80),
(18, 'Sandra',   'Thomas',    'F', '2004-08-13', 'Kochi',      'Commerce',         2023, 81.40),
(19, 'Tijo',     'George',    'M', '2003-10-06', 'Thrissur',   'Mechanical',       2021, 61.90),
(20, 'Uma',      'Maheswari', 'F', '2004-04-22', 'Chennai',    'Computer Science', 2023, 87.70),
(21, 'Vishnu',   'Prasad',    'M', '2004-02-01', 'Kozhikode',  'Electronics',      2022, 69.50),
(22, 'Yamini',   'Krishnan',  'F', '2003-09-15', 'Bengaluru',  'Electronics',      2021, 75.60),
(23, 'Zain',     'Abdul',     'M', '2004-11-04', 'Kochi',      'Computer Science', 2023, 80.20),
(24, 'Alex',     'Sebastian', 'M', '2004-06-30', 'Trivandrum', 'Mechanical',       2022, 58.30),
(25, 'Bhavana',  'Rao',       'F', '2004-03-25', 'Bengaluru',  'Commerce',         2022, 83.50),
(26, 'Chandni',  'Pillai',    'F', '2004-09-17', 'Kochi',      'Commerce',         2023, 70.10),
(27, 'Dhanush',  'Kumar',     'M', '2003-06-11', 'Chennai',    'Computer Science', 2021, 90.80),
(28, 'Emi',      'Joseph',    'F', '2004-05-29', 'Thrissur',   'Computer Science', 2022, 76.40),
(29, 'Farhan',   'Basheer',   'M', '2004-07-08', 'Kozhikode',  'Mechanical',       2023, 64.20),
(30, 'Gayathri', 'Nair',      'F', '2004-01-19', 'Kochi',      'Electronics',      2022, 86.90),
(31, 'Hari',     'Narayan',   'M', '2004-10-24', 'Trivandrum', 'Commerce',         2023, 73.60),
(32, 'Ishita',   'Sen',       'F', '2004-12-31', 'Bengaluru',  'Computer Science', 2023, NULL),
(33, 'Jerin',    'Varghese',  'M', '2005-02-10', 'Kochi',      'Mechanical',       2024, NULL),
(34, 'Kavya',    'Menon',     'F', '2005-03-20', 'Thrissur',   'Electronics',      2024, NULL),
(35, 'Liyana',   'Fathima',   'F', '2005-01-14', 'Kozhikode',  'Commerce',         2024, NULL),
(36, 'Mohan',    'Das',       'M', '2003-04-02', 'Chennai',    'Electronics',      2021, 67.80);

CREATE TABLE courses (
    course_id   INT,
    course_name VARCHAR(40),
    department  VARCHAR(30),
    credits     INT
);

INSERT INTO courses (course_id, course_name, department, credits) VALUES
(101, 'Database Systems',      'Computer Science', 4),
(102, 'Programming in Python', 'Computer Science', 4),
(103, 'Data Structures',       'Computer Science', 4),
(201, 'Digital Circuits',      'Electronics',      3),
(202, 'Microprocessors',       'Electronics',      3),
(301, 'Financial Accounting',  'Commerce',         3),
(302, 'Business Statistics',   'Commerce',         3),
(401, 'Thermodynamics',        'Mechanical',       4);

CREATE TABLE enrollments (
    enrollment_id INT,
    student_id    INT,
    course_id     INT,
    marks         INT
);

INSERT INTO enrollments (enrollment_id, student_id, course_id, marks) VALUES
(1,  1,  101, 78),
(2,  1,  102, 85),
(3,  2,  101, 92),
(4,  2,  103, 88),
(5,  6,  101, 81),
(6,  6,  102, 90),
(7,  10, 102, 84),
(8,  10, 103, 79),
(9,  11, 101, 95),
(10, 11, 103, 91),
(11, 16, 102, 87),
(12, 20, 101, 83),
(13, 23, 103, 74),
(14, 27, 101, 93),
(15, 28, 102, 76),
(16, 32, 101, NULL),
(17, 3,  201, 65),
(18, 3,  202, 70),
(19, 7,  201, 72),
(20, 13, 202, 78),
(21, 14, 201, 85),
(22, 14, 202, 82),
(23, 21, 201, 68),
(24, 22, 202, 77),
(25, 30, 201, 88),
(26, 34, 201, NULL),
(27, 4,  301, 75),
(28, 8,  302, 80),
(29, 12, 301, 64),
(30, 17, 302, 71),
(31, 18, 301, 82),
(32, 25, 301, 84),
(33, 26, 302, 69),
(34, 31, 301, 72),
(35, 5,  401, 58),
(36, 9,  401, 62),
(37, 15, 401, 54),
(38, 19, 401, 60),
(39, 24, 401, 57),
(40, 29, 401, 66);
