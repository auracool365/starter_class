import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: TextFieldApp()));

class TextFieldApp extends StatefulWidget {
  const TextFieldApp({super.key});

  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  final TextEditingController _nameController = TextEditingController();
  String _greeting = "";


  // Controllers MUST always be disposed 
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _greetUser() {
    setState(() {
      _greeting =
          "${_nameController.text.length > 6 ? 'Hi' : 'Hello'}, ${_nameController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TextField App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .spaceBetween,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Enter your name",
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(),
              ),
            ),

            Text(
              _greeting,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            ElevatedButton(
              onPressed: _greetUser,
              child: const Text("Tap to greet"),
            ),
          ],
        ),
      ),
    );
  }
}
