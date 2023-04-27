import 'Models/stats.dart';

final List<StatsModel> statslist = [
  StatsModel(
    date: "11/03",
    present: ["AIDS", "BMW", "CHEM"],
    absent: ["DLO", "EHF", "FORENSICS"],
    month: 4,
    year: 2023,
  ),
  StatsModel(
      date: "11/03",
      present: ["AIDS", "BMW", "CHEM", "EHF", "FORENSICS"],
      absent: [
        "DLO",
      ],
      month: 4,
      year: 2023),
  StatsModel(
      date: "11/03",
      present: [
        "AIDS",
      ],
      absent: ["DLO", "EHF", "FORENSICS", "BMW", "CHEM"],
      month: 4,
      year: 2023),
  StatsModel(
      date: "11/03",
      present: ["AIDS", "BMW", "CHEM", "DLO", "EHF", "FORENSICS"],
      absent: [],
      month: 4,
      year: 2023),
  StatsModel(
      date: "11/03",
      present: [],
      absent: ["AIDS", "BMW", "CHEM", "DLO", "EHF", "FORENSICS"],
      month: 4,
      year: 2023),
];
