import 'package:flutter/material.dart';

class FloatButtonCustom extends StatelessWidget {
  final bool scrollButton;
  final Function action;

  FloatButtonCustom({this.scrollButton = true, required this.action});

  @override 
  Widget build(BuildContext context) {
    return AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: scrollButton ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          opacity: scrollButton ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child:  FloatingActionButton(
            onPressed: () {
              action();
            },
            child: const Icon(Icons.add),
          ),
        ),
      );
  }
}