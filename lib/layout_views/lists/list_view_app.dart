import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ListViewApp()));

class ListViewApp extends StatelessWidget {
  ListViewApp({super.key});

  final List<String> fruits = [
    "Watermelon",
    "Apple",
    "Avocado",
    "Dates",
    "Beetroot",
    "Oranges",
    "Tangerine",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView app",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      /*body:  ListView(
        children: const [
          SizedBox(height: 25),
          ListTile(
            leading: CircleAvatar(radius: 40, child: Icon(Icons.person)),
            title: Text(
              "John Doe",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: CircleAvatar(radius: 40, child: Icon(Icons.person)),
            title: Text(
              "Paul",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: CircleAvatar(radius: 40, child: Icon(Icons.person)),
            title: Text(
              "Jane",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: CircleAvatar(radius: 40, child: Icon(Icons.person)),
            title: Text(
              "Ade",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ), */
      body: ListView(
        children: fruits.map((fruit) {
          return ListTile(
            leading: const Icon(Icons.list, size: 30),
            title: Text(
              fruit,
              style: TextStyle(
                fontSize: 25,
                color: fruit.length > 5 ? Colors.green : Colors.red,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
