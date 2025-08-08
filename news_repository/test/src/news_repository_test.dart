// import 'package:test/test.dart';
// import 'package:news_repository/news_repository.dart';

// void main() {
//   group('InMemoryNewsRepository', () {
//     late InMemoryNewsRepository repository;

//     setUp(() {
//       repository = InMemoryNewsRepository();
//     });

//     test('getCategories returns all categories', () async {
//       final categories = await repository.getCategories();
//       expect(categories, equals(Category.values));
//     });

//     test('getArticles returns a list of articles', () async {
//       final articles = await repository.getArticles();
//       expect(articles, isA<List<Article>>());
//       expect(articles.length, 20);
//     });

//     test('getArticles can be filtered by category', () async {
//       final articles =
//           await repository.getArticles(category: Category.technology);
//       expect(articles.every((a) => a.category == Category.technology), isTrue);
//     });

//     test('getArticles can be sorted by latest', () async {
//       final articles = await repository.getArticles(sortBy: SortBy.latest);
//       for (var i = 1; i < articles.length; i++) {
//         expect(
//             articles[i].publishedAt.isBefore(articles[i - 1].publishedAt), isTrue);
//       }
//     });

//     test('getArticles can be sorted by popular', () async {
//       final articles = await repository.getArticles(sortBy: SortBy.popular);
//       final premiumArticles = articles.where((a) => a.isPremium).toList();
//       final nonPremiumArticles = articles.where((a) => !a.isPremium).toList();

//       expect(articles.first.isPremium, isTrue);
//       expect(premiumArticles.length + nonPremiumArticles.length, articles.length);
//     });

//     test('getArticle returns a single article', () async {
//       final article = await repository.getArticle('article_0');
//       expect(article, isA<Article>());
//       expect(article.id, 'article_0');
//     });

//     test('latestNews returns a list of articles', () async {
//       final articles = await repository.latestNews();
//       expect(articles, isA<List<Article>>());
//       expect(articles.length, 5);
//     });

//     test('popularNews returns a list of articles sorted by premium', () async {
//       final articles = await repository.popularNews();
//       expect(articles, isA<List<Article>>());
//       expect(articles.first.isPremium, isTrue);
//     });

//     test('trendingNews returns a mix of recent articles from different categories', () async {
//       final articles = await repository.trendingNews();
//       final categories = articles.map((a) => a.category).toSet();
//       expect(articles.length, lessThanOrEqualTo(5));
//       expect(categories.length, greaterThan(1));
//     });

//     test('mostReadNews returns a curated list of articles', () async {
//       final articles = await repository.mostReadNews();
//       expect(articles.every((a) => int.parse(a.id.split('_').last) % 2 == 0), isTrue);
//     });
//   });
// }
