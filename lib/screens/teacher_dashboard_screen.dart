import 'package:flutter/material.dart';

class TeacherDashboardScreen extends StatelessWidget {
  const TeacherDashboardScreen({super.key});

  static const pupils = [
    {'name': 'Kwame Mensah', 'progress': 0.8},
    {'name': 'Ama Owusu', 'progress': 0.6},
    {'name': 'Kofi Boateng', 'progress': 0.4},
    {'name': 'Abena Asante', 'progress': 0.9},
    {'name': 'Yaw Darko', 'progress': 0.2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Pupils')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: pupils.length,
        itemBuilder: (context, i) {
          final p = pupils[i];
          final progress = p['progress'] as double;
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                  child: Text((p['name'] as String)[0])),
              title: Text(p['name'] as String),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: LinearProgressIndicator(value: progress),
              ),
              trailing: Text('${(progress * 100).toInt()}%'),
            ),
          );
        },
      ),
    );
  }
}