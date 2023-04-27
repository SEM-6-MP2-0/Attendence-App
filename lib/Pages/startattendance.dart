import 'dart:async';

import 'package:attendenceapp/Pages/attendance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Styles/borderradius.dart';
import '../Styles/colors.dart';
import '../Styles/textstyles.dart';

class StartAttendancePage extends StatefulWidget {
  const StartAttendancePage({Key? key}) : super(key: key);

  @override
  State<StartAttendancePage> createState() => _StartAttendancePageState();
}

class _StartAttendancePageState extends State<StartAttendancePage> {
  late final Timer timer;
  late String formatteddate;
  final String _dateFormat = 'hh:mm a \n EEE d MMM';

  int getEndYear(String year) {
    int curYear = DateTime.now().year;

    switch (year) {
      case "FE":
        return curYear + 3;
      case "SE":
        return curYear + 2;
      case "TE":
        return curYear + 1;
      case "BE":
        return curYear;
      default:
        return curYear;
    }
  }

  @override
  void initState() {
    super.initState();
    _yearController = getEndYear(year[0]);
    _branchController = branches[0];
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

  final branches = const [
    "CE",
    "IT",
    "EXTC",
    "Mech",
    "PPT",
    "ECS",
    "AIML",
    "AIDS",
    "IOT"
  ];

  final curYear = DateTime.now().year;

  final List<String> year = [
    "FE",
    "SE",
    "TE",
    "BE",
  ];

  late String _branchController;
  late int _yearController;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    decoration: BoxDecoration(
                      color: CusColors.yellowD,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(10),
                        value: _branchController,
                        items: branches.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? cur) {
                          setState(() {
                            _branchController = cur!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    decoration: BoxDecoration(
                      color: CusColors.yellowD,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        borderRadius: BorderRadius.circular(10),
                        value: _yearController,
                        items: year.map((String value) {
                          return DropdownMenuItem<int>(
                            value: getEndYear(value),
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (int? cur) {
                          setState(() {
                            _yearController = cur!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
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
                      builder: (context) => AttendancePage(
                        dateOfLeaving: _yearController.toString(),
                        department: _branchController,
                      ),
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
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
