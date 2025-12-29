import 'dart:convert';
import 'package:doctor_appointments/screens/doctor_details_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> doctors = [];
  bool isLoading = true;
  String searchQuery="";

  final String apiUrl = "http://localhost:3000/doctors";

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }
   
     Future<void> fetchDoctors() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          doctors = data["data"];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load doctors");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F9F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F9F8),
        title: const Text("Doctor Apoointments"),
        style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
        ),
      ),
    );
  }
}