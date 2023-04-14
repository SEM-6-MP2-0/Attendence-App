import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadStudents extends StatefulWidget {
  const UploadStudents({Key? key}) : super(key: key);

  @override
  State<UploadStudents> createState() => _UploadStudentsState();
}

class _UploadStudentsState extends State<UploadStudents> {
  final semesters = [1, 2, 3, 4, 5, 6, 7, 8];
  final defaulterList = [1, 2, 3];
  int curSem = 1;
  int curList = 1;
  PlatformFile? selectedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Attendance"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<int>(
                  borderRadius: BorderRadius.circular(10),
                  value: curSem,
                  items: semesters.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text("Sem ${value.toString()}"),
                    );
                  }).toList(),
                  onChanged: (int? cur) {
                    setState(() {
                      curSem = cur!;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<int>(
                  borderRadius: BorderRadius.circular(10),
                  value: curList,
                  items: defaulterList.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text("Attendance ${value.toString()}"),
                    );
                  }).toList(),
                  onChanged: (int? cur) {
                    setState(() {
                      curList = cur!;
                    });
                  },
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              selectFile();
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.3),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  "Browse a file to add attendance",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          selectedFile != null
              ? Text(selectedFile!.name)
              : const Text(
                  "No file selected",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
          TextButton(
              onPressed: () {
                if (selectedFile != null) {
                  // Repository.uploadAttendence(
                  //     selectedFile!.path.toString(), 'xls', curSem, curList);
                } else {
                  Fluttertoast.showToast(msg: "No file selected");
                }
              },
              child: Text("Upload Attendance"))
        ],
      ),
    );
  }

  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.single;
      });
    } else {
      Fluttertoast.showToast(msg: "No file selected");
    }
  }
}