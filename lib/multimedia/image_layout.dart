import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ImageLayout()));
}

class ImageLayout extends StatefulWidget {
  const ImageLayout({super.key});

  @override
  State<ImageLayout> createState() => _ImageLayoutState();
}

class _ImageLayoutState extends State<ImageLayout> {
  bool hasPaid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Layouts',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        // Container can not force its border radius on its child image
        /* child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            // Container's radius affects ONLY the containers background fill, NOT the container's child
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
            ),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                fit: .cover,
                "https://picsum.photos/id/292/600/400",
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    height: 350,
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 350,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/icons/empty_image.png",
                      height: 200,
                      width: 200,
                    ),
                  );
                },
              ),
            ),
          ],
        ), */

        // Solutions
        // 1. ClipRRect: Applies the radius directly to the Rectangular child
        /* child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: .circular(20),
            child: Image.network(
              fit: .cover,
              "https://picsum.photos/id/292/600/400",
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const SizedBox(
                  height: 350,
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 350,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icons/empty_image.png",
                    height: 200,
                    width: 200,
                  ),
                );
              },
            ),
          ),
        ), */

        // 2. ClipOval, clips a rectangular image to oval, square to circle
        /* child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipOval(
            child: Image.network(
              fit: .cover,
              // Sizing available in image url
              /* width: 80,
              height: 80, */
              "https://picsum.photos/id/292/600/400",
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const SizedBox(
                  height: 350,
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 350,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/icons/empty_image.png",
                    height: 200,
                    width: 200,
                  ),
                );
              },
            ),
          ),
        ), */

        // 3. CircleAvatar: for purely circular use cases
        /* child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: CircleAvatar(
              radius: 200,
              backgroundImage: NetworkImage(
                "https://picsum.photos/id/292/600/400",
              ),
            ),
          ),
        ), */

        // 4. ClipRect: Rarely used
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ClipRect(
                // clipBehavior: .hardEdge,
                child: Align(
                  alignment: .topCenter,
                  heightFactor: hasPaid ? 1.0 : 0.4,
                  child: Image.network(
                    fit: .cover,
                    "https://picsum.photos/id/292/600/400",
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const SizedBox(
                        height: 350,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 350,
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/icons/empty_image.png",
                          height: 200,
                          width: 200,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 50),

              ElevatedButton(
                // The only reason to extend stateful
                onPressed: () {
                  setState(() {
                    hasPaid = !hasPaid;
                  });
                },
                child: Text(
                  hasPaid ? "Subscription Active" : "Subscription Expired",
                  style: const TextStyle(fontSize: 18, fontWeight: .bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
