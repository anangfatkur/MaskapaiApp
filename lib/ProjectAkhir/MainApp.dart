import 'package:flutter/material.dart';
import 'package:finalproject/ProjectAkhir/HomeScreen.dart';
import 'package:finalproject/ProjectAkhir/PassengerScreen.dart';
import 'package:finalproject/ProjectAkhir/AboutScreen.dart';

// import 'package:sanberappflutter2/Tugas/Tugas12/DrawerScreen.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  final _layoutPage = [
    HomeScreen(),
    PassengerScreen(),
    AboutScreen(),
  ];
  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.content_paste_outlined), label: 'Passenger'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'About Me')
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
