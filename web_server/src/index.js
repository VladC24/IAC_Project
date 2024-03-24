// This is the web server that will make a request to the application server and return the data to the client.

const express = require('express');
const axios = require('axios');
const app = express();
const port = 3000;

app.get('/getData', async (req, res) => {
  try {
    const response = await axios.get('http://localhost:3001/data');
    res.json(response.data);
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal server error');
  }
});

app.listen(port, () => {
  console.log(`Web server listening on port ${port}`);
});