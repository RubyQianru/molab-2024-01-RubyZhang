// import * as functions from 'firebase-functions';
import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import {updateFollowersCount} from "./helpers";

admin.initializeApp({
  credential: admin.credential.cert(require('../key/admin.json'))
});
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
  {id: "brett", twitterHandle: "basedbrett"},
  {id: "memecoin", twitterHandle: "memecoin"},
  {id: "degen", twitterHandle: "degenstogether"},
  {id: "mew", twitterHandle: "mewsworld"},
  {id: "babydoge", twitterHandle: "babydogecoin"},
  {id: "coq", twitterHandle: "coqinuavax"},
];

exports.scheduledFunction = functions.pubsub.schedule("every 12 hours").onRun(async () => {
  await updateAllFollowerCounts();
  console.log("Finished updating all follower counts.");
});

async function updateAllFollowerCounts() {
  const batch = db.batch();
  const updatePromises = memeCoins.map(async (coin) => {
    const followerCount = await updateFollowersCount(coin.twitterHandle);

    if (typeof followerCount !== "undefined") {
      const timestamp = new Date().toISOString();
      const coinRef = db.collection("MemeCoins").doc(coin.id);
      const countRef = coinRef.collection("FollowerCounts").doc(timestamp);

      batch.set(coinRef, {latestCount: followerCount, updatedAt: timestamp});
      batch.set(countRef, {count: followerCount, timestamp: admin.firestore.FieldValue.serverTimestamp()});
    }
  });

  await Promise.all(updatePromises);
  await batch.commit();

  console.log("Batch commit successful");
}


updateAllFollowerCounts().then(() => console.log("Updated all follower counts")).catch(console.error);

