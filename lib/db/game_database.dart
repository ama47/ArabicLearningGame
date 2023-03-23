import 'package:sqflite/sqflite.dart';
//import 'package:path_provider/path_provider.dart';

class GameDatabase {
  static final GameDatabase instance = GameDatabase._init();
  static Database? _database;

  GameDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('game');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    Future close() async {
      final db = await instance.database;
      db.close();
    }
  }
}
