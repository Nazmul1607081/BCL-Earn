import 'dart:io';

import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ConnectionFailed extends StatelessWidget {
  final String data;
  const ConnectionFailed({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AlertDialog(
      title: MyText(
        label: 'Connection Failed!',
        color: Colors.red,
        size: 25,
      ),
      content: MyText(
        label: "$data.\nPlease Connect again.",
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
