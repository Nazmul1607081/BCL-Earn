import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyDrawerButton extends StatelessWidget {
  final String label;
  final icon;
  final onClick;

  const MyDrawerButton({Key key, this.label, this.icon, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 10,
      ),
      child: InkWell(
        onTap: onClick,
        child: Material(
          color: MyColors.splashPageBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    icon,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MyText(
                  label: label,
                  size: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
