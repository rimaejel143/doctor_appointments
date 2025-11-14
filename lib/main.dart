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
      theme: ThemeData(
        primaryColor: Color(0xFF00897B),
        scaffoldBackgroundColor: Color(0xFFE0F2F1),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF00897B),
          brightness: Brightness.light,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF00897B),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF00897B),
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),

      routes: {
        '/': (context) => const HomePage(),
        '/book': (context) => const BookAppointmentPage(),
        '/confirm': (context) => const ConfirmationPage(),
        '/appointment': (context) => const AppointmentsListPage(),
      },
    );
  }
}
