import 'package:universal_datastores/src/base/query_params.dart';

/// Constants for sorting options
enum ArticleSortOptions {
  /// Sort by article ID
  id,

  /// Sort by article content
  data,

  /// Sort by creation date
  createdAt,

  /// Sort by creation date in descending order
  createdAtDesc,

  /// Sort by update date
  updatedAt,

  /// Sort by update date in descending order
  updatedAtDesc,
}

/// Query parameters for article search
///
/// This class encapsulates all possible parameters for querying articles,
/// making it easier to add new parameters without changing method signatures.
class ArticleQueryParams extends QueryParams {
  /// Creates a new instance of [ArticleQueryParams]
  ///
  /// All parameters are optional and will be applied only if non-null

  /// Parameters:
  /// - [query]: Free text search across article content
  /// - [queryInTitle]: Search only in article titles
  /// - [sources]: Comma-separated list of source IDs
  /// - [domains]: Comma-separated list of domains to include
  /// - [excludeDomains]: Comma-separated list of domains to exclude
  /// - [from]: Start date for date range filter
  /// - [to]: End date for date range filter
  /// - [language]: Filter by article language
  /// - [sortBy]: Field to sort results by
  /// - [preview]: Whether to return preview version of articles
  /// - [limit]: Maximum number of results to return. If null, returns all matching records.
  /// - [offset]: Number of results to skip///
  const ArticleQueryParams({
    this.query,
    this.queryInTitle,
    this.sources,
    this.domains,
    this.excludeDomains,
    this.from,
    this.to,
    this.language,
    this.sortBy = ArticleSortOptions.createdAtDesc,
    this.preview = false,
    super.limit,
    super.offset,
  });

  /// Default query to select all articles
  /// This query sorts articles by their creation date.
  /// It can be used as a default query when no specific parameters are provided.
  /// This is useful for fetching all articles in a sorted manner.
  static const queryAll = ArticleQueryParams();

  /// Checks if sources parameter is valid for filtering
  bool get hasValidSources => sources != null && sources!.isNotEmpty;

  /// Checks if query parameter is valid for content search
  bool get hasValidQuery => query != null && query!.isNotEmpty;

  /// Free text search across article content
  final String? query;

  /// Search only in article titles
  final String? queryInTitle;

  /// Comma-separated list of source IDs
  final String? sources;

  /// Comma-separated list of domains to include
  final String? domains;

  /// Comma-separated list of domains to exclude
  final String? excludeDomains;

  /// Start date for date range filter
  final String? from;

  /// End date for date range filter
  final String? to;

  /// Filter by article language
  final String? language;

  /// Field to sort results by
  final ArticleSortOptions? sortBy;

  /// Whether to return preview version of articles
  final bool preview;

  // /// Maximum number of results to return
  // final int? limit;

  // /// Number of results to skip
  // final int? offset;
}

// /// Extension methods for [IsarQuery<Article>] to apply query parameters.
// extension ArticleQueryExtension on IsarQuery<Article> {
//   /// Applies query parameters to an IsarQuery.
//   ///
//   /// This method applies filtering, searching, and sorting based on the provided parameters.
//   IsarQuery<Article> applyQueryParams(ArticleQueryParams params) {
//     if (params.hasValidSources) {
//       return _applySourceFilter(params.sources!);
//     }

//     if (params.hasValidQuery) {
//       return _applyContentSearch(params.query!);
//     }

//     return _applySorting(params.sortBy);
//   }

//   /// Applies source-based filtering to the query.
//   IsarQuery<Article> _applySourceFilter(String sources) {
//     final sourcesList = sources.split(',');
//     final builder = isar.articles.where();

//     return sourcesList.length == 1
//         ? builder.idEqualTo(sourcesList.first).build()
//         : builder.idContains(sources).build();
//   }

//   /// Applies content-based search to the query.
//   IsarQuery<Article> _applyContentSearch(String query) {
//     final builder = isar.articles.where();
//     return builder.contentContains(query, caseSensitive: false).build();
//   }

//   /// Applies sorting to the query based on the provided option.
//   IsarQuery<Article> _applySorting(ArticleSortOptions? sortBy) {
//     final builder = isar.articles.where();
//     final sortBuilder = builder as QueryBuilder<Article, Article, QSortBy>;

//     return switch (sortBy) {
//       ArticleSortOptions.data =>
//         sortBuilder.sortByContent(caseSensitive: false).build(),
//       ArticleSortOptions.id => sortBuilder.sortById().build(),
//       ArticleSortOptions.updatedAt => sortBuilder.sortByUpdatedAt().build(),
//       ArticleSortOptions.updatedAtDesc =>
//         sortBuilder.sortByUpdatedAtDesc().build(),
//       ArticleSortOptions.createdAt => sortBuilder.sortByCreatedAt().build(),
//       ArticleSortOptions.createdAtDesc =>
//         sortBuilder.sortByCreatedAtDesc().build(),
//       null => sortBuilder.sortByCreatedAt().build(),
//     };
//   }
// }
