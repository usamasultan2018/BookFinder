class Book {
  final String id;
  final String title;
  final String subtitle;
  final String publisher;
  final String description;
  final String thumbnail;
  final String previewLink;

  Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.publisher,
    required this.description,
    required this.thumbnail,
    required this.previewLink,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};

    return Book(
      id: json['id'] ?? 'Unknown ID',
      title: volumeInfo['title'] ?? 'No Title',
      subtitle: volumeInfo['subtitle'] ?? '',
      publisher: volumeInfo['publisher'] ?? 'Unknown Publisher',
      description: volumeInfo['description'] ?? 'No Description Available',
      thumbnail: volumeInfo['imageLinks']?['thumbnail'] ?? '',
      previewLink: volumeInfo['previewLink'] ?? '',
    );
  }

  /// Factory constructor for parsing SQLite data (from a Map)
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] ?? 'Unknown ID',
      title: map['title'] ?? 'No Title',
      subtitle: map['subtitle'] ?? '',
      publisher: map['publisher'] ?? 'Unknown Publisher',
      description: map['description'] ?? 'No Description Available',
      thumbnail: map['thumbnail'] ?? '',
      previewLink: map['previewLink'] ?? '',
    );
  }

  /// Convert Book object into a Map (for SQLite storage)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'publisher': publisher,
      'description': description,
      'thumbnail': thumbnail,
      'previewLink': previewLink,
    };
  }
}
