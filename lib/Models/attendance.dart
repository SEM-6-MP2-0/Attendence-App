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
}