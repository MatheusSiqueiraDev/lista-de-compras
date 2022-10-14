import 'package:flutter/material.dart';
import 'package:lista_compras/models/product.dart';
import 'package:lista_compras/provider/products.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ProductsTile extends StatelessWidget {
  
  final Product product;

  const ProductsTile(this.product);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 42,42,42),
        borderRadius: BorderRadius.circular(10),
      ),
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
          fontWeight: FontWeight.bold
        ),),
        subtitle: Text('R\$${product.price?.toStringAsFixed(2)}', style: const TextStyle(
          color: Colors.white
        ),),
        trailing: Container(
          width: 100,
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
                        Provider.of<Products>(context, listen: false).remove(product);
                      }
                    });
                  },
                  color: Colors.redAccent, 
                  icon: const Icon(Icons.delete)
                ),
              )
            ],
          ),
        ),
      ),
    );
    
  }
}