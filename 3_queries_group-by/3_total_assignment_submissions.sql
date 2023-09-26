-- Get the total number of assignment submissions for each cohort.--

SELECT cohorts.name, count(assignment_submissions.id)
  FROM students
  INNER JOIN cohorts ON cohorts.id = cohort_id
  INNER JOIN assignment_submissions ON assignment_submissions.student_id = students.id
  GROUP BY cohorts.name
  ORDER BY count(assignment_submissions.id) DESC;