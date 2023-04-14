import 'package:attendenceapp/Pages/Utils/saveattendancedialog.dart';
import 'package:attendenceapp/Repository/Faculty/takeattendance.dart';
import 'package:flutter/material.dart';

import '../Models/attendance.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage(
      {super.key, required this.dateOfLeaving, required this.department});
  final String dateOfLeaving;
  final String department;

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  late List<AttendanceModel> mapList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      takeAttendance(widget.dateOfLeaving, widget.department).then((value) {
        mapList = value;
        isLoading = false;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(!isLoading){
            showDialog(
                context: context,
                builder: (context) {
                  return SaveAttendanceDialog(mapList: mapList,);
                });
          }
          // Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
      appBar: AppBar(title: const Text("Attendance")),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scrollbar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => AttendanceTile(
                      idx: index, onTap: onTap, tile: mapList[index]),
                  itemCount: mapList.length,
                ),
              ),
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
  const AttendanceTile(
      {super.key, required this.idx, required this.onTap, required this.tile});

  final int idx;
  final AttendanceModel tile;
  final Function(int idx) onTap;

  @override
  Widget build(BuildContext context) {
    AttendanceModel student = tile;
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
            ),
            Expanded(
              child: Center(
                child: Text(
                  student.name,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
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
