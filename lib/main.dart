import 'package:flutter/material.dart';
import 'screens/role_select_screen.dart';

void main() => runApp(const PreschoolApp());

class PreschoolApp extends StatelessWidget {
  const PreschoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preschool Learning App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const RoleSelectScreen(),
    );
  }
}