import 'package:attendenceapp/Models/attendance.dart';

class StudentModel {
  String id;
  String name;
  String email;
  String prn;
  String dateofjoining;
  String dateofleaving;
  String department;

  StudentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.prn,
    required this.dateofjoining,
    required this.dateofleaving,
    required this.department,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        prn: json["prn"],
        dateofjoining: json["dateofjoining"],
        dateofleaving: json["dateofleaving"],
        department: json["department"],
      );
}
