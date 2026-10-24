import 'package:flutter/material.dart';
import 'login_screen.dart';

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  static const roles = [
    {'name': 'Child', 'icon': Icons.child_care, 'color': Colors.orange},
    {'name': 'Teacher', 'icon': Icons.school, 'color': Colors.blue},
    {'name': 'Parent', 'icon': Icons.family_restroom, 'color': Colors.green},
    {'name': 'Admin', 'icon': Icons.admin_panel_settings, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Who are you?')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: roles.map((r) {
            final color = r['color'] as Color;
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
builder: (_) => LoginScreen(role: r['name'] as String),                ),
              ),
              child: Card(
                color: color.withOpacity(0.15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(r['icon'] as IconData, size: 64, color: color),
                    const SizedBox(height: 8),
                    Text(r['name'] as String,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}