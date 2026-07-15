// Difference between SingleChildScrollView and Expanded
import 'package:flutter/material.dart';

void main() {
  runApp(ExpandedApp());
}

class ColorBlock {
  final Color color;
  final String colorName;

  const ColorBlock({required this.color, required this.colorName});
}

class ExpandedApp extends StatelessWidget {
  ExpandedApp({super.key});

  final List<ColorBlock> colorItems = [
    const ColorBlock(color: Colors.teal, colorName: "Teal"),
    const ColorBlock(color: Colors.red, colorName: "Red"),
    const ColorBlock(color: Colors.blue, colorName: "Blue"),
    const ColorBlock(color: Colors.grey, colorName: "Grey"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expanded",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),

        // Problem
        // Using a fixed constraint widget(expanded) mixed with an infinite amount of space widget(SingleChildScrollView) creates
        //a layout crash. Expanded no longer knows how to calculate its constraint.
        /* body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 400,
                    width: 200,
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                  child: Container(height: 400, width: 200, color: Colors.red),
                ),
                Expanded(
                  child: Container(
                    height: 400,
                    width: 200,
                    color: Colors.deepPurple,
                  ),
                ),
                Expanded(
                  child: Container(height: 400, width: 200, color: Colors.blue),
                ),
              ],
            ),
          ),
        ), */

        // Solution 1. use One without the other
        /* body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(height: 400, width: 200, color: Colors.amber),
                Container(height: 400, width: 200, color: Colors.red),
                Container(height: 400, width: 200, color: Colors.deepPurple),
                Container(height: 400, width: 200, color: Colors.blue),
              ],
            ),
          ),
        ), */

        // Solution 2. use a ConstrainedBox
        /* body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 1000),
            child: IntrinsicHeight(
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: 400,
                        width: 200,
                        color: Colors.amber,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 400,
                        width: 200,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 400,
                        width: 200,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 400,
                        width: 200,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ), */

        // Solution 3. simply use a list
        body: ListView.builder(
          itemCount: colorItems.length,
          itemBuilder: (context, index) {
            final colorItem = colorItems[index];
            return ListTile(
              title: Container(
                height: 400,
                width: 200,
                color: colorItem.color,
                child: Center(
                  child: Text(
                    colorItem.colorName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
