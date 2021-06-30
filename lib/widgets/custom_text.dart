import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key key,
    this.label,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.color,
  }) : super(key: key);

  final String label;
  final int maxLines;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
