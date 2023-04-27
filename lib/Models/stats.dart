class StatsModel {
  String date;
  List<String> present;
  List<String> absent;
  int month;
  int year;

  StatsModel({
    required this.date,
    required this.present,
    required this.absent,
    required this.month,
    required this.year,
  });

  factory StatsModel.fromJson(
          String date, Map<String, dynamic> json, int month, int year) =>
      StatsModel(
        date: date,
        present: List<String>.from(json["attended"].map((x) => x)),
        absent: List<String>.from(json["absent"].map((x) => x)),
        month: month,
        year: year,
      );
}
