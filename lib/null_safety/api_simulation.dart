import 'package:flutter/material.dart';

void main() {
  runApp(const ApiSimulation());
}

// Demo API data.
class Recipe {
  final String name;
  final String? imageUrl;
  final double rating;
  final String description;

  Recipe({
    required this.name,
    this.imageUrl,
    required this.rating,
    required this.description,
  });

  // "Fake API response" data, some fields missing entirely
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'] ?? 'Unnamed Recipe',
      imageUrl: json['imageUrl'], // fine to stay null, optional
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] ?? 'No description available.',
    );
  }
}

class ApiSimulation extends StatelessWidget {
  const ApiSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulates three "API responses" the last two are missing fields.
    final List<Map<String, dynamic>> rawData = [
      {
        'name': 'Jollof Rice',
        'imageUrl': 'https://picsum.photos/id/292/400',
        'rating': 4.8,
        'description': 'Popular in West Africa.',
      },
      {'name': 'Egusi Soup', 'rating': 4.5}, // no imageUrl, no description
      {'rating': null}, // name and rating missing
    ];

    final dishes = rawData.map((json) => Recipe.fromJson(json)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Defensive Parsing',
            style: TextStyle(fontSize: 30, fontWeight: .bold),
          ),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: dishes.map((dish) {
            return ListTile(
              title: Text(
                dish.name,
                style: const TextStyle(fontSize: 20, fontWeight: .w700),
              ),
              subtitle: Text(
                '${dish.description}  •  ⭐ ${dish.rating}',
                style: const TextStyle(fontSize: 16),
              ),
              leading: dish.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        dish.imageUrl!,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(Icons.restaurant, size: 48),
            );
          }).toList(),
        ),
      ),
    );
  }
}
