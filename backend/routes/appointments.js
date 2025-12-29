const express = require("express");
const { pool } = require("../db");

const router = express.Router();

function isNonEmptyString(x) {
  return typeof x === "string" && x.trim().length > 0;
}

/**
 * POST /appointments
 */
router.post("/", async (req, res) => {
  try {
    const { doctor_id, patient_name, phone, date, time } = req.body;

    if (!Number.isInteger(doctor_id)) {
      return res.status(400).json({
        success: false,
        message: "doctor_id must be an integer",
      });
    }

    if (!isNonEmptyString(patient_name)) {
      return res.status(400).json({
        success: false,
        message: "patient_name is required",
      });
    }

    if (!isNonEmptyString(phone)) {
      return res.status(400).json({
        success: false,
        message: "phone is required",
      });
    }

    if (!isNonEmptyString(date)) {
      return res.status(400).json({
        success: false,
        message: "date is required (YYYY-MM-DD)",
      });
    }

    if (!isNonEmptyString(time)) {
      return res.status(400).json({
        success: false,
        message: "time is required (HH:MM)",
      });
    }

    // Check doctor exists
    const [doc] = await pool.query("SELECT id FROM doctors WHERE id = ?", [
      doctor_id,
    ]);

    if (doc.length === 0) {
      return res.status(404).json({
        success: false,
        message: "Doctor not found",
      });
    }

    // Insert appointment
    const [result] = await pool.query(
      `INSERT INTO appointments 
       (doctor_id, patient_name, phone, date, time)
       VALUES (?, ?, ?, ?, ?)`,
      [doctor_id, patient_name.trim(), phone.trim(), date, time]
    );

    res.status(201).json({
      success: true,
      message: "Appointment created successfully",
      appointment_id: result.insertId,
    });
  } catch (err) {
    console.error("POST /appointments error:", err);
    res.status(500).json({ success: false, message: "Server error" });
  }
});

/**
 * GET /appointments
 */
router.get("/", async (req, res) => {
  try {
    const [rows] = await pool.query(
      `SELECT 
         a.id,
         a.doctor_id,
         d.name AS doctor_name,
         d.specialty,
         d.availability,
         a.patient_name,
         a.phone,
         a.date,
         a.time
       FROM appointments a
       JOIN doctors d ON d.id = a.doctor_id
       ORDER BY a.id DESC`
    );

    res.json({ success: true, data: rows });
  } catch (err) {
    console.error("GET /appointments error:", err && err.message);
    if (err && err.sql) console.error("SQL:", err.sql);
    console.error("Full error object:", err);
    console.error("Error stack:", err && err.stack);
    res.status(500).json({ success: false, message: "Server error" });
  }
});

module.exports = router;
