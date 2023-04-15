import 'dart:convert';

import 'package:attendenceapp/Styles/url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Models/faculty.dart';
import 'package:http/http.dart' as http;

Future<FacultyModel?> getMyProfileFaculty() async {
  final url = Uri.parse("$serverURL/faculty/myprofile");
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
    return FacultyModel.fromJson(jsonDecode(response.body)["faculty"]);
  } else {
    print(response.statusCode);
    return null;
  }
}
