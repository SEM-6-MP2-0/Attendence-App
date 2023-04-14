import 'package:attendenceapp/Styles/url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

Future<bool> takeAttendance(String dateofleaving, String department) async {
  final url = Uri.parse("$serverURL/faculty/takeattendance");
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: "token");
  if (token == null) {
    print("Token not found");
    return false;
  }
  final response = await http.post(
    url,
    headers: {
      "Authentication": token,
    },
    body: {
      "dateofleaving": dateofleaving,
      "department": department,
    },
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    print(response.statusCode);
    return false;
  }
}
