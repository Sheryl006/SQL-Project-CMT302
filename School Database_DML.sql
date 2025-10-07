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

insert into Courses()
