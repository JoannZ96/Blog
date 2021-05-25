const sqlite = require("sqlite");
const dbPromise = sqlite.open("./group-project.db");
module.exports = dbPromise;