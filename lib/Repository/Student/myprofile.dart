import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Models/student.dart';
import 'package:http/http.dart' as http;

import '../../Styles/url.dart';

Future<StudentModel?> getMyProfileStudent() async {
  final url = Uri.parse("$serverURL/students/myprofile");
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: "token");
  if (token == null) {
    print("Token not found");
    return null;
  }
  final response = await http.get(url, headers: {
    "authorization": token,
  });
  if (response.statusCode == 200) {
    return StudentModel.fromJson(jsonDecode(response.body)["student"]);
  } else {
    print(response.statusCode);
    return null;
  }
}
