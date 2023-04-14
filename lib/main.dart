import 'package:attendenceapp/Pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/attendance.dart';
import 'Pages/startattendance.dart';
import 'Pages/stats.dart';
import 'Provider/user.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
