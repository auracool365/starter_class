/* import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // must match the number of Tab()s AND views below
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'TabBar',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Browse'),
                Tab(text: 'Favorites'),
                Tab(text: 'Submit'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Browse recipes here')),
              Center(child: Text('Your favorites')),
              Center(child: Text('Submit a new recipe')),
            ],
          ),
        ),
      ),
    );
  }
} */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4, // must match the number of Tab()s AND views below
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Screens',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Search', icon: Icon(Icons.search)),
                Tab(text: 'Favorites', icon: Icon(Icons.favorite_outline)),
                Tab(text: 'Profile', icon: Icon(Icons.person_outline)),
                Tab(text: 'Settings', icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SearchScreen(),
              FavoriteScreen(),
              ProfileScreen(),
              SettingsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "This is the Search Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "This is the Favorite Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "This is the Profile Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "This is the Settings Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
