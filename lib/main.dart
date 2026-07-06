import 'package:flutter/material.dart';
import 'package:starter_class/profile_screen.dart';

void main() {
  runApp(ProfileScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Starter Class",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
          ),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint("Search button");
              },
              icon: Icon(Icons.search, size: 30),
            ),
          ],
          centerTitle: false,
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          toolbarHeight: 60,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Icon(Icons.people, size: 40, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    "Hello Everyone",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
