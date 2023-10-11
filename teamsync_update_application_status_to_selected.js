const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3009; // Choose your desired port number

// MySQL database connection configuration
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'mydb',
});

// Connect to the MySQL database
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database: ' + err.stack);
    return;
  }
  console.log('Connected to the database');
});

// Middleware to parse JSON data
app.use(bodyParser.json());

// API endpoint to change the application_status to 'approved'
app.put('/select-applicant', (req, res) => {
  const { applicantName } = req.body;

  // Update the application_status to 'approved' for the specified applicant
  const sql = 'UPDATE applicant SET application_status = ? WHERE name = ?';
  const values = ['selected', applicantName];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error updating status: ' + err.stack);
      res.status(500).json({ error: 'Internal server error' });
    } else {
      console.log(`Updated status for ${applicantName} to 'selected'`);
      res.json({ message: 'Status updated successfully' });
    }
  });
});

// Start the Express server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
