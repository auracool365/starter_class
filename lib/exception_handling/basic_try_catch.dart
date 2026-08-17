import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BasicTryCatch()));
}

class BasicTryCatch extends StatefulWidget {
  const BasicTryCatch({super.key});

  @override
  State<BasicTryCatch> createState() => _BasicTryCatchState();
}

class _BasicTryCatchState extends State<BasicTryCatch> {
  final _inputController = TextEditingController();
  String _result = '';

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _divide() {
    try {
      final double divisor = double.parse(_inputController.text);
      final double result = 100 / divisor;
      setState(() => _result = result.toString());
    } on FormatException {
      setState(() => _result = 'Please enter a valid number.');
    } on UnsupportedError {
      setState(() => _result = 'Cannot divide by zero.');
    } catch (e) {
      // Fallback for anything not specifically anticipated above.
      setState(() => _result = 'Something went wrong: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "Try/Catch",
          style: TextStyle(fontWeight: .bold, fontSize: 30),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Text("Result is: $_result", style: const TextStyle(fontSize: 25)),
            TextField(controller: _inputController, keyboardType: .number),

            const Text(
              "divide 100 by user input",
              style: TextStyle(fontSize: 24, fontWeight: .bold),
            ),

            ElevatedButton(
              onPressed: _divide,
              child: const Text("Divide", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
