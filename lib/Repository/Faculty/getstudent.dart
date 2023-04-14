import 'dart:convert';

import 'package:attendenceapp/Styles/url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Models/student.dart';
import 'package:http/http.dart' as http;

Future<StudentModel?> getStudentById(String id) async {
  final url = Uri.parse("$serverURL/faculty/profile/student/$id");
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: "token");
  if (token == null) {
    print("Token not found");
    return null;
  }
  final response = await http.get(url, headers: {
    "Authentication": token,
  });
  if (response.statusCode == 200) {
    return StudentModel.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    return null;
  }
}
