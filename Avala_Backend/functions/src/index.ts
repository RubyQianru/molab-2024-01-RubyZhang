import * as admin from "firebase-admin";
import * as functions from "firebase-functions";


admin.initializeApp({
  credential: admin.credential.cert(require("../key/admin.json")),
});

