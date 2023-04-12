class FacultyModel {
  String id;

  FacultyModel({
    required this.id,
  });

  factory FacultyModel.fromJson(Map<String, dynamic> json) => FacultyModel(
    id: json["_id"],
  );
}
