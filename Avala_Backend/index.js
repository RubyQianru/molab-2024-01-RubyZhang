const functions = require('firebase-functions');
const axios = require('axios');
const admin = require('firebase-admin');
admin.initializeApp();

exports.scrapeApiDaily = functions.pubsub.schedule('every 24 hours').onRun(async (context) => {
  try {
    const response = await axios.get('YOUR_API_ENDPOINT');
    const data = response.data; // Parse the data according to your needs

    // Example of saving data to Firestore
    const firestore = admin.firestore();
    await firestore.collection('yourCollection').add(data);

    console.log('Data saved successfully');
  } catch (error) {
    console.error('Error scraping API:', error);
  }
});
