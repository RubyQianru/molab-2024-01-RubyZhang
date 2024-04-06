import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import {updateFollowersCount} from "./helpers";
import memeCoins from "./memeCoins";

admin.initializeApp({
  credential: admin.credential.cert(require("../key/admin.json")),
});
const db = admin.firestore();

exports.scheduledFunction = functions.pubsub.schedule("every 12 hours").onRun(async () => {
  await updateAllFollowerCounts();
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

