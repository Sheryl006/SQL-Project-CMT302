use cueaedu;

create table Fact_StudentSummary as
select
   S.student_id,
   CONCAT(s.first_name,'',s.last_name) AS student_name,
   S.first_name,
   D.department_name,
   avg(E.Marks) as AvgMarks,
   count(E.ExamID) as ExamsTaken,
   sum(F.amount) as TotalFeesPayable,
   sum(F.AmountPaid) as TotalFeesPaid,
   sum(F.Balance) as OutstandingBalance,
   count(BR.BorrowID) as BooksBorrowed
from Students S
left join Programs P on S.program_id = P.program_id
left join Departments D on P.department_id = D.department_id
left join Exams E on S.student_id = E.student_id
left join Fees F on S.student_id = F.student_id
left join Borrow BR on S.student_id = BR.student_id
group by S.student_id, S.first_name, D.department_name;

select * from Fact_StudentSummary;

-- Student With Outstanding Balances
select first_name, OutstandingBalance
from Fact_StudentSummary
where OutstandingBalance > 0
order by OutstandingBalance desc;
 
-- Departmental performance summary
select department_name,
   round(avg(AvgMarks),2) as DeptAverage,
   sum(OutstandingBalance) as TotalDebt
from Fact_studentSummary
group by department_name;

-- Library usage analysis






