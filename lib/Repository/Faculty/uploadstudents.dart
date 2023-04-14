import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

import '../../Styles/url.dart';

Future<bool> uploadStudents(
    String filepath, String filetype, String year, String department) async {
  final req = http.MultipartRequest(
    'POST',
    Uri.parse("$serverURL/faculty/insertrolllist"),
  );
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: "token");
  if (token == null) {
    print("Token not found");
    return false;
  }
  final originalName = filepath.split('/').last;
  final file = http.MultipartFile.fromBytes(
      "Rollfile", await File.fromUri(Uri.parse(filepath)).readAsBytes(),
      contentType: MediaType("application",
          "vnd.openxmlformats-officedocument.spreadsheetml.sheet"),
      filename: originalName);
  req.files.add(file);
  req.fields.addAll({"joinyear": year, "department": department});
  req.headers.addAll({
    'authorization': token,
    "Content-Type": "multipart/form-data",
    "Accept": "application/json",
  });

  var res = await req.send();
  if (res.statusCode == 200) {
    return true;
  } else {
    print(res.statusCode);
    return false;
  }
}
