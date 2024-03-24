const express = require('express');
const mysql = require('mysql');
const app = express();
const port = 9000;

const dbConfig = {
    host: 'mysql-db.cfosy3hm6yzg.eu-west-2.rds.amazonaws.com',
    user: '<username>',
    password: '<password>',
    database: 'mysql-db',
    port: '3306'
};

app.get('/getData', (req, res) => {
    const connection = mysql.createConnection(dbConfig);
    connection.connect();

    connection.query('SELECT * FROM data', (error, results, fields) => {
        if (error) throw error;
        res.json(results);
    });

    connection.end();
});

app.listen(port, () => {
    console.log(`Application server listening on port ${port}`);
});
