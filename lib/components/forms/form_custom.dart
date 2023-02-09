import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lista_compras/components/round_container.dart';

class FormCustom extends StatelessWidget {
  final List<Widget> inputs;
  final GlobalKey<FormState> formKey;

  FormCustom({required this.inputs, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      paddingCustom: EdgeInsets.only(top: 35, left: 5, right: 5, bottom: 5),
      childCustom: Form(
        key: formKey,
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