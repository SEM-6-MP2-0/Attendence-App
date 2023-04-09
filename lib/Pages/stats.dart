import 'package:attendenceapp/Models/stats.dart';
import 'package:flutter/material.dart';

import '../statlist.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: ListView.builder(
        itemBuilder: (context, index) => StatsTile(stat: statslist[index]),
        itemCount: statslist.length,
      ),
    );
  }
}

class StatsTile extends StatelessWidget {
  const StatsTile({super.key, required this.stat});
  final StatsModel stat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.2),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.lightBlueAccent.withOpacity(0.6),
              ),
              child: Center(child: Text(stat.date)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: buildCourseList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildCourseList() {
    final List<Widget> courseWidgets = [];

    List<String> keysWithTrueValues = [];
    List<String> keysWithFalseValues = [];

    stat.attendance.forEach((key, value) {
      if (value) {
        keysWithTrueValues.add(key);
      } else {
        keysWithFalseValues.add(key);
      }
    });

    final List<String> finalKeysList = [
      ...keysWithTrueValues,
      ...keysWithFalseValues
    ];

    finalKeysList.forEach((subject) {
      final bool isPresent = stat.attendance[subject]!;
      final courseName = subject;
      final textWidget = Text(
        "$courseName : ",
        style: TextStyle(fontWeight: FontWeight.w700),
      );
      final boolWidget = Text(
        isPresent ? "Present" : "Absent",
        style: TextStyle(
          color: isPresent ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );

      courseWidgets.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            textWidget,
            boolWidget,
          ],
        ),
      );
    });

    stat.attendance.forEach((courseName, isPresent) {});

    return courseWidgets;
  }
}
