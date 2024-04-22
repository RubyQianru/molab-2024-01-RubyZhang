const functions = require('firebase-functions');
const express = require('express');
const app = express();

app.get('/', (res:any) => {
  res.send('Hello from Firebase Express API!');
});

exports.api = functions.https.onRequest(app);
