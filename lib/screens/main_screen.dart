// lib/screens/main_screen.dart
import 'package:flutter/material.dart';
import 'package:helloworld/screens/calendar_page.dart';
import 'package:helloworld/screens/profilepage.dart';
import 'package:helloworld/screens/fitess_home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FitnessHomePage(),
    const AnalyticsPage(),
    const CalendarPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavBarItem(
                icon: Icons.home_outlined,
                isSelected: _selectedIndex == 0,
                index: 0),
            _buildNavBarItem(
                icon: Icons.analytics_outlined,
                isSelected: _selectedIndex == 1,
                index: 1),
            _buildNavBarItem(
                icon: Icons.calendar_today_outlined,
                isSelected: _selectedIndex == 2,
                index: 2),
            _buildNavBarItem(
                icon: Icons.person_outline,
                isSelected: _selectedIndex == 3,
                index: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem({
    required IconData icon,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
