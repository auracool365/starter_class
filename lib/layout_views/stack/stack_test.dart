import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: StackTest()));
}

class StackTest extends StatefulWidget {
  const StackTest({super.key});

  @override
  State<StackTest> createState() => _StackTestState();
}

class _StackTestState extends State<StackTest> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stack Test",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              // Row Layout
              /* Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              // Column Layout
              Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_outline,
                size: 30,
                color: _isFavorite ? Colors.red : null,
              ),
              Text(
                _isFavorite ? "Added to favorite" : "Add to favorite",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                "assets/images/ryan-reynolds.jpg",
                height: 100,
                width: 100,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                child: const Text(
                  "Add to favorite",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ) */
              // Column Layout
              /* Column(
            children: [
              Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_outline,
                size: 50,
                color: _isFavorite ? Colors.red : null,
              ),
              Text(
                _isFavorite ? "Added to favorite" : "Add to favorite",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Image.asset("assets/images/ryan-reynolds.jpg"),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                child: const Text(
                  "Add to favorite",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ), */
              // Stack Layout
              Stack(
                children: [
                  Image.asset("assets/images/ryan-reynolds.jpg"),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      alignment: .center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(
                          width: 1,
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_outline,
                        size: 35,
                        color: _isFavorite ? Colors.red : Colors.teal,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Text(
                      _isFavorite ? "Added to favorite" : "Add to favorite",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _isFavorite ? Colors.green : Colors.amberAccent,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 0,
                    left: 0,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      child: const Text(
                        "Add image to favorite",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const Align(alignment: .bottomCenter, child: Text("London")),
                ],
              ),
        ),
      ),
    );
  }
}
