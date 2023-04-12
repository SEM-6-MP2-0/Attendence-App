class StudentModel{
  String id;

  StudentModel({
    required this.id,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    id: json["_id"],
  );
}