const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3001; // Replace with your desired port number

// Middleware for parsing JSON request bodies
app.use(bodyParser.json());

// Create a MySQL database connection
const connection = mysql.createConnection({
  host: 'localhost', // Replace with your MySQL host
  user: 'root', // Replace with your MySQL username
  password: 'root', // Replace with your MySQL password
  database: 'mydb', // Replace with your database name
});

// Connect to the MySQL database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    throw err;
  }
  console.log('Connected to MySQL database');
});

// Define a route for updating user data
app.post('/updateProfile', (req, res) => {
  const { email, name, gender, dob, year, course, roll_no, height, weight, strong_foot, pp } = req.body;

  // Update the user's data in the MySQL database
  const query = `UPDATE applicant
                SET name = ?, gender = ?, dob = ?, year = ?, course = ?, roll_no = ?, height = ?, weight = ?, strong_foot = ?, pp = ?
                WHERE email = ?`;
  const values = [name, gender, dob, year, course, roll_no, height, weight, strong_foot, pp, email];

  connection.query(query, values, (err, results) => {
    if (err) {
      console.error('Error updating user data:', err);
      return res.status(500).json({ message: 'Internal server error' });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({ message: 'User not found' });
    }

    return res.status(200).json({ message: 'User data updated successfully' });
  });
});

// Start the Express.js server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
