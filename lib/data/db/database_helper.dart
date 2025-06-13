import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/local_user_model.dart';
// LocalDatabaseHelper


class LocalDatabaseHelper {
  static final LocalDatabaseHelper _instance = LocalDatabaseHelper._internal();
  factory LocalDatabaseHelper() => _instance;
  static Database? _database;
  LocalDatabaseHelper._internal();

  Future<Database> get database async {
    return _database ??= await _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'users2.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          email TEXT UNIQUE,
          password TEXT,
          mobileNumber TEXT
        );
      ''');
    });
  }

  Future<int> insertUser(LocalUserModel user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<LocalUserModel?> getUser(String email, String password) async {
    final db = await database;
    final result = await db.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (result.isNotEmpty) {
      return LocalUserModel.fromMap(result.first);
    } else {
      return null;
    }
  }
}


//////////////////


// class LocalDatabaseHelper {
//   static final LocalDatabaseHelper instance = LocalDatabaseHelper._init();
//   static Database? _database;

//   LocalDatabaseHelper._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('app_database.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT NOT NULL,
//         email TEXT NOT NULL UNIQUE,
//         password TEXT NOT NULL,
//         mobileNumber TEXT NOT NULL
//       )
//     ''');

//     await db.execute('''
//       CREATE TABLE notes (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         userId INTEGER NOT NULL,
//         title TEXT NOT NULL,
//         content TEXT NOT NULL,
//         createdAt TEXT NOT NULL,
//         FOREIGN KEY (userId) REFERENCES users (id) ON DELETE CASCADE
//       )
//     ''');
//   }

//   Future close() async {
//     final db = await instance.database;
//     db.close();
//   }
// }