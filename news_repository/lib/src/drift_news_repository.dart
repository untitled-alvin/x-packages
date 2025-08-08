import 'package:drift/drift.dart';
import 'package:news_repository/src/category.dart';
import 'package:news_repository/src/data/data.dart';
import 'package:news_repository/src/data/database.dart' as db;
import 'package:news_repository/src/models/models.dart' as models;
import 'package:news_repository/src/news_repository.dart';
import 'package:news_repository/src/data/news_api_client.dart';

class DriftNewsRepository implements NewsRepository {
  DriftNewsRepository({
    required NewsApiClient apiClient,
    required db.AppDatabase database,
  })  : _apiClient = apiClient,
        _database = database;

  final NewsApiClient _apiClient;
  final db.AppDatabase _database;

  @override
  Future<void> fetchLatestNews() async {
    final articles = await _apiClient.fetchLatestArticles();
    final companions = articles.map((a) => a.toArticleCompanion()).toList();
    await _database.batch((batch) {
      batch.insertAll(
        _database.articles,
        companions,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  Future<models.Article> getArticle(String id) async {
    final article = await (_database.select(_database.articles)
          ..where((a) => a.id.equals(id)))
        .getSingle();
    final author = await (_database.select(_database.authors)
          ..where((a) => a.id.equals(article.authorId)))
        .getSingle();
    return article.toArticle(author);
  }

  @override
  Future<List<models.Article>> getArticles({
    Category? category,
    String? authorId,
    SortBy? sortBy,
    int limit = 20,
    int offset = 0,
  }) async {
    final articlesQuery = _database.select(_database.articles);

    if (sortBy != null) {
      articlesQuery.orderBy([
        (a) => OrderingTerm(
              expression: a.publishedAt,
              mode: sortBy == SortBy.latest
                  ? OrderingMode.desc
                  : OrderingMode.asc,
            ),
      ]);
    }

    final limitedQuery = articlesQuery
      ..limit(limit)
      ..offset(offset);

    final articles = await limitedQuery.get();
    final authors = await (_database.select(_database.authors)
          ..where((a) => a.id.isIn(articles.map((e) => e.authorId))))
        .get();

    return articles.map((article) {
      final author = authors.firstWhere((a) => a.id == article.authorId);
      return article.toArticle(author);
    }).toList();
  }

  @override
  Future<List<Category>> getCategories() {
    // TODO: Implement category fetching, possibly from a separate table or API endpoint.
    throw UnimplementedError();
  }

  // The following methods are not yet implemented with the new Drift backend.
  // They will need to be updated to query the Drift database.

  @override
  Future<List<models.Article>> highlight() {
    throw UnimplementedError();
  }

  @override
  Future<List<models.Article>> latestNews() {
    return getArticles(sortBy: SortBy.latest);
  }

  @override
  Future<List<models.Article>> mostReadNews() {
    throw UnimplementedError();
  }

  @override
  Future<List<models.Article>> popularNews() {
    // This might require a popularity score in the database.
    throw UnimplementedError();
  }

  @override
  Future<List<models.Article>> topNews() {
    throw UnimplementedError();
  }

  @override
  Future<List<models.Article>> trendingNews() {
    throw UnimplementedError();
  }
}

extension on ArticleDto {
  db.ArticlesCompanion toArticleCompanion() {
    return db.ArticlesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      imageUrl: Value(imageUrl),
      url: Value(url),
      isPremium: Value(isPremium),
      postType: Value(postType),
      publishedAt: Value(publishedAt),
      authorId: Value(author.id),
    );
  }
}

extension on db.Article {
  models.Article toArticle(db.Author author) {
    return models.Article(
      id: id,
      title: title,
      content: content,
      imageUrl: imageUrl,
      url: url,
      isPremium: isPremium,
      postType: postType,
      publishedAt: publishedAt,
      author: author.toAuthor(),
      category: models.Category.top, // Placeholder
      isBreaking: false, // Placeholder
    );
  }
}

extension on db.Author {
  models.Author toAuthor() {
    return models.Author(
      id: id,
      name: name,
      imageUrl: '', // Placeholder
    );
  }
}