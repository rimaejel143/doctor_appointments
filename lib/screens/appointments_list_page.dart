import 'package:flutter/material.dart';

class AppointmentsListPage extends StatelessWidget {
  const AppointmentsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Appointments")),

      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text("Appointment #$index"),
              subtitle: const Text("Doctor: Dr. John Doe"),
            ),
          );
        },
      ),
    );
  }
}
