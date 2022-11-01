import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/components/list_tile_custom.dart';
import 'package:lista_compras/components/products_tile.dart';
import 'package:lista_compras/provider/lists.dart';
import 'package:lista_compras/provider/products.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ShoppingList extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    final Lists list = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'LISTAS DE COMPRAS',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: list.count,
              itemBuilder: (context, index) => Container(
                child: ListTileCustom(list.byIndex(index)),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.lists;
          Navigator.of(context).pushNamed(AppRoutes.LIST_FORM);
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}