// import * as functions from 'firebase-functions';
import * as admin from "firebase-admin";
import axios from "axios";

admin.initializeApp();
const db = admin.firestore();

const memeCoins = [
  {id: "dogecoin", twitterHandle: "dogecoin"},
  {id: "shiba", twitterHandle: "shibtoken"},
  {id: "wif", twitterHandle: "dogwifcoin"},
  {id: "pepe", twitterHandle: "pepecoineth"},
  {id: "floki", twitterHandle: "realflokiinu"},
  {id: "bonk", twitterHandle: "bonk_inu"},
  {id: "bome", twitterHandle: "bomebookofmemes"},
  {id: "corgiai", twitterHandle: "corgiaiclub"},
  {id: "biden", twitterHandle: "boden4pres"},
  {id: "brett", twitterHandle: "basedbßrett"},
  {id: "memecoin", twitterHandle: "memecoin"},
  {id: "degen", twitterHandle: "degenstogether"},
  {id: "mew", twitterHandle: "mewsworld"},
  {id: "babydoge", twitterHandle: "BabyDogeCoin"},
  {id: "coq", twitterHandle: "coqinuavax"},
];


async function updateAllFollowerCounts() {
  const batch = db.batch();
  const updatePromises = memeCoins.map(async (coin) => {
    const followerCount = await updateFollowersCount(coin.twitterHandle);

    if (typeof followerCount !== "undefined") { 
      const timestamp = new Date().toISOString();
      const coinRef = db.collection("MemeCoins").doc(coin.id);
      const countRef = coinRef.collection("FollowerCounts").doc(timestamp);
  
      batch.set(coinRef, { latestCount: followerCount, updatedAt: timestamp });
      batch.set(countRef, { count: followerCount, timestamp: admin.firestore.FieldValue.serverTimestamp() });
    }

  });

  await Promise.all(updatePromises); 
  await batch.commit(); 

  console.log("Batch commit successful");
}

async function updateFollowersCount(coinHandle : string) {
  try {
    const options = {
      method: "GET",
      url: "https://twitter-api45.p.rapidapi.com/followers.php",
      params: {
        screenname: `${coinHandle}`,
      },
      headers: {
        "X-RapidAPI-Key": "d25eb9279amshfda026b08d9a984p1ea465jsn603867ae7669",
        "X-RapidAPI-Host": "twitter-api45.p.rapidapi.com"
      }
    };

    const response = await axios.request(options);
    console.log(coinHandle, response.data.followers_count);
    return response.data.followers_count; 
  } catch (error) {
    console.error("Error fetching follower count for", coinHandle, ":", error);
    return null; 
  }
}

updateAllFollowerCounts().then(() => console.log("Updated all follower counts")).catch(console.error);

