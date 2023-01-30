import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/components/actions/icon_move_card_delete.dart';
import 'package:lista_compras/components/actions/icon_move_card_edit.dart';
import 'package:lista_compras/components/card_custom.dart';
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

    return CardCustom(
      actionEndToStart: () => dataDb.removeList(listBuy),
      actionStartToEnd: () => {
        Navigator.of(context).pushNamed(
          AppRoutes.LIST_FORM,
          arguments: listBuy
        ),
        dataDb.notify()
      },
      titleCard: Text(
        listBuy.name!,
        style: const TextStyle(
          color: Colors.deepPurpleAccent,
          fontWeight: FontWeight.bold
        )
      ),
      containerActionEndToStart: IconMoveCardDelete(),
      containerActionStartToEnd: IconMoveCardEdit(),
      click: () {
        dataDb.initList(listBuy.id);
        Navigator.of(context).pushNamed(
          AppRoutes.PRODUCT_LIST,
          arguments: listBuy
        );
      },
    );
  }
}