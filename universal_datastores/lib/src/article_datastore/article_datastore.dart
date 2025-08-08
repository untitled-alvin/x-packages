import 'package:universal_datastores/src/article_datastore/drift_article_datastore.dart';
import 'package:universal_datastores/src/article_datastore/models/models.dart';
import 'package:universal_datastores/src/datastore.dart'
    show OffsetLimitPagination, OrderMode, QueryParams;
import 'package:universal_datastores/src/exceptions.dart';

export 'package:universal_datastores/src/article_datastore/drift_article_datastore.dart';
export 'package:universal_datastores/src/datastore.dart'
    show OffsetLimitPagination, QueryParams;

export 'models/models.dart';

/// The available sorting options for articles.
enum ArticleSortOptions {
  /// Sort by data.
  data,

  /// Sort by ID.
  id,

  /// Sort by update date ascending.
  updatedAt,

  /// Sort by creation date ascending.
  createdAt,
}

/// {@template article_query_params}
/// The query parameters for fetching articles.
/// {@endtemplate}
class ArticleQueryParams extends QueryParams {
  /// {@macro article_query_params}
  const ArticleQueryParams({
    super.orderMode,
    super.limit,
    super.offset,
    this.sources,
    this.query,
    this.sortBy,
  });

  // static const latestQuery = ArticleQueryParams(
  //   sortBy: ArticleSortOptions.createdAt,
  // );

  /// The sources to filter by.
  final List<String>? sources;

  /// The search query.
  final String? query;

  /// The sorting option.
  final ArticleSortOptions? sortBy;

  /// Whether the query is valid.
  bool get hasValidQuery => query != null && query!.isNotEmpty;

  /// Whether the sources are valid.
  bool get hasValidSources => sources != null && sources!.isNotEmpty;
}

/// {@template articles_datastore_api}
/// The API for the articles datastore.
/// {@endtemplate}
abstract class ArticlesDatastore {
  ///
  factory ArticlesDatastore.drift(ArticleDatabase database) =>
      DriftArticleDatastore(database: database);

  /// Stores a single object.
  ///
  /// Returns the updated object.
  /// * Throws a [PutFailedException] if the put fails.
  Future<Article> put(Article params);

  /// Deletes an article by its [id].
  ///
  /// Returns the deleted article.
  /// * Throws a [DeleteFailedException] if the delete fails.
  Future<Article> delete(String id);

  /// Returns the item with the given `id`.
  /// * Throws a [GetFailedException] if the get fails.
  Future<Article?> get(String id);

  /// Stores multiple objects at once.
  ///
  /// This might update existing objects if they have the same ID.
  /// If the list is empty, this method does nothing.
  /// * Throws a [PutFailedException] if the put fails.
  Future<void> putAll(List<Article> params);

  /// Counts the total number of articles based on the provided query parameters.
  Future<int> count(ArticleQueryParams params);

  /// Searches for articles that match the given query.
  Future<OffsetLimitPagination<Article>> search(ArticleQueryParams params);

  /// Returns the latest news articles.
  Future<OffsetLimitPagination<Article>> latestNews(ArticleQueryParams params);

  /// Returns popular news articles.
  Future<OffsetLimitPagination<Article>> popularNews(ArticleQueryParams params);

  /// Returns top news articles.
  Future<OffsetLimitPagination<Article>> topNews(ArticleQueryParams params);

  /// Returns trending news articles.
  Future<OffsetLimitPagination<Article>> trendingNews(
    ArticleQueryParams params,
  );

  /// Returns most read news articles.
  Future<OffsetLimitPagination<Article>> mostReadNews(
    ArticleQueryParams params,
  );

  /// Returns highlight news articles.
  Future<OffsetLimitPagination<Article>> highlight(ArticleQueryParams params);
}
