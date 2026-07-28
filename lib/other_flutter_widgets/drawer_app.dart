import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DrawerApp()));
}

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drawer app',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: Builder(
        builder: (context) {
          return Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        radius: 40,
                        child: Icon(Icons.person, size: 35),
                      ),
                      Text(
                        "User Profile",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings, size: 35),
                  title: const Text(
                    "Settings",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),

                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.history, size: 35),
                  title: const Text(
                    "History",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),

      body: const Center(
        child: Text(
          "This is the Home Screen",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
        ),
      ),

      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }
}
