import 'package:flutter/material.dart';

class DoctorDetailsPage extends StatelessWidget {
  final int doctorId;
  final String name;
  final String specialty;
  final String availability;

  const DoctorDetailsPage({
    super.key,
    required this.doctorId,
    required this.name,
    required this.specialty,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F9F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00897B),
        title: const Text(
          "Doctor Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xFF00897B),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),

            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004D40),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              specialty,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2F1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: Color(0xFF00897B),
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      availability,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/book',
                  arguments: {"doctor_id": doctorId, "doctor_name": name},
                );
              },
              child: const Text("Book Apointment"),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
