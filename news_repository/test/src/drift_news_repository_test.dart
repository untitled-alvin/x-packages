import 'package:mocktail/mocktail.dart';
import 'package:news_repository/src/data/data.dart';
import 'package:news_repository/src/data/database.dart' as db;
import 'package:news_repository/src/drift_news_repository.dart';
import 'package:news_repository/src/models/models.dart' as models;
import 'package:news_repository/src/data/news_api_client.dart';
import 'package:test/test.dart';

// Mocks
class MockNewsApiClient extends Mock implements NewsApiClient {}

void main() {
  group('DriftNewsRepository', () {
    late DriftNewsRepository newsRepository;
    late MockNewsApiClient mockApiClient;
    late db.AppDatabase database;

    setUp(() {
      mockApiClient = MockNewsApiClient();
      database = db.AppDatabase.inMemory();
      newsRepository = DriftNewsRepository(
        apiClient: mockApiClient,
        database: database,
      );
    });

    tearDown(() async {
      await database.close();
    });

    final authorDto = AuthorDto(id: 'author1', name: 'Test Author');
    final articlesDto = [
      ArticleDto(
        id: 'article1',
        title: 'Test Article 1',
        content: 'Content 1',
        imageUrl: 'url1',
        url: 'url1',
        isPremium: false,
        postType: models.PostType.article,
        publishedAt: DateTime(2025, 1, 1),
        author: authorDto,
      ),
    ];

    test('fetchLatestNews fetches from api and saves to database', () async {
      when(() => mockApiClient.fetchLatestArticles()).thenAnswer((_) async => articlesDto);

      await newsRepository.fetchLatestNews();

      final articles = await newsRepository.getArticles();
      expect(articles.length, 1);
      expect(articles.first.id, 'article1');
    });

    test('getArticles returns data from the local database', () async {
      when(() => mockApiClient.fetchLatestArticles()).thenAnswer((_) async => articlesDto);
      await newsRepository.fetchLatestNews();

      final articles = await newsRepository.getArticles();

      expect(articles, isA<List<models.Article>>());
      expect(articles.length, 1);
      expect(articles.first.id, 'article1');
      verifyNever(() => mockApiClient.fetchLatestArticles());
    });
  });
}