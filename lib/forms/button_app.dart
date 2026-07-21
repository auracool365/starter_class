import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ButtonApp()));
}

class ButtonApp extends StatefulWidget {
  const ButtonApp({super.key});

  @override
  State<ButtonApp> createState() => _ButtonAppState();
}

class _ButtonAppState extends State<ButtonApp> {
  int _elevatedCount = 0;
  int _textCount = 0;
  int _outLinedCount = 0;
  bool _isLiked = false;
  bool _isEnabled = true;

  // _elevatePress method just creates a function (or null) with the ternary and then throws the result away
  //it never actually calls setState. The method itself always completes and returns void, so onPressed: _elevateTap is always a valid,
  //non-null callback. That means:

  // 1. The button never looks disabled, because _elevatePress itself is never null, only the throwaway value inside it is.
  // 2. Tapping the button runs _elevateTap(), which evaluates the ternary, builds a closure (or null), and then does nothing with it
  // so _elevatedCount never increments.
  // Won't work
  /* void _elevateTap() {
    _isEnabled
        ? () {
            setState(() {
              _elevatedCount++;
            });
          }
        : null;
  } */

  // In order to work with methods:
  // Syntax 1. keep onPressed itself conditional, remove anonymous closure
  /* void _elevateTap() {
    setState(() {
      _elevatedCount++;
    });
  } */

  // Syntax 2. keep the conditional logic inside the method,
  //but return a nullable function and call it:
  VoidCallback? _elevateTap() {
    return _isEnabled ? () => setState(() => _elevatedCount++) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buttons App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisAlignment: .spaceEvenly,
          children: [
            Text(
              "Buttons ${_isEnabled ? "Enabled" : "Disabled"}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 20),
            // Elevated Button
            // Syntax 1
            /* ElevatedButton(
              onPressed: _isEnabled ? _elevateTap : null,
              child: Text("Elevated Count: $_elevatedCount"),
            ), */

            // Syntax 2
            ElevatedButton(
              onPressed: _elevateTap(),
              child: Text(
                "Elevated Count: $_elevatedCount",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // TextButton
            TextButton(
              onPressed: _isEnabled
                  ? () => setState(() {
                      _textCount++;
                    })
                  : null,
              child: Text(
                "Text button Count: $_textCount",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // OutLine button
            OutlinedButton(
              onPressed: _isEnabled
                  ? () {
                      return setState(() {
                        _outLinedCount++;
                      });
                    }
                  : null,
              child: Text(
                "Outline Button Count: $_outLinedCount",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // Icon Button
            IconButton(
              onPressed: _isEnabled
                  ? () {
                      return setState(() {
                        _isLiked = !_isLiked;
                      });
                    }
                  : null,
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                size: 80,
                color: _isLiked ? Colors.red : null,
              ),
            ),

            // Switch List
            SwitchListTile(
              value: _isEnabled,
              onChanged: (val) {
                return setState(() {
                  _isEnabled = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
