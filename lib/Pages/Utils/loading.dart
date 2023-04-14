import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Loading..."),
          )
        ],
      ),
    );
  }
}
