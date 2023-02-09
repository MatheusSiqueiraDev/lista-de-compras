import 'package:flutter/material.dart';

class Submit extends StatelessWidget {
  final String title;
  final VoidCallback action;

  Submit({required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(left: 15.0, right: 5.0, top: 5.0, bottom: 5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(100, 50),
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Color.fromARGB(255, 44, 27, 93),
        ),
        onPressed: action,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      )
    );
  }
}