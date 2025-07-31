import 'package:isar/isar.dart';
import 'package:test/test.dart';
import 'package:universal_datastores/src/article_datastore/article_datastore.dart';
import 'package:universal_datastores/src/article_datastore/source.dart';
import 'package:universal_datastores/universal_datastores.dart';

void main() {
  /* cspell: disable */
  const library = 'libisar_macos.dylib';
  const ownerId = '';
  const schemas = [ArticleSchema];
  const directory = '';

  late ArticlesDatastore datastore;
  late IsarDatabase database;

  setUp(() async {
    await Isar.initialize(library);
    final isar = Isar.open(schemas: schemas, directory: directory);
    database = IsarDatabase.injectIsar(isar: isar);
    datastore = ArticlesDatastore(
      database: database,
    );
  });

  tearDown(() async {
    database.close();
  });

  group('ArticlesDatastore', () {
    test('search returns all articles when no query is provided', () async {
      // Arrange
      final articles = [
        Article(
          guid: '1',
          title: 'Title 1',
          content: 'Content 1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Article(
          guid: '2',
          title: 'Title 2',
          content: 'Content 2',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
      ];
      await datastore.putAll(articles);

      // Act
      final result = await datastore.search(
        ArticleQueryParams.queryAll,
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
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Article(
          guid: '2',
          title: 'Banana',
          content: 'Another fruit',
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
          source: const Source(id: 'source1', name: 'Source 1'),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Article(
          guid: '2',
          title: 'Title 2',
          content: 'Content 2',
          source: const Source(id: 'source2', name: 'Source 2'),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
      ];
      await datastore.putAll(articles);

      // Act
      final result = await datastore.search(
        const ArticleQueryParams(
          sources: 'source1',
        ),
      );

      // Assert
      expect(result.data.length, 1);
      expect(result.data.first.source?.id, 'source1');
    });

    test('search returns articles sorted by date', () async {
      // Arrange
      final articles = [
        Article(
          guid: '1',
          title: 'Title 1',
          content: 'Content 1',
          createdAt: DateTime(2023, 1, 1),
          updatedAt: DateTime(2023, 1, 1),
          ownerId: ownerId,
        ),
        Article(
          guid: '2',
          title: 'Title 2',
          content: 'Content 2',
          createdAt: DateTime(2023, 1, 2),
          updatedAt: DateTime(2023, 1, 2),
          ownerId: ownerId,
        ),
      ];
      await datastore.putAll(articles);

      // Act
      final result = await datastore.search(
        ArticleQueryParams.queryAll,
      );

      // Assert
      expect(result.data.first.id, '2');
    });

    test('search returns paginated results', () async {
      // Arrange
      final articles = [
        for (var i = 0; i < 10; i++)
          Article(
            guid: i.toString(),
            title: 'Title $i',
            content: 'Content $i',
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
