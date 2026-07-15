import 'package:flutter/material.dart';

void main() => runApp(const Grid());

class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "GridView app",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 12,
          ),
          itemCount: 30,
          itemBuilder: (context, index) {
            return Container(
              height: 120,
              width: 260,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/images/RONALDOCR7.jpg"),
                    ),

                    const Text("Cristiano Ronaldo", textAlign: .center),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
