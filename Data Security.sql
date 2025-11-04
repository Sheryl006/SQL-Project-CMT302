use cueaedu;

-- Database Security Demonstration
#Step 1: Create  user accounts for role based access control
create user if not exists 'finance_user '@' localhost' identified by 'Finance@123';
create user if not exists 'lecturer_user '@' localhost' identified by 'Lecturer@123';
create user if not exists 'admin_user '@' localhost' identified by 'Admin@123';

#Step2: create secure views for limited data exposure
-- Finance View restricted to fees and balances
create or replace view Secure_FinanceView as
select S.first_name, F.amount, F.AmountPaid,F.balance
from Fees F
join Students S on F.student_id = S.student_id;

-- Lecturer View resticted to academic data
create or replace view Secure_LecturerView as
select S.first_name, C.course_id, E.Marks
from Exams E
join Students S on E.student_id = S.student_id
join Courses C on E.course_id;

# Step 3: mask sensitive student data
create or replace view Masked_Students as
select
  student_id,
  concat(left(first_name,2),'***') as MaskedName,
  gender,
  program_id
from Students;

#Step 4: Assign privileges to simulate secure access
-- finance officer only can view financial records
grant select on cueaedu.Secure_FinanceView to 'finance_user '@' localhost';

-- lecturer only can view academic data
grant select on cueaedu.Secure_LecturerView to 'lecturer_user '@' localhost';

-- Admin has full access
grant all privileges on cueaedu.* to 'admin_user '@' localhost' with grant option;

#Step 5; Optional check of privileges
show grants for 'finance_user '@' localhost';
show grants for 'lecturer_user '@' localhost';