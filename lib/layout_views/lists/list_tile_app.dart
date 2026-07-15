import 'package:flutter/material.dart';

class ListTileApp extends StatelessWidget {
  const ListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListTile app",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: ListTile(
          leading: CircleAvatar(radius: 40, child: Icon(Icons.person)),
          title: Text(
            "John Doe",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          subtitle: Text(
            "John called earlier",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          // subtitleTextStyle: TextStyle(),
          trailing: Icon(Icons.phone),
        ),
      ),
    );
  }
}
