const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3008; // You can choose any port you like

// MySQL database configuration
const db = mysql.createPool({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'root',
    database: 'mydb',
  });

// Middleware for parsing JSON
app.use(bodyParser.json());

// Route to fetch applicant data by email
app.post('/fetchApplicantData', (req, res) => {
  const { email } = req.body;

  // SQL query to fetch data based on email
  const sql = `SELECT * FROM applicant WHERE email = ?`;

  db.query(sql, [email], (err, result) => {
    if (err) {
      console.error('Error fetching data:', err);
      res.status(500).json({ error: 'An error occurred while fetching data' });
      return;
    }

    // Check if any records were found
    if (result.length === 0) {
      res.status(404).json({ message: 'No applicant found with this email' });
      return;
    }

    // Send the fetched data as JSON response
    res.json({ applicant: result[0] });
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
