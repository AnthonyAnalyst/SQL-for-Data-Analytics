INSERT INTO students(Students_id, Full_name, gender, age, Course)
VALUES
(1,'Anthony bulu',"MALE",25,"Data Analysis"),
(2,"Apiyo Esther","FEMALE",23,"Cyber Security"),
(3,"Otim Fencis","MALE",34,"Stack Development"),
(4,"Lanyero Gloria","FEMALE",23,"Data Anlysis"),
(5,"Okoth Jonh","MALE",23,"Digital Makerting"),
(5,"Ajok Evaline","FEMALE",23,"Digital Makerting")
;
SELECT * FROM students;

-- 1. Select all columns
SELECT * 
FROM students;


-- 2. Select Full_name and course
SELECT Full_name, course students
FROM students;


-- 3. Retrieve a list of unique Courses
SELECT DISTINCT Course
FROM students;


-- 4. Rename Full_name as 'Full Name'
SELECT Full_name AS "Full Name", course
FROM students;


-- 5. Concatenate Full_name and course as 'Student_Details'
SELECT CONCAT(Full_name, ' / ', course) AS Student_Details
FROM students;