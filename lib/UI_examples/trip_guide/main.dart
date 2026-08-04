import 'package:flutter/material.dart';
import 'package:starter_class/UI_examples/trip_guide/screens/home_screen.dart';

void main() {
  runApp(const TripGuideApp());
}

class TripGuideApp extends StatelessWidget {
  const TripGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Guide',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
