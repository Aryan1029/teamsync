const express = require('express');
const mysql = require('mysql2');
const app = express();

// Create a MySQL connection pool
const pool = mysql.createPool({
  host: 'localhost',
  port: '3306',
  user: 'root',
  password: 'root',
  database: 'mydb',
});

// Define a route to fetch data from the applicants table
app.get('/rejected_applicant_list', (req, res) => {
  pool.query('SELECT * FROM applicant where application_status="rejected"', (error, results) => {
    if (error) {
      console.error('Error executing query: ' + error.stack);
      res.status(500).json({ error: 'Internal server error' });
      return;
    }
    res.send(results);
  });
});

// Start the Express server
const port = 3007;
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});