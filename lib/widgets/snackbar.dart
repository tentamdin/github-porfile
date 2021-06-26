import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String title, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: message == "Error" ? Colors.red.shade400 : Colors.white,
    content: Row(
      children: [
        Text("$title:"),
        SizedBox(
          width: 10,
        ),
        Text(message),
      ],
    ),
    action: SnackBarAction(
      label: "Close",
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  ));
}
