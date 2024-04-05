import axios from "axios";

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

export {updateFollowersCount};
