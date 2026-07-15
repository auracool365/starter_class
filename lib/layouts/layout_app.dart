import 'package:flutter/material.dart';

// For best results, build the layouts in individual screen
class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              "Layout Concepts",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            Icon(Icons.list_rounded, size: 40),
          ],
        ),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Container
              const Text(
                "Container",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Container(
                color: Colors.orange.shade900,
                height: 400,
                width: 400,
                // Space OUTSIDE the outer container
                margin: const EdgeInsets.all(20),
                // Space INSIDE the outer container
                padding: const EdgeInsets.all(30),

                // inner container
                child: Container(
                  color: Colors.orange.shade600,
                  height: 200,
                  width: 200,
                  // Space OUTSIDE the inner container
                  margin: const EdgeInsets.all(20),
                  // Space INSIDE the inner container
                  padding: const EdgeInsets.all(30),

                  // innermost container
                  child: Container(
                    color: Colors.orange.shade300,
                    height: 80,
                    width: 80,
                    // Space OUTSIDE the innermost container
                    margin: const EdgeInsets.all(20),
                    // Space INSIDE the innermost container
                    padding: const EdgeInsets.all(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Row Alignment",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),

              // Main axis apples the effect along the main axis of the layout(horizontal for Row)
              const Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  Icon(Icons.home, size: 40),
                  Icon(Icons.person, size: 40),
                  Icon(Icons.settings, size: 40),
                ],
              ),

              // Cross axis applies the effect perpendicular to the layout(top to bottom for row)
              const Row(
                crossAxisAlignment: .start,
                children: [
                  Icon(Icons.home, size: 40),
                  Icon(Icons.person, size: 40),
                  Icon(Icons.settings, size: 40),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Column Alignment",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),

              // Main axis apples the effect along the main axis of the layout(horizontal for Row)
              const Column(
                children: [
                  Icon(Icons.home, size: 40),
                  Icon(Icons.person, size: 40),
                  Icon(Icons.settings, size: 40),
                ],
              ),

              const SizedBox(height: 30),

              // Cross axis applies the effect perpendicular to the layout(top to bottom for row)
              const Column(
                crossAxisAlignment: .end,
                children: [
                  Icon(Icons.home, size: 40),
                  Icon(Icons.person, size: 40),
                  Icon(Icons.settings, size: 40),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "SizedBox", // SizedBox spacing in a specified direction
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Flutter",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const Text(
                "Is",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const Text(
                "Lovely",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              // Align
              const SizedBox(height: 20),

              const Text(
                "Align", // SizedBox spacing in a specified direction
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),

              Align(
                alignment: AlignmentGeometry.bottomEnd,
                child: Container(
                  color: Colors.blueAccent,
                  height: 200,
                  width: 50,
                ),
              ),

              // Expanded
              const SizedBox(height: 20),

              const Text(
                "Expanded", // SizedBox spacing in a specified direction
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),

              // Overflow error on the screen
              /* Row(
                children: [
                  Container(color: Colors.greenAccent, height: 200, width: 300),
                  Container(color: Colors.blueAccent, height: 200, width: 300),
                  Container(color: Colors.redAccent, height: 200, width: 300),
                ],
              ), */
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      height: 200,
                      width: 300,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      height: 200,
                      width: 300,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
