import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: GestureDetectorVsInkwell()));
}

class GestureDetectorVsInkwell extends StatefulWidget {
  const GestureDetectorVsInkwell({super.key});

  @override
  State<GestureDetectorVsInkwell> createState() =>
      _GestureDetectorVsInkwellState();
}

class _GestureDetectorVsInkwellState extends State<GestureDetectorVsInkwell> {
  bool _isLightOn = false;

  void _toggleLightSwitch() {
    setState(() {
      _isLightOn = !_isLightOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              "Gesture Detector vs Inkwell",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            Icon(Icons.lightbulb_rounded, size: 40, color: Colors.amber),
          ],
        ),
        backgroundColor: Colors.blue,
        // foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'GestureDetector',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                debugPrint('GestureDetector tapped');
              },
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Tap Me\n(No Visual Feedback)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              'InkWell',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // InkWell needs a Material ancestor to draw its ripple
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.teal.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  splashColor: Colors.white54,
                  highlightColor: Colors.white24,
                  onTap: _toggleLightSwitch,
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    alignment: Alignment.center,
                    child: const Text(
                      'Tap Me\n(Shows Ripple Effect)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 100),

            Container(
              height: 200,
              width: 200,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Icon(
                    Icons.lightbulb_rounded,
                    size: 100,
                    color: _isLightOn ? Colors.amber.shade500 : null,
                  ),

                  const SizedBox(height: 5),

                  Text(
                    _isLightOn ? "Light switched on" : "Light switched off",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _isLightOn ? Colors.amber.shade500 : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
