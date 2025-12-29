import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFF1F9F8),
      appBar: AppBar(
      backgroundColor: const Color(0xFF00897B),
        title: const Text(
          "Appointment Confirmed",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,

      ),
      body: Padding(padding:  const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),

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


          )
        ],
      ),
    ),
    );
  }
}