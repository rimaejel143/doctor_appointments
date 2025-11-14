import 'package:flutter/material.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({super.key});

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedDepartment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Appointment")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name
              TextFormField(
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (value) => value!.isEmpty ? "Required field" : null,
              ),

              // Phone
              TextFormField(
                decoration: const InputDecoration(labelText: "Phone Number"),
                validator: (value) =>
                    value!.length < 8 ? "Invalid number" : null,
              ),

              // Department
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: "Choose Department",
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Cardiology",
                    child: Text("Cardiology"),
                  ),
                  DropdownMenuItem(
                    value: "Dentistry",
                    child: Text("Dentistry"),
                  ),
                  DropdownMenuItem(
                    value: "Neurology",
                    child: Text("Neurology"),
                  ),
                ],
                onChanged: (value) {
                  selectedDepartment = value;
                },
                validator: (value) =>
                    value == null ? "Please choose a department" : null,
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/confirm');
                  }
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
