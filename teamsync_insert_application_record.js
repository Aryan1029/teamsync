const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3004;

// Create a MySQL database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'mydb',
});

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL: ' + err.stack);
    return;
  }
  console.log('Connected to MySQL as id ' + db.threadId);
});

// Parse JSON requests
app.use(bodyParser.json());

// Endpoint to insert applicant data
app.post('/addApplicant', (req, res) => {
  const {
    email,
    name,
    gender,
    dob,
    year,
    course,
    roll_no,
    height,
    weight,
    strong_foot,
    pp,
    application_status,
    device_token,
  } = req.body;

  // SQL query to insert applicant data
  const sql =
    'INSERT INTO applicant (email, name, gender, dob, year, course, roll_no, height, weight, strong_foot, pp, application_status,device_token) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)';

  // Values to insert into the query
  const values = [
    email,
    name,
    gender,
    dob,
    year,
    course,
    roll_no,
    height,
    weight,
    strong_foot,
    pp,
    application_status,
    device_token,
  ];

  // Execute the query
  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error inserting data: ' + err.message);
      res.status(500).send('Error inserting data');
      return;
    }
    console.log('Inserted row with ID ' + result.insertId);
    res.status(200).send('Applicant data inserted successfully');
  });
});

// Start the Express server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
