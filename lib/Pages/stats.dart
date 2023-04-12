import 'package:attendenceapp/Models/stats.dart';
import 'package:flutter/material.dart';

import '../statlist.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: ListView.builder(
        itemBuilder: (context, index) => StatsTile(stat: statslist[index]),
        itemCount: statslist.length,
      ),
    );
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
              child: Center(child: Text(stat.date)),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text(
                          "Present: ",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
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
