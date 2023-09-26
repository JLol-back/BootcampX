-- Get the name of all teachers that performed an assistance request during a cohort.

SELECT teachers.name as teacher_name, cohorts.name
  FROM assistance_requests
  JOIN teachers ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
  GROUP BY teachers.name, cohorts.name
  HAVING cohorts.name LIKE 'JUL02';