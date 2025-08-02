import 'package:drift/native.dart';
import 'package:test/test.dart';
import 'package:universal_datastores/src/article_datastore/article_database.dart';
import 'package:universal_datastores/src/article_datastore/article_datastore_drift.dart';

void main() {
  group('DriftArticlesDatastoreV2', () {
    const ownerId = '';

    late DriftArticlesDatastore datastore;
    late ArticleDatabase database;

    setUp(() async {
      database = ArticleDatabase(NativeDatabase.memory());
      datastore = DriftArticlesDatastore(database: database);
    });

    tearDown(() async {
      await database.close();
    });

    // Write tests for the countArticles method

    group('countArticles', () {
      test('returns 0 when no articles exist', () async {
        // Act
        final result = await datastore.countArticles(
          ArticleQueryParams.queryAll,
        );
        // Assert
        expect(result, 0);
      });

      test('returns correct count for query params  ', () async {
        // Arrange
        final articles = <Article>[
          Article(
            guid: '1',
            title: 'Title 1',
            content: 'Content 1',
            sourceId: 'source1',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            ownerId: ownerId,
            isFeatured: true,
          ),
          Article(
            guid: '2',
            title: 'Title 2',
            content: 'Content 2',
            sourceId: 'source2',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            ownerId: ownerId,
            isFeatured: true,
          ),
        ];

        await datastore.putAll(articles);

        // Act
        final result = await datastore.countArticles(
          ArticleQueryParams.queryAll,
        );

        final result2 = await datastore.countArticles(
          const ArticleQueryParams(sources: 'source1'),
        );

        // Assert
        expect(result, 2);
        expect(result2, 1);
      });
    });
    group('countArticles', () {
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
            isFeatured: true,
          ),
          Article(
            guid: '2',
            title: 'Title 2',
            content: 'Content 2',
            sourceId: 'source2',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            ownerId: ownerId,
            isFeatured: true,
          ),
        ];
        await datastore.putAll(articles);

        // Act
        final result = await datastore.search(ArticleQueryParams.queryAll);

        // Assert
        expect(result.data.length, 2);
      });
    });
  });
}
