import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lista_compras/database/db.dart';
import 'package:lista_compras/models/product.dart';
import 'package:sqflite/sqflite.dart';

class Products with ChangeNotifier {

  late Database db;
  
  List _product = [];

  List get products => _product;

  Products() {
    _initRepository();
  }

  _initRepository() async {
    await _getProducts();
  }

  _getProducts() async {
    db = await DB.instance.database;
    _product = await db.query('product');
    notifyListeners();
  }

  setProduct(String name, String price, String url) async {
    db = await DB.instance.database;
    db.insert('product', {
      'name': name,
      'price': price,
      'photourl': url
    });
    notifyListeners();
  }

  final Map<String, Product> _items = {};

  List<Product> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Product byIndex(int i) {
    List<dynamic> teste = products;
    return _items.values.elementAt(i);
  }

  // void put(Product product) {

  //   if(product.id != null && product.id.trim().isNotEmpty && _items.containsKey(product.id)) {
  //     _items.update(product.id, (value) => Product(
  //       id: product.id,
  //       name: product.name,
  //       price: product.price,
  //       photoUrl: product.photoUrl
  //     ));
  //   } else {
  //     final id = Random().nextDouble().toString();
  //     _items.putIfAbsent(id, () => Product(
  //       id: id,
  //       name: product.name,
  //       price: product.price,
  //       photoUrl: product.photoUrl
  //     ));
  //   }

  //   notifyListeners();
  // }

  void remove(Product product) {
    if(product != null && product.id != null) {
      _items.remove(product.id);
      notifyListeners();
    }
  }

  void removeAllProducts () {
    print('Passei aqui');
    if(_items.isEmpty == false) {
      _items.clear();
      notifyListeners();
    }
  }
}