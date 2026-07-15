import 'dart:io';

import 'package:flutter/material.dart';

class Player {
  final String name;
  final String club;
  final String imagePath;

  Player({required this.name, required this.club, required this.imagePath});
}

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({super.key});

  final List<Player> players = [
    Player(
      name: "Erling Haaland",
      club: "Manchester City",
      imagePath: "assets/images/416.webp",
    ),
    Player(
      name: "Cristiano Ronaldo",
      club: "Al Nassr",
      imagePath: "assets/images/416.webp",
    ),
    Player(
      name: "Lionel Messi",
      club: "Inter Miami",
      imagePath: "assets/images/416.webp",
    ),
    Player(
      name: "Enzo Fernandez",
      club: "Chelsea",
      imagePath: "assets/images/416.webp",
    ),
    Player(
      name: "Cole Palmer",
      club: "Chelsea",
      imagePath: "assets/images/416.webp",
    ),
    Player(
      name: "Bukayo Saka",
      club: "Arsenal",
      imagePath: "assets/images/416.webp",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView.builder app",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        children: players.map((player) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              title: Text(player.name),
              leading: CircleAvatar(
                radius: 60,
                child: Image.asset(player.imagePath),
              ),
              subtitle: Text(player.club),
              trailing: Icon(
                Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}


/* import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({super.key});

  final List<String> contacts = [
    "John",
    "Sam",
    "Timi",
    "Ade",
    "Dami",
    "Favor",
    "Faith",
    "Paul",
    "John",
    "Sam",
    "Timi",
    "Ade",
    "Dami",
    "Favor",
    "Faith",
    "Paul",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView.builder app",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person),
              ),
              title: Text(contacts[index]),
              trailing: const Icon(Icons.phone),
            ),
          );
        },
      ),
    );
  }
} */