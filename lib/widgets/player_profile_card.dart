import 'package:flutter/material.dart';
import 'package:starter_class/widgets/player_detail.dart';

class PlayerProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String occupation;
  final String imagePath;
  final VoidCallback onViewProfile;

  const PlayerProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.occupation,
    required this.imagePath,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 85, backgroundImage: AssetImage(imagePath)),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: .start,
          children: [
            PlayerDetail(label: 'Name', value: name),
            const SizedBox(height: 6),
            PlayerDetail(label: 'Email', value: email),
            const SizedBox(height: 6),
            PlayerDetail(label: 'Phone', value: phone),
            const SizedBox(height: 6),
            PlayerDetail(label: 'Occupation', value: occupation),
            const SizedBox(height: 6),
            PlayerDetail(label: "Club", value: "Al Nassr"),
          ],
        ),
      ],
    );
  }
}
