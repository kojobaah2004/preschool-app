import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  static const classes = [
    {'name': 'Nursery 1', 'avg': 0.72},
    {'name': 'Nursery 2', 'avg': 0.65},
    {'name': 'KG 1', 'avg': 0.81},
    {'name': 'KG 2', 'avg': 0.88},
  ];

  static const topPupils = [
    {'name': 'Abena Asante', 'score': 0.95},
    {'name': 'Kwame Mensah', 'score': 0.9},
    {'name': 'Ama Owusu', 'score': 0.84},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: const [
              Expanded(child: _StatCard(label: 'Avg. score', value: '77%')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(label: 'Active pupils', value: '98')),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Average score by class',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...classes.map((c) {
            final avg = c['avg'] as double;
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(c['name'] as String,
                            style: const TextStyle(fontSize: 16)),
                        Text('${(avg * 100).toInt()}%'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(value: avg, minHeight: 10),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 20),
          const Text('Top pupils',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...topPupils.asMap().entries.map((e) {
            final p = e.value;
            return Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${e.key + 1}')),
                title: Text(p['name'] as String),
                trailing: Text('${((p['score'] as double) * 100).toInt()}%'),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(value,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text(label),
          ],
        ),
      ),
    );
  }
}