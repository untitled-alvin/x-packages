import 'package:drift/drift.dart';
import 'package:universal_datastores/src/article_datastore/article_datastore.dart';
import 'package:universal_datastores/src/datastore.dart' show OrderMode;
import 'package:universal_datastores/src/exceptions.dart';

part 'drift_article_datastore.g.dart';
part 'database.dart';
part 'extension.dart';

/// {@template drift_news_store}
/// Local data source that manages Article objects.
///
/// This class abstracts the data access layer in the Clean Architecture,
/// serving as a local data source for Article entities.
/// {@endtemplate}
class DriftArticleDatastore implements ArticlesDatastore {
  /// {@macro drift_news_store}
  /// Creates a new [DriftArticleDatastore] with the provided database instance.
  ///
  /// The [database] parameter is required and must be an instance of [ArticleDatabase].
  const DriftArticleDatastore({required this.database});

  /// The database instance used for all operations.
  final ArticleDatabase database;

  /// Counts the total number of articles based on the provided query parameters.
  @override
  Future<int> count(ArticleQueryParams params) async {
    final query = database.select(database.articles).applyQueryParams(params);
    return query.get().then((value) => value.length);
  }

  /// Searches for items that match the given query.
  @override
  Future<OffsetLimitPagination<Article>> search(
    ArticleQueryParams params,
  ) async {
    final query = database.select(database.articles).applyQueryParams(params);
    final total = await count(params);
    final offset = params.offset ?? 0;
    final limit = params.limit ?? total;

    query.limit(limit, offset: offset);

    final articles = await query.get();

    return OffsetLimitPagination(
      data: articles.map((e) => e.toModel()).toList(),
      total: total,
      offset: offset,
      limit: limit,
    );
  }

  @override
  Future<Article> delete(String id) async {
    try {
      final article = await get(id);
      if (article == null) {
        throw DeleteFailedException(
          Exception('Article with id $id not found'),
          StackTrace.current,
        );
      }
      await (database.delete(database.articles)..where((tbl) => tbl.guid.equals(id))).go();
      return article;
    } catch (e, s) {
      throw DeleteFailedException(e, s);
    }
  }

  @override
  Future<Article?> get(String id) async {
    try {
      final query = database.select(database.articles)
        ..where((tbl) => tbl.guid.equals(id));
      final data = await query.getSingleOrNull();
      return data?.toModel();
    } catch (e, s) {
      throw GetFailedException(e, s);
    }
  }

  @override
  Future<Article> put(Article object) async {
    try {
      await database.batch((batch) {
        if (object.source != null) {
          batch.insertAllOnConflictUpdate(database.sources, [
            object.source!.toCompanion(),
          ]);
        }

        batch.insert(database.articles, object.toCompanion());
      });

      return object;
    } catch (e, s) {
      throw PutFailedException(e, s);
    }
  }

  @override
  Future<void> putAll(List<Article> objects) async {
    if (objects.isEmpty) return;

    try {
      await database.batch((batch) {
        batch.insertAll(
          database.articles,
          objects.map((e) => e.toCompanion()).toList(),
        );
      });
    } catch (e, s) {
      throw PutFailedException(e, s);
    }
  }

  @override
  Future<OffsetLimitPagination<Article>> latestNews(
    ArticleQueryParams params,
  ) async {
    return search(
      ArticleQueryParams(
        limit: params.limit,
        offset: params.offset,
        orderMode: OrderMode.descending,
        sortBy: ArticleSortOptions.createdAt,
      ),
    );
  }

  @override
  Future<OffsetLimitPagination<Article>> popularNews(
    ArticleQueryParams params,
  ) async {
    return search(
      ArticleQueryParams(
        limit: params.limit,
        offset: params.offset,
        orderMode: OrderMode.descending,
        sortBy: ArticleSortOptions.data, // Assuming 'data' refers to popularity/engagement
      ),
    );
  }

  @override
  Future<OffsetLimitPagination<Article>> topNews(
    ArticleQueryParams params,
  ) async {
    return search(
      ArticleQueryParams(
        limit: params.limit,
        offset: params.offset,
        orderMode: OrderMode.descending,
        sortBy: ArticleSortOptions.data, // Assuming 'data' refers to top articles
      ),
    );
  }

  @override
  Future<OffsetLimitPagination<Article>> trendingNews(
    ArticleQueryParams params,
  ) async {
    return search(
      ArticleQueryParams(
        limit: params.limit,
        offset: params.offset,
        orderMode: OrderMode.descending,
        sortBy: ArticleSortOptions.updatedAt, // Assuming trending is based on recent updates
      ),
    );
  }

  @override
  Future<OffsetLimitPagination<Article>> mostReadNews(
    ArticleQueryParams params,
  ) async {
    return search(
      ArticleQueryParams(
        limit: params.limit,
        offset: params.offset,
        orderMode: OrderMode.descending,
        sortBy: ArticleSortOptions.data, // Assuming 'data' refers to most read
      ),
    );
  }

  @override
  Future<OffsetLimitPagination<Article>> highlight(
    ArticleQueryParams params,
  ) async {
    return search(
      ArticleQueryParams(
        limit: params.limit,
        offset: params.offset,
        orderMode: OrderMode.descending,
        sortBy: ArticleSortOptions.data, // Assuming 'data' refers to highlights
      ),
    );
  }
}
