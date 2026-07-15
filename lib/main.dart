import 'package:flutter/material.dart';
import 'package:starter_class/layout_views/lists/list_view_builder.dart';

void main() {
  runApp(MaterialApp(home: ListViewBuilder()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Starter Class",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
          ),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint("Search button clicked");
              },
              icon: const Icon(Icons.search, size: 30),
            ),
          ],
          centerTitle: false,
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          toolbarHeight: 60,
        ),
        body: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people, size: 40, color: Colors.green),
                  SizedBox(width: 8),
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
