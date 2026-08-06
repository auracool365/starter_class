import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BottomNavBarApp()));
}

class BottomNavBarApp extends StatefulWidget {
  const BottomNavBarApp({super.key});

  @override
  State<BottomNavBarApp> createState() => _BottomNavBarAppState();
}

class _BottomNavBarAppState extends State<BottomNavBarApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text("🏠 Home Screen", style: TextStyle(fontSize: 28))),
    Center(child: Text("🔍 Search Screen", style: TextStyle(fontSize: 28))),
    Center(
      child: Text("🔔 Notifications Screen", style: TextStyle(fontSize: 28)),
    ),
    Center(child: Text("👤 Profile Screen", style: TextStyle(fontSize: 28))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bottom Navigation",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: .fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
