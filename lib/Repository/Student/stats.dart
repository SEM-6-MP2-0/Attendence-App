import 'dart:convert';

import 'package:attendenceapp/Models/stats.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

import '../../Styles/url.dart';

Future<List<StatsModel>?> getStats(String monthYear) async {
  monthYear = monthYear.replaceAll("/", "%2F");
  final url = Uri.parse("$serverURL/students/myattendance/$monthYear");
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
    final res = jsonDecode(response.body);
    final Map<String, dynamic> resMap = res["Attendance"];
    return List<StatsModel>.from(
        resMap.entries.map((e) => StatsModel.fromJson(e.key, e.value)));
  } else {
    print(response.statusCode);
    return [];
  }
}
