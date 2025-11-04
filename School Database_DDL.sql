create database cueaedu;

use cueaedu;

-- Departments
create table Departments(
department_id int auto_increment primary key,
department_name varchar(100),
parent_id int null,
dean_id int null
);

-- Lecturers
create table Lecturers(
lecturer_id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(100),
department_id int,
foreign key (department_id) references Departments(department_id)
);

-- Programs
create table Programs(
program_id int auto_increment primary key,
program_name varchar(50),
department_id int,
duration_years int,
foreign key (department_id) references Departments(department_id)
);

-- Students
create table Students(
student_id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
gender enum('M','F'),
dob date,
program_id int,
admission_year int,
foreign key (program_id ) references Programs(program_id)
);

-- Courses
create table Courses(
course_id int auto_increment primary key,
course_code varchar(10),
course_name varchar(50),
credit_hours int,
program_id int,
lecturer_id int,
foreign key (program_id ) references Programs(program_id),
foreign key (lecturer_id ) references Lecturers(lecturer_id)
);

-- Enrollments
create table Enrollments(
enrollment_id int auto_increment primary key,
student_id int,
course_id int,
semester varchar(20),
grade decimal(3,2),
foreign key (student_id ) references Students(student_id),
foreign key (course_id ) references Courses(course_id)
);

-- Fees

create table Fees(
fee_id int auto_increment primary key,
student_id int,
amount decimal(10,2),
date_paid date,
payment_mode varchar(30),
foreign key (student_id ) references Students(student_id)
);

ALTER TABLE Fees
  ADD COLUMN AmountPaid DECIMAL(10,2),
  ADD COLUMN Balance DECIMAL(10,2);

-- Class Schedules
create table ClassSchedules(
schedule_id int auto_increment primary key,
course_id int,
lecturer_id int,
day_of_week enum('Monday','Tuesday','Wednesday','Thursday','Friday'),
start_time time,
end_time time,
venue varchar(50),
foreign key (course_id ) references Courses(course_id),
foreign key (lecturer_id ) references Lecturers(lecturer_id)
);

-- Lecturer Profiles(JSON file)
create table LecturerProfiles(
lecturer_id int primary key,
profile_data JSON,
foreign key (lecturer_id ) references Lecturers(lecturer_id)
);

-- Audit log table
create table Student_Audit(
audit_id int auto_increment primary key,
student_id int,
action varchar(100),
timestamp datetime,
foreign key (student_id ) references Students(student_id)
);

CREATE TABLE Exams (
  ExamID INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  Marks DECIMAL(5,2),
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
  );

ALTER TABLE Exams
ADD COLUMN course_id INT,
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id) REFERENCES Courses(course_id);


  CREATE TABLE Borrow (
  BorrowID INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  book_title VARCHAR(100),
  borrow_date DATE,
  return_date DATE,
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);







