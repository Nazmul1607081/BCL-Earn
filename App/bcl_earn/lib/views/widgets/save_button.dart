import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MySaveButton extends StatelessWidget {
  final String label;
  final onClick;

  const MySaveButton({Key key, this.label, this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: onClick,
        child: Material(
          borderRadius: BorderRadius.circular(30),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: MyText(
                label: label,
                size: 16.0,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
