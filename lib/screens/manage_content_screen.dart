import 'package:flutter/material.dart';

class ManageContentScreen extends StatefulWidget {
  const ManageContentScreen({super.key});

  @override
  State<ManageContentScreen> createState() => _ManageContentScreenState();
}

class _ManageContentScreenState extends State<ManageContentScreen> {
  final List<Map<String, String>> content = [
    {'title': 'Alphabet Song', 'type': 'Video'},
    {'title': 'Counting 1 to 10', 'type': 'Video'},
    {'title': 'Colours Song', 'type': 'Video'},
    {'title': 'Ghana Animals', 'type': 'Video'},
    {'title': 'Kofi and the Spider', 'type': 'Story'},
    {'title': 'Match the Colours', 'type': 'Game'},
  ];

  static const types = ['Video', 'Story', 'Game', 'Quiz', 'Flashcards'];

  IconData _iconFor(String type) {
    switch (type) {
      case 'Video':
        return Icons.smart_display;
      case 'Story':
        return Icons.menu_book;
      case 'Game':
        return Icons.sports_esports;
      case 'Quiz':
        return Icons.quiz;
      default:
        return Icons.style;
    }
  }

  void _addContent() {
    final titleCtrl = TextEditingController();
    String selectedType = 'Video';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Add learning content'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedType,
                decoration: const InputDecoration(
                    labelText: 'Type', border: OutlineInputBorder()),
                items: types
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => setDialogState(() => selectedType = v!),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel')),
            FilledButton(
              onPressed: () {
                if (titleCtrl.text.trim().isEmpty) return;
                setState(() => content.add({
                      'title': titleCtrl.text.trim(),
                      'type': selectedType,
                    }));
                Navigator.pop(ctx);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learning Content (${content.length})')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addContent,
        icon: const Icon(Icons.add),
        label: const Text('Add content'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 90),
        itemCount: content.length,
        itemBuilder: (context, i) {
          final c = content[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Icon(_iconFor(c['type']!))),
              title: Text(c['title']!),
              subtitle: Text(c['type']!),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => setState(() => content.removeAt(i)),
              ),
            ),
          );
        },
      ),
    );
  }
}