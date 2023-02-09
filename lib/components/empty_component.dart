import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/components/round_container.dart';

class EmptyComponent extends StatelessWidget {
  final String titleCustom;

  EmptyComponent({required this.titleCustom});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RoundContainer(
        paddingCustom: const EdgeInsets.all(0),
        childCustom: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            titleCustom,
            style: Theme.of(context).textTheme.bodyLarge
          ),
        ),
      ),
    );
  }
}