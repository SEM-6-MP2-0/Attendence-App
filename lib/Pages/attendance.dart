import 'package:flutter/material.dart';

import '../Models/attendance.dart';
import '../attendancelist.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            AttendanceTile(idx: index, onTap: onTap),
        itemCount: mapList.length,
      ),
    );
  }

  onTap(int idx) {
    setState(() {
      mapList[idx].changeStatus();
    });
  }
}

class AttendanceTile extends StatelessWidget {
  const AttendanceTile({super.key, required this.idx, required this.onTap});

  final int idx;
  final Function(int idx) onTap;

  @override
  Widget build(BuildContext context) {
    AttendanceModel student = mapList[idx];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.lightBlueAccent.withOpacity(0.6),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              // child: Image.network(student.url),
            ),
            Text(student.name),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    student.isPresent ? Colors.green : Colors.red),
              ),
              onPressed: () {
                onTap(idx);
              },
              child: Text(student.isPresent ? "Present" : "Absent"),
            )
          ],
        ),
      ),
    );
  }
}
