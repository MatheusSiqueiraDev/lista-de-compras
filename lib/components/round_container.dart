import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  RoundContainer({this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )
      ),
      child: child,
    );
  }
}