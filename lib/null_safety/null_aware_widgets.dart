import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NoteEditor());
  }
}

class NoteEditor extends StatefulWidget {
  const NoteEditor({super.key});

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  // Starts null no draft has been loaded or typed yet.
  String? _draftText;

  void _loadSavedDraftIfAny() {
    // Only assigns 'Untitled note' if _draftText is remains null.
    // If the user already typed something
    _draftText ??= 'Untitled note';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Null Aware(??=)',
          style: TextStyle(fontSize: 30, fontWeight: .bold),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Type a note (optional)',
              ),
              onChanged: (value) => setState(() => _draftText = value),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadSavedDraftIfAny,
              child: const Text('Load saved draft'),
            ),
            const SizedBox(height: 16),
            Text(
              'Current _draftText: ${_draftText ?? "(still null)"}',
              style: const TextStyle(fontSize: 25, fontWeight: .bold),
            ),
          ],
        ),
      ),
    );
  }
}
