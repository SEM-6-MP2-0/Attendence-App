import 'package:attendenceapp/Repository/Faculty/uploadstudents.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Styles/colors.dart';

class UploadStudents extends StatefulWidget {
  const UploadStudents({Key? key}) : super(key: key);

  @override
  State<UploadStudents> createState() => _UploadStudentsState();
}

class _UploadStudentsState extends State<UploadStudents> {
  final department = [
    "Information Technology",
    "Computer Science",
    "Electronics and Telecommunication",
    "Mechanical",
    "Civil",
    "Electrical"
  ];
  PlatformFile? selectedFile;
  final yearController = TextEditingController();
  late String depController;

  @override
  void initState() {
    depController = department[0];
    super.initState();
  }

  @override
  void dispose() {
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Students"),
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
                  color: CusColors.yellowD,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    selectedItemBuilder: (context) {
                      return department.map((String value) {
                        return Center(
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    borderRadius: BorderRadius.circular(10),
                    value: depController,
                    items: department.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? cur) {
                      setState(() {
                        depController = cur!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          InputField(
              controller: yearController,
              icon: Icon(Icons.calendar_month, color: CusColors.yellowD!),
              text: "Enter Joining year"),
          InkWell(
            onTap: () {
              selectFile();
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: CusColors.yellowD!.withOpacity(0.3),
                border: Border.all(
                  color: CusColors.yellowD!,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "Browse a file to add students",
                  style: TextStyle(
                    color: CusColors.yellowD!,
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
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CusColors.yellowD),
              ),
              onPressed: () {
                if (selectedFile != null) {
                  uploadStudents(selectedFile!.path.toString(), 'xls',
                      yearController.text, depController);
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

class InputField extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextEditingController controller;
  final Widget? actions;
  const InputField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.text,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CusColors.yellowD!,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CusColors.yellowD!,
                  ),
                ),
                prefixIcon: icon,
                filled: true,
                fillColor: Colors.white,
                labelText: text,
                labelStyle: TextStyle(color: CusColors.yellowD!),
              ),
            ),
          ),
          if (actions != null) actions!,
        ],
      ),
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordInputField({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: widget.controller,
        obscureText: isHidden,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: isHidden
                ? Icon(
                    Icons.visibility,
                    color: CusColors.yellowD,
                  )
                : Icon(
                    Icons.visibility_off,
                    color: CusColors.yellowD,
                  ),
            onPressed: () {
              setState(() {
                isHidden = !isHidden;
              });
            },
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: CusColors.yellowD!,
              ),
              borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: CusColors.yellowD!,
          )),
          prefixIcon: Icon(Icons.lock, color: CusColors.yellowD!),
          filled: true,
          fillColor: Colors.white,
          labelText: 'Password',
          labelStyle: TextStyle(color: CusColors.yellowD!),
        ),
      ),
    );
  }
}
