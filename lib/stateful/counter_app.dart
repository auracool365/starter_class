import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _count = 0; // This is where state resides
  bool _isIncrementing = false;

  void _increment() {
    setState(() {
      _count++;
      _isIncrementing = true;
    });
    debugPrint(_count.toString());
  }

  void _decrement() {
    setState(() {
      _count--;
      _isIncrementing = false;
    });
  }

  void _reset() {
    setState(() => _count = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text.rich(
              TextSpan(
                text: "Counter: ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "$_count",
                    style: TextStyle(
                      color: _isIncrementing ? Colors.green : Colors.red,
                    ),
                  ),
                ],
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
                  child: Icon(Icons.remove, size: 30),
                ),
                FloatingActionButton(
                  onPressed: _reset,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.repeat, size: 30),
                ),
                FloatingActionButton(
                  onPressed: _increment,
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.add, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
