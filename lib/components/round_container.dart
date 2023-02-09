import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Widget? childCustom;
  final EdgeInsetsGeometry? paddingCustom;

  const RoundContainer({super.key, this.childCustom, this.paddingCustom});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingCustom,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )
      ),
      child: childCustom,
    );
  }
}