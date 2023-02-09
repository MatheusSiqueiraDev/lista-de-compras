import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DB {
  // Construtor com acesso privado
  DB._();

  //Criar uma instância de DB
  static final DB instance = DB._();

  //Instância do SQLite
  static Database? _database;

  get database async {
    if(_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'products.db'),
      version: 5,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade
    );
  }

  _onCreate(db, version) async {
    await db.execute(_product);
    await db.execute(_list);
    await db.execute(_setValuesFirtList);
    await db.execute(_theme);
    await db.execute(_themeSet);
  }

  _onUpgrade(db, oldVersion, newVersion) async {
    if(oldVersion < 2) db.execute(_productQty);
    
    if(oldVersion < 3) {
      db.execute(_productListId);
      db.execute(_list);
      db.execute(_addProductsInList);
      db.execute(_setValuesFirtList);
    }

    if(oldVersion < 4) {
      db.execute(_addCheckBox);
    }

    if(oldVersion < 5) {
      db.execute(_theme);
      db.execute(_themeSet);
    }
  }

  String get _product => 
  '''
    CREATE TABLE product(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      price DOUBLE,
      qty INTEGER DEFAULT 1 NOT NULL,
      listId INTEGER NOT NULL,
      buy INTEGER DEFAULT 0 NOT NULL
    );
  ''';

  String get _list => 
  '''
    CREATE TABLE list(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT NOT NULL,
      priceTotal DOUBLE DEFAULT 0 NOT NULL,
      qtyProduct INTEGER DEFAULT 0 NOT NULL
    );
  ''';

  String get _productQty =>
  '''
    ALTER TABLE product ADD COLUMN qty INTEGER DEFAULT 1 NOT NULL 
  ''';

  String get _productListId => 
  '''
    ALTER TABLE product ADD COLUMN listId INTEGER DEFAULT 0
  ''';

  String get _addProductsInList =>
  '''
    UPDATE product
    SET listId = 1;
  ''';

  String get _setValuesFirtList =>
  '''
    INSERT INTO list (name)
    VALUES("Primeira Lista");
  ''';

  String get _addCheckBox =>
  '''
    ALTER TABLE product ADD COLUMN buy INTEGER DEFAULT 0 NOT NULL
  ''';

  String get _theme =>
  '''
    CREATE TABLE theme(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT NOT NULL,
      value INTEGER DEFAULT 0 NOT NULL
    );
  ''';

  String get _themeSet => 
  '''
    INSERT INTO theme (name)
    VALUES("theme-current");
  ''';
}