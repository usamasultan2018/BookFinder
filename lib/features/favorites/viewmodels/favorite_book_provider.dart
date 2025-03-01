import 'package:bookfinder/core/database/database_helper.dart';
import 'package:bookfinder/core/models/book.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Book> _favorites = [];

  List<Book> get favorites => _favorites;

  FavoritesProvider() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    _favorites = await _dbHelper.getFavorites();
    notifyListeners();
  }

  Future<void> toggleFavorite(Book book) async {
    final isFav = await _dbHelper.isFavorite(book.id);
    if (isFav) {
      await _dbHelper.removeFromFavorites(book.id);
    } else {
      await _dbHelper.addToFavorites(book);
    }
    loadFavorites();
  }

  bool isFavorite(String id) {
    return _favorites.any((book) => book.id == id);
  }
}
