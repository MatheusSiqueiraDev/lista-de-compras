import 'package:flutter/material.dart';
import 'package:lista_compras/provider/products.dart';
import 'package:provider/provider.dart';

class ListTotals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products product = Provider.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 26,26,26),
      ),  
      
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'TOTAL',
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 211, 211),
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'R\$ ${product.totalPrice.toStringAsFixed(2).toString()}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 70, 57),
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              )
            ],
          ),
        ],
      ),   
    );
  }
}