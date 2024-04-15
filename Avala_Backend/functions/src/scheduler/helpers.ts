import axios from "axios";
import memeCoins from "./memeCoins";

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
        "X-RapidAPI-Host": "twitter-api45.p.rapidapi.com",
      },
    };

    const response = await axios.request(options);
    console.log(coinHandle, response.data.followers_count);
    return response.data.followers_count;
  } catch (error) {
    console.error("Error fetching follower count for", coinHandle, ":", error);
    return null;
  }
}

async function updateAllFollowerCounts(admin:any) {
  const db = admin.firestore();
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

export {updateAllFollowerCounts};
