class StatsModel{
  String date;
  List<String> present;
  List<String> absent;


  StatsModel({
    required this.date,
    required this.present,
    required this.absent,
  });

  factory StatsModel.fromJson(String date, Map<String, dynamic> json) => StatsModel(
    date: date,
    present: List<String>.from(json["attended"].map((x) => x)),
    absent: List<String>.from(json["absent"].map((x) => x)),
  );
}