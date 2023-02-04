import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lista_compras/components/round_container.dart';

class FormCustom extends StatelessWidget {
  final List<Widget> inputs;
  final Key? key;

  FormCustom({required this.inputs, required this.key});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      padding: EdgeInsets.only(top: 35, left: 5, right: 5, bottom: 5),
      child: Form(
        key: key,
        child: ListView(
          children: <Widget>[
            Column(
              children: inputs
            )
          ]
        ),
      ),
    );
  }
}