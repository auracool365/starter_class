import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BottomNavStateApp()));
}

class BottomNavStateApp extends StatefulWidget {
  const BottomNavStateApp({super.key});

  @override
  State<BottomNavStateApp> createState() => _BottomNavStateAppState();
}

class _BottomNavStateAppState extends State<BottomNavStateApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    _HomePage(),
    _SearchPage(),
    _ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nav Bar State Loss App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      // Does not remember state of each page when switching between tabs
      // body: _pages[_selectedIndex],

      // Remembers state of each page when switching between tabs
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();
  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('🏠 Home counter', style: TextStyle(fontSize: 20)),
          Text('$_count', style: const TextStyle(fontSize: 40)),
          ElevatedButton(
            onPressed: () => setState(() => _count++),
            child: const Text('Tap to increment'),
          ),
        ],
      ),
    );
  }
}

class _SearchPage extends StatefulWidget {
  const _SearchPage();
  @override
  State<_SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<_SearchPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '🔍 Type something, then switch tabs',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('👤 Profile Screen', style: TextStyle(fontSize: 28)),
    );
  }
}
