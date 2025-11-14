import 'package:doctor_appointments/screens/appointments_list_page.dart';
import 'package:doctor_appointments/screens/book_appointment_page.dart';
import 'package:doctor_appointments/screens/confirmation_page.dart';
import 'package:doctor_appointments/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointments App ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => const HomePage(),
        '/book': (context) => const BookAppointmentPage(),
        '/confirm': (context) => const ConfirmationPage(),
        '/appointment': (context) => const AppointmentsListPage(),
      },
    );
  }
}
