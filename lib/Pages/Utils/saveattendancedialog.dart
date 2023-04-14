// ignore_for_file: use_build_context_synchronously

import 'package:attendenceapp/Models/attendance.dart';
import 'package:attendenceapp/Pages/Utils/loading.dart';
import 'package:flutter/material.dart';

import '../../Repository/Faculty/saveattendance.dart';

class SaveAttendanceDialog extends StatefulWidget {
  const SaveAttendanceDialog({Key? key, required this.mapList})
      : super(key: key);
  final List<AttendanceModel> mapList;
  @override
  _SaveAttendanceDialogState createState() => _SaveAttendanceDialogState();
}

class _SaveAttendanceDialogState extends State<SaveAttendanceDialog> {
  final TextEditingController subjectController = TextEditingController();
  late int semController;

  @override
  void initState() {
    super.initState();
    semController = semesters[0];
  }

  List<int> semesters = <int>[1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Save Attendance'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: subjectController,
            decoration: InputDecoration(
              labelText: 'Subject',
            ),
          ),
          DropdownButtonFormField<int>(
            value: semController,
            hint: Text('Select an option'),
            onChanged: (value) {
              setState(() {
                semController = value!;
              });
            },
            items: semesters.map((item) {
              return DropdownMenuItem<int>(
                value: item,
                child: Text("semester ${item.toString()}"),
              );
            }).toList(),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CANCEL', style: TextStyle(color: Colors.grey)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () async {
            String name = subjectController.text;
            Navigator.of(context).pop();
            late BuildContext newContext;
            showDialog(
                context: context,
                builder: (context) {
                  newContext = context;
                  return LoadingDialog();
                });
            bool res = await saveAttendance(widget.mapList,
                subjectController.text, semController.toString());
            Navigator.of(newContext).pop();
            print(res);
          },
        ),
      ],
    );
  }
}
