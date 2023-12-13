--VASANTH_SQL_Assigmnet				Student Information System (SIS)

--TASK 1

-- 1. Create the database named "SISDB"

create database SIS;
use SIS;

/*2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationships.
a. Students
b. Courses
c. Enrollments
d. Teacher
e. Payments*/

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE,
    email VARCHAR(255),
    phone_number VARCHAR(15));

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id));

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id));

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255));

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id));

/*5. Insert at least 10 sample records into each of the following tables.
i. Students
ii. Courses
iii. Enrollments
iv. Teacher
v. Payments*/

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
(1, 'Rohan', 'jami', '1995-05-10', 'rohan.jami@email.com', '147-852-9630'),
(2, 'Jane', 'Smith', '1998-08-22', 'jane.smith@email.com', '987-654-3210'),
(3, 'Bob', 'Johnson', '1997-02-15', 'bob.johnson@email.com', '555-123-4567'),
(4, 'Alice', 'Williams', '1996-11-30', 'alice.williams@email.com', '222-333-4444'),
(5, 'Charlie', 'Brown', '1999-04-05', 'charlie.brown@email.com', '111-999-8888'),
(6, 'Emma', 'Davis', '1994-07-18', 'emma.davis@email.com', '777-888-9999'), 
(7, 'Michael', 'Lee', '1993-09-25', 'michael.lee@email.com', '666-555-4444'),
(8, 'Sophia', 'Taylor', '2000-01-12', 'sophia.taylor@email.com', '444-222-1111'),
(9, 'David', 'Miller', '1992-12-03', 'david.miller@email.com', '123-987-6543'),
(10, 'Olivia', 'Moore', '1991-06-28', 'olivia.moore@email.com', '999-111-3333');
select * from Students;

INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
(1, 'Amit', 'Kumar', 'amit.kumar@email.com'),
(2, 'Priya', 'Sharma', 'priya.sharma@email.com'),
(3, 'Rahul', 'Verma', 'rahul.verma@email.com'),
(4, 'Ananya', 'Srivastava', 'ananya.srivastava@email.com'),
(5, 'Vikram', 'Singh', 'vikram.singh@email.com'),
(6, 'Kavita', 'Joshi', 'kavita.joshi@email.com'),
(7, 'Raj', 'Patel', 'raj.patel@email.com'),
(8, 'Neha', 'Mishra', 'neha.mishra@email.com'),
(9, 'Ravi', 'Yadav', 'ravi.yadav@email.com'),
(10, 'Sonia', 'Gupta', 'sonia.gupta@email.com');
select * from Teacher;

INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
(1, 'Computer Science Fundamentals', 4, 1),
(2, 'Indian History and Culture', 3, 3),
(3, 'Mathematics for Engineering', 5, 5),
(4, 'Environmental Science', 3, 2),
(5, 'English Literature', 4, 6),
(6, 'Business Management Principles', 3, 4),
(7, 'Artificial Intelligence and Machine Learning', 4, 1),
(8, 'Economics of India', 3, 7),
(9, 'Civil Engineering Design', 5, 9),
(10, 'Indian Classical Music', 2, 8);
select * from Courses;

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 1, 7, '2023-01-15'),
(2, 2, 3, '2023-02-20'),
(3, 3, 8, '2023-03-10'),
(4, 4, 1, '2023-04-05'),
(5, 5, 6, '2023-05-12'),
(6, 6, 2, '2023-06-18'),
(7, 7, 9, '2023-07-25'),
(8, 8, 4, '2023-08-30'),
(9, 9, 10, '2023-09-08'),
(10, 10, 5, '2023-10-15');
select * from Enrollments;

INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
(1, 1, 500.00, '2023-01-05'),
(2, 2, 750.50, '2023-02-10'),
(3, 3, 600.25, '2023-03-15'),
(4, 4, 900.75, '2023-04-20'),
(5, 5, 350.00, '2023-05-25'),
(6, 6, 800.50, '2023-06-30'),
(7, 7, 450.25, '2023-07-05'),
(8, 8, 700.75, '2023-08-10'),
(9, 9, 550.00, '2023-09-15'),
(10, 10, 950.50, '2023-10-20');
select * from Payments;

-- Tasks 2: Select, Where, Between, AND, LIKE:

/*1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
© Hexaware Technologies Limited. All rights www.hexaware.com
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890*/

INSERT INTO Students (student_id,first_name, last_name, date_of_birth, email, phone_number)
VALUES (11,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');
select * from Students;

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.

INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date)
VALUES (11,1, 2,'2023-12-08');
select * from Enrollments;

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.

UPDATE Teacher
SET email = 'axar.patel@email.com'
WHERE teacher_id = 7;
select * from Teacher;

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.

DELETE FROM Enrollments
WHERE student_id = 5 AND course_id = 6;
select * from Enrollments;

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.

UPDATE Courses
SET teacher_id = 1
WHERE course_id = 3;
select * from Courses;

--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.

DELETE FROM Payments
WHERE student_id = 1;
DELETE FROM Students
WHERE student_id = 1;
DELETE FROM Enrollments
WHERE student_id = 1;
select * from Students;
select * from Enrollments;

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.

UPDATE Payments
SET amount = 1200.50
WHERE payment_id = 3;
select * from Payments;

--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:

--1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.

SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 5
GROUP BY s.student_id, s.first_name, s.last_name;

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

