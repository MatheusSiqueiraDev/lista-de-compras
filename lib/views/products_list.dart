import 'package:flutter/material.dart';
import 'package:lista_compras/components/list_totals.dart';
import 'package:lista_compras/components/products_tile.dart';
import 'package:lista_compras/models/list_buy.dart';
import 'package:lista_compras/models/product.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetData dataDb = Provider.of(context);
    final list = ModalRoute.of(context)?.settings.arguments as ListBuy;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('${list.name}'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if(dataDb.countProduct > 0) {
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
                      dataDb.removeAllProducts(list.id!);
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
              itemCount: dataDb.countProduct,
              itemBuilder: (context, index) => Container(
                child: ProductsTile(dataDb.byIndexProduct(index))
              ),
            ),
          ),
        ],
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataDb.products;
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_FORM,
            arguments: list.id as int
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}