import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lista_compras/database/db.dart';
import 'package:lista_compras/models/product.dart';
import 'package:sqflite/sqflite.dart';

class Products with ChangeNotifier {

  late Database db;
  
  List _product = [];

  List get products => _product;

  int get count {
    return _product.length;
  }

  Products() {
    _initRepository();
  }

  _initRepository() async {
    await _getProducts();
  }

  _getProducts() async {
    db = await DB.instance.database;
    List productQuery = await db.query('product');
    List listProduct = [];
    for (var product in productQuery) { 
      Product newProduct = Product.fromMap(product); 
      listProduct.add(newProduct); 
    } 
    _product = listProduct;
    notifyListeners();
  }

  setProduct(String id, String name, String price, String url) async {
    Product? updateProduct = _productIsTable(id);
    db = await DB.instance.database;
    if(updateProduct != null) {
      await db.rawUpdate('''
        UPDATE product 
        SET name = ?, price = ?, photoUrl = ? 
        WHERE id = ?
        ''', 
        [name, price, url, id]
      );
    } else {
      db.insert('product', {
        'name': name,
        'price': price,
        'photourl': url
      });
    }
    _getProducts();
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
      _getProducts();
    }
  }

  Future<void> removeAllProducts () async {
    if(_product.isEmpty == false) {  
      await db.rawDelete('''
          DELETE FROM product 
        ''', 
      );
      _getProducts();
    }
  }
}