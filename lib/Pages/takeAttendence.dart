import 'package:flutter/material.dart';

class TakeAttendence extends StatefulWidget {
  const TakeAttendence({super.key});

  @override
  State<TakeAttendence> createState() => _TakeAttendenceState();
}

class _TakeAttendenceState extends State<TakeAttendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Attendence'),
      ),
      body: Column(
        children: [
          tile(),
          tile(),
          tile(),
        ],
      ),
    );
  }

  Widget tile({bool present = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.6),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name'),
                Row(
                  children: [
                    Text('Roll No'),
                    Text('Class'),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline),
                  Text("Present"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
