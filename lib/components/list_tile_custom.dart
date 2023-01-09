import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/models/list_buy.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ListTileCustom extends StatelessWidget {
  final ListBuy listBuy;

  const ListTileCustom(this.listBuy);

  @override 
  Widget build(BuildContext context) {
    final GetData dataDb = Provider.of(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(left: 0, right: 0, top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 58, 58, 58).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2), 
          )
        ]
      ),
      child: Dismissible(
        key: UniqueKey(), 
        onDismissed: (DismissDirection direction) {
          if(direction == DismissDirection.endToStart) {
            dataDb.removeList(listBuy);
          }

          if(direction == DismissDirection.startToEnd) {
            Navigator.of(context).pushNamed(
              AppRoutes.LIST_FORM,
              arguments: listBuy
            );
            dataDb.notify();
          }
        },
        background: Container(
          alignment: Alignment.centerLeft,
          color: Colors.orangeAccent,
          padding: const EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
          child: const Icon(
            Icons.edit, 
            color: Colors.white,
          )   
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 0),
          color: Color.fromARGB(255, 212, 43, 43),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: ListTile(
          onTap: () {
            dataDb.initList(listBuy.id);
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_LIST,
              arguments: listBuy
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            listBuy.name!,
            style: const TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold
            )
          ),
        ),
      ),
    );
  }
}