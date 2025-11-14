import 'package:flutter/material.dart';

class ConfirmationPage  extends StatelessWidget{
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmation"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text(
              "Your appointment has been booked!", textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
               ),
               const SizedBox(height: 30),
               ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent
                ),
                child: const Text("Back to Home"),
                ),
          ],
        ),
      ),
    );
  }
}
