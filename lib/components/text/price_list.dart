import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lista_compras/components/text/format_real_br.dart';

class PriceList extends StatelessWidget {
  final String title;
  final double price;
  final Color colorText;

  PriceList({
    required this.title, 
    required this.price, 
    this.colorText = const Color.fromARGB(255, 211, 211, 211)}
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title
          ),
          Text(
            FormatRealBr().coin.format(price.toStringAsFixed(2).replaceAll('.', ',')),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: colorText,
              fontSize: 18
            ),
          )
        ],
      ),
    );
  }
}