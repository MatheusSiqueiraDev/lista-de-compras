import 'package:flutter/material.dart';
import 'package:lista_compras/components/products_tile.dart';
import 'package:lista_compras/data/dummy_products.dart';
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
        title: Text('Lista de Compras'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => {}, 
            icon: Icon(Icons.do_disturb_alt_outlined),
            )
        ],
      ),
      body: ListView.builder(
        itemCount: product.count,
        itemBuilder: (context, index) => ProductsTile(product.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}