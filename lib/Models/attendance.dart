class AttendanceModel {
  final String studentId;
  final String date;
  final String name;
  bool isPresent;
  final String prn;

  AttendanceModel({
    required this.isPresent,
    required this.name,
    required this.prn,
    required this.date,
    required this.studentId,
  });

  changeStatus() {
    isPresent = !isPresent;
  }

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      name: json['name'],
      prn: json['prn'],
      date: json['date'],
      studentId: json['student'],
      isPresent: json['isPresent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'prn': prn,
      'date': date,
      'student': studentId,
      'isPresent': isPresent,
    };
  }
}
