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
      padding: const EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),
      margin: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: <Widget>[
          PriceList(
            title: 'GASTO', 
            price: dataDb.spending,
            colorText: Color.fromARGB(255, 206, 33, 21),
          ),
          PriceList(
            title: 'TOTAL', 
            price: dataDb.totalPrice,
            colorText: Color.fromARGB(255, 18, 155, 96),
          ),
          PriceList(
            title: 'PENDENTE', 
            price: dataDb.pendingPrice,
            colorText: Color.fromARGB(255, 249, 188, 5),
          )
        ],
      ),   
    );
  }
}