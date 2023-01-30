import 'package:flutter/material.dart';
import 'package:lista_compras/components/text/format_real_br.dart';
import 'package:lista_compras/components/text/price_list.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:provider/provider.dart';

class ListTotals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetData dataDb = Provider.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 26,26,26),
      ),  
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: <Widget>[
          PriceList(
            title: 'GASTO', 
            price: dataDb.spending,
            colorText: const Color.fromARGB(255, 255, 70, 57),
          ),
          PriceList(
            title: 'TOTAL', 
            price: dataDb.totalPrice,
            colorText: const Color.fromARGB(255, 18, 178, 109),
          ),
          PriceList(
            title: 'PENDENTE', 
            price: dataDb.pendingPrice,
            colorText: const Color.fromARGB(255, 246, 197, 53),
          )
        ],
      ),   
    );
  }
}