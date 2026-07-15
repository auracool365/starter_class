import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(ListViewSeparated());

class Player {
  final String name;
  final String club;
  final String imagePath;

  Player({required this.name, required this.club, required this.imagePath});
}

class ListViewSeparated extends StatelessWidget {
  ListViewSeparated({super.key});

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ListView.builder app",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

        body: ListView.separated(
          itemCount: players.length,
          itemBuilder: (context, index) {
            final player = players[index];
            return ListTile(
              title: Text(player.name),
              leading: CircleAvatar(
                radius: 60,
                child: Image.asset(player.imagePath),
              ),
              subtitle: Text(player.club),
              trailing: Icon(
                Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward,
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            //height: 1,
            thickness: 3,
            color: index % 2 == 0 ? Colors.grey : Colors.amber,
          ),
        ),
      ),
    );
  }
}
