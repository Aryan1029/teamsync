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
app.get('/applicant_list', (req, res) => {
  pool.query('SELECT * FROM applicant where application_status=\'pending\'', (error, results) => {
    if (error) {
      console.error('Error executing query: ' + error.stack);
      res.status(500).json({ error: 'Internal server error' });
      return;
    }
    // let responseString='';
    // // Iterate through the results and print each item
    // results.forEach((row) => {
    //     console.log(`ID: ${row.id}, Name: ${row.name}, Position: ${row.pp}`);
    //     responseString+=`${row.id},${row.name}, ${row.pp} <br>`;
    //   });
    // res.json(results);
    // res.send(responseString);
    res.send(results);
  });
});

// Start the Express server
const port = 3000;
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});