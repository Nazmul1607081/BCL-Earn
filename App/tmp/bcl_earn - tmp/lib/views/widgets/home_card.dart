import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyHomeCard extends StatelessWidget {
  final icon;
  final label;

  final onClick;

  const MyHomeCard({Key key, this.icon, this.label, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onClick,
        child: Material(
          color: Colors.white,
          elevation: 4,
          borderRadius: BorderRadius.circular(5),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: Colors.brown,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  MyText(
                    label: label,
                    fontWeight: FontWeight.bold,
                    size: 16.0,
                    color: Colors.red,
                    textAlignment: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
