import 'package:universal_datastores/src/datastore.dart';

/// The available sorting options for articles.
enum ArticleSortOptions {
  /// Sort by data.
  data,

  /// Sort by ID.
  id,

  /// Sort by update date ascending.
  updatedAt,

  /// Sort by update date descending.
  updatedAtDesc,

  /// Sort by creation date ascending.
  createdAt,

  /// Sort by creation date descending.
  createdAtDesc,
}

/// {@template article_query_params}
/// The query parameters for fetching articles.
/// {@endtemplate}
class ArticleQueryParams extends QueryParams {
  /// {@macro article_query_params}
  const ArticleQueryParams({
    super.limit,
    super.offset,
    this.query,
    this.sources,
    this.sortBy,
  });

  /// The search query.
  final String? query;

  /// The sources to filter by.
  final List<String>? sources;

  /// The sorting option.
  final ArticleSortOptions? sortBy;

  /// Whether the query is valid.
  bool get hasValidQuery => query != null && query!.isNotEmpty;

  /// Whether the sources are valid.
  bool get hasValidSources => sources != null && sources!.isNotEmpty;
}
