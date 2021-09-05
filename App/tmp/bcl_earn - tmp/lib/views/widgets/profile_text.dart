import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget {
  final data;

  const ProfileText({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: MyText(
              label: "$data",
              size: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
