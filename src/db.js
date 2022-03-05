const {Pool} = require("pg");

const pool = new Pool({
    user: "temurbek",
    password: "19",
    host: "localhost",
    port: 5432,
    database: "loook"
});

module.exports = pool;