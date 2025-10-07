use cueaedu;

insert into Departments(department_name) values
('Computer Science'),('Business Studies');

insert into Lecturers(first_name ,last_name ,email,department_id) values
('Joel','Barasa','joel@cuea.edu',1),
('Anne','Mutua','anne@cuea.edu',1),
('John','Kariuki','john@cuea.edu',2);

insert into Programs(program_name,department_id ,duration_years) values
('Bsc Information Technology',1,4),
('Bsc Computer Science',1,4),
('Bsc Finance',2,4);

insert into Students(first_name,last_name,gender,dob,program_id,admission_year) values
('Faith','Agnes','F','2001-02-23',1,2022),
('Phil','Kamau','M','2006-04-23',2,2023),
('Caroline','Esther','F','2002-01-19',3,2023),
('Dennis','Adika','M','2005-12-24',2,2024);

insert into Courses(course_code ,course_name ,credit_hours ,program_id ,lecturer_id) values
('CS101', 'Introduction to Computer Science', 3, 1, 1),
('MATH201', 'Calculus II', 4, 2, 2),
('ENG150', 'Database Systems', 2, 1, 1),
('PHY110', 'General Physics', 3, 3, 1),
('HIST210', 'World History', 3, 2, 3);

insert into Enrollments(student_id,course_id,semester,grade) values
(1, 1, 'Jan-Apr', 3.8),
(1, 2, 'May-AUg', 3.6),
(2, 1, 'Jan-Apr', 3.2),
(3, 3, 'Jan-Apr', 4.0),
(4, 4, 'May-AUg',3.9 );

INSERT INTO LecturerProfiles (lecturer_id, profile_data)
VALUES
(3, JSON_OBJECT(
    'experience', 5,
    'Specialization', 'Data Science',
    'Research_Areas', JSON_ARRAY('Machine Learning', 'AI Ethics')
)),
(1, JSON_OBJECT(
    'experience', 2,
    'Specialization', 'Cybersecurity',
    'Research_Areas', JSON_ARRAY('Network Security', 'Cryptography')
));


