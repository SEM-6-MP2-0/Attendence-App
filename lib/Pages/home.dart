import 'package:attendenceapp/Models/attendance.dart';
import 'package:attendenceapp/Models/faculty.dart';
import 'package:attendenceapp/Pages/facultyprofile.dart';
import 'package:attendenceapp/Pages/startattendance.dart';
import 'package:attendenceapp/Pages/stats.dart';
import 'package:attendenceapp/Pages/studentProfile.dart';
import 'package:attendenceapp/Pages/uploadstudents.dart';
import 'package:attendenceapp/Provider/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Enum/users.dart';
import '../Models/student.dart';
import '../Styles/colors.dart';
import '../Styles/textstyles.dart';
import 'attendance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> getNavItems(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    switch (user) {
      case Users.faculty:
        return const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            label: 'Upload Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ];
      case Users.student:
        return const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_outlined),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ];
    }
  }

  List<Widget> getNavPages(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    switch (user) {
      case Users.faculty:
        return <Widget>[
          StartAttendancePage(),
          UploadStudents(),
          FacultyProfilePage(),
        ];
      case Users.student:
        return <Widget>[
          StatsPage(),
          StudentProfilePage(),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: getNavPages(context).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: getNavItems(context),
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: CusColors.yellowD,
        unselectedItemColor: CusColors.black,
        showUnselectedLabels: false,
        onTap: _changePage,
      ),
    );
  }
}
