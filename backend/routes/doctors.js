const express = require("express");
const { pool } = require("../db");

const router = express.Router();

/**
 * GET /doctors
 */
router.get("/", async (req, res) => {
  try {
    const [rows] = await pool.query(
      "SELECT id, name, specialty, availability FROM doctors ORDER BY id ASC"
    );
    res.json({ success: true, data: rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: "Server error" });
  }
});

module.exports = router;
