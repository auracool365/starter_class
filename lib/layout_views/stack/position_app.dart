import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack with Positioned")),
      body: Center(
        child: Stack(
          children: [
            // Bottom layer
            Container(width: 400, height: 650, color: Colors.blue),

            // Positioned on top of the blue box
            Positioned(
              bottom: 50,
              left: 20,
              child: Container(width: 50, height: 50, color: Colors.red),
            ),

            // Positioned on top of the green box
            Positioned(
              top: 20,
              left: 20,
              child: Container(width: 50, height: 50, color: Colors.green),
            ),

            // This is still on top of the green box, but not positioned
            const Text("Hello"),

            // The text is position now on the container
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(width: 100, height: 100, color: Colors.amber),
            ),

            const Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                "Hello",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
