import 'dart:io';

import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MainTaine extends StatelessWidget {
  const MainTaine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AlertDialog(
      title: MyText(
        label: 'Sorry',
        color: Colors.red,
        size: 25,
      ),
      content: MyText(
        label: "App is in Maintaining Mode",
      ),
      actions: <Widget>[
        TextButton(
          child: MyText(
            label: "OK",
            fontWeight: FontWeight.bold,
          ),
          onPressed: () {
            exit(0);
          },
        ),
      ],
    ));
  }
}
