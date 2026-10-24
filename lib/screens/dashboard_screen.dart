import 'package:flutter/material.dart';
import 'child_home_screen.dart';
import 'teacher_dashboard_screen.dart';
import 'parent_dashboard_screen.dart';
import 'admin_dashboard_screen.dart';

class DashboardScreen extends StatelessWidget {
  final String role;
  const DashboardScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    switch (role) {
      case 'Child':
        return const ChildHomeScreen();
      case 'Teacher':
        return const TeacherDashboardScreen();
      case 'Parent':
        return const ParentDashboardScreen();
      default:
        return const AdminDashboardScreen();
    }
  }
}