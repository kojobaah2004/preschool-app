import 'package:flutter/material.dart';

class ManageTeachersScreen extends StatefulWidget {
  const ManageTeachersScreen({super.key});

  @override
  State<ManageTeachersScreen> createState() => _ManageTeachersScreenState();
}

class _ManageTeachersScreenState extends State<ManageTeachersScreen> {
  final List<Map<String, String>> teachers = [
    {'name': 'Mrs. Adwoa Serwaa', 'class': 'Nursery 1'},
    {'name': 'Mr. Yaw Frimpong', 'class': 'Nursery 2'},
    {'name': 'Madam Efua Quaye', 'class': 'KG 1'},
    {'name': 'Mr. Kojo Annan', 'class': 'KG 2'},
  ];

  void _addTeacher() {
    final nameCtrl = TextEditingController();
    String selectedClass = 'Nursery 1';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Add teacher'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                    labelText: 'Teacher name', border: OutlineInputBorder()),
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
                setState(() => teachers.add({
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

  void _deleteTeacher(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete teacher?'),
        content: Text('Remove ${teachers[index]['name']}?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              setState(() => teachers.removeAt(index));
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
      appBar: AppBar(title: Text('Manage Teachers (${teachers.length})')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addTeacher,
        icon: const Icon(Icons.add),
        label: const Text('Add teacher'),
      ),
      body: teachers.isEmpty
          ? const Center(child: Text('No teachers yet'))
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 90),
              itemCount: teachers.length,
              itemBuilder: (context, i) {
                final t = teachers[i];
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.school)),
                    title: Text(t['name']!),
                    subtitle: Text('Class: ${t['class']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteTeacher(i),
                    ),
                  ),
                );
              },
            ),
    );
  }
}