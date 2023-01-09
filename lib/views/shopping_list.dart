import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lista_compras/components/list_tile_custom.dart';
import 'package:lista_compras/components/products_tile.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ShoppingList extends StatefulWidget {
  @override
  _StateShoppingList createState() => _StateShoppingList();
}
class _StateShoppingList extends State<ShoppingList> {
  bool _showFab = true;

  @override 
  Widget build(BuildContext context) {
    final GetData dataDb = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'LISTAS DE COMPRAS',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 0),
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  setState(() {
                    if (direction == ScrollDirection.reverse) {
                      _showFab = false;
                    } else if (direction == ScrollDirection.forward) {
                      _showFab = true;
                    }
                  });
                  return true;
                },
                child: ListView.builder(
                  itemCount: dataDb.countList,
                  itemBuilder: (context, index) => Container(
                    child: ListTileCustom(dataDb.byIndexList(index)),
                  ),
                ),  
              ),
            )
          )
        ],
      ),
      floatingActionButton: AnimatedSlide(
        duration: Duration(milliseconds: 300),
        offset: _showFab ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          opacity: _showFab ? 1 : 0,
          duration: Duration(milliseconds: 300),
          child:  FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.LIST_FORM);
            },
            backgroundColor: Colors.deepPurpleAccent,
            child: const Icon(Icons.add),
          ),
        ),
      ) 
    );
  }
}