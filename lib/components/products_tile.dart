import 'package:flutter/material.dart';
import 'package:lista_compras/components/format_real_br.dart';
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
            dataDb.removeProduct(product);
          }

          if(direction == DismissDirection.startToEnd) {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_FORM,
              arguments: product
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
        child:  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          color: const Color.fromARGB(255, 42,42,42),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.add_shopping_cart, 
                color: Colors.deepPurpleAccent,
              ), 
            ),
            title: Text(product.name!, style: const TextStyle(
              color: Colors.deepPurpleAccent,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold
            ),),
            subtitle: Text(
              formatPrice.coin.format(product.price!.toStringAsFixed(2).toString().replaceAll('.', ',')), 
              style: const TextStyle(
                color: Colors.white
              ),
            ),
            trailing: Container(
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
                      fillColor: MaterialStateProperty.resolveWith((states) => product.buy == 0 ? Colors.deepPurpleAccent : Colors.deepPurpleAccent),
                      value: product.buy == 0 ? false : true,
                      onChanged: (bool? value) {
                        dataDb.changeBuyProduct(product.id.toString(), value, product.listId ?? 0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      )
      
    );
  }
}