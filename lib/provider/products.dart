import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lista_compras/database/db.dart';
import 'package:lista_compras/models/product.dart';
import 'package:sqflite/sqflite.dart';

class Products with ChangeNotifier {

  late Database db;

  double _totalPrice = 0.0;
  
  List _product = [];

  List get products => _product;

  int get count {
    return _product.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  Products() {
    _initRepository();
  }

  get total => null;

  _initRepository() async {
    await _initDb();
  }

  _initDb() async {
    db = await DB.instance.database;
  }

  _getProducts(int listId) async {
    List productQuery = await db.rawQuery('select * from product WHERE listId = ?', [listId]);
    List listProduct = [];
    double totalPrice = 0.0;
    for (var product in productQuery) { 
      Product newProduct = Product.fromMap(product); 
      listProduct.add(newProduct);
      totalPrice += newProduct.price! * newProduct.qty!;
    } 
    _totalPrice = totalPrice;
    _product = listProduct;
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
    _getProducts(listId);
  }

  void initList(listId) {
    _getProducts(listId);
  } 

  _productIsTable(id) {
    for (var product in _product) { 
      if(id == product.id) {
        return product;
      }
    }
  }

  Product byIndex(int i) {
    return _product[i];
  }

  Future<void> remove(Product product) async {
    if(product != null && product.id != null) {
      await db.rawDelete('''
          DELETE FROM product WHERE id = ? 
        ''', 
        [product.id]
      );
      // _getProducts();
    }
  }

  Future<void> removeAllProducts(int listId) async {
    if(_product.isEmpty == false) {  
      await db.rawDelete('''
          DELETE FROM product WHERE listId = ? 
        ''', 
        [listId]
      );
    }
  }
}