import * as admin from "firebase-admin";

admin.initializeApp({
  credential: admin.credential.cert(require("../key/admin.json")),
});

exports.api = require('./expressApi').api;
exports.scheduler = require('./scheduler').scheduledFunction;
