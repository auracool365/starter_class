import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<CounterModel>(
      create: (context) => CounterModel(),
      builder: (context, child) => const CounterProvider(),
    ),
  );
}

class CounterModel extends ChangeNotifier {
  int _counter = 0;
  String _lastAction = 'You have not started counting.';
  int _incrementCount = 0;
  int _decrementCount = 0;

  int get counter => _counter;
  String get lastAction => _lastAction;
  int get incrementCount => _incrementCount;
  int get decrementCount => _decrementCount;

  void increment() {
    _counter++;
    _incrementCount++;
    _lastAction =
        'You have pushed the increment button $_incrementCount times.';
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
      _decrementCount++;
      _lastAction =
          'You have pushed the decrement button $_decrementCount times.';
    } else {
      _lastAction = 'Cannot decrement below zero.';
    }
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    _incrementCount = 0;
    _decrementCount = 0;
    _lastAction = 'Count reset to 0.';
    notifyListeners();
  }
}

class CounterProvider extends StatelessWidget {
  const CounterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter app using Provider'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
            Container(
              width: 200,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${model.counter}',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: .center,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              model.lastAction,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.filled(
                  onPressed: model.decrement,
                  icon: const Icon(Icons.remove, size: 40),
                  tooltip: 'Decrement',
                ),
                FilledButton.tonal(
                  onPressed: model.reset,
                  child: Text(
                    'Reset',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                IconButton.filled(
                  onPressed: model.increment,
                  icon: const Icon(Icons.add, size: 40),
                  tooltip: 'Increment',
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
