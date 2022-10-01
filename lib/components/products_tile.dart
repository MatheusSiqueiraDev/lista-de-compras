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
    final photo = product.photoUrl == null || product.photoUrl.isEmpty ? 
    CircleAvatar(child: Icon(Icons.add_shopping_cart)) : 
    CircleAvatar(backgroundImage: NetworkImage(product.photoUrl));

    return ListTile(
      leading: photo,
      title: Text(product.name),
      subtitle: Text('R\$${product.price}'),
      trailing: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM,
                arguments: product
              ), 
              color: Colors.orange,
              icon: Icon(Icons.edit)
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text('Excluir Usuário'),
                    content: Text('Tem certeza?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('Não')
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Sim')
                      ),
                    ],
                  )
                ).then((value) {
                  if(value) {
                    Provider.of<Products>(context, listen: false).remove(product);
                  }
                });
              },
              color: Colors.red, 
              icon: Icon(Icons.delete)
            ),
          ],
        ),
      ),
    );
  }
}