import 'package:flutter/material.dart';

class AppBarCustom extends AppBar {
  final String titleCustom;
  final List<Widget>? actionsCustom;

  AppBarCustom({this.titleCustom = '', this.actionsCustom}):super(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      titleCustom,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    ),
    actions: actionsCustom
  );
}