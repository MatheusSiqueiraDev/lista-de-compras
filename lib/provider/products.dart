import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lista_compras/data/dummy_products.dart';
import 'package:lista_compras/models/product.dart';

class Products with ChangeNotifier {
  final Map<String, Product> _items = {...DUMMY_USERS};

  List<Product> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Product byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Product product) {

    if(product.id != null && product.id.trim().isNotEmpty && _items.containsKey(product.id)) {
      _items.update(product.id, (value) => Product(
        id: product.id,
        name: product.name,
        price: product.price,
        photoUrl: product.photoUrl
      ));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => Product(
        id: id,
        name: product.name,
        price: product.price,
        photoUrl: product.photoUrl
      ));
    }

    notifyListeners();
  }

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