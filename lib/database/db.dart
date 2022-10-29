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
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade
    );
  }

  _onCreate(db, version) async {
    await db.execute(_product);
  }

  _onUpgrade(db, oldVersion, newVersion) async {
    if(oldVersion < 2) db.execute(_productQty);
  }

  String get _productQty =>
  '''
    ALTER TABLE product ADD COLUMN qty INTEGER DEFAULT 1 NOT NULL 
  ''';

  String get _product => 
  '''
    CREATE TABLE product(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      price DOUBLE,
      qty INTEGER DEFAULT 1 NOT NULL 
    )
  ''';
}