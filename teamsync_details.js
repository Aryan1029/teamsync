const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');

const app = express();
const port = 3018;

app.use(bodyParser.json());

// const pool = mysql.createPool({
//     host: 'localhost',
//     user: 'root',
//     password: 'root',
//     database: 'mydb',
// });
const connection = mysql.createConnection({
    host: 'localhost', // Replace with your MySQL host
    user: 'root', // Replace with your MySQL username
    password: 'root', // Replace with your MySQL password
    database: 'mydb', // Replace with your database name
  });
connection.connect((err) => {
   if (err) {
    console.error('Error connecting to MySQL:', err);
        throw err;
    }
    console.log('Connected to MySQL database');
});

app.post('/storeData', (req, res) => {
    // const { date, venue, time, venue_name } = req.body;
    // console.log(req.body)

    // // Replace undefined values with null
    // const data = {
    //     date: date || null,
    //     venue_name: venue_name || null,
    //     venue: venue || null,
    //     time: time || null,
    // };

    // pool.execute(
    //     'INSERT INTO details (date, venue_name, venue, time) VALUES (?, ?, ?, ?)',
    //     [data.date, data.venue_name, data.venue, data.time],
    //     (err, results) => {
    //         if (err) {
    //             console.error(err);
    //             res.status(500).json({ error: 'Failed to store data' });
    //         } else {
    //             res.status(200).json({ message: 'Data stored successfully' });
    //         }
    //     }
    // );


    const { date, venue, time, venue_name } = req.body;
    console.log(req.body)
    // Update the user's data in the MySQL database
    const data = {
        date: date || null,
        venue_name: venue_name || null,
        venue: venue || null,
        time: time || null,
    };
    const query = `UPDATE details
                  SET date = ?, venue_name = ?, venue = ?, time = ?
                  WHERE id = 1`;
    const values = [data.date, data.venue_name, data.venue, data.time];
  
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
// app.post('/updateProfile', (req, res) => {
//     const { date, venue, time, venue_name } = req.body;
//     console.log(req.body)
//     // Update the user's data in the MySQL database
//     const data = {
//         date: date || null,
//         venue_name: venue_name || null,
//         venue: venue || null,
//         time: time || null,
//     };
//     const query = `UPDATE details
//                   SET date = ?, venue_name = ?, venue = ?, time = ?, 
//                   WHERE id = 1`;
//     const values = [data.date, data.venue_name, data.venue, data.time];
  
//     connection.query(query, values, (err, results) => {
//       if (err) {
//         console.error('Error updating user data:', err);
//         return res.status(500).json({ message: 'Internal server error' });
//       }
  
//       if (results.affectedRows === 0) {
//         return res.status(404).json({ message: 'User not found' });
//       }
  
//       return res.status(200).json({ message: 'User data updated successfully' });
//     });
//   });
  

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
