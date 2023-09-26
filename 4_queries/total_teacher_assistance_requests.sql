-- Get the total number of assistance_requests for a teacher.

SELECT teachers.name as teacher_name, COUNT(assistance_requests.id) as assistance_requests
  FROM teachers
  JOIN assistance_requests ON assistance_requests.teacher_id = teachers.id
  WHERE teachers.name LIKE 'Waylon Boehm'
  GROUP BY teachers.name;