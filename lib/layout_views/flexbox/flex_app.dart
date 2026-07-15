import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FlexApp()));
}

class FlexApp extends StatelessWidget {
  const FlexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flex app",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Flex(
        direction: .vertical, // switch to horizontal
        children: [
          Expanded(child: Container(height: 80, color: Colors.amber)),
          Expanded(child: Container(height: 80, color: Colors.green)),
          Expanded(child: Container(height: 80, color: Colors.blue)),
        ],
      ),
    );
  }
}
