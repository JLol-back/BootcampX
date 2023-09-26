-- Days where total number of assignments equal or exceed 10 --

SELECT day, count(name) as total_assignments
  FROM assignments  
  GROUP BY day
  HAVING count(*) > 10
  ORDER BY day;