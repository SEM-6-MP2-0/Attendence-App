import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Styles/borderradius.dart';
import '../Styles/colors.dart';
import '../Styles/textstyles.dart';
import 'takeAttendence.dart';

class StartAttendancePage extends StatefulWidget {
  const StartAttendancePage({Key? key}) : super(key: key);

  @override
  State<StartAttendancePage> createState() => _StartAttendancePageState();
}

class _StartAttendancePageState extends State<StartAttendancePage> {
  late final Timer timer;
  late String formatteddate;
  final String _dateFormat = 'hh:mm a \n EEE d MMM';

  @override
  void initState() {
    super.initState();
    formatteddate = DateFormat(_dateFormat).format(DateTime.now());
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        setState(() {
          formatteddate = DateFormat(_dateFormat).format(DateTime.now());
        });
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  formatteddate.split('\n')[0],
                  style: CusTextStyle.large,
                  textAlign: TextAlign.center,
                ),
                Text(
                  formatteddate.split('\n')[1],
                  style: CusTextStyle.midL,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ClipRRect(
              borderRadius: CusBorderRadius.mid,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TakeAttendence(),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: CusColors.grey.withOpacity(0.6),
                    border: Border.all(color: CusColors.grey),
                    borderRadius: CusBorderRadius.mid,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "On",
                    style: GoogleFonts.inter(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
