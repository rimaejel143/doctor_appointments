import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class BookAppointmentPage extends StatefulWidget{
  const BookAppointmentPage({super.key});

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPage();
}

class _BookAppointmentPage extends State<BookAppointmentPage>{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book an Appointmennt"),
        backgroundColor: Colors.blueAccent,
      ),
       body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Your Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: "Appointment Date",
                hintText: "Example: 2020-11-20",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(
                labelText: "Appointment time",
                hintText: "Example 3:00 PM",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height:25),
            ElevatedButton(
              onPressed:(){
                Navigator.pushNamed(context, '/confirm');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
               child: const Text("Confirm Appointment", style: TextStyle(fontSize: 18),
               ),
               ),
          ],
        ),
       ),
    );
  }
}