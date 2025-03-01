import 'package:bookfinder/core/models/book.dart';
import 'package:bookfinder/core/services/api/api_service.dart';
import 'package:bookfinder/core/services/api/api_exceptions.dart';

class BookRepository {
  final ApiService apiService;

  BookRepository(this.apiService);

  Future<List<Book>> fetchBooks(String query) async {
    try {
      final response = await apiService.get('q=$query');
      print("API Response: ${response.data}");

      if (response.error != null) {
        throw ApiException(response.error!);
      }

      final List<dynamic> bookData = response.data['items'] ?? [];

      // ✅ Ensure `volumeInfo` exists before parsing
      final validBooks = bookData.where((json) => json['volumeInfo'] != null).toList();

      return validBooks.map((json) => Book.fromJson(json)).toList();
    } catch (e) {
      throw ApiException("Failed to fetch books: $e");
    }
  }
}
