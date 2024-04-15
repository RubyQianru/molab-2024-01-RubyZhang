import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import {updateAllFollowerCounts} from "./helpers";

exports.scheduledFunction = functions.pubsub.schedule("every 12 hours").timeZone("America/New_York").onRun(async () => {
  updateAllFollowerCounts(admin).then(() => console.log("Updated all follower counts")).catch(console.error);
});



