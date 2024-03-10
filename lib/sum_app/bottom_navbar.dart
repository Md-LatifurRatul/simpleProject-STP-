import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.add), label: "add", tooltip: "add"),
        BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: "Question answer",
            tooltip: "Question answer"),
      ],
      currentIndex: _selectedIndex,
      onTap: _selectIndex,
    );
  }

  void _selectIndex(index) {
    _selectedIndex = index;
    setState(() {});
  }
}
