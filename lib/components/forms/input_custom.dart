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
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal
        ),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(
            color: Colors.deepPurpleAccent
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 42,42,42),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 42,42,42)),
          ),
        ),
        onSaved: save
      ),
    );
  }
}