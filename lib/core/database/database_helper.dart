import 'package:bookfinder/core/models/book.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'books.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE favorites (
            id TEXT PRIMARY KEY,
            title TEXT,
            subtitle TEXT,
            publisher TEXT,
            description TEXT,
            thumbnail TEXT,
            previewLink TEXT
          )
          '''
        );
      },
    );
  }

  Future<void> addToFavorites(Book book) async {
    final db = await database;
    await db.insert('favorites', book.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Book>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return maps.map((map) => Book.fromMap(map)).toList();
  }

  Future<void> removeFromFavorites(String id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isFavorite(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('favorites', where: 'id = ?', whereArgs: [id]);
    return maps.isNotEmpty;
  }
}
