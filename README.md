# BookFinder

BookFinder is a Flutter application that helps users search for books, view details, and manage their favorite books.
## Features

✅ Search Books – Find books by title or author
✅ Book Details – View book information (title, author, publisher, cover image)
✅ Favorites – Save and manage favorite books
✅ Theming – Supports light & dark mode

## Folder Structure

📂 lib
 ┣ 📂 core
 ┃ ┣ 📂 utils
 ┃ ┃ ┣ app_colors.dart       # Defines app color scheme
 ┃ ┃ ┣ theme_preferences.dart # Manages theme settings
 ┃ ┣ 📂 models
 ┃ ┃ ┣ book.dart             # Book model
 ┃ ┣ 📂 services
 ┃ ┃ ┣ api_constants.dart    # API endpoint constants
 ┃ ┃ ┣ api_exception.dart    # Handles API errors
 ┃ ┃ ┣ api_service.dart      # Manages API requests
 ┃ ┃ ┣ api_response.dart     # Standard API response format
 ┃ ┣ 📂 repositories
 ┃ ┃ ┣ book_repository.dart  # Handles book-related data fetching

 ┣ 📂 features
 ┃ ┣ 📂 home
 ┃ ┃ ┣ 📂 view               # Home screen UI
 ┃ ┃ ┣ 📂 viewmodel          # Home screen logic
 ┃ ┃ ┣ 📂 widgets            # Reusable home components
 ┃ ┣ 📂 favorites
 ┃ ┃ ┣ 📂 view               # Favorites screen UI
 ┃ ┃ ┣ 📂 viewmodel          # Favorites screen logic
 ┃ ┃ ┣ 📂 widgets            # Reusable favorite components
 ┃ ┣ 📂 settings
 ┃ ┃ ┣ 📂 view               # Settings screen UI
 ┃ ┃ ┣ 📂 viewmodel          # Settings logic
 ┃ ┃ ┣ 📂 widgets            # Reusable settings components
 ┃ ┣ 📂 splash
 ┃ ┃ ┣ 📂 view               # Splash screen UI
 ┃ ┃ ┣ 📂 viewmodel          # Splash logic
 ┃ ┃ ┣ 📂 widgets            # Reusable splash components

 ┣ 📂 shared
 ┃ ┣ 📂 widgets              # Common reusable widgets
 ┃ ┣ 📂 theme
 ┃ ┃ ┣ app_theme.dart        # Centralized theme settings

 ┗ main.dart                 # Entry point of the app

# Installation
git clone https://github.com/yourusername/bookfinder.git
cd bookfinder
flutter pub get
flutter run
# Dependencies
flutter pub get

# API Used
his app fetches book data from the Google Books API.

🔗 API Docs: Google Books API
