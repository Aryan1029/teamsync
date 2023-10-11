const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3002; // You can choose any port you like

// MySQL database configuration
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'mydb',
});

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error('Database connection error:', err);
    throw err;
  }
  console.log('Connected to MySQL database');
});

// Middleware for parsing JSON
app.use(bodyParser.json());

// Route to handle the deletion of a row
app.post('/rejectApplicant', (req, res) => {
  const { applicant_name } = req.body;

// SQL query to update the status to "rejected" based on the applicant_name
const sql = `UPDATE applicant SET application_status = 'rejected' WHERE name = ?`;

    db.query(sql, [applicant_name], (err, result) => {
    if (err) {
      console.error('Error updating status:', err);
      res.status(500).json({ error: 'An error occurred while updating the status' });
      return;
    }

    console.log('Status updated to "rejected" for:', applicant_name);
    res.json({ message: 'Status updated to "rejected" successfully' });
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
