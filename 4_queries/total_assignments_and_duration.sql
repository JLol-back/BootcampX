-- Get each day with the total number of assignments
-- and the total duration of the assignments.

SELECT assignments.day as day, 
       COUNT(assignments.*) as number_of_assignements,
       SUM(assignments.duration) as duration
  FROM assignments
  GROUP BY assignments.day
  ORDER BY day ASC; 

  