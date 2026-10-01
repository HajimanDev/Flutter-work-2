import 'package:flutter/material.dart';
import '../models/note.dart';
import '../theme/cyber_theme.dart';
import '../widgets/note_input.dart';
import '../widgets/note_item.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final List<Note> _notes = [];
  int _counter = 0;

  void _addNote(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _notes.add(Note(id: (_counter++).toString(), text: text.trim()));
    });
  }

  void _deleteNote(String id) {
    setState(() {
      _notes.removeWhere((note) => note.id == id);
    });
  }

  void _editNote(String id, String newText) {
    setState(() {
      final note = _notes.firstWhere((n) => n.id == id);
      note.text = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CyberColors.yellow,
      appBar: AppBar(
        title: const Text('// ЗАМЕТКИ'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'CYBERPUNK 2077',
                style: TextStyle(
                  color: CyberColors.cyan,
                  fontSize: 12,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NoteInput(onSave: _addNote),
            const SizedBox(height: 20),
            Expanded(
              child: _notes.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.memory,
                            size: 60,
                            color: CyberColors.black.withOpacity(0.3),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '// НЕТ ДАННЫХ',
                            style: TextStyle(
                              color: CyberColors.black.withOpacity(0.5),
                              fontSize: 18,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _notes.length,
                      itemBuilder: (context, index) {
                        final note = _notes[index];
                        return NoteItem(
                          note: note,
                          onDelete: () => _deleteNote(note.id),
                          onEdit: (newText) => _editNote(note.id, newText),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}