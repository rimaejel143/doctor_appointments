import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String doctorName = args["doctorName"];
    String specialty = args["specialty"];
    String patientName = args["patientName"];
    String phone = args["phone"];
    DateTime date = args["date"];
    TimeOfDay time = args["time"];

    return Scaffold(
      backgroundColor: const Color(0xFFF1F9F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00897B),
        title: const Text(
          "Appointment Confirmed",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Check icon
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF00897B).withOpacity(0.15),
              ),
              child: const Icon(
                Icons.check_circle,
                color: Color(0xFF00897B),
                size: 90,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Your Appointment is Confirmed!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00897B),
              ),
            ),

            const SizedBox(height: 30),

            // Doctor Info Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    specialty,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  infoRow(Icons.person, "Patient: $patientName"),
                  infoRow(Icons.phone, "Phone: $phone"),
                  infoRow(
                    Icons.calendar_today,
                    "Date: ${date.day}/${date.month}/${date.year}",
                  ),
                  infoRow(Icons.access_time, "Time: ${time.format(context)}"),
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/",
                  (route) => false,
                );
              },
              child: const Text("Back to Home"),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF00897B)),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