SELECT
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS enrolled_students_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.

SELECT s.student_id, s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.

SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.

SELECT
    t.first_name AS teacher_first_name,
    t.last_name AS teacher_last_name,
    c.course_name
FROM
    Teacher t
JOIN
    Courses c ON t.teacher_id = c.teacher_id;

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.

SELECT
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    e.enrollment_date
FROM
    Students s
JOIN
    Enrollments e ON s.student_id = e.student_id
JOIN
    Courses c ON e.course_id = c.course_id
WHERE
    c.course_id = '8';

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.

SELECT
    s.first_name,
    s.last_name
FROM
    Students s
LEFT JOIN
    Payments p ON s.student_id = p.student_id
WHERE
    p.payment_id IS NULL;

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.

SELECT
    c.course_id,
    c.course_name
FROM
    Courses c
LEFT JOIN
    Enrollments e ON c.course_id = e.course_id
WHERE
    e.enrollment_id IS NULL;

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.

SELECT DISTINCT
    e1.student_id,
    s.first_name,
    s.last_name
FROM
    Enrollments e1
JOIN
    Enrollments e2 ON e1.student_id = e2.student_id AND e1.enrollment_id <> e2.enrollment_id
JOIN
    Students s ON e1.student_id = s.student_id;

--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.

SELECT
    t.teacher_id,
    t.first_name,
    t.last_name
FROM
    Teacher t
LEFT JOIN
    Courses c ON t.teacher_id = c.teacher_id
WHERE
    c.teacher_id IS NULL;

--Task 4. Subquery and its type:

--1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.
SELECT
    course_id,
    AVG(student_count) AS average_students_enrolled
FROM (
    SELECT
        course_id,
        COUNT(DISTINCT student_id) AS student_count
    FROM
        Enrollments
    GROUP BY
        course_id
) AS course_enrollment_counts
GROUP BY
    course_id;

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.

SELECT
    Students.student_id,
    Students.first_name,
    Students.last_name,
    Students.email,
    Students.phone_number,
    Payments.amount AS highest_payment_amount,
    Payments.payment_date
FROM
    Students
JOIN
    Payments ON Students.student_id = Payments.student_id
WHERE
    Payments.amount = (SELECT MAX(amount) FROM Payments);

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.

SELECT
    Courses.course_id,
    Courses.course_name,
    COUNT(Enrollments.enrollment_id) AS enrollment_count FROM Courses   
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id   
GROUP BY  Courses.course_id, Courses.course_name
HAVING COUNT(Enrollments.enrollment_id) = (
        SELECT MAX(enrollment_count) FROM 
		(SELECT course_id, COUNT(enrollment_id) AS enrollment_count
FROM Enrollments
            GROUP BY course_id) AS max_enrollments);

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
    
SELECT
    Teacher.teacher_id,
    Teacher.first_name,
    Teacher.last_name,
    sum(payments.amount) as totalpayments
FROM
    Teacher
LEFT JOIN
    Courses ON Teacher.teacher_id = Courses.teacher_id
LEFT JOIN
    Enrollments ON Courses.course_id = Enrollments.course_id
LEFT JOIN
    Payments ON Enrollments.student_id = Payments.student_id
GROUP BY
    Teacher.teacher_id, Teacher.first_name, Teacher.last_name;

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.

SELECT 
    s.student_id,
    s.first_name,
    s.last_name
FROM 
    Students s
WHERE 
    (SELECT COUNT(DISTINCT e.course_id) FROM  Enrollments e
     WHERE  e.student_id = s.student_id ) = (
     SELECT COUNT(DISTINCT c.course_id) FROM Courses c); 
         
--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.

SELECT 
    t.first_name,
    t.last_name
FROM Teacher t
WHERE  t.teacher_id NOT IN (SELECT DISTINCT c.teacher_id
        FROM Courses c
WHERE c.teacher_id IS NOT NULL);  

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.

SELECT 
    AVG(student_age) AS average_age
FROM ( SELECT student_id,DATEDIFF(YEAR, date_of_birth, GETDATE()) AS student_age
    FROM  Students ) AS average_age;
  
--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.

SELECT c.course_id, c.course_name FROM Courses c
WHERE c.course_id NOT IN (    
   SELECT  DISTINCT e.course_id FROM 
   Enrollments e);

--9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.

SELECT 
    s.student_id, s.first_name,s.last_name,c.course_id,c.course_name,SUM(p.amount)
    AS total_payments FROM  Students s
JOIN Enrollments e ON s.student_id = e.student_id    
JOIN Courses c ON e.course_id = c.course_id    
LEFT JOIN  Payments p ON s.student_id = p.student_id AND c.course_id = e.course_id     
GROUP BY s.student_id, s.first_name, s.last_name, c.course_id, c.course_name;

--10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.

SELECT s.student_id,s.first_name,s.last_name
   FROM Students s 
JOIN (SELECT student_id FROM Payments
GROUP BY student_id      
HAVING COUNT(*) > 1)      
 AS payment_counts ON s.student_id = payment_counts.student_id;   

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.

SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount)
AS total_payments
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;
        
--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.    

SELECT c.course_id, c.course_name, COUNT(e.student_id)
AS enrolled_students_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name

--13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.    

SELECT s.student_id, s.first_name, s.last_name, AVG(p.amount) 
AS average_payment_amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;