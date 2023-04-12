import 'package:attendenceapp/Styles/url.dart';

import 'package:http/http.dart' as http;

import '../../Models/attendance.dart';

Future<bool> saveAttendance(
    List<AttendanceModel> attendance, String subject, String semester) async {
  final url = Uri.parse("$serverURL/faculty/saveattendance");
  final response = await http.post(
    url,
    headers: {
      "Authentication": "Sometoke",
    },
    body: {
      "subject": subject,
      "semester": semester,
      "attendance": attendance.map((e) => e.toJson()).toList().toString()
    },
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    print(response.statusCode);
    return false;
  }
}