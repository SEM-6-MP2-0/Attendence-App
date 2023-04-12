class AttendanceModel{
  final String name;
  final String prn;
  final String url;
  bool isPresent;

  AttendanceModel( {
    required this.isPresent,
    required this.name,
    required this.prn,
    required this.url,
  });

  changeStatus(){
    isPresent = !isPresent;
  }

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      name: json['name'],
      prn: json['prn'],
      url: json['url'],
      isPresent: false,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'prn': prn,
      'url': url,
      'isPresent': isPresent,
    };
  }
}