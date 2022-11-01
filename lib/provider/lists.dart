import 'package:flutter/cupertino.dart';
import 'package:lista_compras/database/db.dart';
import 'package:lista_compras/models/list_buy.dart';
import 'package:lista_compras/provider/products.dart';
import 'package:sqflite/sqlite_api.dart';

class Lists with ChangeNotifier {
  late Database db;

  Products product = Products();

  List _list = [];

  Lists() {
    _initRepository();
  }

  _initRepository() async {
    await _getLists();
  }

  List get lists => _list;

  int get count {
    return _list.length;
  }

  ListBuy byIndex(int i) {
    return _list[i];
  }

  _getLists() async {
    db = await DB.instance.database;
    List listQuery = await db.query('list');
    List listBuy = [];
    for(var list in listQuery) {
      ListBuy newListBuy = ListBuy.fromMap(list);
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

  Future<void> remove(ListBuy list) async {
    if(list != null && list.id != null) {
      product.removeAllProducts(list.id!);

      await db.rawDelete('''
          DELETE FROM list WHERE id = ? 
        ''', 
        [list.id]
      );
      
      _getLists();

      
    }
  }
}