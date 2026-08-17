import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ValidateDemo()));
}

// A custom exception type just a class implementing Exception.
class InvalidRecipeException implements Exception {
  final String message;
  InvalidRecipeException(this.message);

  @override
  String toString() => message;
}

void validateRecipe(String name, String description) {
  if (name.trim().isEmpty) {
    throw InvalidRecipeException('Recipe name cannot be empty.');
  } 
  if (name.trim().length < 3) {
    throw InvalidRecipeException('Recipe name must be at least 3 characters.');
  } 
  if (description.trim().length < 10) {
    throw InvalidRecipeException('Description must be at least 10 characters.');
  }
}

class ValidateDemo extends StatefulWidget {
  const ValidateDemo({super.key});

  @override
  State<ValidateDemo> createState() => _ValidateDemoState();
}

class _ValidateDemoState extends State<ValidateDemo> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  String _feedback = '';

  void _submit() {
    try {
      validateRecipe(_nameController.text, _descController.text);
      setState(() => _feedback = 'Recipe looks good!');
    } on InvalidRecipeException catch (e) {
      setState(() => _feedback = '$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom Exceptions',
          style: TextStyle(fontWeight: .bold, fontSize: 30),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(_feedback),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _submit, child: const Text('Validate')),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
