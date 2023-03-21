import 'package:flutter/material.dart';

import 'Pages/home.dart';
import 'Styles/colors.dart';
import 'Styles/textstyles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    HomePage(),
    Text(
      'Index 1: Business',
      style: CusTextStyle.big,
    ),
    Text(
      'Index 2: Stats',
      style: CusTextStyle.big,
    ),
    Text(
      'Index 3: More',
      style: CusTextStyle.big,
    ),
  ];

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in_sharp),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_outlined),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: CusColors.grey,
        selectedItemColor: CusColors.yellowD,
        unselectedItemColor: CusColors.black,
        onTap: _changePage,
      ),
    );
  }
}
