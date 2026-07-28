import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BottomSheetApp()));
}

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bottom Sheet App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                // The modal
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 40,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Options',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 16),

                          ListTile(
                            leading: const Icon(Icons.share),
                            title: const Text('Share'),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 3),
                                  behavior: .floating,
                                  width: 400,
                                  backgroundColor: Colors.green,
                                  content: Text(
                                    "Item Shared",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            },
                          ),

                          const Divider(color: Colors.black),

                          ListTile(
                            leading: const Icon(Icons.delete_outline),
                            title: const Text('Delete'),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 3),
                                  behavior: .floating,
                                  width: 400,
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Item Deleted",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Show Options'),
            ),
          );
        },
      ),
    );
  }
}
