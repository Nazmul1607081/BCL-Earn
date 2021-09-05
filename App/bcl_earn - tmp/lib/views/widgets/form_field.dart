import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final controller;
  final labelText;
  final validationMassage;
  final onChange;
  final obscureText;
  final isPass;
  final maxLine;
  final keyBoard;
  final validator;
  final padding;

  const MyTextFormField(
      {Key key,
      this.controller,
      this.labelText,
      this.validationMassage,
      this.onChange,
      this.obscureText,
      this.isPass,
      this.maxLine,
      this.keyBoard,
      this.validator,
      this.padding})
      : super(key: key);

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool suff = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (widget.padding == null) ? EdgeInsets.all(5) : widget.padding,
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        autocorrect: true,
        controller: widget.controller,
        obscuringCharacter: '*',
        obscureText: (widget.isPass == false) ? false : suff,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          suffixIcon: (widget.isPass == true)
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: IconButton(
                    icon: (suff)
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        suff = !suff;
                      });
                    },
                  ), // myIcon is a 48px-wide widget.
                )
              : null,
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (widget.validator == null)
            ? (value) {
                if (value.isEmpty) {
                  return widget.validationMassage;
                }
                return null;
              }
            : widget.validator,
        onChanged: widget.onChange,
        keyboardType: (widget.keyBoard == null)
            ? TextInputType.multiline
            : widget.keyBoard,
        maxLines: (widget.isPass != true) ? widget.maxLine : 1,
      ),
    );
  }
}
