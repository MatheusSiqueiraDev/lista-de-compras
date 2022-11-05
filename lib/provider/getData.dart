import 'package:flutter/cupertino.dart';
import 'package:lista_compras/database/db.dart';
import 'package:lista_compras/models/list_buy.dart';
import 'package:lista_compras/models/product.dart';
import 'package:sqflite/sqlite_api.dart';

class GetData with ChangeNotifier {
  late Database db;

  List _list = [];

  double _totalPrice = 0.0;

  int _qtyProducts = 0;

  List _product = [];

  GetData() {
    _initRepository();
  }

  _initRepository() async {
    await _getLists();
  }

  List get products => _product;

  int get countProduct {
    return _product.length;
  }

  List get lists => _list;

  int get countList {
    return _list.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  ListBuy byIndexList(int i) {
    return _list[i];
  }

  Product byIndexProduct(int i) {
    return _product[i];
  }

  _getLists() async {
    db = await DB.instance.database;
    List listQuery = await db.query('list');
    List listBuy = [];
    for(var list in listQuery) {
      ListBuy newListBuy = ListBuy.fromMap(list);
      await _getDataProducts(newListBuy.id!);
      newListBuy.qtdProduct = _qtyProducts;
      newListBuy.priceTotal = _totalPrice;
      listBuy.add(newListBuy);
    }
    _list = listBuy;
    notifyListeners();
  }

  setList(int id, String name) async {
    ListBuy? updateListBuy = _listBuyIsTable(id);
    if(updateListBuy != null) {
      await db.rawUpdate('''
        UPDATE list
        SET name = ?
        WHERE ID = ?
      ''',
      [name, id]);
    } else {
      db.insert('list', {
        'name': name
      });
    }
 
    _getLists();
  }

  _listBuyIsTable(id) {
    for (var list in _list) { 
      if(id == list.id) {
        return list;
      }
    }
  }

  Future<void> removeList(ListBuy list) async {
    if(list != null && list.id != null) {
      removeAllProducts(list.id!);

      await db.rawDelete('''
          DELETE FROM list WHERE id = ? 
        ''', 
        [list.id]
      );
      
      _getLists();     
    }
  }

  _getProductDb(listId) async {
    return db.rawQuery('select * from product WHERE listId = ?', [listId]);
  }

  _getDataProducts(int listId) async {
    _product = await getListProducts(listId);
    _totalPrice = _getTotalPrice(_product);
    _qtyProducts = _getQtyProducts(_product);

    notifyListeners();
  }

  setProduct(String id, String name, double price, int qty, int listId) async {
    Product? updateProduct = _productIsTable(id);
    if(updateProduct != null) {
      await db.rawUpdate('''
        UPDATE product 
        SET name = ?, price = ?, qty = ?
        WHERE id = ?
        ''', 
        [name, price, qty, id]
      );
    } else {
      db.insert('product', {
        'name': name,
        'price': price,
        'qty': qty,
        'listId': listId
      });
    }
    await _getDataProducts(listId);
  }

  void initList(listId) {
    _getDataProducts(listId);
  } 

  _productIsTable(id) {
    for (var product in _product) { 
      if(id == product.id) {
        return product;
      }
    }
  }

 

  Future<void> removeProduct(Product product) async {
    if(product != null && product.id != null) {
      await db.rawDelete('''
          DELETE FROM product WHERE id = ? 
        ''', 
        [product.id]
      );
      _getDataProducts(product.listId!);
    }
  }

  Future<void> removeAllProducts(int listId) async {
    await _getDataProducts(listId);
    if(_product.isEmpty == false) {  
      await db.rawDelete('''
          DELETE FROM product WHERE listId = ? 
        ''', 
        [listId]
      );
    }
    _getDataProducts(listId);
  }

  Future<List> getListProducts(int listId) async {
    List productQuery = await _getProductDb(listId) ;
    List listProduct = [];
    for (var product in productQuery) { 
      Product newProduct = Product.fromMap(product);
      listProduct.add(newProduct);
    } 

    return listProduct;
  }

  double _getTotalPrice(List listProduct) {
    double totalPrice = 0.0;
    for(Product product in listProduct) { 
      totalPrice += product.price!;
    }

    return totalPrice;
  }

  int _getQtyProducts(List listProduct) {
    int qty = 0;
    for(Product product in listProduct) {
      qty += product.qty!;
    }
    
    return qty;
  }
}