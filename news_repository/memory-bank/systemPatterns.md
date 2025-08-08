# System Patterns

This file documents the technical architecture and design patterns of the project.

## Architecture
- The project is designed as a modular Dart package.
- The core of the package is the `news_repository`, which is designed to be datasource-agnostic.

## Main Components
- **`NewsRepository`:** This class is the main entry point for all data operations. It abstracts the data source implementation from the client.
- **In-memory Datasource:** The package includes a pre-built in-memory datasource with mock data (approx. 5 users, 20 articles) for testing and as a default implementation.

## Data Models
- The core data models (`Article`, `User`) are **immutable** and use the `equatable` package for value equality.
- All models will include a `copyWith` method to facilitate creating modified instances.
- Models are organized in the `lib/src/models` directory and exported via a single barrel file, `models.dart`.

### `User` Model
- `id`: `String`
- `name`: `String`
- `imageUrl`: `String`

### `Article` Model
- `id`: `String`
- `title`: `String`
- `content`: `String`
- `author`: `User`
- `postType`: `PostType` (Enum)
- `category`: `Category` (Enum)
- `imageUrl`: `String`
- `url`: `String`
- `publishedAt`: `DateTime`
- `isPremium`: `bool`
- `isBreaking`: `bool`

### Enums
- **`PostType`:** `article`, `video`, `live`
- **`Category`:** A simple enum with values like `business`, `technology`, etc.

## API Design
- The API is designed to be intuitive and easy to use, following standard Dart conventions.
- Error handling is designed to be clear and consistent.
- Methods like `topNews` and `trendingNews` will use simple placeholder logic in the initial implementation.

### Core Methods
- `getArticle()`
- `latestNews()`
- `getCategories()`
- `popularNews()`
- `topNews()`
- `trendingNews()`
- `mostReadNews()`
- `highlight()`

### `getArticles` Method
**Signature:**
```dart
Future<List<Article>> getArticles({
  Category? category,
  String? authorId,
  SortBy? sortBy,
  int limit = 20,
  int offset = 0,
});
```

**`SortBy` Enum:**
```dart
enum SortBy {
  latest,
  popular,
}
```