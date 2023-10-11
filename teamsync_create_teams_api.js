const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const app = express();

app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'mydb',
});

db.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the MySQL database');
});

app.get('/generate-teams', (req, res) => {
    // Implement logic to fetch approved applicants from the database
    const query = 'SELECT * FROM applicant WHERE application_status = "approved"';

    db.query(query, (error, results) => {
        if (error) {
            console.error('Error fetching data from the database:', error);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }

        if (!results || results.length === 0) {
            console.error('No data retrieved from the database');
            res.status(500).json({ error: 'No data found' });
            return;
        }

        const applicantsData = results;

        // Implement logic to create teams with distinct players
        const [team1, team2] = createDistinctTeams(applicantsData, 3, 3, 4, 1);

        // Store the team numbers in the applicant table
        storeTeamNumbers(team1, team2);

        res.json({ team1, team2 });
    });
});

function createDistinctTeams(applicantsData, attackers, midfielders, defenders, goalkeepers) {
    // Separate players into different positions
    const attackersData = applicantsData.filter(player => player.pp === 'attack');
    const midfieldersData = applicantsData.filter(player => player.pp === 'midfield');
    const defendersData = applicantsData.filter(player => player.pp === 'defense');
    const goalkeepersData = applicantsData.filter(player => player.pp === 'goalkeeper');

    // Shuffle the player arrays randomly
    shuffleArray(attackersData);
    shuffleArray(midfieldersData);
    shuffleArray(defendersData);
    shuffleArray(goalkeepersData);

    // Create the teams with distinct players
    const team1 = [];
    const team2 = [];

    for (let i = 0; i < attackers; i++) {
        if (attackersData.length > 0) {
            team1.push(attackersData.pop());
            team2.push(attackersData.pop());
        }
    }

    for (let i = 0; i < midfielders; i++) {
        if (midfieldersData.length > 0) {
            team1.push(midfieldersData.pop());
            team2.push(midfieldersData.pop());
        }
    }

    for (let i = 0; i < defenders; i++) {
        if (defendersData.length > 0) {
            team1.push(defendersData.pop());
            team2.push(defendersData.pop());
        }
    }

    for (let i = 0; i < goalkeepers; i++) {
        if (goalkeepersData.length > 0) {
            team1.push(goalkeepersData.pop());
            team2.push(goalkeepersData.pop());
        }
    }

    return [team1, team2];
}

function storeTeamNumbers(team1, team2) {
    team1.forEach(player => {
        if (player && player.id) {
            const updateQuery = 'UPDATE applicant SET team = ? WHERE id = ?';
            db.query(updateQuery, [1, player.id], (error, results) => {
                if (error) {
                    console.error('Error updating team number for Player ID', player.id, error);
                } else {
                    console.log(`Player ID ${player.id} assigned to Team 1`);
                }
            });
        } else {
            console.error('Invalid player data:', player);
        }
    });

    team2.forEach(player => {
        if (player && player.id) {
            const updateQuery = 'UPDATE applicant SET team = ? WHERE id = ?';
            db.query(updateQuery, [2, player.id], (error, results) => {
                if (error) {
                    console.error('Error updating team number for Player ID', player.id, error);
                } else {
                    console.log(`Player ID ${player.id} assigned to Team 2`);
                }
            });
        } else {
            console.error('Invalid player data:', player);
        }
    });
}


function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
}

const PORT = process.env.PORT || 3006;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
