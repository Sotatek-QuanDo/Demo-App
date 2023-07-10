import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedScreen = 0;

  void _onSelectScreen(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedScreen,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '検索',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'フォロー',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'スケジュール',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline_rounded),
          label: 'メッセージ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_sharp),
          label: 'マイページ',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(color: Colors.blue),
      type: BottomNavigationBarType.fixed,
      onTap: _onSelectScreen,
    );
  }
}
