import 'package:collection/collection.dart';
import 'package:news_repository/src/category.dart';
import 'package:news_repository/src/models/models.dart';
import 'package:news_repository/src/news_repository.dart';

/// {@template in_memory_news_repository}
/// An in-memory implementation of the [NewsRepository].
///
/// This implementation is used for testing and development purposes.
/// {@endtemplate}
class InMemoryNewsRepository implements NewsRepository {
  /// {@macro in_memory_news_repository}
  InMemoryNewsRepository() {
    _initialize();
  }

  final List<Author> _authors = [];
  final List<Article> _articles = [];

  void _initialize() {
    // Create mock authors
    for (var i = 0; i < 5; i++) {
      _authors.add(
        Author(
          id: 'author_$i',
          name: 'Author $i',
          imageUrl: 'https://picsum.photos/id/${i + 10}/200/200',
        ),
      );
    }

    // Create mock articles
    for (var i = 0; i < 20; i++) {
      final author = _authors[i % _authors.length];
      final category = Category.values[i % Category.values.length];
      final postType = PostType.values[i % PostType.values.length];

      _articles.add(
        Article(
          id: 'article_$i',
          title: 'Article $i: A Deep Dive into ${category.name}',
          content:
              'This is the full content of article $i. It explores the topic of ${category.name} in great detail, with insights from ${author.name}.',
          author: author,
          postType: postType,
          category: category,
          imageUrl: 'https://picsum.photos/id/$i/800/600',
          url: 'https://example.com/article_$i',
          publishedAt: DateTime.now().subtract(Duration(days: i)),
          isPremium: i % 3 == 0,
          isBreaking: i % 7 == 0,
        ),
      );
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    return Category.values;
  }

  @override
  Future<List<Article>> getArticles({
    Category? category,
    String? authorId,
    SortBy? sortBy,
    int limit = 20,
    int offset = 0,
  }) async {
    var articles = [..._articles];

    if (category != null) {
      articles =
          articles.where((article) => article.category == category).toList();
    }

    if (authorId != null) {
      articles =
          articles.where((article) => article.author.id == authorId).toList();
    }

    if (sortBy != null) {
      switch (sortBy) {
        case SortBy.latest:
          articles.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
          break;
        case SortBy.popular:
          articles.sort((a, b) {
            if (b.isPremium && !a.isPremium) {
              return 1;
            } else if (!b.isPremium && a.isPremium) {
              return -1;
            }
            return b.publishedAt.compareTo(a.publishedAt);
          });
          break;
      }
    }

    return articles.skip(offset).take(limit).toList();
  }

  @override
  Future<Article> getArticle(String id) async {
    return _articles.firstWhere((article) => article.id == id);
  }

  @override
  Future<List<Article>> latestNews() async {
    return getArticles(sortBy: SortBy.latest, limit: 5);
  }

  @override
  Future<List<Article>> popularNews() async {
    return getArticles(sortBy: SortBy.popular, limit: 5);
  }

  @override
  Future<List<Article>> topNews() async {
    return _articles.where((a) => a.isBreaking).take(5).toList();
  }

  @override
  Future<List<Article>> trendingNews() async {
    final latestArticles = await getArticles(sortBy: SortBy.latest, limit: 10);
    final groupedByCategory =
        groupBy<Article, Category>(latestArticles, (a) => a.category);

    final trending = <Article>[];
    for (final category in groupedByCategory.keys) {
      final articles = groupedByCategory[category];
      if (articles != null && articles.isNotEmpty) {
        trending.add(articles.first);
      }
    }
    return trending.take(5).toList();
  }

  @override
  Future<List<Article>> mostReadNews() async {
    // Simulate most read by taking a specific slice of articles
    return _articles.where((a) => int.parse(a.id.split('_').last) % 2 == 0).take(5).toList();
  }

  @override
  Future<List<Article>> highlight() async {
    // Placeholder logic
    return _articles.where((a) => a.id.contains('1')).take(1).toList();
  }
}
