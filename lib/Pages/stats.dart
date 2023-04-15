import 'package:attendenceapp/Models/stats.dart';
import 'package:attendenceapp/Repository/Student/stats.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../statlist.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int curMonth = DateTime.now().month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 50,
            decoration: BoxDecoration(
                // color: Colors.grey.withOpacity(0.2),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    //gp to previous month
                    setState(() {
                      if (curMonth > 1) {
                        curMonth--;
                      } else {
                        Fluttertoast.showToast(
                            msg: "No data for Previous year");
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "${_getMonth(curMonth)} 2023",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (curMonth < DateTime.now().month) {
                        curMonth++;
                      } else {
                        Fluttertoast.showToast(msg: "Cant predict future");
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<StatsModel>?>(
                future: getStats(
                    "${_formatMonth(curMonth)}/${DateTime.now().year.toString()}"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  return snapshot.data!.isNotEmpty
                      ? ListView.builder(
                          itemBuilder: (context, index) =>
                              StatsTile(stat: snapshot.data![index]),
                          itemCount: snapshot.data!.length,
                        )
                      : Center(
                          child: Text("No data for this month"),
                        );
                }),
          ),
        ],
      ),
    );
  }

  String _formatMonth(int monthNum) {
    if (monthNum < 1 || monthNum > 12) {
      return "Invalid month number";
    }
    String monthStr = monthNum.toString();
    if (monthNum < 10) {
      monthStr = "0$monthStr";
    }
    return monthStr;
  }

  String _getMonth(int monthNum) {
    switch (monthNum) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Invalid month number";
    }
  }
}

class StatsTile extends StatelessWidget {
  const StatsTile({super.key, required this.stat});
  final StatsModel stat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.2),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.lightBlueAccent.withOpacity(0.6),
              ),
              child: Center(
                  child:
                      Text(stat.date.toString() + "/" + stat.month.toString())),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        const Text(
                          "Present: ",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: stat.present.map((e) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.green.withOpacity(0.6),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text(
                          "Absent: ",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: stat.absent.map((e) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.red.withOpacity(0.6),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
