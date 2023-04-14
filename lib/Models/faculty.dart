class FacultyModel {
  String id;
  String name;
  String email;
  String department;
  String phone;

  FacultyModel({
    required this.id,
    required this.name,
    required this.email,
    required this.department,
    required this.phone,
  });

  factory FacultyModel.fromJson(Map<String, dynamic> json) => FacultyModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        department: json["department"],
        phone: json["phone"],
      );
}
