import 'package:flutter/material.dart';
import 'manage_pupils_screen.dart';
import 'manage_teachers_screen.dart';
import 'manage_content_screen.dart';
import 'reports_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  static const stats = [
    {'label': 'Pupils', 'value': '120', 'icon': Icons.child_care},
    {'label': 'Teachers', 'value': '8', 'icon': Icons.school},
    {'label': 'Parents', 'value': '95', 'icon': Icons.family_restroom},
    {'label': 'Videos', 'value': '24', 'icon': Icons.smart_display},
  ];

  static const actions = [
    {'label': 'Manage pupils', 'icon': Icons.people},
    {'label': 'Manage teachers', 'icon': Icons.badge},
    {'label': 'Add learning content', 'icon': Icons.add_circle},
    {'label': 'View reports', 'icon': Icons.bar_chart},
  ];

  void _open(BuildContext context, String label) {
    Widget screen;
    switch (label) {
      case 'Manage pupils':
        screen = const ManagePupilsScreen();
        break;
      case 'Manage teachers':
        screen = const ManageTeachersScreen();
        break;
      case 'Add learning content':
        screen = const ManageContentScreen();
        break;
      default:
        screen = const ReportsScreen();
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: stats.map((s) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(s['icon'] as IconData, size: 28),
                    Text(s['value'] as String,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                    Text(s['label'] as String),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          ...actions.map((a) => Card(
                child: ListTile(
                  leading: Icon(a['icon'] as IconData),
                  title: Text(a['label'] as String),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _open(context, a['label'] as String),
                ),
              )),
        ],
      ),
    );
  }
}