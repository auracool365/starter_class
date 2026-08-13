import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: OnboardingDemo());
  }
}

class OnboardingDemo extends StatelessWidget {
  const OnboardingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Discover Recipes",
          body: "Browse hundreds of dishes from around the world.",
          image: const Icon(Icons.restaurant_menu, size: 100),
        ),
        PageViewModel(
          title: "Save Favorites",
          body: "Keep track of the meals you love most.",
          image: const Icon(Icons.favorite, size: 100),
        ),
        PageViewModel(
          title: "Share Your Own",
          body: "Submit your own recipes for others to try.",
          image: const Icon(Icons.upload, size: 100),
        ),
      ],
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      onSkip: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      dotsDecorator: const DotsDecorator(activeColor: Colors.teal),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome!')),
    );
  }
}
