import 'package:flutter/material.dart';
import 'package:lista_compras/components/format_real_br.dart';
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'GASTO',
                  style: TextStyle(
                    color: Color.fromARGB(255, 211, 211, 211),
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  FormatRealBr().coin.format(dataDb.spending.toStringAsFixed(2).toString().replaceAll('.', ',')),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 70, 57),
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  FormatRealBr().coin.format(dataDb.totalPrice.toStringAsFixed(2).toString().replaceAll('.', ',')),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 18, 178, 109),
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                )
              ],
            )
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'PENDENTE',
                  style: TextStyle(
                    color: Color.fromARGB(255, 211, 211, 211),
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  FormatRealBr().coin.format(dataDb.pendingPrice.toStringAsFixed(2).toString().replaceAll('.', ',')),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 246, 197, 53),
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                )
              ],
            )
          )
        ],
      ),   
    );
  }
}