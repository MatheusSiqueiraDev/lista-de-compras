import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchThemeCustom extends StatelessWidget {
  final bool value;
  final Function(bool) action;

  SwitchThemeCustom({required this.value, required this.action});

  @override 
  Widget build(BuildContext context) {
    return Switch(
      value: value, 
      onChanged: action,
      thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
          if (value) {
            return const Icon(Icons.light_mode_outlined);
          }
          return const Icon(Icons.dark_mode_outlined);
        },
      ),
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return Color.fromARGB(255, 255, 255, 255);
        },
      ),
      activeTrackColor: Color.fromARGB(255, 212, 212, 212),
      inactiveTrackColor: Color.fromARGB(255, 0, 0, 0),
    );
  }
}