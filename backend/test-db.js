require("dotenv").config();
const mysql = require("mysql2/promise");

(async () => {
  try {
    console.log("Using env:", {
      host: process.env.MYSQLHOST,
      port: process.env.MYSQLPORT,
      user: process.env.MYSQLUSER,
      password: process.env.MYSQLPASSWORD ? "***present***" : "***empty***",
      database: process.env.MYSQLDATABASE,
    });

    const conn = await mysql.createConnection({
      host: process.env.MYSQLHOST || "127.0.0.1",
      port: Number(process.env.MYSQLPORT) || 3306,
      user: process.env.MYSQLUSER || "root",
      password: process.env.MYSQLPASSWORD || "",
      database: process.env.MYSQLDATABASE || undefined,
    });

    const [rows] = await conn.query("SELECT VERSION() AS version");
    console.log("Connected OK:", rows);
    await conn.end();
  } catch (err) {
    console.error("CONNECT_ERROR:");
    console.error(err && err.code, err && err.message);
    console.error(err);
    process.exitCode = 1;
  }
})();
