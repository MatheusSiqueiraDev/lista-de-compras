import 'package:flutter/material.dart';
import 'package:lista_compras/components/appbar_custom.dart';
import 'package:lista_compras/components/forms/float_button_custom.dart';
import 'package:lista_compras/components/list_tile_custom.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../components/list/list_view_custom.dart';

class ShoppingList extends StatefulWidget {
  @override
  _StateShoppingList createState () => _StateShoppingList();
}

class _StateShoppingList extends State<ShoppingList> {
  late bool _showButtonScroll = true;

  @override 
  Widget build(BuildContext context) {
    final GetData dataDb = Provider.of(context);
    return Scaffold(
      appBar: AppBarCustom(
        titleCustom: 'LISTA DE COMPRAS',
      ),
      body: Column(
        children: <Widget>[
          ListViewCustom(
            qtyList: dataDb.countList,
            builderList: (index) => ListTileCustom(dataDb.byIndexList(index)),
            scrollButton: (bool condition) => { 
              setState(() {
                  _showButtonScroll = condition;
                }
              )
            },
          ),
        ],
      ),
      floatingActionButton: FloatButtonCustom(
        scrollButton: _showButtonScroll,
        action: () {
          Navigator.of(context).pushNamed(AppRoutes.LIST_FORM);
        },
      )
    );
  }
}