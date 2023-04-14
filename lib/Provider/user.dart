import 'package:attendenceapp/Enum/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  late Users _user;
  Users get user => _user;

  void setUser(Users user) {
    _user = user;
    notifyListeners();
  }
}
