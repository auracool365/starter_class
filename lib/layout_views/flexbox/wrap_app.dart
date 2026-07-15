import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Wrap App')),
        body: /* const Row(
          children: [
            _RowOverFlowExample(label: "Hello world"),
            _RowOverFlowExample(label: "Computer Science"),
            _RowOverFlowExample(label: "Flutter"),
            _RowOverFlowExample(label: "Mobile App"),
          ],) */
            const _WrapApp(),
      ),
    );
  }
}

// Row can overflow, because it is fixed
class _RowOverFlowExample extends StatelessWidget {
  final String label;
  const _RowOverFlowExample({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: .center,
      ),
    );
  }
}

// Solution is Wrap
// Wrap flows the the overflowing widgets to a new line
class _WrapApp extends StatelessWidget {
  const _WrapApp();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8, // horizontal gap between items
        runSpacing: 8, // vertical gap between wrapped lines
        children:
            [
                  'Breakfast',
                  'Lunch',
                  'Dinner',
                  'Snacks',
                  'Vegan',
                  'Spicy',
                  'Under 30 mins',
                  'Party Size',
                ]
                .map(
                  (label) => Chip(
                    avatar: const CircleAvatar(
                      child: Icon(Icons.tag, size: 16),
                    ),
                    label: Text(label),
                  ),
                )
                .toList(),
      ),
    );
  }
}
