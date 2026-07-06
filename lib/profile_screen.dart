import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "Player Profile",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.person, size: 30),
            ],
          ),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisSize: .min,
            children: [
              /*CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.person_outlined, size: 80),
              ),*/
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/416.webp"),
              ),
              // Image.asset("assets/images/RONALDOCR7.jpg"),
              const SizedBox(height: 6),
              Text(
                "Cristiano Ronaldo",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Icon(Icons.phone, size: 30),
                    Icon(Icons.email, size: 30),
                    Icon(Icons.pin_drop_outlined, size: 30),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Name: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: 'Cristiano Ronaldo\n\n'),

                        TextSpan(
                          text: 'Email: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'cristiano.ronaldo@gmail.com\n\n',
                          style: TextStyle(color: Colors.blueAccent),
                        ),

                        TextSpan(
                          text: 'Phone: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: '+234 801 234 5678\n\n'),

                        TextSpan(
                          text: 'Occupation: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: 'Professional Footballer\n\n'),

                        TextSpan(
                          text: 'Country: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: 'Portugal\n\n'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
