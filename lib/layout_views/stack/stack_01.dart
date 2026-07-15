import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Basic Stack")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Bottom layer (Index 0)
            Container(width: 250, height: 250, color: Colors.blue),

            // Middle layer (Index 1)
            Container(width: 170, height: 170, color: Colors.green),

            // Top layer (Index 2)
            Container(width: 90, height: 90, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
