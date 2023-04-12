import 'package:attendenceapp/Styles/url.dart';

import 'package:http/http.dart' as http;

Future<bool> login(String email, String password) async {
  final url = Uri.parse("$serverURL/auth/login");
  final response = await http.post(
    url,
    body: {
      "email": email,
      "password": password,
    },
  );
  if (response.statusCode == 200) {
    //save token here
    return true;
  } else {
    print(response.statusCode);
    return false;
  }
}
