use cueaedu;

-- Combined insight  adn security view
create or replace view Institution_Analytics as
select
   department_name,
   count(Student_id) as TotalStudents,
   round(avg(AvgMarks),2) as AvgDeptPerformance,
   sum(OutstandingBalance) as TotalDeptDebt,
   sum(BooksBorrowed) as TotalBooksBorrowed
from Fact_StudentSummary
group by department_name;

select * from Institution_Analytics;