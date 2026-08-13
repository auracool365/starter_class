import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MaterialApp(home: SlidableApp()));
}

class SlidableApp extends StatefulWidget {
  const SlidableApp({super.key});

  @override
  State<SlidableApp> createState() => _SlidableAppState();
}

class _SlidableAppState extends State<SlidableApp> {
  final List<String> _meals = [
    'Spaghetti Bolognese',
    'Chicken Curry',
    'Beef Stroganoff',
    'Vegetable Stir Fry',
    'Fish Tacos',
  ];

  void _deleteItem(int index) {
    setState(() {
      _meals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Slidable Package App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(_meals[index]),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    debugPrint("Editing: ${_meals[index]}");
                  },
                  padding: const EdgeInsets.all(6),
                  label: "Edit",
                  icon: Icons.edit,
                  backgroundColor: Colors.blue,
                  borderRadius: const .all(.circular(8)),
                ),
                const SizedBox(width: 2),

                SlidableAction(
                  onPressed: (context) {
                    _deleteItem(index);
                  },
                  padding: const EdgeInsets.all(6),
                  label: "Delete",
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  borderRadius: const .all(.circular(8)),
                ),
                const SizedBox(width: 2),
              ],
            ),
            child: ListTile(
              title: Text(
                _meals[index],
                style: TextStyle(
                  fontSize: 25,
                  color: index % 2 == 0 ? Colors.green : Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: Icon(
                Icons.fastfood,
                size: 35,
                color: index % 2 == 0 ? Colors.green : Colors.teal,
              ),
            ),
          );
        },
      ),
    );
  }
}
