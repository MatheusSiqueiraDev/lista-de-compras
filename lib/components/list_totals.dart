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
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Row(
        children: <Widget>[
          PriceList(
            title: 'GASTO', 
            price: dataDb.spending,
            colorText: Color.fromARGB(255, 255, 36, 21),
          ),
          PriceList(
            title: 'TOTAL', 
            price: dataDb.totalPrice,
            colorText: Color.fromARGB(255, 44, 255, 164),
          ),
          PriceList(
            title: 'PENDENTE', 
            price: dataDb.pendingPrice,
            colorText: Color.fromARGB(255, 255, 202, 41),
          )
        ],
      ),   
    );
  }
}