import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/models/list_buy.dart';
import 'package:lista_compras/provider/lists.dart';
import 'package:lista_compras/provider/products.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ListTileCustom extends StatelessWidget {
  final ListBuy listBuy;

  const ListTileCustom(this.listBuy);

  @override 
  Widget build(BuildContext context) {
    final Products product = Provider.of(context);
    final Lists lists = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 42,42,42),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
      child: ListTile(
        onTap: () {
          product.initList(listBuy.id);
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_LIST,
            arguments: listBuy
          );
        },
        title: Text(
          listBuy.name!,
          style: const TextStyle(
          color: Colors.deepPurpleAccent,
          fontWeight: FontWeight.bold
        )),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                    AppRoutes.LIST_FORM,
                    arguments: listBuy
                  ),
                  color: Colors.orangeAccent,
                  icon: const Icon(Icons.edit),
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: const Text('Excluir Lista'),
                        content: const Text('Tem certeza?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Não')
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Sim')
                          ),
                        ],
                      )
                    ).then((value) {
                      if(value) {
                        product.initList(listBuy.id);
                        lists.remove(listBuy);
                      }
                    });
                  },
                  color: Colors.redAccent, 
                  icon: const Icon(Icons.delete)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}