import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: OpacityApp()));

class OpacityApp extends StatefulWidget {
  const OpacityApp({super.key});

  @override
  State<OpacityApp> createState() => _OpacityAppState();
}

class _OpacityAppState extends State<OpacityApp> {
  bool _userHasPaid = false;

  void _handleSubscription() => setState(() {
    _userHasPaid = !_userHasPaid;
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Opacity and AnimatedOpacity',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            // Opacity: Specifies the level of depth or transparency of the color
            Container(
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                // color: Colors.deepOrange.withOpacity(0.4), deprecated
                color: Colors.deepOrange.withValues(
                  alpha: _userHasPaid ? 1 : 0.2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            Text(
              _userHasPaid ? "Subscription active" : "Subscription Expired",
              style: const TextStyle(fontSize: 25, fontWeight: .bold),
            ),

            // AnimatedOpacity: Applies some animation
            AnimatedOpacity(
              opacity: _userHasPaid ? 1 : 0.1,
              duration: const Duration(milliseconds: 400),
              child: Container(
                width: 350,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: _handleSubscription,
              child: Text(
                _userHasPaid ? "Features turned on" : "Features turned off",
                style: const TextStyle(fontSize: 18, fontWeight: .bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
