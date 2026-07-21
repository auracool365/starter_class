import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ControlWidgetsApp()));
}

class ControlWidgetsApp extends StatefulWidget {
  const ControlWidgetsApp({super.key});

  @override
  State<ControlWidgetsApp> createState() => _ControlWidgetsAppState();
}

enum MealTime { breakfast, lunch, dinner }

class _ControlWidgetsAppState extends State<ControlWidgetsApp> {
  // Control Widget values
  MealTime _selected = MealTime.dinner;
  bool _notificationsOn = true;
  double _spiceLevel = 0;
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Control Widgets App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              "Meal Time",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),

            // Deprecated Syntax(still works)
            /* RadioListTile<MealTime>(
              title: const Text('Breakfast'),
              value: MealTime.breakfast,
              groupValue: _selected,
              onChanged: (value) => setState(() => _selected = value!),
            ),
            RadioListTile<MealTime>(
              title: const Text('Lunch'),
              value: MealTime.lunch,
              groupValue: _selected,
              onChanged: (value) => setState(() => _selected = value!),
            ),
            RadioListTile<MealTime>(
              title: const Text('Dinner'),
              value: MealTime.dinner,
              groupValue: _selected,
              onChanged: (value) => setState(() => _selected = value!),
            ), */

            // Modern syntax
            RadioGroup(
              groupValue: _selected,
              onChanged: (value) => setState(() => _selected = value!),
              child: const Column(
                children: [
                  RadioListTile<MealTime>(
                    title: Text("Breakfast"),
                    value: MealTime.breakfast,
                  ),
                  RadioListTile<MealTime>(
                    title: Text("Lunch"),
                    value: MealTime.lunch,
                  ),
                  RadioListTile<MealTime>(
                    title: Text("Dinner"),
                    value: MealTime.dinner,
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Text(
                  _notificationsOn ? "Notification On" : "Notification Off",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SwitchListTile(
                  title: const Text('Notifications'),
                  value: _notificationsOn,
                  onChanged: (value) {
                    return setState(() {
                      _notificationsOn = value;
                    });
                  },
                ),
              ],
            ),
            CheckboxListTile(
              title: const Text('Mark task as Completed'),
              value: _isCompleted,
              onChanged: (value) => setState(() => _isCompleted = value!),
            ),
            const SizedBox(height: 12),
            Text('Spice level: ${_spiceLevel.round()}'),
            Slider(
              value: _spiceLevel,
              min: 0,
              max: 5,
              // divisions: 5, // visual points of each number
              label: _spiceLevel.round().toString(),
              onChanged: (value) => setState(() => _spiceLevel = value),
            ),
          ],
        ),
      ),
    );
  }
}
