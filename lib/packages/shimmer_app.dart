import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MaterialApp(home: ShimmerApp()));
}

class ShimmerApp extends StatefulWidget {
  const ShimmerApp({super.key});

  @override
  State<ShimmerApp> createState() => _ShimmerAppState();
}

class _ShimmerAppState extends State<ShimmerApp> {
  bool _isLoading = true;

  void _loadingImage() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shimmer Package App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            _isLoading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey.shade200,
                    child: Container(
                      width: 400,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://picsum.photos/id/292/600/400",
                      width: 400,
                      height: 300,
                      fit: .fill,
                    ),
                  ),

            ElevatedButton(
              onPressed: _loadingImage,
              child: Text(
                _isLoading ? "Image Loading..." : "Image Loaded Successfully",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _isLoading ? Colors.blueAccent : Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
