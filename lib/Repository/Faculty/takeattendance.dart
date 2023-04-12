import 'package:attendenceapp/Styles/url.dart';

import 'package:http/http.dart' as http;

Future<bool> takeAttendance(String dateofleaving, String department) async {
  final url = Uri.parse("$serverURL/faculty/takeattendance");
  final response = await http.post(
    url,
    headers: {
      "Authentication": "Sometoke",
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
