import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as dart;


class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({super.key});

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
   DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final String apiUrl = "http://localhost:3000/appointments";

  @override
  Widget build(BuildContext context) {
     final args = ModalRoute.of(context)!.settings.arguments as Map;

    final int doctorId = args["doctor_id"];
    final String doctorName = args["doctor_name"];

    return Scaffold(
      backgroundColor: const Color(0xFFF1F9F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F9F8),
        title: const Text("Book Appointment",
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                ),
                ],
              ),
              child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Color(0xFF00897B),
                      child: Icon(Icons.person,
                          color: Colors.white, size: 35),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

            ),
             const SizedBox(height: 25),

          ],
        ),
      ),
      ),
    );
  }
}