import 'dart:convert';

import 'package:attendenceapp/Styles/url.dart';

import '../../Models/student.dart';
import 'package:http/http.dart' as http;

Future<StudentModel?> getStudentById(String id)async {
  final url = Uri.parse("$serverURL/faculty/profile/student/$id");
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