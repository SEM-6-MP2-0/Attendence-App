import 'dart:convert';

import 'package:attendenceapp/Styles/url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

import '../../Models/attendance.dart';

Future<List<AttendanceModel>> takeAttendance(
    String dateofleaving, String department) async {
  final url = Uri.parse("$serverURL/faculty/takeattendance");
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: "token");
  if (token == null) {
    print("Token not found");
    return [];
  }
  print(token);
  final response = await http.post(
    url,
    headers: {
      "authorization": token,
    },
    body: {
      "dateofleaving": dateofleaving,
      "department": department,
      "datedateofattendancetake": DateTime.now().toString(),
    },
  );
  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    print(res);
    final List<AttendanceModel> attendanceList = res["attendance"]
        .map((e) {
          return AttendanceModel.fromJson(e);
        })
        .toList()
        .cast<AttendanceModel>();
    return attendanceList;
  } else {
    print(response.statusCode);
    return [];
  }
}
