import 'package:flutter/material.dart';

void main() {
  // ErrorWidget.builder = "Flutter, if a widget fails to build, show this UI instead."
  // Replaces the default red error screen with a friendlier fallback
  // for any widget build error that wasn't caught anywhere else.
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        child: const Text(
          'Something went wrong loading this screen.\nPlease try again.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  };

  // FlutterError.onError = "Flutter, tell me about the error so I can log/report it."
  // Log every framework-level error somewhere, instead of only
  // showing it in a real app this line would send the error to
  // a crash-reporting service.
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint(
      'Caught by FlutterError.onError: ${details.exceptionAsString()}',
    );
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Global Error Handling')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Deliberately triggers a build error to show the fallback UI.
              runApp(const MaterialApp(home: _BrokenWidget()));
            },
            child: const Text('Trigger a broken screen'),
          ),
        ),
      ),
    );
  }
}

class _BrokenWidget extends StatelessWidget {
  const _BrokenWidget();

  @override
  Widget build(BuildContext context) {
    final List<int> empty = [];
    return Scaffold(
      body: Center(
        // Deliberately reads an index that doesn't exist.
        child: Text('${empty[5]}'),
      ),
    );
  }
}
