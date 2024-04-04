import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import axios from 'axios';

admin.initializeApp();

export const scrapeApiDaily = functions.https.onRequest(async (req, res) => {
  try {
    const options = {
        method: 'GET',
        url: 'https://twitter-api45.p.rapidapi.com/followers.php',
        params: {
          screenname: 'elonmusk'
        },
        headers: {
          'X-RapidAPI-Key': 'd25eb9279amshfda026b08d9a984p1ea465jsn603867ae7669',
          'X-RapidAPI-Host': 'twitter-api45.p.rapidapi.com'
        }
    };
      
    let response, followers_count = 0; 

    try {
        response = await axios.request(options);
        console.log(response.data);
    } catch (error) {
        console.error(error);
    }

    if (response) {
        followers_count = response.data.followers_count;
        console.log(followers_count);
    }
    // Example of saving data to Firestore
    const firestore = admin.firestore();
    
    await firestore.collection('/coin-twitter-follower').add({
        
        followers_count: followers_count
    });

    console.log('Data saved successfully');
  } catch (error) {
    console.error('Error scraping API:', error);
  }
});
