import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Appointments')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Doctor App",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Book Appointment"),
              onTap: () => Navigator.pushNamed(context, '/book'),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("My Appointments"),
              onTap: () => Navigator.pushNamed(context, '/appointments'),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search for a doctor",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Doctor list
            Expanded(
              child: ListView(
                children: [
                  doctorCard(context, "Dr. John Doe", "Cardiologist"),
                  doctorCard(context, "Dr. Sarah Ali", "Dentist"),
                  doctorCard(context, "Dr. Adam Smith", "Neurologist"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget doctorCard(BuildContext context, String name, String specialty) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context, '/book');
        },
      ),
    );
  }
}
