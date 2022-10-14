import 'package:flutter/material.dart';
import 'package:lista_compras/components/list_totals.dart';
import 'package:lista_compras/components/products_tile.dart';
import 'package:lista_compras/models/product.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products product = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('LISTA DE COMPRAS'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if(product.count > 0) {
                showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: Text('Excluir Todos os Produtos'),
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
                  ).then((response) {
                    if(response) {
                      Provider.of<Products>(context, listen: false).removeAllProducts();
                    }
                  }
                );
              }
            }, 
            icon: const Icon(Icons.remove_outlined),
            )
        ],
      ),
      body: Column(
        children: <Widget>[
          ListTotals(),
          Expanded(
            child: ListView.builder(
              itemCount: product.count,
              itemBuilder: (context, index) => Container(
                child: ProductsTile(product.byIndex(index))
              ),
            ),
          ),
        ],
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          product.products;
          Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}