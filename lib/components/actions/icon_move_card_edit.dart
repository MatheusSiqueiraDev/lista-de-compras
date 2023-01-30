import 'package:flutter/material.dart';

class IconMoveCardEdit extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.orangeAccent,
      padding: const EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
      child: const Icon(
        Icons.edit, 
        color: Colors.white,
      )   
    );
  }
}