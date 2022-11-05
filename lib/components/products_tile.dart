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
    return  Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color.fromARGB(255, 42,42,42),
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
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
          width: 120,
          child: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                    AppRoutes.PRODUCT_FORM,
                    arguments: product
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
                        title: const Text('Excluir Produto'),
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
                        dataDb.removeProduct(product);
                      }
                    });
                  },
                  color: Colors.redAccent, 
                  icon: const Icon(Icons.delete)
                ),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  child: 
                    Text(
                      product.qty.toString(), 
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    
  }
}