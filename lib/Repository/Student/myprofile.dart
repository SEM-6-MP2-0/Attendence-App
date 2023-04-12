import 'dart:convert';

import '../../Models/student.dart';
import 'package:http/http.dart' as http;

import '../../Styles/url.dart';

Future<StudentModel?> getMyProfileStudent() async {
  final url = Uri.parse("$serverURL/students/myprofile");
  final response = await http.get(url, headers: {
    "Authentication": "Sometoke",
  });
  if (response.statusCode == 200) {
    return StudentModel.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    return null;
  }
}
