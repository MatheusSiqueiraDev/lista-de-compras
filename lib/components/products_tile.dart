import 'package:flutter/material.dart';
import 'package:lista_compras/components/actions/icon_move_card_delete.dart';
import 'package:lista_compras/components/actions/icon_move_card_edit.dart';
import 'package:lista_compras/components/card_custom.dart';
import 'package:lista_compras/components/text/format_real_br.dart';
import 'package:lista_compras/models/product.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ProductsTile extends StatelessWidget {
  
  final Product product;

  const ProductsTile(this.product);
  
  @override
  Widget build(BuildContext context) {
    final GetData dataDb = Provider.of(context);
    final formatPrice = FormatRealBr();

    return CardCustom(
      actionEndToStart: () => { dataDb.removeProduct(product) },
      actionStartToEnd: () => {
        Navigator.of(context).pushNamed(
          AppRoutes.PRODUCT_FORM,
          arguments: product
        ),
        dataDb.notify(),
      },
      containerActionEndToStart: IconMoveCardDelete(),
      containerActionStartToEnd: IconMoveCardEdit(),
      iconCard: const CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.add_shopping_cart, 
          color: Colors.deepPurpleAccent,
        ), 
      ),
      titleCard: Text(
        product.name!, 
        style: const TextStyle(
          color: Colors.deepPurpleAccent,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitleCard: Text(
        formatPrice.coin.format(
          product.price!.toString().replaceAll('.', ',')
        ), 
        style: const TextStyle(
          color: Colors.white
        ),
      ),
      actionsCard: Container(
        width: 150,
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                alignment: Alignment.centerRight,
                child: 
                  Text(
                    product.qty.toString(), 
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              child:  Checkbox(
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fillColor: MaterialStateProperty.resolveWith((state) => Colors.deepPurpleAccent),
                value: product.buy == 0 ? false : true,
                onChanged: (bool? value) {
                  dataDb.changeBuyProduct(
                    product.id.toString(), 
                    value, product.listId ?? 0
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}