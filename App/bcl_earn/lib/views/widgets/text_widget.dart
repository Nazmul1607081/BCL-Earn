import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final label;
  final double size;
  final color;
  final fontWeight;
  final textAlignment;
  final textDecoration;
  final overflow;

  const MyText(
      {Key key,
      this.label,
      this.size,
      this.color,
      this.fontWeight,
      this.textAlignment,
      this.textDecoration,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$label",
      style: TextStyle(
        decoration: textDecoration,
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
      overflow: (overflow == null) ? TextOverflow.clip : overflow,
      textAlign: (textAlignment == null) ? TextAlign.start : textAlignment,
    );
  }
}
