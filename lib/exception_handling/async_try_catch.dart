import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: AsyncTryCatch()));
}

// Simulates a network call that sometimes fails standing in for a real HTTP request
Future<String> fetchDailySpecial() async {
  await Future.delayed(const Duration(seconds: 1));
  final bool serverIsDown = DateTime.now().second.isOdd;
  if (serverIsDown) {
    throw Exception('Server unreachable');
  }
  return 'Jollof Rice';
}

class AsyncTryCatch extends StatefulWidget {
  const AsyncTryCatch({super.key});

  @override
  State<AsyncTryCatch> createState() => _AsyncErrorDemoState();
}

class _AsyncErrorDemoState extends State<AsyncTryCatch> {
  String _status = 'Tap to load';
  bool _loading = false;

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _status = 'Loading...';
    });
    try {
      final special = await fetchDailySpecial();
      setState(() => _status = 'Today\'s special: $special');
    } catch (e) {
      setState(() => _status = 'Failed to load — try again');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Async try/catch',
          style: TextStyle(fontWeight: .bold, fontSize: 30),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loading ? null : _load,
              child: const Text('Load daily special'),
            ),
          ],
        ),
      ),
    );
  }
}
