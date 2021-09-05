import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';

class MyCountryPicker extends StatelessWidget {
  final onChange;

  const MyCountryPicker({Key key, this.onChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              child: CountryCodePicker(
                onChanged: onChange,
                initialSelection: 'BD',
                textOverflow: TextOverflow.fade,
                showCountryOnly: true,
                showOnlyCountryWhenClosed: true,
                alignLeft: true,
                dialogSize: Size(Get.width * .6, Get.height * .6),
                boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
