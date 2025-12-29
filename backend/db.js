const mysql = require("mysql2/promise");

function requiredEnv(name) {
  const v = process.env[name];
  if (v === undefined) throw new Error(`Missing env var: ${name}`);
  return v;
}

const pool = mysql.createPool({
  host: requiredEnv("MYSQLHOST"),
  port: Number(requiredEnv("MYSQLPORT")),
  user: requiredEnv("MYSQLUSER"),
  password: requiredEnv("MYSQLPASSWORD"),
  database: requiredEnv("MYSQLDATABASE"),
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports = { pool };
