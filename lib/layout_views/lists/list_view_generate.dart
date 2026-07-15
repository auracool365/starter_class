import 'package:flutter/material.dart';

void main() => runApp(ListViewGenerate());

class ListViewGenerate extends StatelessWidget {
  ListViewGenerate({super.key});

  final List<int> nums = List.generate(50, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ListView.generate",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: nums.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(child: Text(nums[index].toString())),
              title: Text("Number: ${nums[index]}"),
              subtitle: Text(
                nums[index].isEven
                    ? "${nums[index]} is even"
                    : "${nums[index]} is odd",
              ),

              trailing: Container(
                height: 20,
                width: 20,
                color: nums[index].isEven ? Colors.green : Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
