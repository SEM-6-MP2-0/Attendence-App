import 'dart:convert';

import 'package:attendenceapp/Styles/url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
    const storage = FlutterSecureStorage();
    final res = jsonDecode(response.body);
    print(res);
    await storage.write(key: "token", value: res["token"]["token"]);
    return true;
  } else {
    print(response.statusCode);
    return false;
  }
}
