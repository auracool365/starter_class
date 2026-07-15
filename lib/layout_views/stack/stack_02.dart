import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Understanding Stack Layers'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Base layer: Background
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Base Layer (Index 0)',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),

            // Mid-layer 1: Positioned Element
            Positioned(
              top: 30,
              left: 30,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade700,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(blurRadius: 10, color: Colors.black26),
                  ],
                ),
                child: const Text(
                  'Positioned (Top-Left)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Mid-layer 2: Align element
            Align(
              alignment: .centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.teal.withValues(alpha: 0.8),
                  child: const Center(
                    child: Text('Aligned on the center', textAlign: .center),
                  ),
                ),
              ),
            ),

            // Top layer: Overlaid text with decoration
            Positioned(
              bottom: 40,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Top Floating Layer at the bottom',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Indicator layer for stack overflow demo
            const Positioned(
              top: 20,
              right: 20,
              child: Icon(Icons.layers, size: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
