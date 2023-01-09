import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lista_compras/components/list_totals.dart';
import 'package:lista_compras/components/products_tile.dart';
import 'package:lista_compras/models/list_buy.dart';
import 'package:lista_compras/models/product.dart';
import 'package:lista_compras/provider/getData.dart';
import 'package:lista_compras/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  @override 
  _StateProductList createState() => _StateProductList();
}

class _StateProductList extends State<ProductList> {
  bool _showFab = true;
  
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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 0),
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  setState(() {
                    if (direction == ScrollDirection.reverse) {
                      _showFab = false;
                    } else if (direction == ScrollDirection.forward) {
                      _showFab = true;
                    }
                  });
                  return true;
                },
                child: ListView.builder(
                  itemCount: dataDb.countProduct,
                  itemBuilder: (context, index) => Container(
                    child: ProductsTile(dataDb.byIndexProduct(index))
                  ),
                ),
              )
            )
          ),
        ],
      ), 
      floatingActionButton: AnimatedSlide(
        duration: Duration(milliseconds: 300),
        offset: _showFab ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          opacity: _showFab ? 1 : 0,
          duration: Duration(milliseconds: 300),
          child:  FloatingActionButton(
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
        ),
      ) 
    );
  }
}