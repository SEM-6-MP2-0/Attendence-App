import 'dart:convert';

import 'package:attendenceapp/Styles/url.dart';

import '../../Models/faculty.dart';
import 'package:http/http.dart' as http;

Future<FacultyModel?> getMyProfileFaculty()async {
  final url = Uri.parse("$serverURL/faculty/myprofile");
  final response = await http.get(url, headers: {
    "Authentication": "Sometoke",
  });
  if (response.statusCode == 200) {
    return FacultyModel.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    return null;
  }
}