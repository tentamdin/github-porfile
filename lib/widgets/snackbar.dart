import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String title, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
    content: Row(
      children: [
        Text(
          "$title:",
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            message,
            maxLines: 2,
          ),
        ),
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
