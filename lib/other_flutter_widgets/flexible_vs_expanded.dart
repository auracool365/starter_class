import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FlexibleVsExpanded()));

class FlexibleVsExpanded extends StatelessWidget {
  const FlexibleVsExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flexible vs Expanded Widgets",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xffA9C2B1),
        foregroundColor: const Color(0xffffffff),
      ),
      body: Column(
        children: [
          const Text(
            "Flexible",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              // Takes ONLY the space needed to fit its child widget
              Flexible(
                child: Container(width: 200, height: 100, color: Colors.green),
              ),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),

          const SizedBox(height: 60),

          const Text(
            "Expanded",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              // fits its child widget in the entire available space
              Expanded(
                child: Container(width: 200, height: 100, color: Colors.green),
              ),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}
