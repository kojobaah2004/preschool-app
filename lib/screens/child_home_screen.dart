import 'package:flutter/material.dart';
import 'video_list_screen.dart';

class ChildHomeScreen extends StatelessWidget {
  const ChildHomeScreen({super.key});

  static const items = [
    {'name': 'Letters', 'icon': Icons.abc, 'color': Colors.red},
    {'name': 'Numbers', 'icon': Icons.pin, 'color': Colors.blue},
    {'name': 'Colours', 'icon': Icons.palette, 'color': Colors.green},
    {'name': 'Games', 'icon': Icons.sports_esports, 'color': Colors.purple},
    {'name': 'Videos', 'icon': Icons.smart_display, 'color': Colors.teal},
  ];

  void _open(BuildContext context, String name) {
    if (name == 'Videos') {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const VideoListScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$name coming soon!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Let\'s Learn!')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: items.map((i) {
            final color = i['color'] as Color;
            return InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () => _open(context, i['name'] as String),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(i['icon'] as IconData, size: 72, color: Colors.white),
                    const SizedBox(height: 8),
                    Text(i['name'] as String,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
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