require("dotenv").config();

const express = require("express");
const cors = require("cors");
const { pool } = require("./db");

const doctorsRouter = require("./routes/doctors");
const appointmentsRouter = require("./routes/appointments");

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.json({ success: true, message: "Doctor Appointments API is running" });
});

app.use("/doctors", doctorsRouter);
app.use("/appointments", appointmentsRouter);

app.get("/db-test", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT 1 AS ok");
    res.json({ success: true, data: rows });
  } catch (err) {
    res.status(500).json({ success: false });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`API running on port ${PORT}`));
