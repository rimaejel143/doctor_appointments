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
    return const Placeholder();
  }
}