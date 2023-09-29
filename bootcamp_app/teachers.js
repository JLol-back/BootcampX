const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

'%${process.argv[2]}%'


const queryString = `
  SELECT teachers.name as teacher_name, cohorts.name
  FROM assistance_requests
  JOIN teachers ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
  GROUP BY teachers.name, cohorts.name
  HAVING cohorts.name LIKE $1;
`;

const cohortName = process.argv[2] || 'JUL02';
const values = [`%${cohortName}%`];


pool.query(queryString, values)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));

