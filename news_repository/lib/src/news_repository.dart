import 'package:news_repository/src/category.dart';
import 'package:news_repository/src/models/models.dart';

/// An enum for sorting articles.
enum SortBy {
  /// Sort by the latest articles.
  latest,

  /// Sort by the most popular articles.
  popular,
}

/// {@template news_repository}
/// A repository that exposes news data.
/// {@endtemplate}
abstract class NewsRepository {
  /// Returns a list of all news categories.
  Future<List<Category>> getCategories();

  /// Returns a list of articles.
  ///
  /// Can be filtered by [category] and [authorId].
  /// The list can be sorted by [sortBy].
  ///
  /// The number of articles returned is limited by [limit].
  /// The starting offset of the articles returned is [offset].
  Future<List<Article>> getArticles({
    Category? category,
    String? authorId,
    SortBy? sortBy,
    int limit = 20,
    int offset = 0,
  });

  /// Returns a single article with the given [id].
  Future<Article> getArticle(String id);

  /// Returns the latest news articles.
  Future<List<Article>> latestNews();

  /// Returns the most popular news articles.
  Future<List<Article>> popularNews();

  /// Returns the top news articles.
  Future<List<Article>> topNews();

  /// Returns the trending news articles.
  Future<List<Article>> trendingNews();

  /// Returns the most read news articles.
  Future<List<Article>> mostReadNews();

  /// Returns the highlight news articles.
  Future<List<Article>> highlight();
}