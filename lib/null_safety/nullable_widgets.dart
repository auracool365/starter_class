import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: NullableWidgets()));
}

class NullableWidgets extends StatelessWidget {
  const NullableWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nullable Widgets',
          style: TextStyle(fontSize: 30, fontWeight: .bold),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),

      body: const Column(
        children: [
          _RecipeTile(
            name: "Jollof Rice",
            description: 'A popular dish in West Africa',
          ),

          _RecipeTile(name: "Egusi"),

          _RecipeTile(name: "Garri", description: 'A Nigerian staple food'),
        ],
      ),
    );
  }
}

class _RecipeTile extends StatelessWidget {
  final String name;
  final String? description;
  const _RecipeTile({required this.name, this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: .w700,
          color: description != null ? Colors.green : Colors.deepPurple,
        ),
      ),
      subtitle: description != null
          ? Text(
              description!,
              style: const TextStyle(fontSize: 16, fontWeight: .w700),
            )
          : null,
    );
  }
}
