import 'package:flutter/material.dart';

class ManagePupilsScreen extends StatefulWidget {
  const ManagePupilsScreen({super.key});

  @override
  State<ManagePupilsScreen> createState() => _ManagePupilsScreenState();
}

class _ManagePupilsScreenState extends State<ManagePupilsScreen> {
  final List<Map<String, String>> pupils = [
    {'name': 'Kwame Mensah', 'class': 'Nursery 1'},
    {'name': 'Ama Owusu', 'class': 'Nursery 2'},
    {'name': 'Kofi Boateng', 'class': 'KG 1'},
    {'name': 'Abena Asante', 'class': 'KG 2'},
    {'name': 'Yaw Darko', 'class': 'Nursery 1'},
  ];

  void _addPupil() {
    final nameCtrl = TextEditingController();
    String selectedClass = 'Nursery 1';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Add pupil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                    labelText: 'Pupil name', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedClass,
                decoration: const InputDecoration(
                    labelText: 'Class', border: OutlineInputBorder()),
                items: ['Nursery 1', 'Nursery 2', 'KG 1', 'KG 2']
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setDialogState(() => selectedClass = v!),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel')),
            FilledButton(
              onPressed: () {
                if (nameCtrl.text.trim().isEmpty) return;
                setState(() => pupils.add({
                      'name': nameCtrl.text.trim(),
                      'class': selectedClass,
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

  void _deletePupil(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete pupil?'),
        content: Text('Remove ${pupils[index]['name']}?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              setState(() => pupils.removeAt(index));
              Navigator.pop(ctx);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Pupils (${pupils.length})')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addPupil,
        icon: const Icon(Icons.add),
        label: const Text('Add pupil'),
      ),
      body: pupils.isEmpty
          ? const Center(child: Text('No pupils yet'))
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 90),
              itemCount: pupils.length,
              itemBuilder: (context, i) {
                final p = pupils[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(p['name']![0])),
                    title: Text(p['name']!),
                    subtitle: Text(p['class']!),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deletePupil(i),
                    ),
                  ),
                );
              },
            ),
    );
  }
}