import 'package:drift/drift.dart';
import 'package:universal_datastores/src/article_datastore/article_database.dart';
import 'package:universal_datastores/universal_datastores.dart';

export 'package:universal_datastores/src/article_datastore/models/models.dart';

/// {@template news_store}
/// Local data source that manages Article objects.
///
/// This class abstracts the data access layer in the Clean Architecture,
/// serving as a local data source for Article entities.
/// {@endtemplate}
class DriftArticlesDatastore extends ArticlesDatastore {
  /// {@macro news_store}
  /// Creates a new [DriftArticlesDatastore] with the provided database instance.
  ///
  /// The [database] parameter is required and must be an instance of [AppDatabase].
  DriftArticlesDatastore({
    required this.database,
  });

  /// The database instance used for all operations.
  final ArticleDatabase database;

  SimpleSelectStatement<$ArticlesTable, ArticleData> _buildQuery(
    QueryParams params,
  ) {
    final query = database.select(database.articles);

    if (params is ArticleQueryParams) {
      if (params.hasValidSources) {
        final sourceList = params.sources!.split(',');
        query.where((tbl) => tbl.sourceId.isIn(sourceList));
      }

      if (params.hasValidQuery) {
        final lowerCaseQuery = '%${params.query!.toLowerCase()}%';
        query.where(
          (tbl) {
            return tbl.content.lower().like(lowerCaseQuery) |
                tbl.title.lower().like(lowerCaseQuery);
          },
        );
      }

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

    return query;
  }

  /// Counts the total number of articles based on the provided query parameters.
  Future<int> countArticles(QueryParams params) async {
    if (params is ArticleQueryParams) {
      if (params.hasValidSources) {
        final sourceList = params.sources!.split(',');
        return database.articles
            .count(where: (tbl) => tbl.sourceId.isIn(sourceList))
            .getSingle();
      }
    }

    return database.articles.count().getSingle();
  }

  /// Searches for items that match the given query.
  @override
  Future<OffsetLimitPagination<Article>> search(QueryParams params) async {
    final offset = params.offset ?? 0;
    final limit = params.limit;

    final query = params is ArticleQueryParams
        ? _buildQuery(params)
        : database.select(database.articles);

    final total = await countArticles(params);

    query.limit(limit ?? total, offset: offset);

    final articles = await query.get();

    return OffsetLimitPagination(
      data: articles.map((e) => e.toModel()).toList(),
      total: total,
      offset: offset,
      limit: limit ?? total,
    );
  }

  @override
  Future<Article> delete(String id) async {
    final article = await get(id);
    if (article == null) {
      throw DatastoreException.notFound('Article with id $id not found');
    } else {
      database.delete(database.articles).where((tbl) => tbl.guid.equals(id));
      return article;
    }
  }

  @override
  Future<Article?> get(String id) async {
    final query = database.select(database.articles)
      ..where((tbl) => tbl.guid.equals(id));
    final data = await query.getSingleOrNull();
    return data?.toModel();
    // data!.toJson();
    // return query.getSingleOrNull();
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
    if (objects.isNotEmpty) {
      await database.batch((batch) {
        batch.insertAll(
          database.articles,
          objects.map((e) => e.toCompanion()).toList(),
        );
      });
    }
  }
}

extension on Source {
  /// Converts the Source object to a Drift-compatible SourcesCompanion object.
  SourcesCompanion toCompanion() {
    return SourcesCompanion.insert(
      id: Value(id),
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
  );
  // Article toModel() => Article.fromJson(toJson());
}

extension on SourceData {
  /// Converts the Article object to a Drift-compatible ArticlesCompanion object.
  Source toModel() => Source.fromJson(toJson());
}
