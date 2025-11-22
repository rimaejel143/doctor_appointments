import 'package:doctor_appointments/screens/doctor_details_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //doctors
  List<Map<String, String>> doctors = [
    {
      "name": "Dr. John Doe",
      "specialty": "Cardiologist",
      "availability": "Mon - Fri • 9:00 AM - 3:00 PM",
    },
    {
      "name": "Dr. Sarah Ali",
      "specialty": "Dentist",
      "availability": "Tue - Sat • 10:00 AM - 5:00 PM",
    },
    {
      "name": "Dr. Adam Smith",
      "specialty": "Neurologist",
      "availability": "Everyday • 12:00 PM - 8:00 PM",
    },
    {
      "name": "Dr. Lina Haddad",
      "specialty": "Dermatologist",
      "availability": "Mon - Thu • 11:00 AM - 6:00 PM",
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F9F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFF00897B),
        title: const Text(
          "Doctor Appointments",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Search doctors...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Doctor Cards
            Expanded(
              child: ListView(
                children: doctors
                    .where(
                      (doc) =>
                          doc["name"]!.toLowerCase().contains(searchQuery) ||
                          doc["specialty"]!.toLowerCase().contains(searchQuery),
                    )
                    .map(
                      (doc) => doctorCard(
                        context,
                        doc["name"]!,
                        doc["specialty"]!,
                        doc["availability"]!,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget doctorCard(
    BuildContext context,
    String name,
    String specialty,
    String availability,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),

        leading: CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFF00897B),
          child: const Icon(Icons.person, color: Colors.white, size: 30),
        ),

        title: Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty, style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 18,
                  color: Color(0xFF00897B),
                ),
                const SizedBox(width: 5),
                Text(
                  availability,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),
          ],
        ),

        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DoctorDetailsPage(
                name: name,
                specialty: specialty,
                availability: availability,
              ),
            ),
          );
        },
      ),
    );
  }
}
