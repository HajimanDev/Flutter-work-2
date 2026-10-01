import 'package:flutter/material.dart';
import 'screens/notes_screen.dart';
import 'theme/cyber_theme.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyberpunk Notes',
      debugShowCheckedModeBanner: false,
      theme: CyberTheme.theme,
      home: const NotesScreen(),
    );
  }
}