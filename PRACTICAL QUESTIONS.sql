use cueaedu;

#Average Grade per Program + Top Lecturer
SELECT
	p.program_name,
	AVG(e.grade) as average_grade,
	CONCAT(l.first_name,'',l.last_name) AS top_lecturer
FROM Programs p
JOIN Courses c ON p.program_id = c.program_id
JOIN Lecturers l On c.lecturer_id = l.lecturer_id
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY p.program_name
ORDER BY average_grade DESC; #order in a descending manner


#Top 3 Students per program (CTE + RANK)
WITH StudentAverages AS(
SELECT 
	s.student_id,
    CONCAT(s.first_name,'',s.last_name) AS student_name,
    p.program_name,
    AVG(e.grade) as avg_grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Programs p ON s.program_id = p.program_id
GROUP BY s.student_id, p.program_name
)    
SELECT *
FROM(
	SELECT
		student_name,
        program_name,
        avg_grade,
        RANK() OVER (PARTITION BY program_name ORDER BY avg_grade DESC) AS rank_in_program
	FROM StudentAverages
) ranked
WHERE rank_in_program <= 3;

#Quering JSON data
SELECT
	l.first_name,
    l.last_name,
    JSON_UNQUOTE(JSON_EXTRACT(lp.profile_data,'$.specialization')) AS specialization,
    JSON_EXTRACT(lp.profile_data,'$.experience') AS years_experience
FROM Lecturers l
JOIN LecturerProfiles lp ON l.lecturer_id = lp.lecturer_id
WHERE JSON_UNQUOTE(JSON_EXTRACT(lp.profile_data,'$.specialization')) = 'AT'
	AND  JSON_EXTRACT(lp.profile_data,'$.experience') > 5;

#Fee Status with CASE
SELECT
	s.student_id,
    CONCAT(s.first_name,'',s.last_name) AS student_name,
    IFNULL(SUM(f.amount),0) AS total_paid,
    CASE
		WHEN SUM(f.amount) >= 100000 THEN 'Cleared'
        WHEN SUM(f.amount) BETWEEN 50000 AND 99999 THEN 'Partial'
        ELSE 'Pending'
	END AS fee_status
FROM Students s
LEFT JOIN Fees f ON s.student_id = f.student_id
GROUP BY s.student_id;
    


















