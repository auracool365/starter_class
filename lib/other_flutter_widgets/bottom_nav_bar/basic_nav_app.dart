import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BasicNavApp()));
}

class BasicNavApp extends StatefulWidget {
  const BasicNavApp({super.key});

  @override
  State<BasicNavApp> createState() => _BasicNavAppState();
}

class _BasicNavAppState extends State<BasicNavApp> {
  int _page = 0;

  void _selectScreen() {
    setState(() {
      _page++;

      if (_page > 3) {
        _page = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (_page == 0) {
      body = const ScreenWidgets(
        screenName: "Home Screen",
        screenIcon: Icons.home,
      );
    } else if (_page == 1) {
      body = const ScreenWidgets(
        screenName: "Search Screen",
        screenIcon: Icons.search,
      );
    } else if (_page == 2) {
      body = const ScreenWidgets(
        screenName: "Profile Screen",
        screenIcon: Icons.person,
      );
    } else {
      body = const ScreenWidgets(
        screenName: "Settings Screen",
        screenIcon: Icons.settings,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic Navigation',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: body,

      floatingActionButton: FloatingActionButton(
        onPressed: _selectScreen,
        child: const Icon(Icons.repeat, size: 30),
      ),
    );
  }
}

class ScreenWidgets extends StatelessWidget {
  final String screenName;
  final IconData screenIcon;
  const ScreenWidgets({
    super.key,
    required this.screenName,
    required this.screenIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Icon(screenIcon, size: 50),
          const SizedBox(width: 20),
          Text(
            screenName,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
