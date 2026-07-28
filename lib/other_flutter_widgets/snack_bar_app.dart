import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FavoritePage()));

// Example 1
class SnackBarApp extends StatelessWidget {
  const SnackBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Snack Bar",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Hello World!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          child: const Text("Click Me", style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

// Example 2
class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    final previousValue = _isFavorite;

    setState(() {
      _isFavorite = !_isFavorite;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      // Example 1 for Undo. Action is expected so the snackbar doesn't disappear
      /* SnackBar(
        behavior: .floating,
        duration: const Duration(seconds: 3),

        content: Text(
          _isFavorite ? 'Added to favorites' : 'Removed from favorites',
        ),

        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _isFavorite = previousValue;
            });
          },
        ),
      ), */

      //Example 2. To make it disappear, we can specify it as a button ourselves
      SnackBar(
        duration: const Duration(seconds: 3),
        behavior: .floating,
        width: 400,
        backgroundColor: Colors.blue,
        content: Row(
          children: [
            Expanded(
              child: Text(
                _isFavorite ? 'Added to favorites' : "Removed from favorites",
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isFavorite = previousValue;
                });

                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Text('UNDO', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SnackBar Example',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: 400,
                child: Image.network(
                  'https://poedagar.store/wp-content/uploads/2022/03/827.3.jpg',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Poedagar 827 Mens Watches Business Stainless Steel Quartz Silver Watch for Men Waterproof',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                '\$79.99',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 20),

              IconButton(
                iconSize: 40,
                onPressed: _toggleFavorite,
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : Colors.grey,
                ),
              ),

              Text(
                _isFavorite
                    ? 'Added to Favorites'
                    : 'Tap the heart to favorite',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
