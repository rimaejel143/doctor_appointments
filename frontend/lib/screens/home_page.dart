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
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}