import 'package:flutter/material.dart';

class ToggleTextPage extends StatefulWidget {
  const ToggleTextPage({super.key});

  @override
  State<ToggleTextPage> createState() => _ToggleTextPageState();
}

class _ToggleTextPageState extends State<ToggleTextPage> {
  bool _isTextChange = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(
                !_isTextChange ? "Hello World" : "Welcome to SQI",
                style: TextStyle(
                  color: !_isTextChange ? Colors.green : Colors.blue,
                  fontSize: !_isTextChange ? 30 : 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isTextChange = !_isTextChange;
                  });
                },
                child: Text(
                  "Switch Text",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
