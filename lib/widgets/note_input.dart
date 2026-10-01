import 'package:flutter/material.dart';
import '../theme/cyber_theme.dart';
import 'cyber_clip.dart';

class NoteInput extends StatefulWidget {
  final void Function(String text) onSave;

  const NoteInput({super.key, required this.onSave});

  @override
  State<NoteInput> createState() => _NoteInputState();
}

class _NoteInputState extends State<NoteInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_controller.text.trim().isEmpty) return;
    widget.onSave(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CyberBox(
            color: Colors.white,
            borderColor: CyberColors.black,
            child: TextField(
              controller: _controller,
              style: const TextStyle(
                color: CyberColors.black,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                hintText: 'ВВЕДИТЕ ЗАМЕТКУ...',
                hintStyle: TextStyle(
                  color: CyberColors.grey,
                  letterSpacing: 1.5,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                border: InputBorder.none,
              ),
              onSubmitted: (_) => _handleSave(),
            ),
          ),
        ),
        const SizedBox(width: 12),
        CyberBox(
          color: CyberColors.black,
          borderColor: CyberColors.black,
          child: InkWell(
            onTap: _handleSave,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 18),
              child: Text(
                'СОХРАНИТЬ',
                style: TextStyle(
                  color: CyberColors.yellow,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}