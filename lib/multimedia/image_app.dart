import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ImageApp()));
}

class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image App asset vs network',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 10,
          right: 10,
          bottom: 100,
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(height: 350, "assets/images/ryan-reynolds.jpg"),
            const SizedBox(height: 50),

            Image.network(
              height: 350,
              width: .infinity,
              fit: .cover,
              "https://images.unsplash.com/photo-1785829413650-ba241aae5f92?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzN3x8fGVufDB8fHx8fA%3D%3D",

              // Prevent User from staring at a blank screen
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const SizedBox(
                  height: 350,
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              },
              // Placeholder in case image call fails for whatever reason
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 350,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icons/empty_image.png",
                    height: 200,
                    width: 200,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
