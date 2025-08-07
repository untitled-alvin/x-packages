part of 'drift_article_datastore.dart';

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

// extension on SourceData {
//   /// Converts the Article object to a Drift-compatible ArticlesCompanion object.
//   Source toModel() => Source.fromJson(toJson());
// }
