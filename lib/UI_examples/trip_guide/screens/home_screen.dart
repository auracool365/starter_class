import 'package:flutter/material.dart';
import 'package:starter_class/UI_examples/trip_guide/models/city_model.dart';
import 'package:starter_class/UI_examples/trip_guide/screens/view_all_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int selectedContinent = 0;

  final List<String> favorites = [];

  void toggleFavorite(String city) {
    setState(() {
      if (favorites.contains(city)) {
        favorites.remove(city);

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("$city removed from favorites")));
      } else {
        favorites.add(city);

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("$city added to favorites")));
      }
    });
  }

  void showQuickView(City city) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                city.country,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 20),

              Image.network(
                city.imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,

                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;

                  return const SizedBox(
                    height: 180,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 70,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange),

                  const SizedBox(width: 8),

                  Text(
                    city.rating.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final continent = continents[selectedContinent];

    return Scaffold(
      key: _scaffoldKey,

      backgroundColor: const Color(0xfff5f5f5),

      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff14213D)),

              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Vanessa",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),

            ListTile(leading: Icon(Icons.person), title: Text("Profile")),

            ListTile(leading: Icon(Icons.settings), title: Text("Settings")),

            ListTile(leading: Icon(Icons.logout), title: Text("Logout")),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Header
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Hello, Vanessa",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Discover your next destination",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },

                    child: const CircleAvatar(
                      radius: 26,

                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500",
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Search
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,

                          icon: Icon(Icons.search),

                          hintText: "Search destination...",
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  CircleAvatar(
                    radius: 24,

                    backgroundColor: const Color(0xff14213D),

                    child: IconButton(
                      onPressed: () {},

                      icon: const Icon(Icons.tune, color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Continents
              SizedBox(
                height: 42,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: continents.length,

                  itemBuilder: (_, index) {
                    final selected = selectedContinent == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContinent = index;
                        });
                      },

                      child: Container(
                        margin: const EdgeInsets.only(right: 10),

                        padding: const EdgeInsets.symmetric(horizontal: 18),

                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xff14213D)
                              : Colors.white,

                          borderRadius: BorderRadius.circular(30),
                        ),

                        child: Text(
                          continents[index].name,

                          style: TextStyle(
                            color: selected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const Text(
                    "Popular Cities",

                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ViewAllScreen(),
                        ),
                      );
                    },

                    child: const Text("View All"),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              ...continent.cities.map((city) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),

                  child: _DestinationCard(
                    city: city,

                    isFavorite: favorites.contains(city.name),

                    onFavorite: () {
                      toggleFavorite(city.name);
                    },

                    onArrow: () {
                      showQuickView(city);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _DestinationCard extends StatelessWidget {
  final City city;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onArrow;

  const _DestinationCard({
    required this.city,
    required this.isFavorite,
    required this.onFavorite,
    required this.onArrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              city.imageUrl,
              fit: BoxFit.cover,

              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;

                return Container(
                  color: Colors.grey.shade300,
                  child: const Center(child: CircularProgressIndicator.adaptive()),
                );
              },

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 70,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),

          // Dark Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withValues(alpha: 0.25)),
          ),

          // Rating
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),

                  const SizedBox(width: 5),

                  Text(
                    city.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Favorite Button
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: onFavorite,
              child: CircleAvatar(
                backgroundColor: Colors.black45,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Bottom Details
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white70,
                            size: 18,
                          ),

                          const SizedBox(width: 5),

                          Text(
                            city.country,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: onArrow,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_outward, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
