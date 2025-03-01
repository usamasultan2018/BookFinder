import 'package:bookfinder/core/repositories/book_repository.dart';
import 'package:bookfinder/core/services/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:bookfinder/core/models/book.dart';

class BookProvider extends ChangeNotifier {
  final BookRepository bookRepository;
  final TextEditingController controller = TextEditingController();

  BookProvider({BookRepository? repository})
      : bookRepository = repository ?? BookRepository(ApiService()) {
    controller.addListener(_onSearchTextChanged);
  }

  List<Book> _books = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Book> get books => _books;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void _setBooks(List<Book> value) {
    _books = value;
    notifyListeners();
  }

  void _setLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }

  void _setErrorMessage(String? value) {
    if (_errorMessage != value) {
      _errorMessage = value;
      notifyListeners();
    }
  }

  /// Called when the search text changes
  void _onSearchTextChanged() {
    if (controller.text.isEmpty) {
      _setBooks([]);
      _setErrorMessage(null);
    }
  }

  Future<void> searchBooks(String query) async {
    if (query.isEmpty) {
      _setBooks([]);
      _setErrorMessage(null);
      return;
    }

    _setLoading(true);
    _setErrorMessage(null);

    try {
      final fetchedBooks = await bookRepository.fetchBooks(query);
      _setBooks(fetchedBooks);

      if (fetchedBooks.isEmpty) {
        _setErrorMessage("No books found for '$query'");
      }
    } catch (e) {
      _setErrorMessage("Failed to fetch books: ${e.toString()}");
    } finally {
      _setLoading(false);
    }
  }

  void clearSearch() {
    controller.clear();
    _setBooks([]);
    _setErrorMessage(null);
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchTextChanged);
    controller.dispose();
    super.dispose();
  }
}
