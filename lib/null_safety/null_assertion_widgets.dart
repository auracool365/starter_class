import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: NullAssertionWidgets()));
}

class NullAssertionWidgets extends StatefulWidget {
  const NullAssertionWidgets({super.key});

  @override
  State<NullAssertionWidgets> createState() => _NullAssertionWidgetsState();
}

class _NullAssertionWidgetsState extends State<NullAssertionWidgets> {
  String? _selectedDish; // starts null, nothing selected yet

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Null Assertion(!)',
          style: TextStyle(fontSize: 30, fontWeight: .bold),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _selectedDish = 'Jollof Rice'),
              child: const Text('Select a dish'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Risky: assumes _selectedDish is not null.
                // Tap this before tapping "Select a dish" above, and watch it crash.
                final String dish = _selectedDish!;

                // the fix(remove the assertion, and check for null)
                /* final String? dish = _selectedDish;
                if (dish == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please Select a dish first',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: .bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      backgroundColor: Colors.yellow,
                    ),
                  );
                  return;
                } */
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Confirmed: $dish',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: .bold,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Confirm selection (risky)'),
            ),
          ],
        ),
      ),
    );
  }
}
