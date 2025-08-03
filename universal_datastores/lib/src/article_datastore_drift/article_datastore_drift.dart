// ignore_for_file: public_member_api_docs, document_ignores

import 'package:drift/drift.dart';
import 'package:universal_datastores/src/article_datastore/article_datastore.dart';
import 'package:universal_datastores/src/datastore.dart';

part 'database.dart';
part 'article_datastore_drift.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Articles, Sources])
class ArticlesDataStore extends DatabaseAccessor<ArticleDatabase>
    with _$ArticlesDataStoreMixin
    implements ArticlesDatastoreApi {
  // this constructor is required so that the main database can create an instance
  // of this object.
  ArticlesDataStore(super.db);

  void _applySourceFilter(
    SimpleSelectStatement<$ArticlesTable, ArticleData> query,
    ArticleQueryParams params,
  ) {
    if (params.hasValidSources) {
      final sourceList = params.sources!.split(',');
      query.where((tbl) => tbl.sourceId.isIn(sourceList));
    }
  }

  void _applyTextSearch(
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

  void _applySorting(
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

  SimpleSelectStatement<$ArticlesTable, ArticleData> _buildQuery(
    ArticleQueryParams params,
  ) {
    final query = db.select(db.articles);
    _applySourceFilter(query, params);
    _applyTextSearch(query, params);
    _applySorting(query, params);
    return query;
  }

  @override
  Future<OffsetLimitPagination<Article>> search(
    ArticleQueryParams params,
  ) async {
    final query = _buildQuery(params);
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

  /// Counts the total number of articles based on the provided query parameters.
  Future<int> countArticles(QueryParams params) async {
    final query = db.select(db.articles);
    if (params is ArticleQueryParams) {
      _applySourceFilter(query, params);
      return query.get().then((value) => value.length);
    }

    return db.articles.count().getSingle();
  }

  @override
  Future<Article?> get(String id) async {
    final query = db.select(db.articles)..where((tbl) => tbl.guid.equals(id));
    final data = await query.getSingleOrNull();
    return data?.toModel();
  }

  @override
  Future<Article> put(Article params) async {
    await db.batch((batch) {
      if (params.source != null) {
        batch.insertAllOnConflictUpdate(db.sources, [
          params.source!.toCompanion(),
        ]);
      }

      batch.insert(db.articles, params.toCompanion());
    });

    return params;
  }

  @override
  Future<void> putAll(List<Article> params) async {
    if (params.isNotEmpty) {
      await db.batch((batch) {
        batch.insertAll(
          db.articles,
          params.map((e) => e.toCompanion()).toList(),
        );
      });
    }
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
      sourceId: sourceId,
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

extension on SourceData {
  /// Converts the Article object to a Drift-compatible ArticlesCompanion object.
  Source toModel() => Source.fromJson(toJson());
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
