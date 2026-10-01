import 'package:flutter/material.dart';
import '../models/note.dart';
import '../theme/cyber_theme.dart';
import 'cyber_clip.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;
  final void Function(String newText) onEdit;

  const NoteItem({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onEdit,
  });

  void _openEditDialog(BuildContext context) {
    final controller = TextEditingController(text: note.text);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: CyberBox(
          color: CyberColors.yellow,
          borderColor: CyberColors.black,
          cut: 16,
          borderWidth: 3,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '// РЕДАКТИРОВАНИЕ',
                  style: TextStyle(
                    color: CyberColors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                CyberBox(
                  color: Colors.white,
                  borderColor: CyberColors.black,
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    maxLines: null,
                    style: const TextStyle(color: CyberColors.black),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'ОТМЕНА',
                        style: TextStyle(
                          color: CyberColors.black,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CyberBox(
                      color: CyberColors.black,
                      borderColor: CyberColors.black,
                      cut: 8,
                      child: InkWell(
                        onTap: () {
                          final newText = controller.text.trim();
                          if (newText.isNotEmpty) {
                            onEdit(newText);
                          }
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text(
                            'СОХРАНИТЬ',
                            style: TextStyle(
                              color: CyberColors.yellow,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: CyberBox(
        color: CyberColors.dark,
        borderColor: CyberColors.cyan,
        cut: 14,
        borderWidth: 2,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              // неоновая вертикальная полоса
              Container(
                width: 4,
                height: 40,
                color: CyberColors.cyan,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  note.text,
                  style: const TextStyle(
                    color: CyberColors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: CyberColors.yellow),
                tooltip: 'Редактировать',
                onPressed: () => _openEditDialog(context),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: CyberColors.red),
                tooltip: 'Удалить',
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}