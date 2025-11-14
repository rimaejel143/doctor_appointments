import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirmation")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Appointment Summary",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(),

                rowDetail("Name:", "Rima Ejél"),
                rowDetail("Department:", "Cardiology"),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/appointments');
                  },
                  child: const Text("Confirm Appointment"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rowDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
