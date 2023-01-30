import 'package:flutter/material.dart';

class IconMoveCardDelete extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 0),
      color: Color.fromARGB(255, 212, 43, 43),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}