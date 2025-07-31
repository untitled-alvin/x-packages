// ignore_for_file: always_use_package_imports, document_ignores

import 'package:isar/isar.dart';
import 'package:universal_datastores/src/article_datastore/source.dart';
import 'package:universal_datastores/universal_datastores.dart';
import 'article.dart';
import 'article_query_params.dart';

export 'article.dart';
export 'article_query_params.dart';

/// {@template news_store}
/// Local data source that manages Article objects.
///
/// This class abstracts the data access layer in the Clean Architecture,
/// serving as a local data source for Article entities.
/// {@endtemplate}
class ArticlesDatastore extends IsarDatastore<Article>
    with DatastoreSearch<Article> {
  /// {@macro news_store}
  /// Creates a new [ArticlesDatastore] with the provided database instance.
  ///
  /// The [database] parameter is required and must be an instance of [IsarDatabase].
  ArticlesDatastore({required super.database});

  /// Builds an optimized query based on the provided parameters.
  ///
  /// This is a helper method used by [search].
  IsarQuery<Article> _buildArticleQuery(Isar isar, QueryParams params) {
    final queryBuilder = isar.articles.where();
    final query = queryBuilder.build();
    if (params is ArticleQueryParams) {
      return query.applyQueryParams(params);
    }
    return query;
  }

  @override
  Future<OffsetLimitPagination<Article>> search(QueryParams params) async {
    return database.read((isar) {
      final offset = params.offset ?? 0;
      final limit = params.limit;
      final query = _buildArticleQuery(isar, params);
      final articles = query.findAll(offset: offset, limit: limit);
      final total = query.count();
      return OffsetLimitPagination(
        data: articles,
        total: total,
        offset: offset,
        limit: limit ?? total,
      );
    });
  }
}

/// Extension methods for [IsarQuery<Article>] to apply query parameters.
extension ArticleQueryExtension on IsarQuery<Article> {
  /// Applies query parameters to an IsarQuery.
  ///
  /// This method applies filtering, searching, and sorting based on the provided parameters.
  IsarQuery<Article> applyQueryParams(ArticleQueryParams params) {
    final tmp = this;
    if (params.hasValidSources) {
      tmp._applySourceFilter(params.sources!);
    }

    if (params.hasValidQuery) {
      tmp._applyContentSearch(params.query!);
    }

    return tmp._applySorting(params.sortBy);
  }

  /// Applies source-based filtering to the query.
  IsarQuery<Article> _applySourceFilter(String sources) {
    final sourcesList = sources.split(',');
    final builder = isar.articles.where();
    if (sourcesList.isNotEmpty) {
      // for (var i = 0; i < sourcesList.length; i++) {
      //   if (i == sourcesList.length - 1) {
      //     q.idEqualTo(sourcesList[i]);
      //   } else {
      //     // q.id(sourcesList[i]).or();
      //     q.idEqualTo(sourcesList[i]);
      //   }
      // }

      // return q.idEqualTo(sourcesList[0]);
      // // return q;

      // for (var i = 0; i < sourcesList.length; i++) {
      //   if (i != sourcesList.length - 1) {
      //     builder.source((q) => q.idEqualTo(sourcesList[i])).or();
      //   } else {
      //     builder.source((q) => q.idEqualTo(sourcesList[i]));
      //   }
      // }

      return builder
          .source((q) => q.allOf(sourcesList, (q, id) => q.idContains(id)))
          .build();
    }

    return builder.build();
  }

  /// Applies content-based search to the query.
  IsarQuery<Article> _applyContentSearch(String query) {
    final builder = isar.articles.where();
    return builder.contentContains(query, caseSensitive: false).build();
  }

  /// Applies sorting to the query based on the provided option.
  IsarQuery<Article> _applySorting(ArticleSortOptions? sortBy) {
    final builder = isar.articles.where();
    final sortBuilder = builder as QueryBuilder<Article, Article, QSortBy>;

    return switch (sortBy) {
      ArticleSortOptions.data =>
        sortBuilder.sortByContent(caseSensitive: false).build(),
      ArticleSortOptions.id => sortBuilder.sortById().build(),
      ArticleSortOptions.updatedAt => sortBuilder.sortByUpdatedAt().build(),
      ArticleSortOptions.updatedAtDesc =>
        sortBuilder.sortByUpdatedAtDesc().build(),
      ArticleSortOptions.createdAt => sortBuilder.sortByCreatedAt().build(),
      ArticleSortOptions.createdAtDesc =>
        sortBuilder.sortByCreatedAtDesc().build(),
      null => sortBuilder.sortByCreatedAt().build(),
    };
  }
}
