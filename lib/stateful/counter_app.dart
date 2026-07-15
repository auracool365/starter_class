import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _count = 0; // This is where state resides
  String _lastAction = 'You have not started counting';
  int _incrementCount = 0;
  int _decrementCount = 0;

  void _increment() {
    setState(() {
      _count++;
      _incrementCount++;
      _lastAction =
          'You have pushed the increment button $_incrementCount times.';
    });
    debugPrint(_count.toString());
  }

  void _decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
        _decrementCount++;
        _lastAction =
            'You have pushed the decrement button $_decrementCount times.';
      } else {
        _lastAction = 'Cannot decrement below zero.';
      }
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
      _incrementCount = 0;
      _decrementCount = 0;
      _lastAction = 'Count reset to 0.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Count',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _lastAction,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),

            const SizedBox(height: 100),

            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _decrement,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.remove, size: 30),
                ),
                FloatingActionButton(
                  onPressed: _reset,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.repeat, size: 30),
                ),
                FloatingActionButton(
                  onPressed: _increment,
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.add, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
