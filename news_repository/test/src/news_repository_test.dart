import 'package:test/test.dart';
import 'package:news_repository/news_repository.dart';

void main() {
  group('InMemoryNewsRepository', () {
    late InMemoryNewsRepository repository;

    setUp(() {
      repository = InMemoryNewsRepository();
    });

    test('getCategories returns all categories', () async {
      final categories = await repository.getCategories();
      expect(categories, equals(Category.values));
    });

    test('getArticles returns a list of articles', () async {
      final articles = await repository.getArticles();
      expect(articles, isA<List<Article>>());
      expect(articles.length, 20);
    });

    test('getArticles can be filtered by category', () async {
      final articles =
          await repository.getArticles(category: Category.technology);
      expect(articles.every((a) => a.category == Category.technology), isTrue);
    });

    test('getArticles can be sorted by latest', () async {
      final articles = await repository.getArticles(sortBy: SortBy.latest);
      for (var i = 1; i < articles.length; i++) {
        expect(
            articles[i].publishedAt.isBefore(articles[i - 1].publishedAt), isTrue);
      }
    });

    test('getArticle returns a single article', () async {
      final article = await repository.getArticle('article_0');
      expect(article, isA<Article>());
      expect(article.id, 'article_0');
    });

    test('latestNews returns a list of articles', () async {
      final articles = await repository.latestNews();
      expect(articles, isA<List<Article>>());
      expect(articles.length, 5);
    });
  });
}