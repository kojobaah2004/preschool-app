import 'package:flutter/material.dart';

class ParentDashboardScreen extends StatelessWidget {
  const ParentDashboardScreen({super.key});

  static const subjects = [
    {'name': 'Letters', 'score': 0.85},
    {'name': 'Numbers', 'score': 0.6},
    {'name': 'Colours', 'score': 0.9},
    {'name': 'Games', 'score': 0.4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Child\'s Progress')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('K')),
              title: Text('Kwame Mensah'),
              subtitle: Text('Learning time today: 25 min'),
              trailing: Icon(Icons.star, color: Colors.amber),
            ),
          ),
          const SizedBox(height: 12),
          ...subjects.map((s) {
            final score = s['score'] as double;
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(s['name'] as String,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('${(score * 100).toInt()}%'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: score,
                      minHeight: 10,
                      color: score >= 0.7 ? Colors.green : Colors.orange,
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          const Text('Strength: Colours',
              style: TextStyle(fontSize: 16, color: Colors.green)),
          const Text('Needs practice: Games',
              style: TextStyle(fontSize: 16, color: Colors.orange)),
        ],
      ),
    );
  }
}