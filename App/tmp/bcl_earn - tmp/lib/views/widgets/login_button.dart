import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoginButton extends StatelessWidget {
  final String label;
  final onClick;
  final Color color;
  final Color labelColor;

  const MyLoginButton(
      {Key key, this.label, this.onClick, this.color, this.labelColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onClick,
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(30),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyText(
              label: label,
              size: 18.0,
              fontWeight: FontWeight.bold,
              color: labelColor,
            ),
          ),
        ),
      ),
    );
  }
}
