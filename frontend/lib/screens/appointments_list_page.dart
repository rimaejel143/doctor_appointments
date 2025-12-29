import 'package:flutter/material.dart';

class AppointmentsListPage extends StatelessWidget {
  const AppointmentsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Appointments",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 5, // You can replace with real data later
        itemBuilder: (context, index) {
          return appointmentCard(
            doctorName: "Dr. John Doe",
            department: "Cardiology",
            date: "Dec ${10 + index}, 2024",
          );
        },
      ),
    );
  }

  Widget appointmentCard({
    required String doctorName,
    required String department,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),

        leading: CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFF00897B),
          child: const Icon(Icons.person, color: Colors.white, size: 28),
        ),

        title: Text(
          doctorName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.local_hospital, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Text(department, style: TextStyle(color: Colors.grey[700])),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_month, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Text(date, style: TextStyle(color: Colors.grey[700])),
              ],
            ),
          ],
        ),

        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[600],
          size: 20,
        ),
      ),
    );
  }
}
