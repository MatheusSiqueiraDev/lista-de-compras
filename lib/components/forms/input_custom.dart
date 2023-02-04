import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  String? initValue;
  String? label;
  dynamic validator;
  dynamic save;
  dynamic typeKeyboard;
  dynamic maskInput;

  InputCustom({this.initValue, this.label, this.validator, this.save, this.typeKeyboard, this.maskInput});

  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: TextFormField(
        validator: validator,
        keyboardType: typeKeyboard ?? TextInputType.text,
        inputFormatters: maskInput,
        initialValue: initValue,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).inputDecorationTheme.fillColor as Color
            ),
          ),
        ),
        onSaved: save
      ),
    );
  }
}