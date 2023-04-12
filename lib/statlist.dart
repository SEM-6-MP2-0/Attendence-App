import 'Models/stats.dart';

final List<StatsModel> statslist = [
  StatsModel(
      date: "11/03",
      present: ["AIDS", "BMW", "CHEM"],
      absent: ["DLO", "EHF", "FORENSICS"]),
  StatsModel(date: "11/03", present: [
    "AIDS",
    "BMW",
    "CHEM",
    "EHF",
    "FORENSICS"
  ], absent: [
    "DLO",
  ]),
  StatsModel(date: "11/03", present: [
    "AIDS",
  ], absent: [
    "DLO",
    "EHF",
    "FORENSICS",
    "BMW",
    "CHEM"
  ]),
  StatsModel(
      date: "11/03",
      present: ["AIDS", "BMW", "CHEM", "DLO", "EHF", "FORENSICS"],
      absent: []),
  StatsModel(
      date: "11/03",
      present: [],
      absent: ["AIDS", "BMW", "CHEM", "DLO", "EHF", "FORENSICS"]),
];
