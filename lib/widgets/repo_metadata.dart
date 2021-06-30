import 'package:flutter/material.dart';

class RepoMetaData extends StatelessWidget {
  const RepoMetaData({Key key, this.iconWidget, this.label}) : super(key: key);

  final Widget iconWidget;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconWidget,
        SizedBox(
          width: 5,
        ),
        Text(label),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
