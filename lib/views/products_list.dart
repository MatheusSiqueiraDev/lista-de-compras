import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lista_compras/components/actions/remove_all_elements.dart';
import 'package:lista_compras/components/appbar_custom.dart';
import 'package:lista_compras/components/forms/float_button_custom.dart';
import 'package:lista_compras/components/list/list_view_custom.dart';
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
  late bool _showButtonScroll = true;
  
  @override
  Widget build(BuildContext context) {
    final GetData dataDb = Provider.of(context);
    final list = ModalRoute.of(context)?.settings.arguments as ListBuy;

    return Scaffold(
      appBar: AppBarCustom(
        titleCustom: list.name.toString(),
        actionsCustom: <Widget>[
          RemoveAllElements(
            condition: dataDb.countProduct, 
            message: 'Excluir Todos os Produtos', 
            action:() => { dataDb.removeAllProducts(list.id!) }
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ListTotals(),
          ListViewCustom(
            qtyList: dataDb.countProduct,
            builderList: (index) => ProductsTile(dataDb.byIndexProduct(index)),
            scrollButton: (bool condition) => { 
              setState(() {
                  _showButtonScroll = condition;
                }
              )
            },
          ),
        ],
      ), 
      floatingActionButton: FloatButtonCustom(
        scrollButton: _showButtonScroll,
        action: () {
          Navigator.of(context).pushNamed(
            AppRoutes.PRODUCT_FORM,
            arguments: list.id
          );
        },
      )
    );
  }
}