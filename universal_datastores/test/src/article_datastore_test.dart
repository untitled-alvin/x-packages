import 'package:test/test.dart';
import 'package:universal_datastores/universal_datastores.dart';

void main() {
  const ownerId = '';

  late ArticleDatastore datastore;
  late ArticleDatabase db;

  setUp(() async {
    db = ArticleDatabase(isTest: true);
    datastore = ArticleDatastore(database: db);
  });

  tearDown(() async {
    await db.close();
  });

  group('ArticleDatastore', () {
    test('search returns all articles when no query is provided', () async {
      // Arrange
      final articles = [
        Article(
          guid: '1',
          title: 'Title 1',
          content: 'Content 1',
          sourceId: 'source1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Article(
          guid: '2',
          title: 'Title 2',
          content: 'Content 2',
          sourceId: 'source2',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
      ];
      await datastore.putAll(articles);

      // Act
      final result = await datastore.search(
        const ArticleQueryParams(),
      );

      // Assert
      expect(result.data.length, 2);
    });

    test('search returns matching articles for a given query', () async {
      // Arrange
      final articles = [
        Article(
          guid: '1',
          title: 'Apple',
          content: 'A fruit',
          sourceId: 'source1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Article(
          guid: '2',
          title: 'Banana',
          content: 'Another fruit',
          sourceId: 'source2',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
      ];
      await datastore.putAll(articles);

      // Act
      final result = await datastore.search(
        const ArticleQueryParams(query: 'Apple'),
      );

      // Assert
      expect(result.data.length, 1);
      expect(result.data.first.title, 'Apple');
    });

    test('search returns matching articles for a given source', () async {
      // Arrange
      final articles = [
        Article(
          guid: '1',
          title: 'Title 1',
          content: 'Content 1',
          sourceId: 'source1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Article(
          guid: '2',
          title: 'Title 2',
          content: 'Content 2',
          sourceId: 'source2',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
      ];
      await datastore.putAll(articles);

      // Act
      final result = await datastore.search(
        const ArticleQueryParams(
          sources: ['source1'],
        ),
      );

      // Assert
      expect(result.data.length, 1);
      expect(result.data.first.sourceId, 'source1');
    });

    test('search returns articles sorted by date', () async {
      // Arrange
      final articles = [
        Article(
          guid: '1',
          title: 'Title 1',
          content: 'Content 1',
          sourceId: 'source1',
          createdAt: DateTime(2023),
          updatedAt: DateTime(2023),
          ownerId: ownerId,
        ),
        Article(
          guid: '2',
          title: 'Title 2',
          content: 'Content 2',
          sourceId: 'source2',
          createdAt: DateTime(2023, 1, 2),
          updatedAt: DateTime(2023, 1, 2),
          ownerId: ownerId,
        ),
      ];
      await datastore.putAll(articles);

      // Act
      final result = await datastore.search(
        const ArticleQueryParams(sortBy: ArticleSortOptions.createdAt),
      );

      // Assert
      expect(result.data.first.guid, '1');
    });

    test('search returns paginated results', () async {
      // Arrange
      final articles = [
        for (var i = 0; i < 10; i++)
          Article(
            guid: i.toString(),
            title: 'Title $i',
            content: 'Content $i',
            sourceId: 'source$i',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            ownerId: ownerId,
          ),
      ];
      await datastore.putAll(articles);

      // Act
      final result = await datastore.search(
        const ArticleQueryParams(offset: 5, limit: 5),
      );

      // Assert
      expect(result.data.length, 5);
      expect(result.total, 10);
      expect(result.offset, 5);
      expect(result.limit, 5);
    });
  });
}
