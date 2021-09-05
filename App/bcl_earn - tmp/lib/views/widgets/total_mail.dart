import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TotalMail extends StatelessWidget {
  final amount;

  const TotalMail({Key key, this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.white54,
        elevation: 4,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                label: "TOTAL NUMBER OF MAILS $amount",
                color: Colors.white,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
