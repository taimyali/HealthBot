import 'package:flutter/material.dart';
import 'package:healthbot/components/navigation_bar.dart';
import 'package:healthbot/pages/articles_page.dart';
import 'package:healthbot/pages/dashboard_screen.dart';
import 'package:healthbot/pages/doctor_screen.dart';
import 'package:healthbot/pages/exercise_screen.dart';
import 'package:healthbot/pages/history_screen.dart';
import 'package:healthbot/pages/profile_page.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: selectedIndex,
        onItemSelected: (index) => setState(() => selectedIndex = index),
      ),
      body: getSelectedPage(),
    );
  }

  Widget getSelectedPage() {
    switch (selectedIndex) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const HistoryScreen();
      case 2:
        return const DoctorScreen();
      case 3:
        return const ArticlesPage();
      case 4:
        return const ExerciseScreen();
      default:
        return const DashboardScreen();
    }
  }
}
