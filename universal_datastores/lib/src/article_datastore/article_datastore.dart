import 'package:drift/drift.dart';
import 'package:universal_datastores/src/article_datastore/article_datastore_api.dart';
import 'package:universal_datastores/src/article_datastore/database.dart';
import 'package:universal_datastores/src/article_datastore/models/models.dart';
import 'package:universal_datastores/src/datastore.dart';

export 'package:universal_datastores/src/article_datastore/article_datastore_api.dart';
export 'package:universal_datastores/src/article_datastore/database.dart';
export 'package:universal_datastores/src/article_datastore/models/models.dart';

/// {@template news_store}
/// Local data source that manages Article objects.
///
/// This class abstracts the data access layer in the Clean Architecture,
/// serving as a local data source for Article entities.
/// {@endtemplate}
class ArticleDatastore extends ArticlesDatastoreApi {
  /// {@macro news_store}
  /// Creates a new [ArticleDatastore] with the provided database instance.
  ///
  /// The [database] parameter is required and must be an instance of [ArticleDatabase].
  ArticleDatastore({required this.database});

  /// The database instance used for all operations.
  final ArticleDatabase database;

  /// Counts the total number of articles based on the provided query parameters.
  Future<int> countArticles(QueryParams params) async {
    if (params is ArticleQueryParams) {
      final query = database.select(database.articles).applyQueryParams(params);
      return query.get().then((value) => value.length);
    }

    return database.articles.count().getSingle();
  }

  /// Searches for items that match the given query.
  @override
  Future<OffsetLimitPagination<Article>> search(QueryParams params) async {
    final query = database.select(database.articles).applyQueryParams(params);
    final total = await countArticles(params);
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
    final article = await get(id);
    if (article == null) {
      throw Exception('Article with id $id not found');
    }
    database.delete(database.articles).where((tbl) => tbl.guid.equals(id));
    return article;
  }

  @override
  Future<Article?> get(String id) async {
    final query = database.select(database.articles)
      ..where((tbl) => tbl.guid.equals(id));
    final data = await query.getSingleOrNull();
    return data?.toModel();
  }

  @override
  Future<Article> put(Article object) async {
    await database.batch((batch) {
      if (object.source != null) {
        batch.insertAllOnConflictUpdate(database.sources, [
          object.source!.toCompanion(),
        ]);
      }

      batch.insert(database.articles, object.toCompanion());
    });

    return object;
  }

  @override
  Future<void> putAll(List<Article> objects) async {
    if (objects.isEmpty) return;

    await database.batch((batch) {
      batch.insertAll(
        database.articles,
        objects.map((e) => e.toCompanion()).toList(),
      );
    });
  }
}

extension on SimpleSelectStatement<$ArticlesTable, ArticleData> {
  SimpleSelectStatement<$ArticlesTable, ArticleData> applyQueryParams(
    QueryParams params,
  ) {
    final query = this;

    if (params is ArticleQueryParams) {
      applySourceFilter(query, params);
      applyTextSearch(query, params);
      applySorting(query, params);
    }

    return query;
  }

  void applySourceFilter(
    SimpleSelectStatement<$ArticlesTable, ArticleData> query,
    ArticleQueryParams params,
  ) {
    if (params.hasValidSources) {
      query.where((tbl) => tbl.sourceId.isIn(params.sources!));
    }
  }

  void applyTextSearch(
    SimpleSelectStatement<$ArticlesTable, ArticleData> query,
    ArticleQueryParams params,
  ) {
    if (params.hasValidQuery) {
      final lowerCaseQuery = '%${params.query!.toLowerCase()}%';
      query.where(
        (tbl) {
          return tbl.content.lower().like(lowerCaseQuery) |
              tbl.title.lower().like(lowerCaseQuery);
        },
      );
    }
  }

  void applySorting(
    SimpleSelectStatement<$ArticlesTable, ArticleData> query,
    ArticleQueryParams params,
  ) {
    query.orderBy([
      (t) => switch (params.sortBy) {
        ArticleSortOptions.data => OrderingTerm(expression: t.content),
        ArticleSortOptions.id => OrderingTerm(expression: t.guid),
        ArticleSortOptions.updatedAt => OrderingTerm(expression: t.updatedAt),
        ArticleSortOptions.updatedAtDesc => OrderingTerm(
          expression: t.updatedAt,
          mode: OrderingMode.desc,
        ),
        ArticleSortOptions.createdAt => OrderingTerm(expression: t.createdAt),
        ArticleSortOptions.createdAtDesc => OrderingTerm(
          expression: t.createdAt,
          mode: OrderingMode.desc,
        ),
        _ => OrderingTerm(expression: t.createdAt),
      },
    ]);
  }
}

extension on Source {
  /// Converts the Source object to a Drift-compatible SourcesCompanion object.
  SourcesCompanion toCompanion() {
    return SourcesCompanion.insert(
      id: id,
      name: Value(name),
      url: Value(url),
      image: Value(image),
      description: Value(description),
      category: Value(category),
      language: Value(language),
      country: Value(country),
    );
  }
}

extension on Article {
  /// Converts the Article object to a Drift-compatible ArticlesCompanion object.
  ArticlesCompanion toCompanion() {
    return ArticlesCompanion.insert(
      guid: guid,
      createdAt: Value(createdAt),
      ownerId: ownerId,
      updatedAt: Value(updatedAt),
      modifiedId: Value(modifiedId),
      apiArticleId: Value(apiArticleId),
      sourceId: Value(sourceId),
      authorName: Value(authorName),
      title: Value(title),
      slug: Value(slug),
      description: Value(description),
      summary: Value(summary),
      content: Value(content),
      imageUrl: Value(imageUrl),
      videoUrl: Value(videoUrl),
      publishedAt: Value(publishedAt),
      ingestedAt: Value(ingestedAt),
      isFeatured: Value(isFeatured),
    );
  }
}

extension on ArticleData {
  /// Converts the Article object to a Drift-compatible ArticlesCompanion object.
  Article toModel() => Article(
    guid: guid,
    createdAt: createdAt,
    ownerId: ownerId,
    updatedAt: updatedAt,
    modifiedId: modifiedId,
    apiArticleId: apiArticleId,
    sourceId: sourceId,
    authorName: authorName,
    title: title,
    slug: slug,
    description: description,
    summary: summary,
    content: content,
    imageUrl: imageUrl,
    videoUrl: videoUrl,
    publishedAt: publishedAt,
    ingestedAt: ingestedAt,
    isFeatured: isFeatured,
  );
}

extension on SourceData {
  /// Converts the Article object to a Drift-compatible ArticlesCompanion object.
  Source toModel() => Source.fromJson(toJson());
}
